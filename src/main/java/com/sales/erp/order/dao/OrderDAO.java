package com.sales.erp.order.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class OrderDAO implements OrderMapper{

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.selectProductAll();
	}

	public void insertOrder(OrderVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.insertOrder(vo);
	}

	public ArrayList<ProductVO> adminSelectOrders(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.adminSelectOrders(vo);
	}
	
}
