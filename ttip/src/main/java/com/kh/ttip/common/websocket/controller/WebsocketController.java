package com.kh.ttip.common.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping("/websocket")
public class WebsocketController {
	
	
	@GetMapping("/basic")
	public String basic() {
		return "websocket/basic";
	}
	
	@GetMapping("/group")
	public String group() {
		return "websocket/group";
	}
	
	
	@GetMapping("/member")
	public String member() {
		return "websocket/member";
	}
	
	
	
	
}
