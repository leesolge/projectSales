package com.sales.erp.salary.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.salary.service.SalaryService;


@Controller
public class SalaryController {

	@Autowired
	private SalaryService ss;
	
	@RequestMapping("/admin/salary")
	public ModelAndView adminSalary(HttpServletRequest request){
		ModelAndView mav = ss.adminSalary(request);
		mav.setViewName("salary/adminlist");
		mav.addObject("history", "관리자메뉴 > 월급조회");
		return mav;
	}
	
	@RequestMapping("/salary/view")
	public ModelAndView testSalary(HttpServletRequest request){
		ModelAndView mav = ss.viewSalary(request);
		mav.setViewName("salary/list");
		mav.addObject("history", "개인메뉴 > 월급조회");
		return mav;
	}
}
