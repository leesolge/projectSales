package com.sales.erp.salary.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.salary.vo.SalaryVO;
import com.sales.erp.salary.vo.VOforSQL;

@Repository
public class SalaryDAO implements SalaryMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public String profitOfManager(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.profitOfManager(vo);
	}

	public void insertSalary(SalaryVO vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		mapper.insertSalary(vo);
	}

	public String profitOfEmpl(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.profitOfEmpl(vo);
	}

	public ArrayList<MemberVO> allMemberExceptAdmin() {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.allMemberExceptAdmin();
	}

	public String profitSum(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.profitSum(vo);
	}

	public ArrayList<OrderJoinVO> selectMonthlyPerformance(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.selectMonthlyPerformance(vo);
	}
	
}
