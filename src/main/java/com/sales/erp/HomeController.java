package com.sales.erp;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sales.erp.note.service.NoteService;
import com.sales.erp.note.vo.NoteVO;
import com.sales.erp.notice.service.NoticeService;
import com.sales.erp.notice.vo.NoticeVO;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService ns;
	
	@Autowired
	private NoteService noteService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	//After login page
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = ns.getNoticeList(request);
		Map<String, Object> map = mv.getModel();
		ArrayList<NoticeVO> notice = (ArrayList<NoticeVO>) map.get("list");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", notice);
		mv = noteService.receiveLists(request);
		map = mv.getModel();
		ArrayList<NoteVO> notes = (ArrayList<NoteVO>) map.get("list");
		mav.addObject("note", notes);
		mav.setViewName("main/main");
		return mav;
	}

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping("/loginfail")
	public String loginfail(Locale locale, Model model) {

		return "loginfail";
	}
}
