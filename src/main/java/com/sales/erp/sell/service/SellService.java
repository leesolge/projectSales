package com.sales.erp.sell.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.product.vo.ProductVO;
import com.sales.erp.sell.dao.SellDAO;

@Service
public class SellService {
	
	@Autowired
	private SellDAO dao;

	public ModelAndView sellWriteForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("list", list);
		return mav;
	}
	
}
