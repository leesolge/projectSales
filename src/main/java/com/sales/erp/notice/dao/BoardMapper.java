package com.sales.erp.notice.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.notice.vo.BoardSearch;
import com.sales.erp.notice.vo.BoardVO;
import com.sales.erp.notice.vo.CommentForUpdateVO;
import com.sales.erp.notice.vo.CommentVO;

public interface BoardMapper extends Serializable {
	
	//ArrayList<BoardVO> getBoardList(BoardVO vo);
	ArrayList<BoardVO> getBoardList(BoardSearch search);
	
	public int getBoardCount(BoardSearch search); //글의수
	public void insertBoard(BoardVO vo); //글쓰기

	BoardVO getBoard(String num); //읽기
	
	public int deleteBoard(int num); //삭제

	int updateBoard(BoardVO vo); //수정

	MemberVO getNameTeamAuth(String empno);

	public BoardVO sendWriteForm(BoardVO vo);

	ArrayList<CommentVO> commentList(String num);

	public void insertComment(CommentVO vo);

	CommentVO commentListforUpdate(CommentForUpdateVO vo);

	void updateComments(CommentForUpdateVO vo);

	void deleteComments(CommentForUpdateVO vo);
	
}
