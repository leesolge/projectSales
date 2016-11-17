package com.sales.erp.salary.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.salary.vo.VOforSQL;

public interface SalaryMapper extends Serializable{
	
	ArrayList<OrderJoinVO> selectMonthlyPerformance(VOforSQL vo);
	String profitSum(VOforSQL vo);
}
