package com.sales.erp.sell.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.sell.vo.SellVO;

public interface SellMapper extends Serializable {

	ArrayList<SellVO> getChart();

}
