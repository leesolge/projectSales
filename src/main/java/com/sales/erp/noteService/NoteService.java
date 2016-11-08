package com.sales.erp.noteService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
	
	public ModelAndView viewNoteContent(int noteNum){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		NoteVO vo = dao.viewNote(noteNum);
		if(vo.getReceiver().equals(empno)&&vo.getCheck()==0){
			dao.checkNote(noteNum);
		}
		
		Date date = vo.getSenddate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		String change = sdf.format(date);
		vo.setChange(change);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		
		return mav;
	}
	
	public ModelAndView noteLists(){
		ArrayList<NoteVO> list;
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		int empno = Integer.parseInt(auth.getName());
		
		int count = dao.countReceiveAll(empno);
		list = dao.selectReceiveAll(empno);
		
		for(NoteVO vo:list){
			Date date = vo.getSenddate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String change = sdf.format(date);
			vo.setChange(change);
		}
		
		mav.addObject("list", list);
		mav.addObject("count", count);
		return mav;
	}
	
	public ModelAndView detailRecieve(){
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
