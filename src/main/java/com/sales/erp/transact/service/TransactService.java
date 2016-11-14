package com.sales.erp.transact.service;

import java.text.ParseException;
import java.util.ArrayList;

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
		
		ArrayList<String> procode_list;
		ArrayList<String> team_list;
		procode_list = dao.get_procode();
		team_list = dao.get_team();
				
		ModelAndView mav = new ModelAndView();
		ArrayList<TransactVO> list;
		list = dao.selectList(vo);
		mav.addObject("list", list);		
		mav.addObject("procode_list", procode_list);
		mav.addObject("team_list", team_list);		
		return mav;
	}

	
}
