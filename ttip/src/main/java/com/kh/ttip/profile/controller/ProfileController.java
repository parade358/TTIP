package com.kh.ttip.profile.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ttip.profile.model.service.ProfileService;
import com.kh.ttip.profile.model.vo.Image;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService service;
	
	@RequestMapping("profile.pr")
	public String profileMainPage() {
		
		return "profile/profileMainPage";
	}
	@PostMapping("uploadImages.pr")
	public String uploadImages(@RequestParam("files")MultipartFile[] formData, HttpSession session) {
		
		
		//매개변수로 주입받는 객체의 경우는 생성이 되어 넘어오기대문에
		//null인지 아닌지로는 비교할 수 없음 내부 데이터로 판별해야한다.
		
		//전달받은 파일의 이름이 있는지 확인(넘어온 파일이 없으면 getOfiginalFilename() 이 빈문자열 반환
		ArrayList<Image> list = new ArrayList<>();
		for(int i=0; i<formData.length; i++) {
			
			if(!formData[i].getOriginalFilename().equals("")) {
				//전달받은 파일이 있을경우 - 서버에 업로드(파일명 수정후) - 데이터베이스에 정보 등록
				//saveFile 에서 이름 변경작업 후 파일 서버업로드까지 마친 후 업로드된 파일명 반환받기.
				String changeName = saveFile(formData[i],session);
				
				//8.데이터 베이스에 등록할 변경이름,원본이름 Board VO에 담기
				Image image = new Image();
				image.setOriginName(formData[i].getOriginalFilename());
				image.setChangeName("resources/uploadFiles/"+changeName);
				image.setFileType("detail-image");
				
				list.add(image);
			}
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("imageList",list);
		
		//if문 벗어나서 작업하기
			//데이터베이스에 정보 등록하기.
			int result = service.uploadImages(map);
			
			if(result>0) {
				session.setAttribute("alertMsg", "게시글 등록 성공");
				return "redirect:/selectDetailImage.pr";
			}else {
				session.setAttribute("alertMsg", "게시글 등록 실패");
				return "common/errorPage";
			}
				
	}
	@RequestMapping("selectDetailImage.pr")
	public String selectDetailImages(HttpSession session,ModelAndView mv) {
		
//		int userNo = session.getAttribute("loginUser").getUserNo();
		int userNo = 12;
		ArrayList<Image> list = service.selectDetailImages(userNo);
		
		if(list!=null) {
			mv.addObject(list);
		}else {
			return "common/errorPage";
		}
		return "profile/profileMainPage";
	}
	//파일명 수정 모듈
		public String saveFile(MultipartFile upfile
							  ,HttpSession session) {
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
}
