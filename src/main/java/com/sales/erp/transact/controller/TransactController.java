package com.sales.erp.transact.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
