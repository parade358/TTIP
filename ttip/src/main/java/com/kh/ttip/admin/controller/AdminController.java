package com.kh.ttip.admin.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ttip.admin.model.service.AdminService;
import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;

	
	// 관리자 페이지로 이동
	@RequestMapping("adminPage.ad")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	
	// 유저 정보 select
	@ResponseBody
	@RequestMapping("selectUser.ad")
	public ArrayList<Member> selectUser() {
		
		ArrayList<Member> list = adminService.selectUser();
		
		return list;
	}
	
	
	
	//유저 검색
	@ResponseBody
	@RequestMapping("searchUser.ad")
	public ArrayList<Member> searchUser(@RequestParam(name = "userKeyword", defaultValue = "") String keyword) {
		
		System.out.println(keyword);
		
		
	    ArrayList<Member> list;

	    list = adminService.selectSearchList(keyword);
	    
	    System.out.println(list);
	    
	    return list;
	}



	
	// 유저 정보 복구
	@RequestMapping("restore.ad")
	public String restore(HttpSession session, String email) {
		System.out.println(email);
		
		int result = adminService.restore(email);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "정보 수정 완료!");
		} else {
			session.setAttribute("alertMsg", "정보 수정 실패!");
		}
		
		return "admin/adminPage";
	}
	
	// 유저 정보 탈퇴
	@RequestMapping("out.ad") 
	public String out(HttpSession session, String email) {
		
		int result = adminService.out(email);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "정보 수정 완료!");
		} else {
			session.setAttribute("alertMsg", "정보 수정 실패!");
		}
		
		return "admin/adminPage";
	}
	
	//게시글 정보 select
	@ResponseBody
	@RequestMapping("selectBoard.ad")
	public ArrayList<Board> selectBoard() {
		
		ArrayList<Board> list = adminService.selectBoard();
		
		return list;
	}
	
	
	// 게시글 정보 복구
	@RequestMapping("boardRestore.ad")
	public String boardRestore(HttpSession session, int bno) {
		System.out.println(bno);
		
		int result = adminService.boardRestore(bno);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "정보 수정 완료!");
		} else {
			session.setAttribute("alertMsg", "정보 수정 실패!");
		}
		
		return "admin/adminPage";
	}
	
	// 게시글 정보 삭제
	@RequestMapping("boardDelete.ad") 
	public String boardDelete(HttpSession session, int bno) {
		
		int result = adminService.boardDelete(bno);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "정보 수정 완료!");
		} else {
			session.setAttribute("alertMsg", "정보 수정 실패!");
		}
		
		return "admin/adminPage";
	}
	
	
	// 게시판 검색
	@ResponseBody
	@RequestMapping("searchBoard.ad")
	public ArrayList<Board> searchBoard(@RequestParam(name = "boardKeyword", defaultValue = "") String keyword) {
		
		System.out.println(keyword);
		
		
	    ArrayList<Board> list;

	    list = adminService.selectSearchBoard(keyword);
	    
	    System.out.println(list);
	    
	    return list;
	}
	
	

	
	//채팅 정보 select
	@ResponseBody
	@RequestMapping("selectChat.ad")
	public ArrayList<MessageModel> selectChat() {
		
		ArrayList<MessageModel> list = adminService.selectChat();
		
		return list;
	}
}
