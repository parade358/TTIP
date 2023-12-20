package com.kh.ttip.announcement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class DetailCategory {

	
	private int detailNo;
	private String detailName;
	private String status;
	private int categoryNo;
	private int count;
}
