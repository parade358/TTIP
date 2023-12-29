package com.kh.ttip.profile.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ttip.profile.model.service.ProfileService;
import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;
import com.kh.ttip.profile.model.vo.QA_comment;



@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService service;
	
	//파일명 수정 모듈
			public String saveFile(MultipartFile upfile
								  ,HttpSession session) {
				System.out.println("유성이형 사랑해");
				//파일명 수정하기
				//1. 원본파일명 추출
				String originName = upfile.getOriginalFilename();
				
				//2. 시간 추출하기 -util.Date
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				//3.뒤에 붙일 랜덤값 5자리 추출하기
				int ranNum = (int)(Math.random()*90000+10000);
				
				//4.원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고 그 뒤로 잘라내기 .txt
				String ext = originName.substring(originName.lastIndexOf("."));
				
				//5. 2,3,4 이어붙여서 변경이름 만들기 (업로드이름)
				String changeName = currentTime+ranNum+ext;
				
				
				//6. 저장시킬 실질적인 물리적 경로 추출하기
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				
				try {
					//7. 경로와 수정파일명으로 파일 업로드 하기 (경로+파일명) 파일객체를 생성한뒤 해당 파일 객체를 업로드시킨다.
					upfile.transferTo(new File(savePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				return changeName;
			}
			
	@RequestMapping("profile.pr")
	public String profileMainPage() {
		
		return "profile/profileMainPage";
	}
	@ResponseBody
	@PostMapping("uploadImages.pr")
	public int uploadImages(@RequestParam("files")MultipartFile[] formData,
							   @RequestParam("userNo")String userNo,
							   String oldFileNoArr,
							   String oldChangeNameArr,
							   HttpSession session) throws JsonMappingException, JsonProcessingException {
		
		System.out.println("userNo가 과연 뭘까?"+userNo);
		ObjectMapper mapper = new ObjectMapper();
        
        // JSON 문자열을 List<Map<String, Object>>으로 변환
        String[] oldFileNoArray = mapper.readValue(oldFileNoArr, String[].class);
        String[] oldChangeNameArray = mapper.readValue(oldChangeNameArr, String[].class);
        
        for(String fileNo : oldFileNoArray) {
        	System.out.println("fileNo:"+fileNo);
        }
        for(String oldChangeName : oldChangeNameArray) {
        	System.out.println("oldChangeNameArray:"+oldChangeName);
        }
		//만약 새로운 첨부파일이 전달되었다면
		Image image = null;
		
		ArrayList<Image> list = new ArrayList<>();
		//기존에 데이터가 있었다면 기존파일 삭제
		if(oldFileNoArray != null && oldFileNoArray.length > 0 && oldFileNoArray[0] != "") {
			//새로 첨부된 파일이 있고 기존 파일도 있다면 
			//파일정보가 등록된 데이터에서 변경작업을 한다. update
			//파일번호(식별자)를 이용하여 기존데이터에서 변경하기. (덮어쓰기)
			service.deleteExistedImages(oldFileNoArray);
			//기존 파일 삭제 해주기 (저장경로 + 원본파일명 ) - 원본파일명은 view에서 넘겨줌
			String savePath = session.getServletContext().getRealPath("/");
			for(String changeName : oldChangeNameArray) {
				
				new File(savePath+changeName).delete();
			}
			
		}
		int realUserNo = Integer.parseInt(userNo);
		for(int i=0; i<formData.length; i++) {
			
			image = new Image();
			String changeName = saveFile(formData[i],session);
			
			image.setOriginName(formData[i].getOriginalFilename());
			image.setChangeName("resources/uploadFiles/"+changeName);
			image.setFileType("detail-image");
			image.setRefNo(realUserNo);
			list.add(image);
				
			
		}
			
		HashMap<String, Object> map = new HashMap<>();
		map.put("imageList",list);

		int result = service.uploadImages(map);
		
		return result;
				
	}
	@ResponseBody
	@RequestMapping("deleteOneDetailImage.pr")
	public int deleteOneDetailImage(HttpSession session,
									String atNo) {
		
		int result = service.deleteOneDetailImage(Integer.parseInt(atNo));
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectDetailImage.pr")
	public ArrayList<Image> selectDetailImages(HttpSession session,
											 String userNo) {
		
		System.out.println("userNo는?"+userNo);
		ArrayList<Image> list = service.selectDetailImages(Integer.parseInt(userNo));
		
		for(Image image : list) {
			System.out.println(image);
		}
		return list;
	}
	@ResponseBody
	@PostMapping("uploadProfilePicture.pr")
	public int uploadProfilePicture(@RequestParam("file")MultipartFile formData,
									@RequestParam("profileNo")String profileNo,
									@RequestParam("oldChangeName")String oldChangeName,
									HttpSession session) {
		
		
		//매개변수로 주입받는 객체의 경우는 생성이 되어 넘어오기대문에
		//null인지 아닌지로는 비교할 수 없음 내부 데이터로 판별해야한다.
		
		System.out.println("profileNo: "+profileNo);
		Image image = new Image();
		if(!formData.getOriginalFilename().equals("")) {
			//전달받은 파일이 있을경우 - 서버에 업로드(파일명 수정후) - 데이터베이스에 정보 등록
			//saveFile 에서 이름 변경작업 후 파일 서버업로드까지 마친 후 업로드된 파일명 반환받기.
			String changeName = saveFile(formData,session);
			
			//8.데이터 베이스에 등록할 변경이름,원본이름 Board VO에 담기
			image.setOriginName(formData.getOriginalFilename());
			image.setChangeName("resources/uploadFiles/"+changeName);
			
			
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("image",image);
		map.put("profileNo", Integer.parseInt(profileNo));
		
		//if문 벗어나서 작업하기
			//데이터베이스에 정보 등록하기.
			int result = service.uploadProfilePicture(map);
			
			if(result>0) {
				new File(session.getServletContext().getRealPath("/"+oldChangeName)).delete();
			}
			return result;
			
				
	}
	@ResponseBody
	@RequestMapping("changeNickName.pr")
	public int updateNickname(String changedNickname,
							 String userNo) {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("changedNickname", changedNickname);
		map.put("userNo", userNo);
		int result = service.updateNickname(map);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("updateSubCategory.pr")
	public int insertSubCategory(@RequestParam(value="userNo") int userNo,
								@RequestParam(value="checkedCategory[]") String[] checkedCategory) {
		
		StringJoiner joiner = new StringJoiner(",");
		for(String category : checkedCategory) {
			joiner.add(category);
		}
		String realCheckedCategory = joiner.toString();
		HashMap<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("realCheckedCategory", realCheckedCategory);
		
		System.out.println(realCheckedCategory);
		
		int result = service.updateSubCategory(map);
		return result;
	}
	@ResponseBody
	@RequestMapping("updateMainCategory.pr")
	public int insertMainCategory(@RequestParam(value="userNo") int userNo,
								@RequestParam(value="checkedCategory") String checkedCategory) {
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("realCheckedCategory", checkedCategory);
		
		System.out.println(checkedCategory);
		
		int result = service.updateMainCategory(map);
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("selectAllProfileInfo.pr")
	public Profile selectAllProfileInfo(int userNo) {
		
		System.out.println("userNo맞나?"+userNo);
		Profile profile = service.selectAllProfileInfo(userNo);
		System.out.println("profile:"+profile);
		return profile;
	}
	
		@GetMapping("getCurrentPage.pr")
		public String getCurrentPage(int currentPage,ModelAndView mv) {
			
			mv.addObject("currentPage",currentPage);
			return "profile/profileMainPage";
		}
		@ResponseBody
		@RequestMapping("updateOneLineIntroduce.pr")
		public int updateOneLineIntroduce(String changedText,
								 		String userNo) {
			
			HashMap<String,String> map = new HashMap<>();
			map.put("changedText", changedText);
			map.put("userNo", userNo);
			int result = service.updateOneLineIntroduce(map);
			
			return result;
		}
		@ResponseBody
		@RequestMapping("updateAddress.pr")
		public int updateAddress(String address,
								 String userNo) {
			
			HashMap<String,String> map = new HashMap<>();
			map.put("address", address);
			map.put("userNo", userNo);
			int result = service.updateAddress(map);
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping("updateTime.pr")
		public int updateTime(String changedTime,
								 String userNo) {
			
			HashMap<String,String> map = new HashMap<>();
			map.put("changedTime", changedTime);
			map.put("userNo", userNo);
			int result = service.updateTime(map);
			
			return result;
		}
		@ResponseBody
		@RequestMapping("updateDetailDescription.pr")
		public int updateDetailDescription(String changedDescription,
								 		   String userNo) {
			
			HashMap<String,String> map = new HashMap<>();
			map.put("changedDescription", changedDescription);
			map.put("userNo", userNo);
			int result = service.updateDetailDescription(map);
			
			return result;
		}
		@ResponseBody
		@RequestMapping("updateQuestion.pr")
		public int updateQuestion(String commentObjectArray, 
								  String userNo) throws ParseException, JsonMappingException, JsonProcessingException {
			
			System.out.println("commentObjectArray 결과:"+commentObjectArray);
			System.out.println("userNo 결과:"+userNo);
			
	        ObjectMapper mapper = new ObjectMapper();
	        
	        // JSON 문자열을 List<Map<String, Object>>으로 변환
	        List<Map<String, Object>> list = mapper.readValue(commentObjectArray, new TypeReference<List<Map<String, Object>>>() {});

	        // List<Map>을 List<QA_comment>으로 변환
	        List<QA_comment> qaCommentList = new ArrayList<>();
	        for (Map<String, Object> map : list) {
	            QA_comment qaComment = new QA_comment();
	            qaComment.setQuestionNum((int) map.get("questionNum"));
	            qaComment.setQaAnswer((String) map.get("qaAnswer"));
	            qaCommentList.add(qaComment);
	        }
	        
			HashMap<String, Object> paramMap = new HashMap<>();
			  paramMap.put("list", list);
			  paramMap.put("userNo", Integer.parseInt(userNo));
			  
			int result = service.updateQuestion(paramMap);
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping("selectQuestionComment.pr")
		public ArrayList<QA_comment> selectQuestionComment(String userNo) {
			
			ArrayList<QA_comment> result = service.selectQuestionComment(userNo);
			
			return result;
		}
		
		
		
		
}
