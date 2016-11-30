package com.sales.erp.sell.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	// 판매 등록
	@RequestMapping(value = "/sell/sellWrite", method = RequestMethod.POST)
	public String sellWrite(HttpServletRequest request) {
		ss.sellWrite(request); // BUY 테이블에 승인요청 등록
		return "/sell/sellListPayWait";
	}

	// 판매 대기 리스트
	@RequestMapping("/sell/sellListPayWait")
	public ModelAndView sellListPayWait(HttpServletRequest request) {
		ModelAndView mav = ss.sellListPayWait();
		mav.setViewName("sell/sellListPayWait");
		return mav;
	}

	// 판매 대기 리스트
	@RequestMapping("/sell/sellListTest")
	public ModelAndView sellList(HttpServletRequest request) {
		ModelAndView mav = ss.sellList();
		mav.setViewName("sell/sellList");
		return mav;
	}

}
