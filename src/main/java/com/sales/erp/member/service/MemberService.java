package com.sales.erp.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAO;
import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberSearch;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.member.vo.SendMail;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private SendMail mail;


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

	public ModelAndView memberUpdateFormE(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO voParam = new MemberVO();
		voParam.setEmpno(auth.getName());
		MemberVO vo = dao.getMember(voParam); // 현재 사용자 정보
		mav.addObject("vo", vo);
		return mav;
	}

	public void memberUpdate(MemberJoinVO vo) {
		dao.memberUpdate(vo);		
	}

	public ModelAndView memberUpdateFormA(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberVO voParam = new MemberVO();
		voParam.setEmpno(request.getParameter("empno"));
		MemberVO vo = dao.getMember(voParam);
		mav.addObject("vo", vo);
		return mav;
	}

	public void memberUpdateA(HttpServletRequest request) {
		MemberVO vo = new MemberVO();
		vo.setEmpno(request.getParameter("empno"));
		vo.setAuth(request.getParameter("auth"));
		vo.setTeam(request.getParameter("team"));
		dao.memberUpdateA(vo);		
	}

	public ModelAndView memberListWait(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String strPg = request.getParameter("pg");
		int pg = 1;
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
		search.setEnd(end);
		search.setStart(start);
		//// 검색조건 추가 끝
		int total = dao.memberListWaitCount(search);
		int allPage = (int) Math.ceil(total / (double) rowSize);
		if (toPage > allPage) {
			toPage = allPage;
		}
		
		ArrayList<MemberVO>list = dao.memberListWait(search);

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

	public void Approve(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(empno);
		MemberVO vo = dao.getMember(mvoParam);		
		dao.Approve(vo);
		String subject = "[회원가입승인]감사합니다." + vo.getName() + "님의 Kosta125상사 회원가입이 승인되었습니다.";
		String text = "회원님의 아이디는 [ " + empno + " ] 입니다.";
		mail.sendMail(vo, subject, text);
	}

	public void Cancel(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(empno);
		MemberVO vo = dao.getMember(mvoParam);				
		String subject = "[승인거부]죄송합니다." + vo.getName() + "님의 Kosta125상사 회원가입이 거부되었습니다.";
		String text = "다음 기회에 도전해 주십시요";
		mail.sendMail(vo, subject, text);
		dao.Cancel(vo);
	}

}
