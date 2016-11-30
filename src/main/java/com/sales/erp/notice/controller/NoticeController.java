package com.sales.erp.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService ns;

	// 공지사항 목록 요청
	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList(HttpServletRequest request) {
		ModelAndView mav = ns.getNoticeList(request);
		mav.setViewName("/notice/noticeList");
		mav.addObject("history", "공지사항 > 목록");
		return mav;
	}

	// 공지사항 글쓰기양식(관리자만 사용가능)
	@RequestMapping("/notice/admin/noticeWriteForm")
	public ModelAndView noticeWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/noticeWriteForm");
		mav.addObject("history", "공지사항 > 목록 > 글쓰기");
		return mav;
	}

	// 공지사항 글쓰기 등록(관리자만 사용가능)
	@RequestMapping(value = "/notice/admin/noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(HttpServletRequest request) {
		ns.noticeWrite(request);
		return "redirect:/notice/noticeList";
	}

	// 공지사항 내용확인 및 댓글확인(추가해야함)
	@RequestMapping("/notice/noticeContent")
	public ModelAndView noticeContent(HttpServletRequest request) {
		ModelAndView mav = ns.noticeContent(request);
		mav.setViewName("/notice/noticeContent");
		mav.addObject("history", "공지사항 > 목록 > 상세보기");
		return mav;
	}

	// 공지사항 수정양식(관리자만 사용가능)
	@RequestMapping("/notice/admin/noticeUpdateForm")
	public ModelAndView noticeUpdateForm(HttpServletRequest request) {
		ModelAndView mav = ns.noticeUpdateForm(request);
		mav.setViewName("/notice/noticeUpdateForm");
		mav.addObject("history", "공지사항 > 목록 > 상세보기 > 수정");
		return mav;
	}

	// 공지사항 수정(관리자만 사용가능)
	@RequestMapping("/notice/admin/noticeUpdate")
	public String noticeUpdate(HttpServletRequest request) {
		String num = request.getParameter("num");
		ns.noticeUpdate(request);
		return "redirect:/notice/noticeContent?num=" + num;
	}

	// 공지사항 수정(관리자만 사용가능)
	@RequestMapping("/notice/admin/noticeDelete")
	public String noticeDelete(HttpServletRequest request) {
		ns.noticeDelete(request);
		return "redirect:/notice/noticeList";
	}

	// 리플 쓰기
	@RequestMapping(value = "/notice/replyWrite", method = RequestMethod.POST)
	public String replyWrite(HttpServletRequest request) {
		String num = request.getParameter("num");
		ns.replyWrite(request);
		return "redirect:/notice/noticeContent?num=" + num;
	}

	// 리플 수정양식
	@RequestMapping(value = "/notice/replyUpdateForm", method = RequestMethod.POST)
	public ModelAndView replyUpdateForm(HttpServletRequest request) {
		ModelAndView mav = ns.replyUpdateForm(request);
		mav.setViewName("/notice/replyUpdateForm");
		mav.addObject("history", "공지사항 > 목록 > 상세보기 > 댓글수정");
		return mav;
	}

	// 리플 수정
	@RequestMapping(value = "/notice/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(HttpServletRequest request) {
		String num = request.getParameter("num");
		ns.replyUpdate(request);
		return "redirect:/notice/noticeContent?num=" + num;
	}

	// 리플 삭제
	@RequestMapping(value = "/notice/replyDelete", method = RequestMethod.POST)
	public String replyDelete(HttpServletRequest request) {
		String num = request.getParameter("num");
		ns.replyDelete(request);
		return "redirect:/notice/noticeContent?num=" + num;
	}
}
