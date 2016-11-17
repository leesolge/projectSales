package com.sales.erp.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.OrderRequestListVO;
import com.sales.erp.member.vo.OrderRequestVO;
import com.sales.erp.order.dao.OrderMapper;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class EmplDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.selectProductAll();
	}

	public void Buy_Request_Action(OrderRequestVO ovo) {
		EmplMapper mapper = sqlSession.getMapper(EmplMapper.class);
		mapper.Buy_Request_Action(ovo);
	}

	public void Buy_Request_Action_re(OrderRequestVO ovo) {
		EmplMapper mapper = sqlSession.getMapper(EmplMapper.class);
		mapper.Buy_Request_Action_re(ovo);
	}

	public ArrayList<OrderRequestListVO> getRequestList(String empno) {
		EmplMapper mapper = sqlSession.getMapper(EmplMapper.class);
		ArrayList<OrderRequestListVO> list = mapper.getRequestList(empno);
		return list;
	}

	public ArrayList<OrderRequestVO> getRequestContent(String onum) {
		EmplMapper mapper = sqlSession.getMapper(EmplMapper.class);
		ArrayList<OrderRequestVO> list = mapper.getRequestContent(onum);
		return list;
	}
}
