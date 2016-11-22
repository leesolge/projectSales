package com.sales.erp.buy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.buy.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService bs;

	// Product 충원 요청 양식
	@RequestMapping(value = "/buy/buyWriteForm")
	public ModelAndView buyWriteForm(HttpServletRequest request) {
		ModelAndView mav = bs.buyWriteForm();
		mav.setViewName("buy/buyWriteForm");
		return mav;
	}

	// Product 충원 요청 등록
	@RequestMapping(value = "/buy/buyWrite", method = RequestMethod.POST)
	public String EbuyWrite(HttpServletRequest request) {
		bs.buyWrite(request); // BUY 테이블에 승인요청 등록
		return "redirect:/buy/buyListWait";
		
	}
	
	@RequestMapping("/buy/buyListWait")
	public ModelAndView buyListWait(HttpServletRequest request) {		
		ModelAndView mav = bs.buyListWait();		
		mav.setViewName("buy/buyListWait");
		return mav;
	}

}
