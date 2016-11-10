package com.sales.erp.note.service;

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
import com.sales.erp.note.dao.NoteDAO;
import com.sales.erp.note.vo.NoteSearchVO;
import com.sales.erp.note.vo.NoteVO;

@Service
public class NoteService {
	
	@Autowired
	private NoteDAO dao;
	
	public ModelAndView reply(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String pageCheck = request.getParameter("pageCheck");
		mav.addObject("pageCheck", pageCheck);
		int notenum = Integer.parseInt(request.getParameter("notenum"));
		mav.addObject("notenum", notenum);
		String receiver = request.getParameter("receiver");
		if(!pageCheck.equals("etc")){
			String pageNum = request.getParameter("pageNum");
			String field = request.getParameter("field");
			String keyword = request.getParameter("keyword");
			mav.addObject("pageNum", pageNum);
			mav.addObject("field", field);
			mav.addObject("keyword", keyword);
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		mav.addObject("sender", empno);
		
		MemberVO sendervo = dao.getNameTeamAuth(empno);
		MemberVO receivervo = dao.getNameTeamAuth(receiver);
		
		if(sendervo.getAuth().equals("ROLE_EMPLOYEE")){
			sendervo.setAuth("사원");
		}
		if(sendervo.getAuth().equals("ROLE_MANAGER")){
			sendervo.setAuth("팀장");
		}
		if(sendervo.getAuth().equals("ROLE_ADMIN")){
			sendervo.setAuth("관리자");
		}
		
		if(receivervo.getAuth().equals("ROLE_EMPLOYEE")){
			receivervo.setAuth("사원");
		}
		if(receivervo.getAuth().equals("ROLE_MANAGER")){
			receivervo.setAuth("팀장");
		}
		if(receivervo.getAuth().equals("ROLE_ADMIN")){
			receivervo.setAuth("관리자");
		}
		mav.addObject("svo", sendervo);
		mav.addObject("rvo", receivervo);
		
		return mav;
	}
	
	public ModelAndView writePro(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		NoteVO vo = new NoteVO();
		vo.setPageCheck(request.getParameter("pageCheck"));
		vo.setSender(request.getParameter("sender"));
		vo.setReceiver(request.getParameter("receiver"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		dao.writePro(vo);
		if(vo.getPageCheck().equals("receive")){
			mav.setViewName("redirect:/note/rdetail");
		}else if(vo.getPageCheck().equals("send")){
			mav.setViewName("redirect:/note/sdetail");
		}else if(vo.getPageCheck().equals("etc")){
			mav.setViewName("redirect:/note/list");
		}else if(vo.getPageCheck().equals("rbin")){
			
		}else if(vo.getPageCheck().equals("sbin")){
			
		}
		return mav;
	}
	
	public ModelAndView receiverCheck(String pageCheck, String rec){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		ModelAndView mav = new ModelAndView();
		MemberVO senderVo = dao.getNameTeamAuth(empno);
		if(rec.equals("0")){
		}else{
			MemberVO receiverVo = dao.getNameTeamAuth(rec);
			if(receiverVo.getAuth().equals("ROLE_EMPLOYEE")){
				receiverVo.setAuth("사원");
			}
			if(receiverVo.getAuth().equals("ROLE_MANAGER")){
				receiverVo.setAuth("팀장");
			}
			if(receiverVo.getAuth().equals("ROLE_ADMIN")){
				receiverVo.setAuth("관리자");
			}
		mav.addObject("receiverVo", receiverVo);
		}
		
		ArrayList<MemberVO> receiverList = dao.receiverCheck(empno);
		System.out.println(receiverList);
		for(MemberVO svo:receiverList){
			if(svo.getAuth().equals("ROLE_EMPLOYEE")){
				svo.setAuth("사원");
			}
			if(svo.getAuth().equals("ROLE_MANAGER")){
				svo.setAuth("팀장");
			}
			if(svo.getAuth().equals("ROLE_ADMIN")){
				svo.setAuth("관리자");
			}
		}
		mav.addObject("list", receiverList);
		mav.addObject("pageCheck", pageCheck);
		mav.addObject("rec", rec);
		mav.addObject("senderName", senderVo.getName());
		mav.addObject("id", empno);
		return mav;
	}
	
	public ModelAndView viewNoteContent(HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		ModelAndView mav = new ModelAndView();
		
		String pageCheck = request.getParameter("pageCheck");
		int notenum = Integer.parseInt(request.getParameter("notenum"));
		
		if(pageCheck.equals("receive")||pageCheck.equals("send")){
			String pageNum = request.getParameter("pageNum");
			mav.addObject("pageNum", pageNum);
			String field = request.getParameter("field");
			mav.addObject("field", field);
			String keyword = request.getParameter("keyword");
			mav.addObject("keyword", keyword);
		}
		
		NoteVO vo = dao.viewNote(notenum);
		if(vo.getReceiver().equals(empno)&&vo.getChecks()==0){
			dao.checkNote(notenum);
		}
		MemberVO sendervo = dao.getNameTeamAuth(vo.getSender());
		MemberVO receivervo = dao.getNameTeamAuth(vo.getReceiver());
		
		if(sendervo.getAuth().equals("ROLE_EMPLOYEE")){
			sendervo.setAuth("사원");
		}
		if(sendervo.getAuth().equals("ROLE_MANAGER")){
			sendervo.setAuth("팀장");
		}
		if(sendervo.getAuth().equals("ROLE_ADMIN")){
			sendervo.setAuth("관리자");
		}
		
		if(receivervo.getAuth().equals("ROLE_EMPLOYEE")){
			receivervo.setAuth("사원");
		}
		if(receivervo.getAuth().equals("ROLE_MANAGER")){
			receivervo.setAuth("팀장");
		}
		if(receivervo.getAuth().equals("ROLE_ADMIN")){
			receivervo.setAuth("관리자");
		}
		
		Date date = vo.getSenddate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		String change = sdf.format(date);
		vo.setChange(change);
		mav.addObject("vo", vo);
		mav.addObject("svo", sendervo);
		mav.addObject("rvo", receivervo);
		mav.addObject("notenum", notenum);
		mav.addObject("pageCheck", pageCheck);
		mav.addObject("empno", empno);
		return mav;
	}
	/*받은 쪽지만 가져오기*/
	public ModelAndView receiveLists(HttpServletRequest request){
		ArrayList<NoteVO> list;
		ModelAndView mav = new ModelAndView();
		/*정보 가공 시작*/
		int pageSize = 10;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		String pageNum = (String) request.getParameter("pageNum");
		String field = (String) request.getParameter("field");
		String keyword = (String) request.getParameter("keyword");
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		if(field==null||field.equals("")){
			field="title";
		}
		if(keyword==null||keyword.equals("")){
			keyword="";
		}
		System.out.println(pageNum);
		String newkeyword="%"+keyword+"%";
		int count = dao.countReceiveAll(empno);
		int end = count -(pageSize*(Integer.parseInt(pageNum)-1));
		int start = end -(pageSize-1);
		if(start<1){
			start = 1;
		}
		int max;
		if(count%pageSize==0){
			max = count/pageSize;
		}else{
			max = (count/pageSize)+1;
		}
		NoteSearchVO svo = new NoteSearchVO();
		svo.setEmpno(empno);
		svo.setField(field);
		svo.setKeyword(newkeyword);
		svo.setStart(start);
		svo.setEnd(end);
		
		list = dao.selectReceiveAll(svo);
		if(list!=null){
			for(NoteVO nvo:list){
				Date date = nvo.getSenddate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				String change = sdf.format(date);
				nvo.setChange(change);
			}
		}
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pageNum", pageNum);
		mav.addObject("field", field);
		mav.addObject("keyword", keyword);
		mav.addObject("max", max);
		return mav;
	}
	
	/*보낸 쪽지만 가져오기*/
	public ModelAndView sendLists(HttpServletRequest request){
		ArrayList<NoteVO> list;
		ModelAndView mav = new ModelAndView();
		/*정보 가공 시작*/
		int pageSize = 10;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		String pageNum = (String) request.getParameter("pageNum");
		String field = (String) request.getParameter("field");
		String keyword = (String) request.getParameter("keyword");
		System.out.println(field);
		System.out.println(keyword);
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		if(field==null||field.equals("")){
			field="title";
		}
		if(keyword==null||keyword.equals("")){
			keyword="";
		}
		System.out.println(pageNum);
		String newkeyword="%"+keyword+"%";
		int count = dao.countSendAll(empno);
		int end = count -(pageSize*(Integer.parseInt(pageNum)-1));
		int start = end -(pageSize-1);
		if(start<1){
			start = 1;
		}
		int max;
		if(count%pageSize==0){
			max = count/pageSize;
		}else{
			max = (count/pageSize)+1;
		}
		NoteSearchVO svo = new NoteSearchVO();
		svo.setEmpno(empno);
		svo.setField(field);
		svo.setKeyword(newkeyword);
		svo.setStart(start);
		svo.setEnd(end);
		
		list = dao.selectSendAll(svo);
		
		if(list!=null){
			for(NoteVO nvo:list){
				Date date = nvo.getSenddate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
				String change = sdf.format(date);
				nvo.setChange(change);
			}
		}
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pageNum", pageNum);
		mav.addObject("field", field);
		mav.addObject("keyword", keyword);
		mav.addObject("max", max);
		return mav;
	}
	
	public ModelAndView sendRecieve(){
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
