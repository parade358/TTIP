package com.kh.ttip.common.websocket.server;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.ttip.javamaster.model.service.ChatService;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketMemberServer extends TextWebSocketHandler{
	
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
	
	@Autowired
	private ChatService chatService;
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.add(session);
		
		log.info("접속");
		log.debug("session : {}",session);
		log.debug("접속자의 아이디 : {}",((Member)session.getAttributes().get("loginUser")).getUserNickName()); //이거 없애면 user정보를 가져오지 못함. why?
		log.info("접속 ! 현재 접속자 수 : {}",users.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//본인의 아이디와 전달할 메세지 붙여서 전달하기
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		MessageModel chatMessage = objectMapper.readValue(message.getPayload(), MessageModel.class);
		
		int result = chatService.insertChat(chatMessage);
		
		for(WebSocketSession ws : users) {
			// WebSocketSession == HttpSession (로그인정보,채팅방정보) 을 가로챈것..
			String id = ((Member)ws.getAttributes().get("loginUser")).getUserNickName(); //test123와 test1이 채팅jsp에 접속하면 users에는 두개가 담겨있음.
//			System.out.println("total id : "+id);
//			System.out.println("보낸사람 id : "+chatMessage.getUserId());
//			System.out.println("받는사람 id : "+chatMessage.getReceiveId());
			//보낸사람 또는 받는사람중에 접속자가 있다면 
			
			if(id.equals(chatMessage.getFromLogin()) || id.equals(chatMessage.getToLogin())) {
				//System.out.println("채팅이 지금 가는 id : "+id);
				ws.sendMessage( new TextMessage( new Gson().toJson(chatMessage) ));
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		users.remove(session); // 내 정보를 사용자 정보 보관소에서 지우고 나가기
		//정보를 보관소에서 지우지 않으면 해당 데이터는 그대로 남아있기 때문에 불필요한 메세지 전송이 일어난다.
		log.info("접속 종료! 현재 접속자 수 : {}",users.size());
	}
	

}
