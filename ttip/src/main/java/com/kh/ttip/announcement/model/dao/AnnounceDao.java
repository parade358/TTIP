package com.kh.ttip.announcement.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;

@Repository
public class AnnounceDao {

	public ArrayList<MainCategory> selectMainCategory(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectMainCategory");
	}

	public ArrayList<DetailCategory> selectDetailCategory(SqlSession sqlSession, int[] checkedCategory) {
		return (ArrayList)sqlSession.selectList("announceMapper.selectDetailCategory",checkedCategory);
	}

	
}
