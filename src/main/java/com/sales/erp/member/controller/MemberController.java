package com.sales.erp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.service.MemberService;
import com.sales.erp.member.vo.SendMail;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private SendMail mail;
	
	@RequestMapping("/member/memberContent")
	public ModelAndView memberContent(HttpServletRequest request) {
		ModelAndView mav = ms.memberContent(request);
		mav.setViewName("member/memberContent");
		return mav;
	}
	
	@RequestMapping("/member/memberList")
	public ModelAndView memberList(HttpServletRequest request) {
		ModelAndView mav = ms.memberList(request);
		mav.setViewName("member/memberList");		
		return mav;
	}
	
}
