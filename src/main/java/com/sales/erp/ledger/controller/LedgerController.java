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
	
	@RequestMapping("/ledger/delete")
	public ModelAndView delete(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ls.deletePro(request);
		mav.setViewName("redirect:/ledger/list");
		return mav;
	}
	
	@RequestMapping("/ledger/modify")
	public ModelAndView modifyPro(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ls.modifyPro(request);;
		mav.setViewName("redirect:/ledger/list");
		return mav;
	}
	
	@RequestMapping("/ledger/modifyForm")
	public ModelAndView modifyForm(HttpServletRequest request){
		ModelAndView mav = ls.modifyForm(request);
		mav.setViewName("/ledger/modifyform");
		mav.addObject("history", "자재팀메뉴 > 회계장부 > 수정");
		return mav;
	}
	
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
		mav.addObject("history", "자재팀메뉴 > 회계장부 > 목록");
		return mav;
	}
	
	@RequestMapping("/ledger/registForm")
	public ModelAndView ledgerRegistForm(){
		ModelAndView mav = ls.ledgerRegistForm();
		mav.setViewName("/ledger/registform");
		mav.addObject("history", "자재팀메뉴 > 회계장부 > 등록");
		return mav;
	}
	
}