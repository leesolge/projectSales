package com.sales.erp.noteController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.noteService.NoteService;
import com.sales.erp.noteVO.NoteVO;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService nos;
	
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
	public ModelAndView writeForm(@RequestParam("pageCheck") String pageCheck){
		ModelAndView mav = nos.receiverCheck(pageCheck);
		mav.setViewName("/note/write");
		return mav;
	}
	
	@RequestMapping("/note/view")
	public ModelAndView viewNote(@RequestParam("notenum") int notenum, @RequestParam("pageCheck") String pageCheck){
		ModelAndView mav = nos.viewNoteContent(notenum, pageCheck);
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
