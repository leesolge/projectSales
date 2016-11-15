package com.sales.erp.order.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.TeamVO;
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

public interface OrderMapper extends Serializable{

	ArrayList<ProductVO> selectProductAll();
	void insertOrder(OrderVO vo);
	ArrayList<OrderJoinVO> adminSelectOrders(TestVO vo);
	ArrayList<TeamVO> selectTeam();
	ArrayList<MemberVO> teamMember(TeamVO vo);
}
