package com.kh.ttip.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.board.model.dao.BoardDao;
import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Board> selectMyList(String userNo, PageInfo pi) {
		return boardDao.selectMyList(sqlSession, userNo, pi);
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

}
