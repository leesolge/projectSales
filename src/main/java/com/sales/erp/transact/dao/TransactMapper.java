package com.sales.erp.transact.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.OrderRequestListJoinVO;
import com.sales.erp.member.vo.OrderRequestListVO;
import com.sales.erp.member.vo.OrderRequestVO;
import com.sales.erp.transact.vo.TransactSearchVO;
import com.sales.erp.transact.vo.TransactVO;

public interface TransactMapper extends Serializable {
	public ArrayList<TransactVO> selectList(TransactSearchVO vo);

	public ArrayList<String> get_procode();

	public ArrayList<String> get_team();

	public ArrayList<OrderRequestListJoinVO> getRequestList();

	public void RequestApprove(String onum);

	

	public ArrayList<OrderRequestVO> GetTransactList(String onum);

	public void AddTransactList(OrderRequestVO vo);

	public void AddProduct(OrderRequestVO vo);
}
