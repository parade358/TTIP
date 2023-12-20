package com.kh.ttip.profile.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ttip.profile.model.vo.Image;

@Repository
public class ProfileDao {

	public int uploadImages(HashMap<String, Object> map, SqlSession sqlSession) {
		return sqlSession.insert("profileMapper.uploadImages",map);
	}

	public ArrayList<Image> selectDetailImages(int userNo, SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("profileMapper.selectDetailImages",userNo);
	}

}
