package com.sales.erp.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.order.service.OrderService;
import com.sales.erp.order.vo.OrderVO;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping("/admin/orderfail")
	public ModelAndView orderFail(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/fail");
		return mav;
	}
	
	@RequestMapping("/admin/corder")
	public ModelAndView orderCheck(@RequestParam("orderid") String orderid){
		ModelAndView mav = os.orderCheck(orderid);
		return mav;
	}
	
	@RequestMapping("/admin/modifyPro")
	public ModelAndView modifyPro(HttpServletRequest request){
		ModelAndView mav = os.modifyPro(request);
		return mav;
	}
	
	@RequestMapping("/admin/morder")
	public ModelAndView modifyOne(@RequestParam("orderid") String id){
		ModelAndView mav = os.adminRegistForm();
		mav.addObject("mo", os.selectOneOrder(id));
		mav.setViewName("order/modifyone");
		return mav;
	}
	
	@RequestMapping("/admin/dorder")
	public ModelAndView cancleOne(@RequestParam("orderid") String id){
		ModelAndView mav = os.canclePro(id);
		return mav;
	}
	
	@RequestMapping("/admin/registOrder")
	public ModelAndView adminRegistPro(HttpServletRequest request){
		ModelAndView mav = os.adminRegistPro(request);
		return mav;
	}
	
	@RequestMapping("/admin/worder")
	public ModelAndView adminRegistForm(HttpServletRequest request){
		ModelAndView mav = os.adminRegistForm();
		mav.setViewName("order/adminregist");
		return mav;
	}
	
	@RequestMapping("/admin/order")
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = os.adminOrder(request);
		mav.setViewName("order/adminlist");
		return mav;
	}
	
	@RequestMapping("/order/regist")
	public ModelAndView registForm(){
		ModelAndView mav = os.registForm();
		mav.setViewName("/order/regist");
		return mav;
	}
	
	@RequestMapping("/order/registOrder")
	public ModelAndView registPro(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		os.registPro(request);
		mav.setViewName("redirect:/order/list");
		return mav;
	}
	
}
