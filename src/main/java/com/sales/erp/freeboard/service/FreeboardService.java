package com.sales.erp.freeboard.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.freeboard.dao.FreeboardDAO;
import com.sales.erp.freeboard.vo.FreeboardSearch;
import com.sales.erp.freeboard.vo.FreeboardVO;
import com.sales.erp.freeboard.vo.ReplyForUpdateVO;
import com.sales.erp.freeboard.vo.ReplyVO;
import com.sales.erp.member.vo.MemberVO;

@Service
public class FreeboardService {

	@Autowired
	private FreeboardDAO dao;
	
	public ModelAndView getFreeboardList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		int pg=1;
		
		String strPg =request.getParameter("pg");
		String field = request.getParameter("field");
		String word = request.getParameter("word");
		
		if(field == null || field.equals("")){
			field = "name";
	    }
	    if(word == null || word.equals("")){
	    	word = "";
	    }    
		if(strPg != null){
			pg = Integer.parseInt(strPg);
		}
		
		FreeboardSearch search = new FreeboardSearch();
		search.setField(field);
	    search.setWord("%" + word + "%");
	    
		int rowSize=10;
		int start=(pg*rowSize)-(rowSize-1);
		int end=pg*rowSize;
		
		int total=dao.getFreeboardCount(search); //총 게시물수
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		
		int block=10; //한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage=((pg-1)/block*block)+1; //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage=((pg-1)/block*block)+block; //보여줄 페이지의 끝
		
	    search.setEnd(end);
	    search.setStart(start);
	    
		if(toPage>allPage){
			toPage=allPage;
		}		
		
		ArrayList<FreeboardVO> list= dao.getFreeboardList(search);  ////////////
		System.out.println(list);
		mav.addObject("total", total);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("allPage", allPage);
		mav.addObject("block", block);
		mav.addObject("fromPage", fromPage);
		mav.addObject("toPage", toPage);
		
		return mav;
	}
	
	public ModelAndView sendWriteform(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		ModelAndView mav = new ModelAndView();
		MemberVO senderVO = dao.getNameTeamAuth(empno);
		
		mav.addObject("senderVO", senderVO);
		return mav;
	}
	
	
	public void insertFreeboard(FreeboardVO vo){
		dao.insertFreeboard(vo);
	}
	
	public ModelAndView getFreeboard(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		FreeboardVO freeVO = dao.getFreeboard(num);
		mav.addObject("freeVO", freeVO);
		return mav;
	}
	
	public int deleteFreeboard(int num){
		int result = dao.deleteFreeboard(num);
		return result;
	}
	
	public void updateFreeboard(FreeboardVO vo){
		System.out.println("서비스의 updateFreeboard 시작점");
		dao.updateFreeboard(vo);
		System.out.println("서비스의 updateFreeboard 끝점");
	}
	
	public ArrayList<ReplyVO> replyList(String num){
		return dao.replyList(num);
	}
	
	public void insertReply(ReplyVO vo){
		dao.insertReply(vo);
	}
	
	public ModelAndView readFreeboard(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		ArrayList<ReplyVO> reply = dao.replyList(num);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		MemberVO senderVO = dao.getNameTeamAuth(empno);
		
		FreeboardVO freeVO = dao.getFreeboard(num);
		
		mav.addObject("freeVO", freeVO);
		mav.addObject("senderVO", senderVO);
		mav.addObject("reply", reply);
		
		return mav;
	}
	
	public ModelAndView getReply(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String num = request.getParameter("num");
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("seq:"+seq);
		
		ReplyForUpdateVO vo = new ReplyForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		
		ReplyVO reply1 = dao.replyListForUpdate(vo);
		mav.addObject("reply1", reply1);
		mav.addObject("vo", vo);
		
		return mav;
	}
	
	public void updateReply(HttpServletRequest request){
		String num = request.getParameter("num");
		System.out.println("num:"+num);
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String reply = request.getParameter("reply");
		System.out.println("seq:"+seq+"/reply:"+reply);
		
		ReplyForUpdateVO vo = new ReplyForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		vo.setReply(reply);
		
		dao.updateReply(vo);
	}
	
	public void deleteReply(HttpServletRequest request){
		String num = request.getParameter("num");
		System.out.println("num:"+num);
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String reply = request.getParameter("reply");
		System.out.println("seq:"+seq+"/reply:"+reply);
		
		ReplyForUpdateVO vo = new ReplyForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		vo.setReply(reply);
		
		dao.deleteReply(vo);
	}
}
