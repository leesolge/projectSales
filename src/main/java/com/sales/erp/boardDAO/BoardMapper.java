package com.sales.erp.boardDAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import com.sales.erp.boardVO.BoardVO;

public interface BoardMapper extends Serializable {
	
	//ArrayList<BoardVO> getBoardList(BoardVO vo);
	ArrayList<BoardVO> getBoardList(HashMap map);
	
	public int getBoardCount(); //글의수
	public void insertBoard(BoardVO vo); //글쓰기

	BoardVO getBoard(int num); //읽기
	
	public int deleteBoard(int num); //삭제

	int updateBoard(BoardVO vo); //수정
	
}
