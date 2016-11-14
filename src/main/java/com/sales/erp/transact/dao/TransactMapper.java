package com.sales.erp.transact.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.transact.vo.TransactSearchVO;
import com.sales.erp.transact.vo.TransactVO;

public interface TransactMapper extends Serializable {
	public ArrayList<TransactVO> selectList(TransactSearchVO vo);

	public ArrayList<String> get_procode();

	public ArrayList<String> get_team();
}
