package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.OrderRequestListVO;
import com.sales.erp.member.vo.OrderRequestVO;

public interface EmplMapper extends Serializable {

	void Buy_Request_Action(OrderRequestVO ovo);
	void Buy_Request_Action_re(OrderRequestVO ovo);
	ArrayList<OrderRequestListVO> getRequestList(String empno);
	ArrayList<OrderRequestVO> getRequestContent(String onum);
	ArrayList<OrderRequestListVO> getRequestApprovedList(String empno);

}
