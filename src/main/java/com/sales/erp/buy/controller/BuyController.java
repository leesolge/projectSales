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
	
	// Product 충원 요청 대기 리스트
	@RequestMapping("/buy/buyListWait")
	public ModelAndView buyListWait(HttpServletRequest request) {		
		ModelAndView mav = bs.buyListWait();		
		mav.setViewName("buy/buyListWait");
		return mav;
	}
	
	// Product 충원 승인 대기 리스트
	@RequestMapping("/buy/buyListAppWait")
	public ModelAndView buyListAppWait(HttpServletRequest request) {
		ModelAndView mav = bs.buyListAppWait();
		mav.setViewName("buy/buyListAppWait");
		return mav;
	}
	
	// Product 충원 요청 콘텐트
	@RequestMapping(value="/buy/buyContent", method=RequestMethod.POST)
	public ModelAndView buyContent(HttpServletRequest request) {
		ModelAndView mav = bs.buyContent(request);
		mav.setViewName("buy/buyContent");
		return mav;
	}
	
	// Product 충원 승인처리
	@RequestMapping(value = "/buy/buyApprove", method = RequestMethod.POST)
	public String buyApprove(HttpServletRequest request) {
		bs.buyApprove(request);
		return "redirect:/buy/buyListAppWait";
	}
	
	// Product 충원 승인 리스트
	@RequestMapping("/buy/buyAppList")
	public ModelAndView buyAppList(HttpServletRequest request) {
		ModelAndView mav = bs.buyAppList();
		mav.setViewName("buy/buyAppList");
		return mav;
	}
}
