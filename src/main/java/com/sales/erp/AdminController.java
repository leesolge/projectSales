package com.sales.erp;

import java.util.List;

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
	
	@RequestMapping("/member_ok")
	public ModelAndView member_ok(Model model) {
		ModelAndView result = new ModelAndView();

		List<SMemberVO> memberList = sMemberDAOImpl.getSMembers();
		result.addObject("result", memberList);
		result.setViewName("admin/member_ok");

		return result;
	}
}
