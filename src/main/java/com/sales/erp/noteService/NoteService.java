package com.sales.erp.noteService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.noteDAO.NoteDAO;
import com.sales.erp.noteVO.NoteSearchVO;
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
	/*받은 쪽지만 가져오기*/
	public ModelAndView receiveLists(String pageNum, String field, String keyword){
		ArrayList<NoteVO> list;
		ModelAndView mav = new ModelAndView();
		
		/*정보 가공 시작*/
		int pageSize = 10;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String empno = auth.getName();
		if(pageNum.equals("")||pageNum==null){
			pageNum="1";
		}
		if(field.equals("")||field==null){
			field="title";
		}
		if(keyword.equals("")||keyword==null){
			keyword="";
		}
		int count = dao.countReceiveAll(empno);
		int start = count-(pageSize*(Integer.parseInt(pageNum)-1));
		int end = count-((pageSize-(pageSize-1))*Integer.parseInt(pageNum));
		NoteSearchVO svo = new NoteSearchVO();
		svo.setEmpno(empno);
		svo.setField(field);
		svo.setKeyword(keyword);
		svo.setStart(start);
		svo.setEnd(end);
		
		list = dao.selectReceiveAll(svo);
		
		for(NoteVO nvo:list){
			Date date = nvo.getSenddate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			String change = sdf.format(date);
			nvo.setChange(change);
		}
		
		mav.addObject("list", list);
		mav.addObject("count", count);
		return mav;
	}
	/*확인하지 않은 쪽지 보여주기*/
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
