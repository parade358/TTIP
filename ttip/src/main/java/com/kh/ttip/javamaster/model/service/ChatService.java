package com.kh.ttip.javamaster.model.service;

import java.util.ArrayList;

import com.kh.ttip.javamaster.model.vo.MessageModel;

public interface ChatService {

	int insertChat(MessageModel message);

	ArrayList<MessageModel> selectChat(MessageModel message);

	

}
