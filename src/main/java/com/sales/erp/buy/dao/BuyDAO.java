package com.sales.erp.buy.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class BuyDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProductVO> selectProductAll() {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.selectProductAll();
	}

	public void buyWrite(BuyVO bvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyWrite(bvo);
	}

	public void buyWriteSameBuynum(BuyVO bvo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		mapper.buyWriteSameBuynum(bvo);
	}

	public ArrayList<BuyListVO> buyListWait(BuyVO vo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.buyListWait(vo);
	}

	public String getAuth(BuyVO vo) {
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.getAuth(vo);
	}
}
