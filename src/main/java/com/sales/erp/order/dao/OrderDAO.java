package com.sales.erp.order.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.TeamVO;
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

@Repository
public class OrderDAO implements OrderMapper{

	@Autowired
	private SqlSession sqlSession;

	public OrderJoinVO adminSelectOne(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.adminSelectOne(vo);
	}

	public void orderCheck(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.orderCheck(vo);
	}

	public void transInsert(OrderJoinVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.transInsert(vo);
	}

	public void modifyPro(OrderVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.modifyPro(vo);
	}

	public OrderVO selectOneOrder(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.selectOneOrder(vo);
	}

	public void cancleOne(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.cancleOne(vo);
	}

	public ArrayList<MemberVO> memberForReg() {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.memberForReg();
	}

	public ArrayList<TeamVO> selectTeam() {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.selectTeam();
	}

	public ArrayList<MemberVO> teamMember(TeamVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.teamMember(vo);
	}

	public ArrayList<ProductVO> selectProductAll() {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.selectProductAll();
	}

	public void insertOrder(OrderVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		mapper.insertOrder(vo);
	}

	public ArrayList<OrderJoinVO> adminSelectOrders(TestVO vo) {
		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
		return mapper.adminSelectOrders(vo);
	}
	
}
