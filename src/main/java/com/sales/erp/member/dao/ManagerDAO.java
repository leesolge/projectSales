package com.sales.erp.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.member.vo.OrderRequestListJoinVO;
import com.sales.erp.member.vo.OrderRequestVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession;

	public String getTeamName(String empno) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		return mapper.getTeamName(empno);
	}
	
	public List<MemberVO> getMemberList(String team) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		return mapper.getMemberList(team);
	}

	public ArrayList<OrderRequestListJoinVO> getRequestList(String team) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		return mapper.getRequestList(team);
	}
	
	public ArrayList<OrderRequestListJoinVO> getRequestApprovedList(String team) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		return mapper.getRequestApprovedList(team);
	}

	//콘텐트 내용출력은 사원에서 출력하는것과 동일하기 때문에 ManagerMapper에 따로 생성 안함.
	public ArrayList<OrderRequestVO> getRequestContent(String onum) {
		EmplMapper mapper = sqlSession.getMapper(EmplMapper.class);
		ArrayList<OrderRequestVO> list = mapper.getRequestContent(onum);
		return list;
	}

	public void RequestApprove(String onum) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		mapper.RequestApprove(onum);
	}





}
