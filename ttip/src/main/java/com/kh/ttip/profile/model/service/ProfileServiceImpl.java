package com.kh.ttip.profile.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.profile.model.dao.ProfileDao;
import com.kh.ttip.profile.model.vo.Image;

@Service
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDao profileDao;
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int uploadImages(HashMap<String, Object> map) {
		return profileDao.uploadImages(map,sqlSession);
	}

}
