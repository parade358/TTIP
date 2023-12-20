package com.kh.ttip.announcement.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.announcement.model.dao.AnnounceDao;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;

@Service
public class AnnounceServiceImpl implements AnnounceService{

	@Autowired
	private AnnounceDao announceDao;
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public ArrayList<MainCategory> selectMainCategory() {
		
		return announceDao.selectMainCategory(sqlSession);
	}
	@Override
	public ArrayList<DetailCategory> selectDetailCategory(int[] checkedCategory) {
		return announceDao.selectDetailCategory(sqlSession,checkedCategory);
	}

}
