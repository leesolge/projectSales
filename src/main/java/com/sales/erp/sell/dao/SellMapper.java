package com.sales.erp.sell.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sales.erp.sell.vo.SellVO;
import com.sales.erp.sell.vo.SellVO.KeyValue;

public interface SellMapper extends Serializable {

	List<KeyValue> getChart();

}
