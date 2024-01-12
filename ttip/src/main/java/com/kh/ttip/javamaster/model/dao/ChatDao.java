package com.kh.ttip.javamaster.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ttip.javamaster.model.vo.MessageModel;
import com.kh.ttip.member.model.vo.Member;

@Repository
public class ChatDao {

	public int insertChat(SqlSessionTemplate sqlSession, MessageModel message) {
		
		return sqlSession.insert("chatMapper.insertChat", message);
	}

	public ArrayList<MessageModel> selectChat(SqlSessionTemplate sqlSession, MessageModel message) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChat", message);
	}

	public ArrayList<MessageModel> selectChatUserList(SqlSessionTemplate sqlSession, String fromId) {
		
		String fromLogin = fromId;

		return (ArrayList)sqlSession.selectList("chatMapper.selectChatUserList", fromLogin);
	}

}
