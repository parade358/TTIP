package com.kh.ttip.announcement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ttip.announcement.model.service.AnnounceService;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;

@Controller
public class AnnounceController {
	
	@Autowired
	private AnnounceService announceService;
	
	@RequestMapping("announceMentEnroll.an")
	public String Announcement(Model model
							  ,int currentPage) {
		ArrayList<MainCategory> list = announceService.selectMainCategory();
		
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		
		System.out.println(currentPage);
		return "announcement/announcement";
	}
	
	@GetMapping("selectDetailCategory.an")
	public String selectDetailCategory(Model model
									  ,int[] checkedCategory
									  ,String currentPage) {
		
		System.out.println("2번째:"+currentPage);
		ArrayList<DetailCategory> list = announceService.selectDetailCategory(checkedCategory);
		
		model.addAttribute("list",list);
		model.addAttribute("currentPage",Integer.parseInt(currentPage));
		
		return "announcement/detailCategory";
	}
	
	@GetMapping("insertDetailCtg.an")
	public String insertDetailCtg(Model model
								 ,String currentPage) {
		
		
		return "";
	}
	@ResponseBody
	@RequestMapping("selectMainCategoryModal.an")
	public HashMap<String, Object> selectMainCategoryModal(int currentPage){
		
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<MainCategory> list = announceService.selectMainCategory();
		map.put("list",list);
		map.put("currentPage", currentPage);
		return map;
	}
	@ResponseBody
	@RequestMapping("selectDetailCategoryModal.an")
	public ArrayList<DetailCategory> selectDetailCategoryModal(Model model
									  ,@RequestParam(value="checkedCategory[]") int[] arrayParams
			
														) {
		
		
	/*
	 * int[] realCheckedCategory = new int[10]; for(int i=0;
	 * i<checkedCategory.length; i++) { if (checkedCategory[i]
	 * != null) { realCheckedCategory[i] =
	 * Integer.parseInt(checkedCategory[i]); } else { break; } }
	 */
		ArrayList<DetailCategory> list = announceService.selectDetailCategory(arrayParams);
		
		return list;
	}
	

}
