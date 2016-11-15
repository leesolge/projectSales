package com.sales.erp.order.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

public interface OrderMapper extends Serializable{

	ArrayList<ProductVO> selectProductAll();
	void insertOrder(OrderVO vo);
	ArrayList<ProductVO> adminSelectOrders(TestVO vo);
}
