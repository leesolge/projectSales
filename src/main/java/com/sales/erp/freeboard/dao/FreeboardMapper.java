package com.sales.erp.freeboard.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.freeboard.vo.FreeboardSearch;
import com.sales.erp.freeboard.vo.FreeboardVO;
import com.sales.erp.freeboard.vo.ReplyForUpdateVO;
import com.sales.erp.freeboard.vo.ReplyVO;
import com.sales.erp.member.vo.MemberVO;

public interface FreeboardMapper extends Serializable {

	ArrayList<FreeboardVO> getFreeboardList(FreeboardSearch search);
	
	public int getFreeboardCount(FreeboardSearch search); //글의 수
	
	public void insertFreeboard(FreeboardVO vo); //글 쓰기
	
	FreeboardVO getFreeboard(String num); //읽기
	
	public int deleteFreeboard(int num); //삭제
	
	public void updateFreeboard(FreeboardVO vo); //수정
	
	MemberVO getNameTeamAuth(String empno); //?
	
	public FreeboardVO sendWriteform(FreeboardVO vo);
	
	ArrayList<ReplyVO> replyList(String num);
	
	public void insertReply(ReplyVO vo);
	
	ReplyVO replyListForUpdate(ReplyForUpdateVO vo);
	
	void updateReply(ReplyForUpdateVO vo);
	
	void deleteReply(ReplyForUpdateVO vo);
	
}
