package com.kh.ttip.profile.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.profile.model.dao.ProfileDao;
import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;
import com.kh.ttip.profile.model.vo.QA_comment;

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
	public int updateSubCategory(HashMap<String,Object> map) {
		return profileDao.updateSubCategory(map,sqlSession);
	}
	@Override
	public Profile selectAllProfileInfo(int userNo) {
		return profileDao.selectAllProfileInfo(userNo,sqlSession);
	}
	@Override
	public int updateMainCategory(HashMap<String, Object> map) {
		return profileDao.updateMainCategory(map,sqlSession);
	}
	@Override
	public int updateOneLineIntroduce(HashMap<String, String> map) {
		return profileDao.updateOneLineIntroduce(map,sqlSession);
	}
	@Override
	public int updateAddress(HashMap<String, String> map) {
		return profileDao.updateAddress(map,sqlSession);
	}
	@Override
	public int updateTime(HashMap<String, String> map) {
		return profileDao.updateTime(map,sqlSession);
	}
	@Override
	public int updateDetailDescription(HashMap<String, String> map) {
		return profileDao.updateDetailDescription(map,sqlSession);
	}
	@Override
	public int uploadProfilePicture(HashMap<String, Object> map) {
		return profileDao.uploadProfilePicture(map,sqlSession);
	}
	@Override
	public int updateQuestion(Map<String, Object> paramMap) {
		return profileDao.updateQuestion(paramMap,sqlSession);
	}
	@Override
	public ArrayList<QA_comment> selectQuestionComment(String userNo) {
		return profileDao.selectQuestionComment(userNo,sqlSession);
	}
	@Override
	public int deleteExistedImages(String[] oldFileNoArray) {
		return profileDao.deleteExistedImages(oldFileNoArray,sqlSession);
	}
	@Override
	public int deleteOneDetailImage(int atNo) {
		return profileDao.deleteOneDetailImage(atNo,sqlSession);
	}
	

}
