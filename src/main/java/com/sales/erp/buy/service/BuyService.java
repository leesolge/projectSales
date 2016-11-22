package com.sales.erp.buy.service;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.buy.dao.BuyDAO;
import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.product.dao.ProductDAO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class BuyService {

	@Autowired
	private BuyDAO dao;

	@Autowired
	private ProductDAO pdao;

	public ModelAndView buyWriteForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("list", list);
		return mav;
	}

	// Product 충원 요청 등록(사원)
	public void buyWrite(HttpServletRequest request) {
		ArrayList<String> list = new ArrayList<String>();		
		BuyVO vo = new BuyVO();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		vo.setEmpno(auth.getName());
		String position = dao.getAuth(vo);		//권한 받아오기
		
		Enumeration var = request.getParameterNames();
		String var_name;
		String var_value;
		while (var.hasMoreElements()) {
			var_name = (String) var.nextElement();
			var_value = request.getParameter(var_name);
			list.add(var_value);
			System.out.println("Loop - var_name : " + var_name + "\t var_value : " + var_value);
		}
		System.out.println("Service - position : " + position);

		for (int i = 1; i < list.size(); i += 3) {
			BuyVO bvo = new BuyVO();
			bvo.setEmpno(list.get(0));
			bvo.setProcode(list.get(i));
			bvo.setAmount(list.get(i + 1));
			bvo.setBuycomment(list.get(i + 2));
			if (position.equals("ROLE_EMPLOYEE"))
				bvo.setBuystep(0); // 사원일 경우 승인단계 0으로 지정
			else
				bvo.setBuystep(1); // 팀장급일 경우 승인단계 1로 지정

			if (i == 1)
				dao.buyWrite(bvo); // 구매요청 번호생성 및 등록
			else
				dao.buyWriteSameBuynum(bvo); // 동일한 구매요청번호 등록
		}
	}

	public ModelAndView buyListWait() {
		ModelAndView mav = new ModelAndView();
		BuyVO vo = new BuyVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		vo.setEmpno(auth.getName());
		String position = dao.getAuth(vo);		//권한 받아오기
		if (position.equals("ROLE_EMPLOYEE"))
			vo.setBuystep(0); // 사원일 경우 승인단계 0으로 지정
		else
			vo.setBuystep(1); // 팀장급일 경우 승인단계 1로 지정
		
		ArrayList<BuyListVO> list = dao.buyListWait(vo);
		for (int i = 0; i < list.size(); i++) {
			ProductVO name = pdao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}
}
