package com.kh.ttip.profile.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class QA_comment {

	private int questionNum;
	private String qaAnswer;
}
