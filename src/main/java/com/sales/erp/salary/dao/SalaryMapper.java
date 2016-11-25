package com.sales.erp.salary.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.TeamVO;
import com.sales.erp.salary.vo.SalaryJoinVO;
import com.sales.erp.salary.vo.SalaryVO;
import com.sales.erp.salary.vo.TempVO;
import com.sales.erp.salary.vo.VOforSQL;

public interface SalaryMapper extends Serializable{
	MemberVO selectAMember(TempVO vo);
	ArrayList<OrderJoinVO> selectOrders(TempVO vo);
	ArrayList<MemberVO> tempTeam(TempVO vo);
	ArrayList<TeamVO> selectTeam();
	ArrayList<MemberVO> teamMember(TeamVO vo);
	ArrayList<SalaryJoinVO> adminSalary(TempVO vo);
	ArrayList<SalaryVO> dateObject();
	ArrayList<OrderJoinVO> team(VOforSQL vo);
	MemberVO selectMember(TempVO vo);
	ArrayList<SalaryVO> salaryList(TempVO vo);
	String profitOfManager(VOforSQL vo);
	void insertSalary(SalaryVO vo);
	String profitOfEmpl(VOforSQL vo);
	ArrayList<MemberVO> allMemberExceptAdmin();
	ArrayList<OrderJoinVO> selectMonthlyPerformance(VOforSQL vo);
	String profitSum(VOforSQL vo);
}
