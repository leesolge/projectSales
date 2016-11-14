package com.sales.erp.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.order.service.OrderService;
import com.sales.erp.order.vo.OrderVO;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
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
