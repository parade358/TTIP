package com.kh.ttip.javamaster.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ttip.javamaster.model.service.ChatService;
import com.kh.ttip.javamaster.model.vo.MessageModel;

@Controller
public class ChatController {
	
	@Autowired
	 private ChatService chatService; 
	
	@RequestMapping("chat")
	public String enrollForm() {
		
		return "chat/chat";
	}
	
	@RequestMapping("chat2")
	public String chat2() {
		
		return "websocket/member";
	}
	
	@RequestMapping("newChat")
	public String newChat(Model model
						 ,String fromId) {
		
		System.out.println(fromId);
		int result = 0;
		
		String toId = "hodoo";
		
		ArrayList<MessageModel> list = chatService.selectChatUserList(fromId);
		
		for (MessageModel messageModel : list) {
	        if (toId.equals(messageModel.getToLogin())) {
	            result++;
	        }
	    }
		
		if(result>0) {
			
			model.addAttribute("selectUser",toId);
			return "websocket/member";
			
		}else {
			
			model.addAttribute("nullUser",toId);
			return "websocket/member";
			
		}
		
			
		
	}
}
