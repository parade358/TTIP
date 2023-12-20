package com.kh.ttip.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Member {
	private int userNo; // USER_NO NUMBER
	private String email; // EMAIL VARCHAR2(30 BYTE)
	private String userPassword; // USER_PASSWORD VARCHAR2(50 BYTE)
	private String userNickName; // USER_NICKNAME VARCHAR2(50 BYTE)
	private String userName; // USER_NAME VARCHAR2(40 BYTE)
	private String phone; // PHONE VARCHAR2(20 BYTE)
	private String enrollDate; // ENROLLDATE DATE
	private String gender; // GENDER VARCHAR2(10 BYTE)
	private String address; // ADDRESS VARCHAR2(100 BYTE)
	private String images; // IMAGES VARCHAR2(100 BYTE)
	private String categoryNo; // CATEGORY_NO NUMBER
	private int userPoint; // USER_POINT NUMBER
	private String status; // STATUS VARCHAR2(10 BYTE)
}
