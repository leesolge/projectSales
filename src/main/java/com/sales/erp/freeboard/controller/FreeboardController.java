package com.sales.erp.freeboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.freeboard.service.FreeboardService;
import com.sales.erp.freeboard.vo.FreeboardVO;
import com.sales.erp.freeboard.vo.ReplyVO;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService freeboardService;
	
	@RequestMapping("/freeboard/list")
	public ModelAndView viewFreeboard(HttpServletRequest request){
		ModelAndView mav = freeboardService.getFreeboardList(request);
		mav.setViewName("/freeboard/freeboardList");
		return mav;
	}
	
	@RequestMapping("/freeboard/writeForm")
	public String writeForm(){
		return "/freeboard/writeForm";
	}
	
	@RequestMapping(value="/freeboard/write", method=RequestMethod.POST)
	public String write(HttpServletRequest request){
		FreeboardVO vo = new FreeboardVO();
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		freeboardService.insertFreeboard(vo);
		return "redirect:/freeboard/list";
	}
	
	@RequestMapping("/freeboard/read")
	public ModelAndView read(HttpServletRequest request){
		ModelAndView mav = freeboardService.readFreeboard(request);
		mav.setViewName("/freeboard/read");
		return mav;
	}
	
	//댓글
	@RequestMapping(value="/freeboard/reply", method=RequestMethod.POST)
	public ModelAndView reply(HttpServletRequest request){
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		String reply = request.getParameter("reply");
		String empno = request.getParameter("empno");
		
		ReplyVO vo = new ReplyVO();
		vo.setNum(num);
		vo.setName(name);
		vo.setReply(reply);
		vo.setEmpno(empno);
		
		freeboardService.insertReply(vo);
		
		return new ModelAndView("redirect:/freeboard/read?num="+num);
	}
	
	@RequestMapping("/freeboard/delete")
	public String delete(@RequestParam("num") int num){
		int result = freeboardService.deleteFreeboard(num); //실패: 0, 성공: 1
		String res = "redirect:/freeboard/list";
		if(result == 0){
			res = "/freeboard/fail"; //fail.jsp
		}
		return res;
	}
	
	@RequestMapping("/freeboard/updateForm")
	public ModelAndView updateForm(HttpServletRequest request){
		ModelAndView mav = freeboardService.getFreeboard(request);
		mav.setViewName("/freeboard/updateForm");
		return mav;
	}
	
	@RequestMapping("/freeboard/update")
	public String update(FreeboardVO vo){
		System.out.println("update=>"+vo);
		freeboardService.updateFreeboard(vo); //실패: 0, 성공: 1
		//System.out.println("update result=>"+result);
		
		String res = "redirect:/freeboard/list";
		
		/*if(result == 0){
			res = "/freeboard/fail";
		}*/
		return res;
	}
	
	
	@RequestMapping(value="/freeboard/replyUpdateForm", method=RequestMethod.POST)
	public ModelAndView replyUpdateForm(HttpServletRequest request){
		ModelAndView mav = freeboardService.getReply(request);
		mav.setViewName("/freeboard/replyUpdateForm");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(HttpServletRequest request){
		freeboardService.updateReply(request);
		return "redirect:/freeboard/list";
	}
	
	@RequestMapping(value="/freeboard/replyDelete", method=RequestMethod.POST)
	public String replyDelete(HttpServletRequest request){
		freeboardService.deleteReply(request);
		return "redirect:/freeboard/list";
	}
}
