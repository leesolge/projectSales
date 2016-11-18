package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.member.vo.OrderRequestListJoinVO;
import com.sales.erp.member.vo.OrderRequestListVO;

public interface ManagerMapper extends Serializable {

	String getTeamName(String empno);
	ArrayList<OrderRequestListJoinVO> getRequestList(String team);
	void RequestApprove(String onum);
	ArrayList<OrderRequestListJoinVO> getRequestApprovedList(String team);
	List<MemberVO> getMemberList(String team);

}
