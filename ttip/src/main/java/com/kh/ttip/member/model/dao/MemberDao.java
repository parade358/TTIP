package com.kh.ttip.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.ttip.member.model.vo.Member;

@Repository
public class MemberDao {

	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	//별명 중복체크
	public int CheckNickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nickname",nickname);
	}

	//이메일 중복체크
	public int EmailSend(SqlSessionTemplate sqlSession, String emailck) {
		return sqlSession.selectOne("memberMapper.emailck", emailck);
	}

	public Member memberSessionReinsert(String email, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", email);
	}

	public int findPwdCheck(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.findPwdCheck", email);
	}

	public void insertProfile(SqlSessionTemplate sqlSession) {
		sqlSession.update("memberMapper.insertProfile");
	}

	public void insertQAcomment(SqlSessionTemplate sqlSession) {
		sqlSession.update("memberMapper.insertQAcomment");
	}

	public void insertBasicImage(SqlSessionTemplate sqlSession) {
		sqlSession.update("memberMapper.insertBasicImage");
	}
}
