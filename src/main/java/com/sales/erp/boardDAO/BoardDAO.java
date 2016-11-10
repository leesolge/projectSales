package com.sales.erp.boardDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.boardVO.BoardVO;


@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*public ArrayList<BoardVO> getBoardList(BoardVO vo){
		BoardMapper boardMapper=sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> list=boardMapper.getBoardList(vo);
		return list;
	}*/
	public ArrayList<BoardVO> getBoardList(HashMap map) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getBoardList(map);
	}
	
	/*public int getBoardCount(){
	BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
	return boardDAO.getBoardCount();
	}*/
	
	public int getBoardCount() {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getBoardCount();
	}
	
	public void insertBoard(BoardVO vo){
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		boardDAO.insertBoard(vo);
	}
	
	public BoardVO getBoard(int num){
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getBoard(num);
	}
	
	public int deleteBoard(int num){
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.deleteBoard(num);
	}

	public int updateBoard(BoardVO vo) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.updateBoard(vo);
	}
}
