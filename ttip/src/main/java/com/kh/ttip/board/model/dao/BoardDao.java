package com.kh.ttip.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ttip.board.model.vo.Board;
import com.kh.ttip.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public ArrayList<Board> selectMyList(SqlSessionTemplate sqlSession, String userNo, PageInfo pi) {
		
		//몇개씩 보여줄지
				int limit = pi.getBoardLimit();
				//몇개를 건너뛸지
				int offset = (pi.getCurrentPage() -1 ) * limit;
				
				
				RowBounds rowBounds = new RowBounds(offset,limit);
				//rowbounds 객체를 전달해야하는데 전달할 파라미터(전달값)이 없다면 null을 넣어서 메소드 호출하기.
				return (ArrayList)sqlSession.selectList("boardMapper.selectMyList", userNo, rowBounds);
				
		}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

}
