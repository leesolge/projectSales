package com.sales.erp.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.dao.MemberDAOImpl;
import com.sales.erp.member.vo.MemberJoinVO;
import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.member.vo.SendMail;

@Controller
public class JoinController {
	
	@Autowired
	private MemberDAOImpl memberDAOImpl;	
	
	@Autowired
	private SendMail mail;
	
	@RequestMapping("/join")	
	public String Join() {		
		return "/join/join";
	}
	
	@RequestMapping("/home")	
	public String home() {		
		return "home";
	}
	
	@RequestMapping(value="/JoinMember", method=RequestMethod.POST)
	public ModelAndView JoinSMember(MemberJoinVO vo) throws Exception {
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
		
		memberDAOImpl.insertMember(member);

		ModelAndView mav = new ModelAndView();
		mav.addObject("member", member);
		mav.setViewName("/join/joinSuccess");
		return mav;
	}
	 
	
	
	@RequestMapping("/confirmID")	
	public String confirmID() {		
		return "/join/confirmID";
	}
	
	@RequestMapping(value="/ConfirmID_Member", method=RequestMethod.POST)	
	public ModelAndView ConfirmID_Member(HttpServletRequest request) {		
		
		MemberVO member = new MemberVO ();
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		
		ModelAndView mav = new ModelAndView();
		member = memberDAOImpl.ConfirmID_Member(member);
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
	
	@RequestMapping("/confirmPWD")	
	public String confirmPWD() {		
		return "/join/confirmPWD";
	}
	
	@RequestMapping(value="/ConfirmPWD_Member", method=RequestMethod.POST)	
	public ModelAndView ConfirmPWD_Member(HttpServletRequest request) {		
		
		MemberVO member = new MemberVO ();
		member.setEmpno(request.getParameter("empno"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		
		ModelAndView mav = new ModelAndView();
		MemberVO vo = memberDAOImpl.ConfirmID_Member(member);
		String subject = "[PW확인]" + vo.getName() + "님의 PW요청확인 메일입니다.";
		String text = "귀하의 아이디는 [ " + vo.getEmpno() + " ]입니다.\n"
				+ "귀하의 비밀번호는 [ " + vo.getPwd() + " ]입니다.";
		mail.sendMail(vo, subject, text);
		memberDAOImpl.Update_Cancel_Member(member.getEmpno());
		return mav;
	}
}
