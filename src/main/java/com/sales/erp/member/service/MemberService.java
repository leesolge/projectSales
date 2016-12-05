package com.sales.erp.member.service;

import java.text.SimpleDateFormat;
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

	public ModelAndView JoinMember(MemberJoinVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		String year = vo.getYear();
		String month = vo.getMonth();
		String day = vo.getDay();
		String birth = year + "-" + month + "-" + day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		MemberVO member = new MemberVO();
		member.setPwd(vo.getPwd());
		member.setName(vo.getName());
		member.setGender(vo.getGender());
		member.setBirth(sdf.parse(birth));
		member.setAddress(vo.getAddress());
		member.setPhone(vo.getPhone());
		member.setEmail(vo.getEmail());
		member.setAuth("ROLE_EE");
		member.setAccount(vo.getAccount());
		member.setTeam(vo.getTeam());
		member.setPortrait(vo.getPortrait());
		dao.JoinMember(member);
		mav.addObject("member", member);
		return mav;
	}
	
	public ModelAndView memberContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String empno = request.getParameter("empno");
		MemberVO vo = new MemberVO();
		if (empno == null) { // empno 파라미터가 없을 경우 자신의 정보 불러오기
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			MemberVO mvoParam = new MemberVO();
			mvoParam.setEmpno(auth.getName());
			vo = dao.getMember(mvoParam);
			mav.addObject("history", "내정보");
		} else { // empno 파라미터가 있을 경우 요청받은 empno 정보 불러오기
			MemberVO mvoParam = new MemberVO();
			mvoParam.setEmpno(empno);
			vo = dao.getMember(mvoParam);
			mav.addObject("history", "영업팀메뉴 > 사원정보");
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
		mav.addObject("history", "영업팀메뉴 > 사원명부");

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
		mav.addObject("history", "관리자메뉴 > 가입승인");

		return mav;
	}

	public void Approve(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(empno);
		MemberVO vo = dao.getMember(mvoParam);		
		dao.Approve(vo);
		String subject = "[회원가입승인]감사합니다." + vo.getName() + "님의 (주)노다지 회원가입이 승인되었습니다.";
		String text = "회원님의 아이디는 [ " + empno + " ] 입니다.";
		mail.sendMail(vo, subject, text);
	}

	public void Cancel(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		MemberVO mvoParam = new MemberVO();
		mvoParam.setEmpno(empno);
		MemberVO vo = dao.getMember(mvoParam);				
		String subject = "[승인거부]죄송합니다." + vo.getName() + "님의 (주)노다지 회원가입이 거부되었습니다.";
		String text = "다음 기회에 도전해 주십시요";
		mail.sendMail(vo, subject, text);
		dao.Cancel(vo);
	}

	public ModelAndView ConfirmID_Member(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MemberVO ();
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member = dao.ConfirmID_Member(member);
		if(member != null){
			String subject = "[ID확인]" + member.getName() + "님의 ID요청 확인메일입니다.";
			String text = "귀하의 아이디는 [ " + member.getEmpno() + " ]입니다.";
			mail.sendMail(member, subject, text);
			mav.addObject("member", member);
			mav.setViewName("/join/confirmID_Success");
			return mav;
		}
		else{
			mav.addObject("member", member);
			mav.setViewName("/join/confirmID_Fail");
			return mav;
		}	
	}

	public ModelAndView ConfirmPWD_Member(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MemberVO ();
		member.setEmpno(request.getParameter("empno"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member = dao.ConfirmPWD_Member(member);
		if(member != null){
			String subject = "[PW확인]" + member.getName() + "님의 PW요청확인 메일입니다.";
			String text = "귀하의 아이디는 [ " + member.getEmpno() + " ]입니다.\n"
					+ "귀하의 비밀번호는 [ " + member.getPwd() + " ]입니다.";
			mail.sendMail(member, subject, text);
			mav.addObject("member", member);
			mav.setViewName("/join/confirmID_Success");
			return mav;
		}
		else{
			mav.addObject("member", member);
			mav.setViewName("/join/confirmID_Fail");
			return mav;
		}	
	}

}
