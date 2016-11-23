package com.sales.erp.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.ManagerDAO;
import com.sales.erp.member.dao.MemberDAO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.notice.vo.PagingVO;

@Service
public class MemberService {

	@Autowired
	private ManagerDAO mdao;

	@Autowired
	private MemberDAO dao;

	public ModelAndView getMemberList() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		String team = mdao.getTeamName(empno);
		List<MemberVO> list = mdao.getMemberList(team);
		mav.addObject("list", list);
		return mav;
	} //// 추후 삭제할 내용

	public ModelAndView memberContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String empno = request.getParameter("empno");
		MemberVO vo = new MemberVO();
		if (empno == null) { // empno 파라미터가 없을 경우 자신의 정보 불러오기
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			MemberVO mvoParam = new MemberVO();
			mvoParam.setEmpno(auth.getName());
			vo = dao.getMember(mvoParam);
		} else { // empno 파라미터가 있을 경우 요청받은 empno 정보 불러오기
			MemberVO mvoParam = new MemberVO();
			mvoParam.setEmpno(empno);
			vo = dao.getMember(mvoParam);
		}
		mav.addObject("vo", vo);
		return mav;
	}

	public ModelAndView memberList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(auth.getName());
		MemberVO mvo = dao.getMember(mvoParam); // 현재 사용자 정보
		
		//	검색정보 받는 부분
		String strPg = request.getParameter("pg");
		String field = request.getParameter("field");
		String word = request.getParameter("word");
		int pg = 1;
		if (field == null || field.equals(""))		field = "name";
		if (word == null || word.equals(""))	word = "";
		if (strPg != null)								pg = Integer.parseInt(strPg);
		//	검색정보 받는 부분 끝

		//	페이징 처리부분
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		int block = 10; // 한번에 보여주는 페이지 수
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;
		
		//// 검색조건 추가
		MemberSearch search = new MemberSearch();
		search.setField(field);
		search.setWord("%" + word + "%");
		search.setEnd(end);
		search.setStart(start);
		search.setTeam(mvo.getTeam());
		//// 검색조건 추가 끝
		int total = 0;
		ArrayList<MemberVO> list = null;
		
		if (mvo.getAuth().equals("ROLE_ADMIN")) {
			total = dao.memberListCount(search);
		} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			total = dao.memberListCountTeam(search);
		}
				
		int allPage = (int) Math.ceil(total / (double) rowSize);
		if (toPage > allPage) {
			toPage = allPage;
		}
		
		if (mvo.getAuth().equals("ROLE_ADMIN")) {
			list = dao.memberList(search);
		} else if (mvo.getAuth().equals("ROLE_MANAGER")) {
			list = dao.memberListTeam(search);
		}


		mav.addObject("field", field);
		mav.addObject("word", word);
		mav.addObject("count", total);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("allPage", allPage);
		mav.addObject("block", block);
		mav.addObject("fromPage", fromPage);
		mav.addObject("toPage", toPage);

		return mav;
	}

}
