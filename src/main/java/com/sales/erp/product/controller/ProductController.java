package com.sales.erp.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.sales.erp.product.service.ProductService;
import com.sales.erp.product.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService proservice;
	
	@RequestMapping("/product/list")
	public ModelAndView selectProduct(){
		ModelAndView mav = proservice.selectAll();
		mav.setViewName("/product/productList");
		mav.addObject("history", "자재팀메뉴 > 상품 관리");
		return mav;
	}
	
	@RequestMapping( value="/product/list" , method = RequestMethod.POST )
	public ModelAndView selectOneProduct(@RequestParam("procode") String procode){
		ModelAndView mav = proservice.selectOne(procode);
		mav.addObject("history", "자재팀메뉴 > 상품 관리");
		mav.setViewName("/product/productList");
		return mav;
	}
	
	@RequestMapping("/product/productInfo")
	public ModelAndView proInfo(HttpServletRequest request) {
		String procode = request.getParameter("procode");
		ModelAndView mav = proservice.selectOne(procode);
		mav.setViewName("/product/productInfo");
		mav.addObject("history", "자재팀메뉴 > 상품 관리 > 상품 세부정보");
		return mav;
	}
	
	@RequestMapping("/product/insert")
	public ModelAndView insertPro(){
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("/product/insertForm");
		mav.addObject("history", "자재팀메뉴 > 상품 관리 > 상품 등록");
		return mav;
	}
	
	@RequestMapping( value ="/product/insert", method = RequestMethod.POST)
	public String insetPro(ProductVO vo){
		proservice.insertPro(vo);
		return "redirect:/product/list";
	}
	
	@RequestMapping("/product/delete")
	public String deletePro(HttpServletRequest request){
		proservice.deletePro(request.getParameter("procode"));
		return "redirect:/product/list";
	}
	
	@RequestMapping("/product/updateForm")
	public ModelAndView updateProForm(HttpServletRequest request){
		String procode = request.getParameter("procode");
		ModelAndView mav = proservice.selectOne(procode);
		mav.setViewName("/product/productUpdate");
		mav.addObject("history", "자재팀메뉴 > 상품 관리 > 상품 세부 정보 > 상품수정");
		return mav;
	}
	
	@RequestMapping(value="/product/update", method = RequestMethod.POST)
	public String updatePro(ProductVO vo){
		proservice.updatePro(vo);
	    return "redirect:/product/list";
	}
	
}
