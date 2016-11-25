package com.sales.erp.freeboard.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.freeboard.vo.FreeboardReplyVO;
import com.sales.erp.freeboard.vo.FreeboardSearchVO;
import com.sales.erp.freeboard.vo.FreeboardVO;

@Repository
public class FreeboardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<FreeboardVO> getFreeboardList(FreeboardSearchVO search){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.getFreeboardList(search);
	}
	
	public int getFreeboardCount(FreeboardSearchVO search){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.getFreeboardCount(search);
	}
	
	public void freeboardWrite(FreeboardVO vo){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.freeboardWrite(vo);
	}
	
	public FreeboardVO freeboardContent(String num){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.freeboardContent(num);
	}
	
	public void freeboardUpdate(FreeboardVO vo){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.freeboardUpdate(vo);
	}
	
	public void freeboardDelete(String num){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.freeboardDelete(num);
	}
	
	public void replyWrite(FreeboardReplyVO vo){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.replyWrite(vo);
	}
	
	public void reReplyWrite(FreeboardReplyVO vo) {
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.reReplyWrite(vo);
	}
	
	/*public MemberVO getNameTeamAuth(String empno){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.getNameTeamAuth(empno);
	}*/
	
	public ArrayList<FreeboardReplyVO> replyList(String num){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.replyList(num);
	}
	
	public FreeboardReplyVO replyUpdateForm(FreeboardReplyVO voParam){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		return mapper.replyUpdateForm(voParam);
	}
	
	public void replyUpdate(FreeboardReplyVO vo){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.replyUpdate(vo);
	}
	
	public void replyDelete(FreeboardReplyVO vo){
		FreeboardMapper mapper = sqlSession.getMapper(FreeboardMapper.class);
		mapper.replyDelete(vo);
	}

}