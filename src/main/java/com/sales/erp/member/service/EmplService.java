package com.sales.erp.member.service;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.EmplDAO;
import com.sales.erp.member.vo.OrderRequestVO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class EmplService {

	@Autowired
	private EmplDAO dao;

	public ModelAndView Buy_RequestForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("list", list);
		return mav;
	}

	public ModelAndView Buy_Request_Action(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ArrayList<String> list = new ArrayList<String>();
		Enumeration var = request.getParameterNames();
		String var_name;
		String var_value;
		while (var.hasMoreElements()) {			
			var_name = (String) var.nextElement();
			var_value = request.getParameter(var_name);
			list.add(var_value);
		}
		
		for(int i = 1; i<list.size(); i+=3){
			OrderRequestVO ovo = new OrderRequestVO();
			ovo.setEmpno(list.get(0));
			ovo.setProcode(list.get(i));
			ovo.setOamount(Integer.parseInt(list.get(i+1)));
			ovo.setOcomment(list.get(i+2));
			if(i == 1) dao.Buy_Request_Action(ovo);
			else dao.Buy_Request_Action_re(ovo);
		}
		return mav;
	}

	public ModelAndView getRequestList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		ArrayList<OrderRequestVO> list = dao.getRequestList(empno);
		mav.addObject("list", list);
		return mav;
	}
}


