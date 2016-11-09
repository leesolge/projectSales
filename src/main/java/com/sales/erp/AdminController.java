package com.sales.erp;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.smember.JoinVO;
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

	@RequestMapping(value = "/admin/Approve")
	public String Approve(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");

		sMemberDAOImpl.Update_Approve_Member(empno);
		return "redirect:/admin/member_ok";
	}

	//
	@RequestMapping(value = "/admin/Cancel")
	public String Cancel(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");

		sMemberDAOImpl.Update_Cancel_Member(empno);
		return "redirect:/admin/member_ok";
	}

	@RequestMapping("/admin/member_info")
	public ModelAndView member_info(HttpServletRequest request, Model model) {
		String empno = request.getParameter("empno");

		ModelAndView result = new ModelAndView();

		SMemberVO vo = sMemberDAOImpl.selectSMember(empno);
		result.addObject("vo", vo);
		result.setViewName("admin/member_info");

		return result;
	}
	
	@RequestMapping("/admin/member_update")
	public ModelAndView member_update(HttpServletRequest request, Model model) {
		String empno = request.getParameter("empno");

		ModelAndView result = new ModelAndView();

		SMemberVO vo = sMemberDAOImpl.selectSMember(empno);
		result.addObject("vo", vo);
		result.setViewName("admin/member_update");

		return result;
	}
	
	@RequestMapping(value = "/admin/Admin_Update_SMember", method = RequestMethod.POST)
	public String Admin_Update_SMember(HttpServletRequest request) throws Exception {
		String empno = request.getParameter("empno");
		String auth = request.getParameter("auth");
		String team = request.getParameter("team");
		SMemberVO vo = new SMemberVO();
		vo.setEmpno(empno);
		vo.setAuth(auth);
		vo.setTeam(team);
		sMemberDAOImpl.Admin_Update_SMember(vo);
		return "redirect:/admin/member_list";
	}

}
