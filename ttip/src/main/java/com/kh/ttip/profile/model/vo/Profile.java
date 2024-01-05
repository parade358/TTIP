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
public class Profile {
	
	private int profileNo;
	private int reviewCount;
	private int reviewAverage;
	private String subService;
	private String oneLineIntro;
	private String approveYN;
	private String phoneAvailable;
	private String serviceDetailContent;
	private String changeName;
	private String mainService;
	private String address;
	private String license;
	private String portfolio;
}
