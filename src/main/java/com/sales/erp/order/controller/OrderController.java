package com.sales.erp.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.order.service.OrderService;
import com.sales.erp.order.vo.OrderVO;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping("/order/orderfail")
	public ModelAndView orderFail(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/fail");
		return mav;
	}
	
	@RequestMapping("/order/cancle")
	public ModelAndView orderCheck(@RequestParam("orderid") String orderid){
		ModelAndView mav = os.orderCheck(orderid);
		return mav;
	}
	
	@RequestMapping("/order/modify")
	public ModelAndView modifyPro(HttpServletRequest request){
		ModelAndView mav = os.modifyPro(request);
		return mav;
	}
	
	@RequestMapping("/order/modifyForm")
	public ModelAndView modifyOne(@RequestParam("orderid") String id, @RequestParam("authpage") String authpage){
		ModelAndView mav = os.adminRegistForm(authpage);
		mav.addObject("mo", os.selectOneOrder(id));
		mav.setViewName("order/modifyone");
		return mav;
	}
	
	@RequestMapping("/order/delete")
	public ModelAndView cancleOne(@RequestParam("orderid") String id){
		ModelAndView mav = os.canclePro(id);
		return mav;
	}
	
	@RequestMapping("/order/regist")
	public ModelAndView adminRegistPro(HttpServletRequest request){
		ModelAndView mav = os.adminRegistPro(request);
		return mav;
	}
	
	@RequestMapping(value="/order/registForm", method=RequestMethod.POST)
	public ModelAndView adminRegistForm(@RequestParam("authpage") String authpage){
		ModelAndView mav = os.adminRegistForm(authpage);
		mav.setViewName("order/adminregist");
		return mav;
	}
	
	@RequestMapping("/order/list")
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = os.adminOrder(request);
		mav.setViewName("order/adminlist");
		return mav;
	}
	
}
