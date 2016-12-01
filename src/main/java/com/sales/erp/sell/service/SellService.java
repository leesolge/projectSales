package com.sales.erp.sell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sales.erp.sell.dao.SellDAO;
import com.sales.erp.sell.vo.SellVO.KeyValue;

@Service
public class SellService {

	@Autowired
	private SellDAO dao;

	public List<KeyValue> getChart() {		
		return dao.getChart();
	}

}
