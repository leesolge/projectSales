package com.sales.erp.notice.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.member.vo.MemberVO;
import com.sales.erp.notice.dao.BoardDAO;
import com.sales.erp.notice.vo.BoardSearch;
import com.sales.erp.notice.vo.BoardVO;
import com.sales.erp.notice.vo.CommentForUpdateVO;
import com.sales.erp.notice.vo.CommentVO;

@Service
public class BoardService{
	
	@Autowired
	private BoardDAO dao;
	
	public ModelAndView getBoardList(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView();
		
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
		
		BoardSearch search = new BoardSearch();
		search.setField(field);
	    search.setWord("%" + word + "%");
	    
		int rowSize=10;
		int start=(pg*rowSize)-(rowSize-1);
		int end=pg*rowSize;
		
		int total=dao.getBoardCount(search); //총 게시물수
		System.out.println("시작 : "+start +" 끝:"+end);
		System.out.println("글의 수 : " +total);
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		System.out.println("페이지수 : "+ allPage);
		
		int block=10; //한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage=((pg-1)/block*block)+1; //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage=((pg-1)/block*block)+block; //보여줄 페이지의 끝
		
	    search.setEnd(end);
	    search.setStart(start);
		System.out.println(field);
		if(toPage>allPage){
			toPage=allPage;
		}
		
		
		ArrayList<BoardVO> list= dao.getBoardList(search);  ////////////
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
	
	public ModelAndView sendWriteForm(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		ModelAndView mav = new ModelAndView();
		MemberVO senderVo = dao.getNameTeamAuth(empno);
		
		mav.addObject("senderVo", senderVo);		
		return mav;
	}
	
	public void insertBoard(BoardVO vo){
		dao.insertBoard(vo);
	}

	public ModelAndView getBoard(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		int num=Integer.parseInt(request.getParameter("num"));
		BoardVO b= dao.getBoard(num);
		mav.addObject("b", b);
		return mav;
	}

	public int deleteBoard(int num) {
		int result=dao.deleteBoard(num);
		return result;
	}

	public int updateBoard(BoardVO vo) {
		int result=dao.updateBoard(vo);
		return result;
	}

	public ArrayList<CommentVO> commentList(String num) {
		return dao.commentList(num);
	}

	public void insertComment(CommentVO vo) {
		dao.insertComment(vo);
	}

	public ModelAndView readBoard(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		String num=request.getParameter("num");
		ArrayList<CommentVO> comments = dao.commentList(num);
		
		if(comments!=null){
			for(CommentVO vo:comments){
				Date date = vo.getRegDate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
				String change = sdf.format(date);
				vo.setChange(change);
			}
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		MemberVO senderVo = dao.getNameTeamAuth(empno);
		
		int num1=Integer.parseInt(request.getParameter("num"));
		BoardVO b= dao.getBoard(num1);
		
		mav.addObject("b", b);
		mav.addObject("senderVo", senderVo);
		mav.addObject("comments", comments);
		return mav;
	}

	public ModelAndView getComments(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		String num=request.getParameter("num");
		int seq=Integer.parseInt(request.getParameter("seq"));
		System.out.println("seq:"+seq);
		CommentForUpdateVO vo=new CommentForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		
		CommentVO comments1=dao.commentListforUpdate(vo);
		mav.addObject("comments1", comments1);
		mav.addObject("vo", vo);
		return mav;
	}

	public void updateComments(HttpServletRequest request) {
		String num=request.getParameter("num");
		System.out.println("num:"+num);
		int seq=Integer.parseInt(request.getParameter("seq"));
		String comments=request.getParameter("comments");
		System.out.println("num:"+num+"/seq:"+seq);
		
		CommentForUpdateVO vo=new CommentForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		vo.setComments(comments);
	
		dao.updateComments(vo);
	}

	public void deleteComments(HttpServletRequest request) {
		String num=request.getParameter("num");
		System.out.println("num="+num);
		int seq=Integer.parseInt(request.getParameter("seq"));
		String comments=request.getParameter("comments");
		System.out.println("num="+num+"/seq="+seq);
		
		CommentForUpdateVO vo=new CommentForUpdateVO();
		vo.setNum(num);
		vo.setSeq(seq);
		vo.setComments(comments);
		
		dao.deleteComments(vo);
	}
}
