package com.sales.erp.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping("/order/orderfail")
	public ModelAndView orderFail(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/fail");
		mav.addObject("history", "영업팀메뉴 > 판매목록 > 판매확정 > 실패");
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
	public ModelAndView modifyOne(HttpServletRequest request){
		ModelAndView mav = os.adminRegistForm(request);
		mav.addObject("mo", os.selectOneOrder(request.getParameter("orderid")));
		mav.setViewName("order/modifyone");
		mav.addObject("history", "영업팀메뉴 > 판매목록 > 수정");
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
	
	@RequestMapping("/order/registForm")
	public ModelAndView adminRegistForm(HttpServletRequest request){
		ModelAndView mav = os.adminRegistForm(request);
		mav.setViewName("order/adminregist");
		mav.addObject("history", "영업팀메뉴 > 판매등록");
		return mav;
	}
	
	@RequestMapping("/order/detail")
	public ModelAndView orderContents(@RequestParam("authpage") String authpage, @RequestParam("orderid") String id, @RequestParam("checks") String checks){
		ModelAndView mav = os.orderContents(authpage, id, checks);
		mav.setViewName("order/orderdetail");
		mav.addObject("history", "영업팀메뉴 > 판매목록 > 상세보기");
		return mav;
	}
	
	@RequestMapping("/order/list")
	public ModelAndView adminOrder(HttpServletRequest request){
		ModelAndView mav = os.adminOrder(request);
		mav.setViewName("order/adminlist");
		mav.addObject("history", "영업팀메뉴 > 판매목록");
		return mav;
	}
	
}
