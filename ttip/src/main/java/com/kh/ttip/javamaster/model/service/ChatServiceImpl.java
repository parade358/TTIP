package com.kh.ttip.javamaster.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.javamaster.model.dao.ChatDao;
import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChat(MessageModel message) {
		
		return chatDao.insertChat(sqlSession, message);
	}

	@Override
	public ArrayList<MessageModel> selectChat(MessageModel message) {
		
		return chatDao.selectChat(sqlSession, message);
	}

	@Override
	public ArrayList<MessageModel> selectChatUserList(String fromId) {

		return chatDao.selectChatUserList(sqlSession, fromId);
	}
	
	

}
