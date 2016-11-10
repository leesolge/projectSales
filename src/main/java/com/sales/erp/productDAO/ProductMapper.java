package com.sales.erp.productDAO;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.productVO.ProductVO;

public interface ProductMapper extends Serializable{
	
	ArrayList<ProductVO> selectAll();
	ArrayList<ProductVO> selectOne(String procode);
	public void insertPro(ProductVO vo);
	public void deletePro(String procode);
}
