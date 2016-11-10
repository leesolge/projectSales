package com.sales.erp.product.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.product.vo.ProductVO;

public interface ProductMapper extends Serializable{
	
	ArrayList<ProductVO> selectAll();
	ArrayList<ProductVO> selectOne(String procode);
	public void insertPro(ProductVO vo);
	public void deletePro(String procode);
}
