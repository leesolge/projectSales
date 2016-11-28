package com.sales.erp.freeboard.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.freeboard.vo.FreeboardReplyVO;
import com.sales.erp.freeboard.vo.FreeboardSearchVO;
import com.sales.erp.freeboard.vo.FreeboardVO;

public interface FreeboardMapper extends Serializable {

	ArrayList<FreeboardVO> getFreeboardList(FreeboardSearchVO search);
	
	public int getFreeboardCount(FreeboardSearchVO search); //글의 수
	
	public void freeboardWrite(FreeboardVO vo); //글 쓰기
	
	FreeboardVO freeboardContent(String num); //읽기
	
	void freeboardUpdate(FreeboardVO vo); //수정

	void freeboardDelete(String num); //삭제
	
	//MemberVO getNameTeamAuth(String empno); //?
	
	/*여기서부터 댓글*/
	//public FreeboardVO sendWriteform(FreeboardVO vo);
	
	public void reReplyWriteForm(FreeboardReplyVO voParam);
	
	public void replyWrite(FreeboardReplyVO vo);
	
	public void reReplyWrite(FreeboardReplyVO vo);
	
	ArrayList<FreeboardReplyVO> replyList(String num);
	
	FreeboardReplyVO replyUpdateForm(FreeboardReplyVO voParam);
	
	void replyUpdate(FreeboardReplyVO vo);
	
	void replyDelete(FreeboardReplyVO vo);
	
	void reReplyDelete(FreeboardReplyVO vo);

}
