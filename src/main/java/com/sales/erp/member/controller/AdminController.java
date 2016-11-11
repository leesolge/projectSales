package com.sales.erp.member.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAOImpl;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.member.vo.SendMail;
import com.sales.erp.member.vo.MemberSearch;

@Controller
public class AdminController {

	@Autowired
	private MemberDAOImpl memberDAOImpl;
	
	@Autowired
	private SendMail mail;
	
	@RequestMapping("/admin/member_ok")
	public ModelAndView member_ok(HttpServletRequest request) {
		int pg = 1;
		
		String strPg = request.getParameter("pg");
		  
		if(strPg != null){
			pg = Integer.parseInt(strPg);
		}
		
		MemberSearch search = new MemberSearch();
		
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;		
		int block = 10; // 한번에 보여주는 페이지 수
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;
		
	    search.setEnd(end);
	    search.setStart(start);
	    
	    int count = memberDAOImpl.Count_Ok_Member();
	    
	    int allPage = (int) Math.ceil(count / (double)rowSize);
		if(toPage > allPage) {
			toPage = allPage;
		}
		ModelAndView result = new ModelAndView();
		
		List<MemberVO> memberList = memberDAOImpl.Admin_Ok_Member(search);
		result.addObject("count", count);
		result.addObject("start", start);
		result.addObject("end", end);
		result.addObject("result", memberList);
		result.addObject("pg", pg);
		result.addObject("allPage", allPage);
		result.addObject("block", block);
		result.addObject("fromPage", fromPage);
		result.addObject("toPage", toPage);
		result.setViewName("admin/member_ok");

		return result;
	}

	@RequestMapping("/admin/member_list")
	public ModelAndView member_list(HttpServletRequest request) {
		
		int pg = 1;
		
		String strPg = request.getParameter("pg");
		String field = request.getParameter("field");
		String word = request.getParameter("word");
		
		if(field == null || field.equals("")){
	        field = "name";
	    }
	    if(word == null || word.equals("")){
	        word = "";
	    }    
		if(strPg != null){
			pg = Integer.parseInt(strPg);
		}
		
		MemberSearch search = new MemberSearch();
		
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;		
		int block = 10; // 한번에 보여주는 페이지 수
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;
		
	    search.setField(field);
	    search.setWord("%" + word + "%");
	    search.setEnd(end);
	    search.setStart(start);
	    
	    
	    int count = memberDAOImpl.Count_Approved_Member(search);
	    
	    int allPage = (int) Math.ceil(count / (double)rowSize);
		if(toPage > allPage) {
			toPage = allPage;
		}
		ModelAndView result = new ModelAndView();
		
		List<MemberVO> memberList = memberDAOImpl.Admin_Approved_Member(search);
		result.addObject("field", field);
		result.addObject("word", word);
		result.addObject("count", count);
		result.addObject("start", start);
		result.addObject("end", end);
		result.addObject("result", memberList);
		result.addObject("pg", pg);
		result.addObject("allPage", allPage);
		result.addObject("block", block);
		result.addObject("fromPage", fromPage);
		result.addObject("toPage", toPage);
		result.setViewName("admin/member_list");

		return result;
	}

	@RequestMapping(value="/admin/Approve")
	public String Approve(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");
		memberDAOImpl.Update_Approve_Member(empno);
		
		return "redirect:/admin/member_ok";
	}

	@RequestMapping(value="/admin/Cancel")
	public String Cancel(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");
		MemberVO vo = memberDAOImpl.selectMember(empno);
		String subject = "[승인거부]죄송합니다." + vo.getName() + "님의 Kosta125상사 회원가입이 거부되었습니다.";
		String text = "다음 기회에 도전해 주십시요";
		mail.sendMail(vo, subject, text);
		memberDAOImpl.Update_Cancel_Member(empno);
		
		return "redirect:/admin/member_ok";
	}

	@RequestMapping("/admin/member_info")
	public ModelAndView member_info(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ModelAndView result = new ModelAndView();
		MemberVO vo = memberDAOImpl.selectMember(empno);
		result.addObject("vo", vo);
		result.setViewName("admin/member_info");

		return result;
	}
	
	@RequestMapping("/admin/member_update")
	public ModelAndView member_update(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ModelAndView result = new ModelAndView();
		MemberVO vo = memberDAOImpl.selectMember(empno);
		result.addObject("vo", vo);
		result.setViewName("admin/member_update");

		return result;
	}
	
	@RequestMapping(value="/admin/Admin_Update_Member", method=RequestMethod.POST)
	public String Admin_Update_SMember(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		String auth = request.getParameter("auth");
		String team = request.getParameter("team");
		MemberVO vo = new MemberVO();
		vo.setEmpno(empno);
		vo.setAuth(auth);
		vo.setTeam(team);
		memberDAOImpl.Admin_Update_Member(vo);
		
		return "redirect:/admin/member_list";
	}

}
