package com.sales.erp.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.OrderRequestListJoinVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession;

	public String getTeamName(String empno) {

		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		return mapper.getTeamName(empno);
	}

	public ArrayList<OrderRequestListJoinVO> getRequestList(String team) {
		ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);
		ArrayList<OrderRequestListJoinVO> list = mapper.getRequestList(team);
		return list;
	}

}
