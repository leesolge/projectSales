package com.sales.erp.product.controller;

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
		return mav;
	}
	
	@RequestMapping( value="/product/list" , method = RequestMethod.POST )
	public ModelAndView selectOneProduct(@RequestParam("procode") String procode){
		ModelAndView mav = proservice.selectOne(procode);
		mav.setViewName("/product/productList");
		return mav;
	}
	
	@RequestMapping("/product/insert")
	public ModelAndView insertPro(){
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("/product/insertForm");
		return mav;
	}
	
	@RequestMapping( value ="/product/insert", method = RequestMethod.POST)
	public String insetPro(ProductVO vo){
		proservice.insertPro(vo);
		return "redirect:/product/list";
	}
	
	@RequestMapping("/product/delete")
	public ModelAndView deletePro(){
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("/product/deleteForm");
		return mav;
	}
	@RequestMapping( value ="/product/delete", method = RequestMethod.POST)
	public String deletePro(@RequestParam("procode") String procode){
		proservice.deletePro(procode);
		return "redirect:/product/list";
	}
	
	
}
