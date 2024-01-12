package com.kh.ttip.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ttip.board.model.service.BoardService;
import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.common.model.vo.PageInfo;
import com.kh.ttip.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	@ResponseBody
	@RequestMapping("myList.bo")
	public Map<String, Object> selectMyList(@RequestParam(value="currentPage",defaultValue="1")
									    int currentPage
									   ,Model model
									   ,String userNo){
		
		//페이징처리된 게시글 조회하기
		//현재 페이지정보 (currentPage) - 처음 게시판을 들어올때는 페이지정보가 없으니 defualtValue에 설정해주기
		
		//전체 게시글 개수 (listCount) - selectListCount() 메소드명
		int listCount = boardService.selectListCount();
		
		int boardLimit = 5;
		//한페이지에서 보여줘야하는 게시글 개수 (boardLimit): 5
		int pageLimit = 10;
		//페이징바 개수 (pageLimit) : 10
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectMyList(userNo, pi);
		
		Map<String, Object> result = new HashMap<>();
	    result.put("list", list);
	    result.put("pi", pi);

	    return result;
		
	}
	
	

}
