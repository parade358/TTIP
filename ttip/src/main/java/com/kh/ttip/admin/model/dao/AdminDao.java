package com.kh.ttip.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

@Repository
public class AdminDao {

	//유저 정보 select
	public ArrayList<Member> selectUser(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectUser");
	}

	//유저 정보 복구
	public int restore(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("adminMapper.restore", email);
	}

	//유저 정보 탈퇴
	public int out(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("adminMapper.out", email);
	}

	//게시글 정보 select
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard");
	}

	//게시글 정보 복구
	public int boardRestore(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("adminMapper.boardRestore", bno);
	}

	//게시글 정보 삭제
	public int boardDelete(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("adminMapper.boardDelete", bno);
	}
	
	
	//유저 검색
	public ArrayList<Member> selectSearchList(SqlSessionTemplate sqlSession, String keyword) {
	    return (ArrayList)sqlSession.selectList("adminMapper.selectSearchList", keyword);
	}

	//게시판 검색
	public ArrayList<Board> selectSearchBoard(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBoard", keyword);
	}

	//채팅
	public ArrayList<MessageModel> selectChat(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectChat");
	}
	
}
