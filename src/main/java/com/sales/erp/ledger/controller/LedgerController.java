package com.sales.erp.ledger.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.ledger.service.LedgerService;

@Controller
public class LedgerController {

	@Autowired
	private LedgerService ls;
	
	@RequestMapping("/ledger/regist")
	public ModelAndView registPro(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ls.ledgerRegistPro(request);
		mav.setViewName("redirect:/ledger/list");
		return mav;
	}
	
	@RequestMapping("/ledger/list")
	public ModelAndView ledgerList(HttpServletRequest request){
		ModelAndView mav = ls.ledgerList(request);
		mav.setViewName("/ledger/list");
		return mav;
	}
	
	@RequestMapping("/ledger/registForm")
	public ModelAndView ledgerRegistForm(){
		ModelAndView mav = ls.ledgerRegistForm();
		mav.setViewName("/ledger/registform");
		return mav;
	}
	
}