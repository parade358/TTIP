package com.kh.ttip.board.model.service;

import java.util.ArrayList;

import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.common.model.vo.PageInfo;

public interface BoardService {

	ArrayList<Board> selectMyList(String userNo, PageInfo pi);

	int selectListCount();

}
