package com.sales.erp.noteService;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.noteDAO.NoteDAO;
import com.sales.erp.noteVO.NoteVO;

@Service
public class NoteService {
	
	@Autowired
	private NoteDAO dao;
	
	public ModelAndView noteLists() throws ParseException{
		ArrayList<NoteVO> sendList;
		ArrayList<NoteVO> receiveList;
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		sendList = dao.selectSend(empno);
		for(NoteVO vo:sendList){
			Date date = vo.getSenddate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String change = sdf.format(date);
			vo.setChange(change);
		}
		
		receiveList = dao.selectReceive(empno);
		for(NoteVO vo:receiveList){
			Date date = vo.getSenddate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String change = sdf.format(date);
			vo.setChange(change);
		}
		
		mav.addObject("sendList", sendList);
		mav.addObject("receiveList", receiveList);
		return mav;
		
		
	}
}
