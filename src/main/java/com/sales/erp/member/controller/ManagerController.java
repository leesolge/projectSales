package com.sales.erp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAOImpl;
import com.sales.erp.member.service.EmplService;
import com.sales.erp.member.service.ManagerService;

@Controller
public class ManagerController {

	@Autowired
	private MemberDAOImpl MemberDAOImpl;
	
	@Autowired
	private ManagerService ms;

	@RequestMapping("/manager/buy_request_list")
	public ModelAndView buy_request_list(HttpServletRequest request) {		
		ModelAndView mav = ms.getRequestList();		
		mav.setViewName("manager/buy_request_list");
		return mav;
	}
}
