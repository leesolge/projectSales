package com.sales.erp.sell.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.product.vo.ProductVO;

public interface SellMapper extends Serializable{

	ArrayList<ProductVO> selectProductAll();

}
