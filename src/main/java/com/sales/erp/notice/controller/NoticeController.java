package com.sales.erp.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.notice.service.NoticeService;
import com.sales.erp.notice.vo.BoardVO;
import com.sales.erp.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	
	//공지사항 목록 요청
	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList(HttpServletRequest request){
		ModelAndView mav=ns.getNoticeList(request);
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	//공지사항 글쓰기양식(관리자만 입장가능)
	@RequestMapping("/notice/admin/noticeWriteForm")
	public String noticeWriteForm(HttpServletRequest request){
		return "/notice/noticeWriteForm";
	}
	
	//공지사항 글쓰기 등록(관리자만 사용가능)
	@RequestMapping(value="/notice/admin/noticeWrite", method= RequestMethod.POST)
	public String noticeWrite(HttpServletRequest request){
		ns.noticeWrite(request);
		return "redirect:/notice/noticeList";
	}

	//공지사항 내용확인 및 댓글확인(추가해야함)
	@RequestMapping("/notice/noticeContent")
	public ModelAndView noticeContent(HttpServletRequest request){
		ModelAndView mav = ns.noticeContent(request);
		mav.setViewName("/notice/noticeContent");
		return mav;
	}
	
	//공지사항 수정
	@RequestMapping("/notice/admin/noticeUpdateForm")
	public ModelAndView noticeUpdateForm(HttpServletRequest request){
		ModelAndView mav = ns.noticeUpdateForm(request);
		mav.setViewName("/notice/noticeUpdateForm");
		return mav;
	}	

}
