package com.kh.ttip.announcement.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;

public interface AnnounceService {
	
	//큰 카테고리 조회
	ArrayList<MainCategory> selectMainCategory();

	//작은 카테고리 조회
	ArrayList<DetailCategory> selectDetailCategory(int[] arrayParams);
}
