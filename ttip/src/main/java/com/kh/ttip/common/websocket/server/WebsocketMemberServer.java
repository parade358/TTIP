package com.kh.ttip.common.websocket.server;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebsocketMemberServer extends TextWebSocketHandler{
	
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
	
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.add(session);
		
		log.info("session = {}",session);
		log.info("접속! 현재 접속자 수 : {}", users.size());
		log.info("attribute : {}",session.getAttributes().get("loginUser"));
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//본인의 아이디와 전달할 메세지 붙여서 전달하기
		
		String userId = "관리자";
		
		//메세지랑 userId 붙여서 보내기
		
		String text = "["+userId+"]" + message.getPayload();
		
		//새로 만든 텍스트를 넣고 TextMessage 생성하기
		
		TextMessage newMessage = new TextMessage(text);
		
		//저장소에 담겨있는 회원들에게 메세지 전달하기
		for(WebSocketSession s : users) {
			s.sendMessage(newMessage);
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		users.remove(session); // 내 정보를 사용자 정보 보관소에서 지우고 나가기
		//정보를 보관소에서 지우지 않으면 해당 데이터는 그대로 남아있기 때문에 불필요한 메세지 전송이 일어난다.
		log.info("접속 종료! 현재 접속자 수 : {}",users.size());
	}
	

}
