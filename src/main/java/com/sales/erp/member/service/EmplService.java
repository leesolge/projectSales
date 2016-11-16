package com.sales.erp.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.EmplDAO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class EmplService {
	
	@Autowired
	private EmplDAO dao;
	
	public ModelAndView Buy_RequestForm(){
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		ProductVO temp = new ProductVO();
		temp.setProname("기타");
		list.add(temp);
		mav.addObject("list", list);
		return mav;
	}
}
