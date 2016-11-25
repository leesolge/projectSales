package com.sales.erp.freeboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService freeboardService;
	
	// 자유게시판 글 리스트 요청
	@RequestMapping("/freeboard/freeboardList")
	public ModelAndView freeboardList(HttpServletRequest request){
		ModelAndView mav = freeboardService.getFreeboardList(request);
		mav.setViewName("/freeboard/freeboardList");
		return mav;
	}
	
	// 자유게시판 글쓰기양식
	@RequestMapping("/freeboard/freeboardWriteForm")
	public String writeForm(HttpServletRequest request){
		return "/freeboard/freeboardWriteForm";
	}
	
	// 자유게시판 글쓰기
	@RequestMapping(value="/freeboard/freeboardWrite", method=RequestMethod.POST)
	public String freeboardWrite(HttpServletRequest request){
		freeboardService.freeboardWrite(request);
		return "redirect:/freeboard/freeboardList";
	}
	
	// 자유게시판 글 하나 클릭해서 글 보기
	@RequestMapping("/freeboard/freeboardContent")
	public ModelAndView freeboardContent(HttpServletRequest request){
		ModelAndView mav = freeboardService.freeboardContent(request);
		mav.setViewName("/freeboard/freeboardContent");
		return mav;
	}
	
	// 자유게시판 수정양식
	@RequestMapping("/freeboard/freeboardUpdateForm")
	public ModelAndView freeboardUpdateForm(HttpServletRequest request){
		ModelAndView mav = freeboardService.freeboardUpdateForm(request);
		mav.setViewName("/freeboard/freeboardUpdateForm");
		return mav;
	}
	
	// 자유게시판 수정하기
	@RequestMapping("/freeboard/freeboardUpdate")
	public String freeboardUpdate(HttpServletRequest request){
		String num = request.getParameter("num");
		freeboardService.freeboardUpdate(request);
		return "redirect:/freeboard/freeboardContent?num=" + num;
	}
	
	// 자유게시판 글 삭제
	@RequestMapping("/freeboard/freeboardDelete")
	public String freeboardDelete(HttpServletRequest request){
		freeboardService.freeboardDelete(request);
		return "redirect:/freeboard/freeboardList";
	}
	
	//댓글
	@RequestMapping(value="/freeboard/replyWrite", method=RequestMethod.POST)
	public String replyWrite(HttpServletRequest request){
		String num = request.getParameter("num");
		freeboardService.replyWrite(request);
		return "redirect:/freeboard/freeboardContent?num="+num;
	}
	
	//대댓글 작성하는 폼으로 가기
	@RequestMapping(value="/freeboard/reReplyWriteForm", method=RequestMethod.POST)
	public ModelAndView reReplyWriteForm(HttpServletRequest request){
		ModelAndView mav = freeboardService.reReplyWriteForm(request);
		mav.setViewName("/freeboard/reReplyWriteForm");
		return mav;
	}
	
	//대댓글 작성
	@RequestMapping(value="/freeboard/reReplyWrite", method=RequestMethod.POST)
	public String reReplyWrite(HttpServletRequest request){
		String num = request.getParameter("num");
		freeboardService.reReplyWrite(request);
		return "redirect:/freeboard/freeboardContent?num="+num;
	}
	
	@RequestMapping(value="/freeboard/replyUpdateForm", method=RequestMethod.POST)
	public ModelAndView replyUpdateForm(HttpServletRequest request){
		ModelAndView mav = freeboardService.replyUpdateForm(request);
		mav.setViewName("/freeboard/replyUpdateForm");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(HttpServletRequest request){
		String num = request.getParameter("num");
		freeboardService.replyUpdate(request);
		return "redirect:/freeboard/freeboardContent?num="+num;
	}
	
	@RequestMapping(value="/freeboard/replyDelete", method=RequestMethod.POST)
	public String replyDelete(HttpServletRequest request){
		String num = request.getParameter("num");
		freeboardService.replyDelete(request);
		return "redirect:/freeboard/freeboardContent?num="+num;
	}
}
