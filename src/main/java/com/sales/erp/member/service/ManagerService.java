package com.sales.erp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.ManagerDAO;
import com.sales.erp.member.vo.MemberVO;

@Service
public class ManagerService {

	@Autowired
	private ManagerDAO dao;

	public ModelAndView getMemberList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		String team = dao.getTeamName(empno);
		List<MemberVO> list = dao.getMemberList(team);
		mav.addObject("list", list);
		return mav;
	}

}
