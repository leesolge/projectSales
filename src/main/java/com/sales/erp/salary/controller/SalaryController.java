package com.sales.erp.salary.controller;

import java.text.ParseException;

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
	
	@RequestMapping("/salary/salary")
	public ModelAndView testSalary(){
		ModelAndView mav = new ModelAndView();
		ss.viewSalaries();
		mav.setViewName("main/main");
		return mav;
	}
}
