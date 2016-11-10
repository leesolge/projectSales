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
import com.sales.erp.member.vo.MemberSearch;

@Controller
public class AdminController {

	@Autowired
	private MemberDAOImpl sMemberDAOImpl;

	@RequestMapping("/admin/member_ok")
	public ModelAndView member_ok() {
		ModelAndView result = new ModelAndView();
		int count = sMemberDAOImpl.Count_Ok_Member();
		List<MemberVO> memberList = sMemberDAOImpl.Admin_Ok_Member();
		result.addObject("count", count);
		result.addObject("result", memberList);
		result.setViewName("admin/member_ok");

		return result;
	}

	@RequestMapping("/admin/member_list")
	public ModelAndView member_list(HttpServletRequest request) {
		String field = request.getParameter("field");
		String word = request.getParameter("word");
		
		if(field == null || field.equals("")){
	        field = "name";
	    }
	    
	    if(word == null || word.equals("")){
	        word = "";
	    }    
	    
	    MemberSearch search = new MemberSearch();
	    search.setField(field);
	    search.setWord("%" + word + "%");  
		ModelAndView result = new ModelAndView();
		int count = sMemberDAOImpl.Count_Approved_Member(search);
		List<MemberVO> memberList = sMemberDAOImpl.Admin_Approved_Member(search);
		result.addObject("field", field);
		result.addObject("word", word);
		result.addObject("count", count);
		result.addObject("result", memberList);
		result.setViewName("admin/member_list");

		return result;
	}

	@RequestMapping(value="/admin/Approve")
	public String Approve(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");
		sMemberDAOImpl.Update_Approve_Member(empno);
		
		return "redirect:/admin/member_ok";
	}

	@RequestMapping(value="/admin/Cancel")
	public String Cancel(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");
		sMemberDAOImpl.Update_Cancel_Member(empno);
		
		return "redirect:/admin/member_ok";
	}

	@RequestMapping("/admin/member_info")
	public ModelAndView member_info(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ModelAndView result = new ModelAndView();
		MemberVO vo = sMemberDAOImpl.selectMember(empno);
		result.addObject("vo", vo);
		result.setViewName("admin/member_info");

		return result;
	}
	
	@RequestMapping("/admin/member_update")
	public ModelAndView member_update(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ModelAndView result = new ModelAndView();
		MemberVO vo = sMemberDAOImpl.selectMember(empno);
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
		sMemberDAOImpl.Admin_Update_Member(vo);
		
		return "redirect:/admin/member_list";
	}

}
