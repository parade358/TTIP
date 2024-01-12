package com.kh.ttip.javamaster.model.service;

import java.util.ArrayList;

import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

public interface ChatService {

	int insertChat(MessageModel message);

	ArrayList<MessageModel> selectChat(MessageModel message);
	
	ArrayList<MessageModel> selectChatUserList(String fromId);

}
