package com.kh.ttip.announcement.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
