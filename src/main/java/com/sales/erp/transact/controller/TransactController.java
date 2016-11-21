package com.sales.erp.transact.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.transact.service.TransactService;

@Controller
public class TransactController {
	
	@Autowired
	private TransactService trs;
	
	@RequestMapping("/transact/transactlist_default")
	public ModelAndView transactlist_default(){
		ModelAndView mav = trs.takeOptions();
		mav.setViewName( "/transact/transactlist_default");
		return mav;
	}

	@RequestMapping("/transact/transactlist")
	public ModelAndView selectNotes(HttpServletRequest request) throws ParseException{
		ModelAndView mav = trs.transList(request);
		mav.setViewName("/transact/transactlist");
		return mav;
	}
	
	@RequestMapping("/transact/buy_request_list")
	public ModelAndView buy_request_list(HttpServletRequest request) {
		ModelAndView mav = trs.getRequestList();
		mav.setViewName("transact/buy_request_list");
		return mav;
	}
	
	@RequestMapping(value = "/transact/buy_request_approve", method = RequestMethod.POST)
	public String buy_request_approve(HttpServletRequest request) {
		trs.RequestApprove(request);
		trs.AddTransact(request);
		return "redirect:/transact/buy_request_list";
	}


}
