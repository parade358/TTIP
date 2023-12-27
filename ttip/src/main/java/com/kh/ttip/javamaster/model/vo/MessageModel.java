package com.kh.ttip.javamaster.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageModel {
	private String message;
	private String fromLogin;
	private String toLogin;
	private String createDate;
}
