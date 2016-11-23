package com.sales.erp.sell.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.product.vo.ProductVO;

@Repository
public class SellDAO{

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		SellMapper mapper = sqlSession.getMapper(SellMapper.class);
		return mapper.selectProductAll();
	}
	
}
