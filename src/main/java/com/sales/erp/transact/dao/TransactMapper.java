package com.sales.erp.transact.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.transact.vo.TransactVO;

public interface TransactMapper extends Serializable {
	public ArrayList<TransactVO> selectList(TransactVO vo);
}
