package com.sales.erp.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAOImpl;
import com.sales.erp.member.service.EmplService;
import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberVO;

@Controller
public class EmplController {
	@Autowired
	private MemberDAOImpl memberDAOImpl;
	
	@Autowired
	private EmplService es;
	
	@RequestMapping("/my_Info")
	public ModelAndView member_info(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		MemberVO vo = memberDAOImpl.selectMember(empno);
		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("empl/member_info");

		return result;
	}
	
	@RequestMapping("/my_Update")
	public ModelAndView updateSelect(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ModelAndView result = new ModelAndView();
		MemberVO vo = memberDAOImpl.selectMember(empno);
		result.addObject("vo", vo);
		result.setViewName("empl/member_update");

		return result;
	}
	
	@RequestMapping(value="/employee/Empl_Update_Member", method=RequestMethod.POST)
	public String Empl_Update_Member(MemberJoinVO vo) throws Exception{
		
		MultipartFile uploadfile = vo.getFile();
        if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            try {
                File file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + fileName);
	            int count = 0;
	            int indexes = fileName.lastIndexOf(".");
	            String extension = fileName.substring(indexes);
	            
                while(file.exists()) {
	                	String newFileName = fileName.substring(0, indexes) + count + extension;
	                	fileName = newFileName;
	                	file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + newFileName);
	                	count++;
	                }
	               vo.setPortrait(fileName);
	               uploadfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		memberDAOImpl.updateMember(vo);
		return "main/main";
	}
	
	@RequestMapping("/employee/buy_request_list")
	public ModelAndView buy_request_list(HttpServletRequest request) {		
		ModelAndView result = new ModelAndView();		
		result.setViewName("empl/buy_request_list");
		return result;
	}
	
	@RequestMapping(value="/employee/buy_request", method=RequestMethod.POST)
	public ModelAndView buy_request(HttpServletRequest request) {
		ModelAndView mav = es.Buy_RequestForm();		
		mav.setViewName("empl/buy_request_order");
		return mav;
	}
}
