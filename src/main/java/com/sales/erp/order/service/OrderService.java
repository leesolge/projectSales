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
import com.sales.erp.order.vo.TestVO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> plist = dao.selectProductAll();
		
		String firstdate = request.getParameter("firstdate");
		String seconddate = request.getParameter("seconddate");
		String product = request.getParameter("product");
		String emp = request.getParameter("emp");
		if(firstdate==null||firstdate.equals("")){
			firstdate = "";
		}else{
			firstdate = firstdate.replace("-", "")+"000000";
			firstdate = "AND O.REGDATE>=TO_DATE('"+firstdate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(seconddate==null||seconddate.equals("")){
			seconddate = "";
		}else{
			seconddate = seconddate.replace("-", "")+"235959";
			seconddate = "AND O.REGDATE<=TO_DATE('"+seconddate+"', 'YYYYMMDDHH24MISS') ";
		}
		if(product==null||product.equals("")){
			product = "";
		}else{
			product = "AND O.PROCODE='"+product+"' ";
		}
		if(emp==null||emp.equals("")){
			emp = "";
		}else{
			emp = "AND O.EMPNO='"+emp+"' ";
		}
		TestVO vo = new TestVO();
		vo.setTests(firstdate+seconddate+product+emp);
		System.out.println(vo.getTests());
		ArrayList<ProductVO> list = dao.adminSelectOrders(vo);
		System.out.println(list);
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
