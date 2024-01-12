package com.kh.ttip.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

public interface AdminService {

	//유저 정보 관리
	ArrayList<Member> selectUser();

	//유저 정보 복구
	int restore(String email);

	//유저 정보 탈퇴
	int out(String email);

	//게시글 정보 관리
	ArrayList<Board> selectBoard();

	//게시글 정보 복구
	int boardRestore(int bno);

	//게시글 정보 삭제
	int boardDelete(int bno);

	//유저 검색
	ArrayList<Member> selectSearchList(String keyword);

	//게시판 검색
	ArrayList<Board> selectSearchBoard(String keyword);

	//채팅 select
	ArrayList<MessageModel> selectChat();


}
