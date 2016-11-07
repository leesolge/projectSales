package com.sales.erp.noteController;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.noteService.NoteService;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService nos;
	
	@RequestMapping("/note/list")
	public ModelAndView selectNotes() throws ParseException{
		ModelAndView mav = nos.noteLists();
		mav.setViewName("/note/notelist");
		return mav;
	}
}
