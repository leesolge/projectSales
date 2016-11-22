package com.sales.erp.buy.dao;

import java.io.Serializable;
import java.util.ArrayList;

import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.product.vo.ProductVO;

public interface BuyMapper extends Serializable {

	ArrayList<ProductVO> selectProductAll();

	void buyWrite(BuyVO bvo);

	void buyWriteSameBuynum(BuyVO bvo);

	ArrayList<BuyListVO> buyListWait(BuyVO vo);

	String getAuth(BuyVO vo);

}
