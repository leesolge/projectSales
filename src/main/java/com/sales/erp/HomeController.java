package com.sales.erp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.sales.erp.note.service.NoteService;
import com.sales.erp.note.vo.NoteVO;
import com.sales.erp.notice.service.NoticeService;
import com.sales.erp.notice.vo.NoticeVO;
import com.sales.erp.schedule.vo.RssVO;

@Controller
public class HomeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private NoteService noteService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	// After login page
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = noticeService.getNoticeList(request);
		Map<String, Object> map = mv.getModel();
		ArrayList<NoticeVO> notice = (ArrayList<NoticeVO>) map.get("list");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", notice);
		mv = noteService.uncheckedList(request);
		map = mv.getModel();
		ArrayList<NoteVO> notes = (ArrayList<NoteVO>) map.get("list");
		mav.addObject("note", notes);
		// weather
		ArrayList<RssVO> list = new ArrayList<RssVO>();
		Calendar oCalendar = Calendar.getInstance();
		int hour = oCalendar.get(Calendar.HOUR_OF_DAY);

		try {
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = f.newDocumentBuilder();

			Document xmlDoc = null;
			String url = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4113565500";
			xmlDoc = parser.parse(url);

			Element root = xmlDoc.getDocumentElement();
			String hour2 = "", temp = "", wfEn = "", change = "";
			RssVO rvo = new RssVO();

			for (int i = 3; i < 10; i++) {
				Node xmlNode1 = root.getElementsByTagName("data").item(i);

				Node xmlNode21 = ((Element) xmlNode1).getElementsByTagName("temp").item(0);
				Node xmlNode22 = ((Element) xmlNode1).getElementsByTagName("wfEn").item(0);
				Node xmlNode23 = ((Element) xmlNode1).getElementsByTagName("hour").item(0);

				temp = xmlNode21.getTextContent();
				wfEn = xmlNode22.getTextContent();
				change = xmlNode23.getTextContent();

				if (hour <= Integer.parseInt(change)) {
					hour2 = change;
					break;
				} else {
					continue;
				}

			}
			String hour1 = hour2 + "시";
			rvo.setTemp(temp);
			rvo.setWfEn(wfEn);
			rvo.setHour1(hour1);

			list.add(rvo);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e.toString());
		}
		mav.addObject("weather", list);
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
