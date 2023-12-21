package com.kh.ttip.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ttip.member.model.vo.Member;
import com.kh.ttip.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
    private MemberService memberService;

    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
    
    
    //로그인 페이지로 이동
    @RequestMapping("login.me")
    public String loginForm() {
    	return "member/loginForm";
    }
    
	
    //회원가입 페이지로 이동
  	@RequestMapping("enroll.me")
  	public String enrollForm() {
  		
  		//페이지 이동만 하면 되니 return 한줄처리 
  		return "member/enrollForm";
  	}
  	
  	
    //회원가입
  	@RequestMapping("insert.me")
  	public String insertMember(Member m
  							  ,Model model
  							  ,HttpSession session) {
  		
  		String encPwd = bcryptPasswordEncoder.encode(m.getUserPassword());
		
		
		m.setUserPassword(encPwd); //암호화된 비밀번호로 변경 
		
		// insertMember로 작업하기 성공시 메인페이지로 (성공메세지 alertMsg 담기)  
		// 실패시 에러페이지로 (model에 에러메세지 담기)  
		
		int result = memberService.insertMember(m);
		
		
		if(result>0) { //성공
			session.setAttribute("alertMsg", "회원가입 성공");
			
			return "redirect:/";//재요청
		}else { //실패
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";//포워딩
		}
		
	}
  	
  	
  	//암호화 작업 후 로그인 메소드
  	@RequestMapping("loginInsert.me")
  	public ModelAndView loginMember(Member m
  						   ,HttpSession session
  						   ,ModelAndView mv) {

  		Member loginUser = memberService.loginMember(m);
  		
  		System.out.println("입력한 이메일: " + m.getEmail());
  	    System.out.println("입력한 비밀번호: " + m.getUserPassword());
  		
  		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPassword(), loginUser.getUserPassword())) { //성공
  			
  			session.setAttribute("loginUser", loginUser);
  			
  			mv.setViewName("redirect:/"); 
  			
  		}else {
  			
  			mv.addObject("errorMsg","로그인 실패"); 
  			
  			mv.setViewName("common/errorPage");
  		}	
  		
  		return mv;
  	}
  	
  	
  	//지역 선택
  	@RequestMapping("/memberAddresses")
    public String getAddresses(Model model) {
        List<String> addresses = getAddressesFromDatabase();

        model.addAttribute("addresses", addresses);

        return "member/enrollForm";
  	}

    private List<String> getAddressesFromDatabase() {
        List<String> addresses = new ArrayList<>();
        addresses.add("서울");
        addresses.add("경기");
        addresses.add("부산");
        return addresses;
    }

  	
    
    //비밀번호 찾기 페이지로 이동
  	@RequestMapping("pwdFind.me")
  	public String pwdFind() {
  		
  		return "member/pwdFindForm";
  	}
	

  	//로그아웃
  	@RequestMapping("logout.me")
  	public String logoutMember(HttpSession session) {
  		
  		//세션에 담겨있는 loginUser정보 지우기
  		session.removeAttribute("loginUser");
  		
  		//로그아웃처리 후 메인페이지 재요청
  		return "redirect:/";
  	}
  	
  	
	
	@ResponseBody
	@RequestMapping("checkNickname.do")
	public String CheckNickname(String nickname) {
		
		System.out.println(nickname);
		int count = memberService.CheckNickname(nickname);
		
		if(count>0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	
	}

}


