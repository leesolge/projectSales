package com.sales.erp.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
