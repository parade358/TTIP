package com.kh.ttip.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.member.model.dao.MemberDao;
import com.kh.ttip.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		int result =  memberDao.insertMember(sqlSession, m);
		memberDao.insertProfile(sqlSession);
		memberDao.insertQAcomment(sqlSession);
		memberDao.insertBasicImage(sqlSession);
		return result;
	}

	//로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession,m);
	}
	
	//별명 중복체크
	@Override
	public int CheckNickname(String nickname) {
		return memberDao.CheckNickname(sqlSession,nickname);
	}

	//이메일 중복체크
	@Override
	public int EmailSend(String emailck) {
		return memberDao.EmailSend(sqlSession, emailck);
	}

	@Override
	public Member memberSessionReinsert(String email) {
		return memberDao.memberSessionReinsert(email,sqlSession);
	}

	@Override
	public int findPwdCheck(String email) {
		// TODO Auto-generated method stub
		return memberDao.findPwdCheck(sqlSession, email);
	}
	
	
}
