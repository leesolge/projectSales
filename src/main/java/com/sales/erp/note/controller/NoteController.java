package com.sales.erp.note.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.note.service.NoteService;
import com.sales.erp.note.vo.NoteVO;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService nos;
	
	@RequestMapping("/admin/note")
	public ModelAndView adminNoteSelect(HttpServletRequest request){
		ModelAndView mav = nos.adminSelectAll(request);
		mav.setViewName("/note/adminnote");
		return mav;
	}
	
	@RequestMapping("/note/notedel")
	public ModelAndView deleteNote(HttpServletRequest request){
		ModelAndView mav = nos.deleteN(request);
		return mav;
	}
	
	@RequestMapping("/note/reply")
	public ModelAndView reply(HttpServletRequest request){
		ModelAndView mav = nos.reply(request);
		mav.setViewName("/note/reply");
		return mav;
	}
	
	@RequestMapping("/note/writes")
	public ModelAndView writePro(HttpServletRequest request){
		ModelAndView mav = nos.writePro(request);
		return mav;
	}
	
	@RequestMapping("/note/list")
	public ModelAndView selectNotes(){
		ModelAndView mav = nos.sendRecieve();
		mav.setViewName("/note/notelist");
		return mav;
	}
	
	@RequestMapping("/note/write")
	public ModelAndView writeForm(@RequestParam("pageCheck") String pageCheck, @RequestParam("rec") String rec){
		ModelAndView mav = nos.receiverCheck(pageCheck, rec);
		mav.setViewName("/note/write");
		return mav;
	}
	
	@RequestMapping("/note/view")
	public ModelAndView viewNote(HttpServletRequest request){
		ModelAndView mav = nos.viewNoteContent(request);
		mav.setViewName("/note/notecontent");
		return mav;
	}
	
	@RequestMapping("/note/rdetail")
	public ModelAndView viewRdetail(HttpServletRequest request){
		ModelAndView mav = nos.receiveLists(request);
		mav.setViewName("/note/receivedetail");
		return mav;
	}
	
	@RequestMapping("/note/sdetail")
	public ModelAndView viewSdetail(HttpServletRequest request){
		
		ModelAndView mav = nos.sendLists(request);
		mav.setViewName("/note/senddetail");
		return mav;
	}
	
}
