package com.sales.erp.member.dao;

import java.io.Serializable;
import java.util.List;

import com.sales.erp.member.vo.MemberVO;

public interface ManagerMapper extends Serializable {

	String getTeamName(String empno);
	List<MemberVO> getMemberList(String team);

}