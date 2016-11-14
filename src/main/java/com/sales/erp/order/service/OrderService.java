package com.sales.erp.order.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sales.erp.order.dao.OrderDAO;
import com.sales.erp.order.vo.OrderJoinVO;
import com.sales.erp.order.vo.OrderVO;
import com.sales.erp.order.vo.SortVO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ArrayList<OrderJoinVO> list = dao.ab();
		ArrayList<ProductVO> plist = dao.selectProductAll();
		
		String firstdate = request.getParameter("firstdate");
		String seconddate = request.getParameter("seconddate");
		String product = request.getParameter("product");
		String emp = request.getParameter("emp");
		if(firstdate==null||firstdate.equals("")){
			firstdate = "none";
		}else{
			firstdate = firstdate.replace("-", "")+"000000";
		}
		if(seconddate==null||seconddate.equals("")){
			seconddate = "none";
		}else{
			firstdate = seconddate.replace("-", "")+"235959";
		}
		if(product==null||product.equals("")){
			seconddate = "none";
		}
		if(emp==null||emp.equals("")){
			emp = "";
		}
		mav.addObject("plist", plist);
		mav.addObject("alist", list);
		return mav;
	}
	
	public ModelAndView registForm(){
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("plist", list);
		mav.addObject("empno", empno);
		return mav;
	}
	
	public ModelAndView registPro(HttpServletRequest request){
		OrderVO vo = new OrderVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setProcode(request.getParameter("procode"));
		vo.setProamount(request.getParameter("proamount"));
		vo.setCustomer(request.getParameter("customer"));
		vo.setAddress(request.getParameter("address"));
		dao.insertOrder(vo);
		RedirectView rv = null;
		rv = new RedirectView("/erp/order/list");
		rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(rv);
		return mav;
	}
}
