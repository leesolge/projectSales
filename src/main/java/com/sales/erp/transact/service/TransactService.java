package com.sales.erp.transact.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.transact.dao.TransactDAO;
import com.sales.erp.transact.vo.TransactSearchVO;
import com.sales.erp.transact.vo.TransactVO;

@Service
public class TransactService {

	@Autowired
	private TransactDAO dao;
	
	public ModelAndView takeOptions() {
		ArrayList<String> procode_list;
		ArrayList<String> team_list;
		procode_list = dao.get_procode();
		team_list = dao.get_team();
		ModelAndView mav = new ModelAndView();
		mav.addObject("procode_list", procode_list);
		mav.addObject("team_list", team_list);		
		return mav;
	}	

	public ModelAndView transList(HttpServletRequest request) throws ParseException{
				
		TransactSearchVO vo = new TransactSearchVO();
		vo.setProcode(request.getParameter("procode"));
		vo.setCategory(request.getParameter("category"));
		vo.setTeam(request.getParameter("team"));
		vo.setStart_date(request.getParameter("start_date"));
		vo.setEnd_date(request.getParameter("end_date"));
		
		System.out.println(vo.getStart_date());
		System.out.println(vo.getEnd_date());
		
		ArrayList<String> procode_list;
		ArrayList<String> team_list;
		procode_list = dao.get_procode();
		team_list = dao.get_team();
				
		ModelAndView mav = new ModelAndView();
		ArrayList<TransactVO> list;
		list = dao.selectList(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		for(TransactVO tvo:list){
			Date date = tvo.getTransdate();
			String view_date = sdf.format(date);
			tvo.setView_date(view_date);
		}
		
		mav.addObject("list", list);		
		mav.addObject("procode_list", procode_list);
		mav.addObject("team_list", team_list);		
		return mav;
	}

	
}
