package com.sales.erp.notice.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.notice.vo.BoardSearch;
import com.sales.erp.notice.vo.BoardVO;

public interface BoardMapper extends Serializable {
	
	//ArrayList<BoardVO> getBoardList(BoardVO vo);
	ArrayList<BoardVO> getBoardList(BoardSearch search);
	
	public int getBoardCount(BoardSearch search); //글의수
	public void insertBoard(BoardVO vo); //글쓰기

	BoardVO getBoard(int num); //읽기
	
	public int deleteBoard(int num); //삭제

	int updateBoard(BoardVO vo); //수정
	
}
