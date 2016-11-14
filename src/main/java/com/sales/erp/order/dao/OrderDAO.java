package com.sales.erp.order.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.note.vo.JoinVO;
import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.SortVO;
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

}
