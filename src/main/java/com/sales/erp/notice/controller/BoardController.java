package com.sales.erp.notice.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.note.vo.JoinVO;
import com.sales.erp.notice.service.BoardService;
import com.sales.erp.notice.vo.BoardVO;
import com.sales.erp.notice.vo.CommentVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/list")
	public ModelAndView viewBoard(HttpServletRequest request){
		ModelAndView mav=boardService.getBoardList(request);
		mav.setViewName("/board/boardList");
		return mav;
	}
	
	@RequestMapping("/board/writeForm")
	public ModelAndView writeForm(){
		ModelAndView mav = boardService.sendWriteForm();
		mav.setViewName("/board/writeForm");
		return mav;
	}
	
	@RequestMapping(value="/board/write", method= RequestMethod.POST)
	public String write(HttpServletRequest request){
		BoardVO vo = new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		boardService.insertBoard(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/board/read")
	public ModelAndView read(HttpServletRequest request){
		String num=request.getParameter("num");
		ArrayList<CommentVO> comments = boardService.commentList(num);
		
		if(comments!=null){
			for(CommentVO vo:comments){
				Date date = vo.getRegDate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
				String change = sdf.format(date);
				vo.setChange(change);
			}
		}
		
		ModelAndView mav=boardService.getBoard(request);  //글 읽기
		
		mav.addObject("comments", comments);
		/*mav.addObject("comments", boardService.commentList(num));*/
		/*mav.setViewName("/board/read");*/
		return mav;
	}
	
	//커맨트쓰기
	@RequestMapping(value="/board/comment", method=RequestMethod.POST)
	public ModelAndView comment(HttpServletRequest request){
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		String comments=request.getParameter("comments");
		CommentVO vo=new CommentVO();
		vo.setNum(num);
		vo.setName(name);
		vo.setComments(comments);
		
		boardService.insertComment(vo);
		
		return new ModelAndView("redirect:/board/read?num="+num);
	}
	
	
	@RequestMapping("/board/delete")
	public String delete(@RequestParam("num") int num){
		int result=boardService.deleteBoard(num); //실패 : 0 , 성공 : 1
		String res="redirect:/board/list";
		if(result==0){
			res="/board/fail";//fail.jsp
		}
		
		return res;
	}
	
	@RequestMapping("/board/updateForm")
	public ModelAndView updateForm(HttpServletRequest request){
		ModelAndView mav=boardService.getBoard(request);
		mav.setViewName("/board/updateForm");
		return mav;
	}
	
	@RequestMapping("/board/update")
	public String update(BoardVO vo){
		System.out.println("update=>"+vo);
		int result=boardService.updateBoard(vo); //실패: 0, 성공: 1
		System.out.println("update result=>"+result);
		String res="redirect:/board/list";
		if(result==0){
			res="/board/fail";
		}
		return res;
	}
	
}
