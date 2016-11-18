package com.sales.erp.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.notice.vo.BoardSearch;
import com.sales.erp.notice.vo.BoardVO;
import com.sales.erp.notice.vo.CommentForUpdateVO;
import com.sales.erp.notice.vo.CommentVO;


@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*public ArrayList<BoardVO> getBoardList(BoardVO vo){
		BoardMapper boardMapper=sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> list=boardMapper.getBoardList(vo);
		return list;
	}*/
	public ArrayList<BoardVO> getBoardList(BoardSearch search) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getBoardList(search);
	}
	
	/*public int getBoardCount(){
	BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
	return boardDAO.getBoardCount();
	}*/
	
	public int getBoardCount(BoardSearch search) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getBoardCount(search);
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
	
	public BoardVO sendWriteForm(BoardVO vo){
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.sendWriteForm(vo);
	}
	
	public MemberVO getNameTeamAuth(String empno) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.getNameTeamAuth(empno);
	}

	public ArrayList<CommentVO> commentList(String num) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.commentList(num);
	}

	public void insertComment(CommentVO vo) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		boardDAO.insertComment(vo);
	}
	
	public CommentVO commentListforUpdate(CommentForUpdateVO vo) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		return boardDAO.commentListforUpdate(vo);
	}

	public void updateComments(CommentForUpdateVO vo) {
		BoardMapper boardDAO = sqlSession.getMapper(BoardMapper.class);
		boardDAO.updateComments(vo);
	}
}
