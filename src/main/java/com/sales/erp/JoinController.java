package com.sales.erp;

import java.text.SimpleDateFormat;
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
	public ModelAndView JoinSMember(HttpServletRequest request) throws Exception {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birth = year + "-" + month + "-" + day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		SMemberVO member = new SMemberVO();
		member.setPwd(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setGender(request.getParameter("gender"));
		member.setBirth(sdf.parse(birth));
		member.setAddress(request.getParameter("address"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setAuth("ROLE_EE");
		member.setAccount(request.getParameter("account"));
		member.setTeam(request.getParameter("team"));

		sMemberDAOImpl.insertMember(member);

		ModelAndView mav = new ModelAndView();
		List<SMemberVO> memberList = sMemberDAOImpl.getSMembers();
		mav.addObject("result", memberList);
		mav.setViewName("sMemberList");
		return mav;
	}
}
