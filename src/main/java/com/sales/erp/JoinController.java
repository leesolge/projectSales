package com.sales.erp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.smember.SMemberVO;
import com.sales.erp.smemberDao.SMemberDAOImpl;

@Controller
public class JoinController {
	
	@Autowired
	private SMemberDAOImpl sMemberDAOImpl;	
	
	@RequestMapping("/Join")	
	public String Join(Model model) {		
		return "/join/Join";
	}
	
	@RequestMapping("/home")	
	public String home(Model model) {		
		return "home";
	}
	
	@RequestMapping(value = "/JoinSMember", method = RequestMethod.POST)
	public ModelAndView JoinSMember(HttpServletRequest request) {

		SMemberVO member = new SMemberVO();
		member.setName((String) request.getParameter("name"));
		member.setPwd((String) request.getParameter("pwd"));
		member.setPhone((String) request.getParameter("phone"));
		member.setAuth("ROLE_EE");
		member.setAccount("12345");
		member.setTeam("영업부");

		sMemberDAOImpl.insertMember(member);

		ModelAndView mav = new ModelAndView();
		List<SMemberVO> memberList = sMemberDAOImpl.getSMembers();
		mav.addObject("result", memberList);
		mav.setViewName("sMemberList");
		return mav;
	}
}
