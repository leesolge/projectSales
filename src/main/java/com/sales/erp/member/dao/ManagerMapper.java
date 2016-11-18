package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.OrderRequestListJoinVO;

public interface ManagerMapper extends Serializable {

	String getTeamName(String empno);
	ArrayList<OrderRequestListJoinVO> getRequestList(String team);

}
