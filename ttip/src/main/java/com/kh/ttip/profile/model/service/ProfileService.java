package com.kh.ttip.profile.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.ttip.profile.model.vo.Image;
import com.kh.ttip.profile.model.vo.Profile;

public interface ProfileService {
	
	//사진 업로드
	int uploadImages(HashMap<String, Object> map);
	//상세 이미지 조회
	ArrayList<Image> selectDetailImages(int userNo);
	//활동명 업데이트
	int updateNickname(HashMap<String, String> map);
	//제공서비스 추가
	int insertSubCategory(HashMap<String,Object> map);
	//프로필 전체 조회
	Profile selectAllProfileInfo(int userNo);

}
