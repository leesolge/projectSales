package com.sales.erp.salary.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SalaryController {

	
	@RequestMapping("/salary/salary")
	public ModelAndView testSalary(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		return mav;
	}
}
