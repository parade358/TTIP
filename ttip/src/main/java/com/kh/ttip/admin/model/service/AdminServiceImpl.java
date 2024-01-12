package com.kh.ttip.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.admin.model.dao.AdminDao;
import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//유저 정보 select
	@Override
	public ArrayList<Member> selectUser() {
		return adminDao.selectUser(sqlSession);
	}

	//유저 정보 복구
	@Override
	public int restore(String email) {
		return adminDao.restore(sqlSession, email);
	}

	//유저 정보 탈퇴
	@Override
	public int out(String email) {
		return adminDao.out(sqlSession, email);
	}

	//게시글 정보 select
	@Override
	public ArrayList<Board> selectBoard() {
		return adminDao.selectBoard(sqlSession);
	}

	//게시글 정보 복구
	@Override
	public int boardRestore(int bno) {
		return adminDao.boardRestore(sqlSession, bno);
	}

	//게시글 정보 삭제
	@Override
	public int boardDelete(int bno) {
		return adminDao.boardDelete(sqlSession, bno);
	}

	//유저 검색
	@Override
	public ArrayList<Member> selectSearchList(String keyword) {
		return adminDao.selectSearchList(sqlSession, keyword);
	}

	//게시판 검색
	@Override
	public ArrayList<Board> selectSearchBoard(String keyword) {
		return adminDao.selectSearchBoard(sqlSession, keyword);
	}

	//채팅
	@Override
	public ArrayList<MessageModel> selectChat() {
		return adminDao.selectChat(sqlSession);
	}
}
