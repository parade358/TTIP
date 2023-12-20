package com.kh.ttip.profile.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Image {
	
	private int atNo;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private int fileLevel;
	private String fileType;
	private int refNo;
}
