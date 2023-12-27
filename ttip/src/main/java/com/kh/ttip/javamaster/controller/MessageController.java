package com.kh.ttip.javamaster.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ttip.javamaster.model.service.ChatService;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.javamaster.storage.UserStorage;

@RestController
public class MessageController {
	
	 @Autowired
	 private SimpMessagingTemplate simpMessagingTemplate;
	 
	 @Autowired
	 private ChatService chatService; 

	 @MessageMapping("/chat/{to}")
	 public void sendMessage(@DestinationVariable String to, MessageModel message) {
		 
		 System.out.println("handling send message: " + message + " to: " + to);
		 
		 message.setToLogin(to);
		 
		 chatService.insertChat(message);
		 
	     boolean isExists = UserStorage.getInstance().getUsers().contains(to);
	     
	     if (isExists) {
	         simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
	     }
	 }
	 
	 @PostMapping("selectChat")
	 @ResponseBody
	 public ArrayList<MessageModel> selectChat(String userName, String fromId){
		 
		MessageModel message = new MessageModel();
		
		message.setFromLogin(fromId);
		message.setToLogin(userName);
		
		ArrayList<MessageModel> list = chatService.selectChat(message);
		
		return list;
	 }

}
