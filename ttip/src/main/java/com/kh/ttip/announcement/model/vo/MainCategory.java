package com.kh.ttip.announcement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder

public class MainCategory {

	private int categoryNo;
	private String categoryName;
}
