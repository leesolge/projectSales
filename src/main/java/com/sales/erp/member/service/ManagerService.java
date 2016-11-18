package com.sales.erp.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.ManagerDAO;
import com.sales.erp.member.vo.OrderRequestListJoinVO;
import com.sales.erp.product.dao.ProductDAO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class ManagerService {

	@Autowired
	private ManagerDAO dao;
	
	@Autowired
	private ProductDAO prodao;

	public ModelAndView getRequestList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		String team = dao.getTeamName(empno);
		ArrayList<OrderRequestListJoinVO> list = dao.getRequestList(team);
		for(int i=0; i<list.size(); i++){
			ProductVO name = prodao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt()-1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}

	
}


