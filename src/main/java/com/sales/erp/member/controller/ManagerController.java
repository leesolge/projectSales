package com.sales.erp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAOImpl;
import com.sales.erp.member.service.ManagerService;
import com.sales.erp.member.vo.MemberVO;

@Controller
public class ManagerController {

	@Autowired
	private MemberDAOImpl memberDAOImpl;

	@Autowired
	private ManagerService ms;

	@RequestMapping("/manager/member_list")
	public ModelAndView member_list(HttpServletRequest request) {
		ModelAndView mav = ms.getMemberList();
		mav.setViewName("manager/member_list");
		return mav;
	}

	@RequestMapping("/manager/member_info")
	public ModelAndView member_info(HttpServletRequest request) {
		MemberVO vo = memberDAOImpl.selectMember(request.getParameter("empno"));
		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("manager/member_info");
		return result;
	}

	@RequestMapping("/manager/buy_request_list")
	public ModelAndView buy_request_list(HttpServletRequest request) {
		ModelAndView mav = ms.getRequestList();
		mav.setViewName("manager/buy_request_list");
		return mav;
	}

	@RequestMapping("/manager/buy_approved_list")
	public ModelAndView buy_approved_list(HttpServletRequest request) {
		ModelAndView mav = ms.getRequestApprovedList();
		mav.setViewName("manager/buy_approved_list");
		return mav;
	}

	@RequestMapping(value = "/manager/buy_request_content", method = RequestMethod.POST)
	public ModelAndView buy_request_content(HttpServletRequest request) {
		ModelAndView mav = ms.getRequestContent(request.getParameter("onum"));
		mav.setViewName("manager/buy_request_content");
		return mav;
	}

	@RequestMapping(value = "/manager/buy_request_approve", method = RequestMethod.POST)
	public String buy_request_approve(HttpServletRequest request) {
		ms.RequestApprove(request.getParameter("onum"));
		return "redirect:/manager/buy_request_list";
	}

}
