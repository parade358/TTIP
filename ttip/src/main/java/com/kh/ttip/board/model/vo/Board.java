package com.kh.ttip.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Board {
	private int boardNo;		
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private int count;
	private String createDate;
	private String status;
	private int boardType;
	private String userNo;
	
}
