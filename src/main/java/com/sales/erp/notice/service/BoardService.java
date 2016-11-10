package com.sales.erp.notice.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.notice.dao.BoardDAO;
import com.sales.erp.notice.vo.BoardVO;

@Service
public class BoardService{
	
	@Autowired
	private BoardDAO dao;
	
	public ModelAndView getBoardList(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		int pg=1;
		String strPg =request.getParameter("pg");
		if(strPg!=null){
			pg=Integer.parseInt(strPg);
		}
		int rowSize=10;
		int start=(pg*rowSize)-(rowSize-1);
		int end=pg*rowSize;
		
		int total=dao.getBoardCount(); //총 게시물수
		System.out.println("시작 : "+start +" 끝:"+end);
		System.out.println("글의 수 : " +total);
		
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		System.out.println("페이지수 : "+ allPage);
		
		int block=10; //한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage=((pg-1)/block*block)+1; //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage=((pg-1)/block*block)+block; //보여줄 페이지의 끝
		if(toPage>allPage){
			toPage=allPage;
		}
		
		HashMap map=new HashMap();
		//BoardVO vo = new BoardVO();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<BoardVO> list= dao.getBoardList(map);  ////////////
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("allPage", allPage);
		mav.addObject("block", block);
		mav.addObject("fromPage", fromPage);
		mav.addObject("toPage", toPage);
		
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
	
	

}
