package com.sales.erp.noteController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import com.sales.erp.noteService.NoteService;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService nos;
	
	@RequestMapping("/note/list")
	public ModelAndView selectNotes(){
		ModelAndView mav = nos.noteLists();
		mav.setViewName("/note/notelist");
		return mav;
	}
	
	@RequestMapping("/note/view")
	public ModelAndView viewNote(@RequestParam("noteNum") int noteNum){
		ModelAndView mav = nos.viewNoteContent(noteNum);
		mav.setViewName("/note/notecontent");
		return mav;
	}
}
