package com.sales.erp.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sales.erp.member.service.MemberService;
import com.sales.erp.member.vo.MemberJoinVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;

	@RequestMapping("/join")
	public String Join() {
		return "/join/registermember";
	}

	// 회원가입
	@RequestMapping(value = "/JoinMember", method = RequestMethod.POST)
	public ModelAndView JoinMember(MemberJoinVO vo) throws Exception {

		MultipartFile uploadfile = vo.getFile();
		if (uploadfile != null) {
			String fileName = uploadfile.getOriginalFilename();
			try {
				File file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + fileName);
				int count = 0;
				int indexes = fileName.lastIndexOf(".");
				String extension = fileName.substring(indexes);

				while (file.exists()) {
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
		ModelAndView mav = ms.JoinMember(vo);
		mav.setViewName("/join/joinSuccess");
		return mav;
	}

	// 아이디 확인페이지
	@RequestMapping("/confirmID")
	public String confirmID() {
		return "/join/confirmID";
	}

	// 아이디 확인(메일전송)
	@RequestMapping(value = "/ConfirmID_Member", method = RequestMethod.POST)
	public ModelAndView ConfirmID_Member(HttpServletRequest request) {
		ModelAndView mav = ms.ConfirmID_Member(request);
		return mav;
	}

	// 아이디 확인(메일전송)
	@RequestMapping(value="/ConfirmPWD_Member", method=RequestMethod.POST)	
	public ModelAndView ConfirmPWD_Member(HttpServletRequest request) {		
		ModelAndView mav = ms.ConfirmPWD_Member(request);
		return mav;
	}

	// 회원정보보기
	@RequestMapping("/member/memberContent")
	public ModelAndView memberContent(HttpServletRequest request) {
		ModelAndView mav = ms.memberContent(request);
		mav.setViewName("member/memberContent");
		return mav;
	}

	@RequestMapping("/member/memberList")
	public ModelAndView memberList(HttpServletRequest request) {
		ModelAndView mav = ms.memberList(request);
		mav.setViewName("member/memberList");
		return mav;
	}

	// 개인정보수정 양식
	@RequestMapping(value = "/member/memberUpdateFormE", method = RequestMethod.POST)
	public ModelAndView memberUpdateFormE(HttpServletRequest request) {
		ModelAndView mav = ms.memberUpdateFormE(request);
		mav.setViewName("member/memberUpdateFormE");
		return mav;
	}

	// 개인정보수정
	@RequestMapping(value = "/member/memberUpdateE", method = RequestMethod.POST)
	public String memberUpdate(MemberJoinVO vo) throws Exception {
		String empno = vo.getEmpno();
		MultipartFile uploadfile = vo.getFile();
		if (uploadfile != null) {
			String fileName = uploadfile.getOriginalFilename();
			try {
				File file = new File("C:/sales/sales/src/main/webapp/resources/portraits/" + fileName);
				int count = 0;
				int indexes = fileName.lastIndexOf(".");
				String extension = fileName.substring(indexes);

				while (file.exists()) {
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
		ms.memberUpdate(vo);
		return "redirect:/member/memberContent?empno=" + empno;
	}

	// 사원정보수정 양식
	@RequestMapping(value = "/admin/memberUpdateFormA", method = RequestMethod.POST)
	public ModelAndView memberUpdateFormA(HttpServletRequest request) {
		ModelAndView mav = ms.memberUpdateFormA(request);
		mav.setViewName("member/memberUpdateFormA");
		return mav;
	}

	// 사원정보수정 양식
	@RequestMapping(value = "/admin/memberUpdateA", method = RequestMethod.POST)
	public String memberUpdateA(HttpServletRequest request) {
		String empno = request.getParameter("empno");
		ms.memberUpdateA(request);
		return "redirect:/member/memberContent?empno=" + empno;
	}

	// 사원 가입대기 리스트
	@RequestMapping("/admin/memberListWait")
	public ModelAndView memberListWait(HttpServletRequest request) {
		ModelAndView mav = ms.memberListWait(request);
		mav.setViewName("member/memberListWait");
		return mav;
	}

	// 사원 가입승인
	@RequestMapping(value = "/admin/Approve")
	public String Approve(HttpServletRequest request) throws Exception {
		ms.Approve(request);
		return "redirect:/admin/memberListWait";
	}

	// 사원 가입승인거부
	@RequestMapping(value = "/admin/Cancel")
	public String Cancel(HttpServletRequest request) throws Exception {
		ms.Cancel(request);
		return "redirect:/admin/memberListWait";
	}

}
