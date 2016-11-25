package com.sales.erp.sell.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.vo.ProductVO;
import com.sales.erp.sell.dao.SellDAO;
import com.sales.erp.sell.vo.SellListVO;
import com.sales.erp.sell.vo.SellVO;

@Service
public class SellService {

	@Autowired
	private SellDAO dao;

	public ModelAndView sellWriteForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("list", list);
		return mav;
	}

	public void sellWrite(HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		SellVO vo = new SellVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setProcode(request.getParameter("procode"));
		vo.setProamount(request.getParameter("proamount"));
		vo.setCustomer(request.getParameter("customer"));
		vo.setAddress(request.getParameter("address"));
		if (mvo.getAuth().equals("ROLE_EMPLOYEE"))
			vo.setChecks("0"); // 사원일 경우 승인단계 0으로 지정
		else 
			vo.setChecks("1"); // 팀장급일 경우 승인단계 1로 지정
		
		dao.sellWrite(vo);
	}

	public ModelAndView sellListPayWait() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		ArrayList<SellListVO> list = null;

		if (mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.sellListPayWaitAll();
		} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			list = dao.sellListPayWaitTeam(mvo);
		}else if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
			list = dao.sellListPayWait(mvo);
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}

	public ModelAndView sellList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		ArrayList<SellListVO> list = null;

		if (mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.sellListAll();
		} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			list = dao.sellListTeam(mvo);
		}else if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
			list = dao.sellList(mvo);
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}

}
