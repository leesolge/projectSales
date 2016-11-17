package com.sales.erp.salary.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.salary.vo.VOforSQL;

@Repository
public class SalaryDAO implements SalaryMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public String profitSum(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.profitSum(vo);
	}

	public ArrayList<OrderJoinVO> selectMonthlyPerformance(VOforSQL vo) {
		SalaryMapper mapper = sqlSession.getMapper(SalaryMapper.class);
		return mapper.selectMonthlyPerformance(vo);
	}
	
}
