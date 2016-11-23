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
import com.sales.erp.member.vo.MemberVO;
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

	// Product 충원 요청 등록
	public void buyWrite(HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		ArrayList<String> list = new ArrayList<String>(); // Parameter값 저장하기 위한
															// list

		Enumeration var = request.getParameterNames();
		String var_name;
		String var_value;
		while (var.hasMoreElements()) {
			var_name = (String) var.nextElement();
			var_value = request.getParameter(var_name);
			list.add(var_value);
		}

		for (int i = 1; i < list.size(); i += 3) {
			BuyVO bvo = new BuyVO();
			bvo.setEmpno(list.get(0));
			bvo.setProcode(list.get(i));
			bvo.setAmount(list.get(i + 1));
			bvo.setBuycomment(list.get(i + 2));
			if (mvo.getAuth().equals("ROLE_EMPLOYEE"))
				bvo.setBuystep(0); // 사원일 경우 승인단계 0으로 지정
			else if (mvo.getAuth().equals("ROLE_MANAGER"))
				bvo.setBuystep(1); // 팀장급일 경우 승인단계 1로 지정
			else {
				bvo.setBuystep(2); // 팀장급 이상일 경우 승인단계 2로 지정

				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Product
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 내용
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 변경
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 추가해야함

			}

			if (i == 1)
				dao.buyWrite(bvo); // 구매요청 번호생성 및 등록
			else
				dao.buyWriteSameBuynum(bvo); // 동일한 구매요청번호 등록
		}
	}

	public ModelAndView buyListWait() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		BuyVO voParam = new BuyVO();
		voParam.setEmpno(mvo.getEmpno());
		ArrayList<BuyListVO> list = null;

		if (mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.buyListWaitAll();
		} else {
			list = dao.buyListWait(voParam);
		}
		for (int i = 0; i < list.size(); i++) {
			ProductVO name = pdao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}

	public ModelAndView buyListAppWait() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기
		ArrayList<BuyListVO> list = null;
		if (mvo.getAuth().equals("ROLE_MANAGER")) {
			list = dao.buyListAppWaitTeam(mvo);
			for (int i = 0; i < list.size(); i++) {
				ProductVO name = pdao.selectOne(list.get(i).getProcode());
				list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
			}
		}

		else if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.buyListWaitAll();
			for (int i = 0; i < list.size(); i++) {
				ProductVO name = pdao.selectOne(list.get(i).getProcode());
				list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
			}
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}

	public ModelAndView buyContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		BuyVO voParam = new BuyVO();
		voParam.setBuynum(Integer.parseInt(request.getParameter("buynum")));
		ArrayList<BuyVO> list = dao.buyContent(voParam);
		mav.addObject("list", list);
		mav.addObject("buynum", voParam.getBuynum());
		return mav;
	}

	public void buyApprove(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		if (mvo.getAuth().equals("ROLE_MANAGER")) {
			dao.buyApproveManager(request.getParameter("buynum"));
		} else if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			dao.buyApproveAdmin(request.getParameter("buynum"));
		}
	}

	public ModelAndView buyAppList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		BuyVO voParam = new BuyVO();
		voParam.setEmpno(mvo.getEmpno());
		ArrayList<BuyListVO> list = null;

		// 관리자나 자재팀 전체받아오기  //팀장일때 팀내용 받아오기  // 개인일때 개인내용 받아오기
		if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.buyAppListAll();
		} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			list = dao.buyAppListTeam(mvo);
		} else if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
			list = dao.buyAppList(mvo);
		}
		for (int i = 0; i < list.size(); i++) {
			ProductVO name = pdao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("count", list.size());
		return mav;
	}
}
