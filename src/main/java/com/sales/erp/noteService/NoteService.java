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
import com.sales.erp.noteVO.NoteSearchVO;
import com.sales.erp.noteVO.NoteVO;
import com.sales.erp.smember.SMemberVO;

@Service
public class NoteService {
	
	@Autowired
	private NoteDAO dao;
	
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
		}
		return mav;
	}
	
	public ModelAndView receiverCheck(String pageCheck, String rec){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		ModelAndView mav = new ModelAndView();
		SMemberVO senderVo = dao.getNameTeamAuth(empno);
		if(rec.equals("0")){
		}else{
			SMemberVO receiverVo = dao.getNameTeamAuth(rec);
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
		
		ArrayList<SMemberVO> receiverList = dao.receiverCheck(empno);
		System.out.println(receiverList);
		for(SMemberVO svo:receiverList){
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
	
	public ModelAndView viewNoteContent(int notenum, String pageCheck){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		
		NoteVO vo = dao.viewNote(notenum);
		if(vo.getReceiver().equals(empno)&&vo.getChecks()==0){
			dao.checkNote(notenum);
		}
		
		Date date = vo.getSenddate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		String change = sdf.format(date);
		vo.setChange(change);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("pageCheck", pageCheck);
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
