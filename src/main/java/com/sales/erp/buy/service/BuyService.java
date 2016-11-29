package com.sales.erp.buy.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.buy.dao.BuyDAO;
import com.sales.erp.buy.vo.BuyListVO;
import com.sales.erp.buy.vo.BuyPagingVO;
import com.sales.erp.buy.vo.BuyVO;
import com.sales.erp.ledger.dao.LedgerDAO;
import com.sales.erp.ledger.vo.LedgerJoinVO;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.product.dao.ProductDAO;
import com.sales.erp.product.vo.ProductVO;

@Service
public class BuyService {

	@Autowired
	private BuyDAO dao;

	@Autowired
	private ProductDAO pdao;
	
	@Autowired
	private LedgerDAO ldao;

	public ModelAndView buyWriteForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> list = dao.selectProductAll();
		mav.addObject("list", list);
		return mav;
	}

	// Product 충원 요청 등록
	public ModelAndView buyWrite(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
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
			if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
				bvo.setBuystep(0); // 사원일 경우 승인단계 0으로 지정
				mav.setViewName("redirect:/buy/buyListWait");
			} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
				bvo.setBuystep(1); // 팀장급일 경우 승인단계 1로 지정
				mav.setViewName("redirect:/buy/buyListWait");
			} else {
				bvo.setBuystep(2); // 팀장급 이상일 경우 승인단계 2로 지정
				mav.setViewName("redirect:/buy/buyAppList");
				dao.addProduct(bvo);
				
				ProductVO pvo = new  ProductVO();
				pvo = dao.getProductContent(bvo);
				LedgerJoinVO ledger = new LedgerJoinVO();
				ledger.setEmpno(bvo.getEmpno());
				ledger.setEnable("0");
				ledger.setSort("지출");
				ledger.setContent(pvo.getProname());
				ledger.setAmount(Integer.parseInt(bvo.getAmount()) * Integer.parseInt(pvo.getSellprice()));
				ledger.setSortamount(Integer.parseInt(bvo.getAmount()) * Integer.parseInt(pvo.getSellprice()) * (-1));				
				ledger.setEtc(""); // 나중에 구매목록번호 입력				
				ldao.registLedger(ledger);
			}			
			
			if (i == 1)
				dao.buyWrite(bvo); // 구매요청 번호생성 및 등록
			else
				dao.buyWriteSameBuynum(bvo); // 동일한 구매요청번호 등록
		}
		return mav;
	}

	public ModelAndView buyContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		BuyVO voParam = new BuyVO();
		voParam.setBuynum(Integer.parseInt(request.getParameter("buynum")));
		ArrayList<BuyVO> list = dao.buyContent(voParam);
		mav.addObject("list", list);
		mav.addObject("list1", list.get(0));
		mav.addObject("buynum", voParam.getBuynum());

		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(list.get(0).getEmpno());
		MemberVO writer = dao.getMember(mvoParam);
		mav.addObject("writer", writer);
		return mav;
	}

	public void buyApprove(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		if (mvo.getAuth().equals("ROLE_MANAGER")) {
			dao.buyApproveManager(request.getParameter("buynum"));
		} 
		
		else if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			dao.buyApproveAdmin(request.getParameter("buynum"));
			
			BuyVO voParam = new BuyVO();
			voParam.setBuynum(Integer.parseInt(request.getParameter("buynum")));
			ArrayList<BuyVO> list = dao.buyContent(voParam);
			for (int i = 0; i < list.size(); i++) {
				dao.addProduct(list.get(i));
				
				ProductVO pvo = new  ProductVO();
				pvo = dao.getProductContent(list.get(i));
				LedgerJoinVO ledger = new LedgerJoinVO();
				ledger.setEmpno(list.get(i).getEmpno());
				ledger.setEnable("0");
				ledger.setSort("지출");
				ledger.setContent(pvo.getProname());
				ledger.setAmount(Integer.parseInt(list.get(i).getAmount()) * Integer.parseInt(pvo.getSellprice()));
				ledger.setSortamount(Integer.parseInt(list.get(i).getAmount()) * Integer.parseInt(pvo.getSellprice()) * (-1));				
				ledger.setEtc(""); // 나중에 구매목록번호 입력				
				ldao.registLedger(ledger);
			}

		}
	}

	public ModelAndView buyCancel(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		dao.buyCancel(request.getParameter("buynum"));
		mav.setViewName("redirect:/buy/buyListWait");
		return mav;
	}

	public ModelAndView buyListWait(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		BuyPagingVO paging = new BuyPagingVO();
		paging.setPage(1);
		String page = request.getParameter("page");

		if (page != null && page != "") {
			paging.setPage(Integer.parseInt(request.getParameter("page")));
		}
		paging.setRowSize(10, paging.getPage());
		paging.setBlock(5, paging.getPage());

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		paging.setEmpno(mvo.getEmpno());

		paging.setTotal(dao.buyListWaitCount(paging), (double) paging.getRowSize());
		ArrayList<BuyListVO> list = dao.buyListWait(paging);

		for (int i = 0; i < list.size(); i++) {
			ProductVO name = pdao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}

	public ModelAndView buyListAppWait(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		BuyPagingVO paging = new BuyPagingVO();
		paging.setPage(1);
		String page = request.getParameter("page");
		if (page != null && page != "") {
			paging.setPage(Integer.parseInt(request.getParameter("page")));
		}
		paging.setRowSize(10, paging.getPage());
		paging.setBlock(5, paging.getPage());

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기
		ArrayList<BuyListVO> list = null;
		if (mvo.getAuth().equals("ROLE_MANAGER")) {
			paging.setTeam(mvo.getTeam());
			paging.setTotal(dao.getbuyAppWaitCount(paging), (double) paging.getRowSize());
			list = dao.buyListAppWait(paging);
			for (int i = 0; i < list.size(); i++) {
				ProductVO name = pdao.selectOne(list.get(i).getProcode());
				list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
			}
		}

		else if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			paging.setTotal(dao.getbuyAppWaitCount(paging), (double) paging.getRowSize());
			list = dao.buyListAppWait(paging);
			for (int i = 0; i < list.size(); i++) {
				ProductVO name = pdao.selectOne(list.get(i).getProcode());
				list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
			}
		}
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}

	public ModelAndView buyAppList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		BuyPagingVO paging = new BuyPagingVO();
		paging.setPage(1);
		String page = request.getParameter("page");
		paging.setStart_date(request.getParameter("start_date"));
		paging.setEnd_date(request.getParameter("end_date"));
		ArrayList<String> team_list;
		team_list = dao.get_team(); // select를 위한 팀리스트 받아오기

		if (page != null && page != "") {
			paging.setPage(Integer.parseInt(request.getParameter("page")));
		}
		paging.setRowSize(10, paging.getPage()); // 한페이지에 출력되는 게시글 수
		paging.setBlock(5, paging.getPage()); // 페이지 네비게이션 범위 << [1] [2] [3] [4]
												// [5]>>

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 사용자 정보 받아오기

		ArrayList<BuyListVO> list = null;

		// 관리자나 자재팀 전체받아오기 //팀장일때 팀내용 받아오기 // 개인일때 개인내용 받아오기
		if (mvo.getAuth().equals("ROLE_BUDGET") || mvo.getAuth().equals("ROLE_ADMIN")) {
			paging.setTeam(request.getParameter("team"));
			paging.setTotal(dao.getbuyAppListCountAll(paging), (double) paging.getRowSize());
			list = dao.buyAppListAll(paging);
		}

		else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			paging.setTeam(mvo.getTeam());
			paging.setTotal(dao.getbuyAppListCountAll(paging), (double) paging.getRowSize());
			list = dao.buyAppListAll(paging);
		}

		else if (mvo.getAuth().equals("ROLE_EMPLOYEE")) {
			paging.setEmpno(mvo.getEmpno());
			paging.setTotal(dao.getbuyAppListCountAll(paging), (double) paging.getRowSize());
			list = dao.buyAppListAll(paging);
		}

		for (int i = 0; i < list.size(); i++) {
			ProductVO name = pdao.selectOne(list.get(i).getProcode());
			list.get(i).setTitle(name.getProname() + " 외 " + (list.get(i).getCnt() - 1) + "건");
		}
		mav.addObject("list", list);
		mav.addObject("team_list", team_list);
		mav.addObject("paging", paging);
		return mav;
	}
}
