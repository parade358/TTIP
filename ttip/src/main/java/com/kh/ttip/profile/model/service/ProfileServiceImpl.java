package com.kh.ttip.profile.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.profile.model.dao.ProfileDao;
import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;

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
	@Override
	public ArrayList<Image> selectDetailImages(int userNo) {
		return profileDao.selectDetailImages(userNo,sqlSession);
	}
	@Override
	public int updateNickname(HashMap<String,String> changedNickname) {
		return profileDao.updateNickname(changedNickname,sqlSession);
	}
	@Override
	public int insertSubCategory(HashMap<String,Object> map) {
		return profileDao.insertSubCategory(map,sqlSession);
	}
	@Override
	public Profile selectAllProfileInfo(int userNo) {
		return profileDao.selectAllProfileInfo(userNo,sqlSession);
	}

}
