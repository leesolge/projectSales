package com.sales.erp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
