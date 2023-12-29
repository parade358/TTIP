package com.kh.ttip.member.service;

import com.kh.ttip.member.model.vo.Member;

public interface MemberService {

	//회원가입 메소드
	int insertMember(Member m);

	//로그인
	Member loginMember(Member m);

	//별명 중복체크
	int CheckNickname(String nickname);

	//이메일 중복체크
	int EmailSend(String emailck);
	
	//회원정보 재조회
	Member memberSessionReinsert(String email);

	int findPwdCheck(String email);

}
