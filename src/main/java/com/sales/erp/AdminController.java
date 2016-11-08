package com.sales.erp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.smember.SMemberVO;
import com.sales.erp.smemberDao.SMemberDAOImpl;

@Controller
public class AdminController {
	
	@Autowired
	private SMemberDAOImpl sMemberDAOImpl;	
	
	@RequestMapping("/admin/member_ok")
	public ModelAndView member_ok(Model model) {
		ModelAndView result = new ModelAndView();

		List<SMemberVO> memberList = sMemberDAOImpl.Admin_Ok_Members();
		result.addObject("result", memberList);
		result.setViewName("admin/member_ok");

		return result;
	}
	
	@RequestMapping("/admin/member_list")
	public ModelAndView member_list(Model model) {
		ModelAndView result = new ModelAndView();

		List<SMemberVO> memberList = sMemberDAOImpl.Admin_Approved_Members();
		result.addObject("result", memberList);
		result.setViewName("admin/member_list");

		return result;
	}
	
	
	@RequestMapping(value = "/Approve")
	public String JoinSMember(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");

		sMemberDAOImpl.Update_Approve_Member(empno);
		return "redirect:admin/member_ok";
	}
	
	//
	@RequestMapping(value = "/Cancel")
	public String Cancel(Model model) {

		return "member_ok";
	}
}
