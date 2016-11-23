package com.sales.erp.sell.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.sell.service.SellService;

@Controller
public class SellController {
	
	@Autowired
	private SellService ss;
	
	// 판매 양식
		@RequestMapping(value = "/sell/sellWriteForm")
		public ModelAndView sellWriteForm(HttpServletRequest request) {
			ModelAndView mav = ss.sellWriteForm();
			mav.setViewName("sell/sellWriteForm");
			return mav;
		}
			
}
