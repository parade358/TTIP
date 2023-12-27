package com.kh.ttip.javamaster.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
		@RequestMapping("chat")
		public String enrollForm() {
			
			return "chat/chat";
		}
}
