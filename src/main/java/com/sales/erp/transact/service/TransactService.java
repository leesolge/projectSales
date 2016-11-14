package com.sales.erp.transact.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.transact.dao.TransactDAO;
import com.sales.erp.transact.vo.TransactVO;

@Service
public class TransactService {

	@Autowired
	private TransactDAO dao;

	public ModelAndView transList(HttpServletRequest request) throws ParseException{
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
		TransactVO vo = new TransactVO();
	//	String date = request.getParameter("start_date");
		vo.setCategory(request.getParameter("category"));
		vo.setTeam(request.getParameter("team"));
		//vo.setTransdate(sdf.parse(date));
				
		ModelAndView mav = new ModelAndView();
		ArrayList<TransactVO> list;
		list = dao.selectList(vo);
		mav.addObject("list", list);		
		return mav;
	}
}
