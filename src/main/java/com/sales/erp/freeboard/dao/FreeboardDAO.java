package com.sales.erp.freeboard.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.freeboard.vo.FreeboardSearch;
import com.sales.erp.freeboard.vo.FreeboardVO;
import com.sales.erp.freeboard.vo.ReplyForUpdateVO;
import com.sales.erp.freeboard.vo.ReplyVO;
import com.sales.erp.member.vo.MemberVO;

@Repository
public class FreeboardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<FreeboardVO> getFreeboardList(FreeboardSearch search){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.getFreeboardList(search);
	}
	
	public int getFreeboardCount(FreeboardSearch search){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.getFreeboardCount(search);
	}
	
	public void insertFreeboard(FreeboardVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		freeboardDAO.insertFreeboard(vo);
	}
	
	public FreeboardVO getFreeboard(String num){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.getFreeboard(num);
	}
	
	public int deleteFreeboard(int num){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.deleteFreeboard(num);
	}
	
	public void updateFreeboard(FreeboardVO vo){
		System.out.println("DAO의 updateFreeboard 시작점");
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		System.out.println("DAO의 updateFreeboard 끝점");
		
	}
	
	public FreeboardVO sendWriteform(FreeboardVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.sendWriteform(vo);
	}
	
	public MemberVO getNameTeamAuth(String empno){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.getNameTeamAuth(empno);
	}
	
	public ArrayList<ReplyVO> replyList(String num){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.replyList(num);
	}
	
	public void insertReply(ReplyVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		freeboardDAO.insertReply(vo);
	}
	
	public ReplyVO replyListForUpdate(ReplyForUpdateVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		return freeboardDAO.replyListForUpdate(vo);
	}
	
	public void updateReply(ReplyForUpdateVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		freeboardDAO.updateReply(vo);
	}
	
	public void deleteReply(ReplyForUpdateVO vo){
		FreeboardMapper freeboardDAO = sqlSession.getMapper(FreeboardMapper.class);
		freeboardDAO.deleteReply(vo);
	}
}