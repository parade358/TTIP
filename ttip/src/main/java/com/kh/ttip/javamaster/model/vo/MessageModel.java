package com.kh.ttip.javamaster.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageModel {
	private int chatNo;
	private String message;
	private String fromLogin;
	private String toLogin;
	private String createDate;
}
