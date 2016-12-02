package com.sales.erp.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.sales.erp.schedule.vo.RssVO;
import com.sales.erp.schedule.dao.ScheduleDAO;
import com.sales.erp.schedule.vo.ScheduleVO;


@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleDAO sdao;
	

	@RequestMapping(value="/schedule/insert", method=RequestMethod.POST)
	public String insert(HttpServletRequest request){
	
			ScheduleVO vo = new ScheduleVO();
			int month = Integer.parseInt(request.getParameter("month"))-1;
			vo.setContents(request.getParameter("contents"));
			vo.setTitle(request.getParameter("title"));
			vo.setEmpno(request.getParameter("empno"));
			vo.setYear(Integer.parseInt(request.getParameter("year")));
			vo.setMonth(Integer.parseInt(request.getParameter("month")));
			vo.setDay(Integer.parseInt(request.getParameter("day")));
			sdao.insertSchedule(vo);
			
			
			return "redirect:/schedule/chooseday?year="+vo.getYear()+"&month="+month+"&day="+vo.getDay();
	}
	
	@RequestMapping(value="/schedule/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request){
		String empno = request.getParameter("empno");
		String contents = request.getParameter("contents");
		int year1= Integer.parseInt(request.getParameter("year"));
		int month1 = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int num = Integer.parseInt(request.getParameter("num"));

		ScheduleVO vo = new  ScheduleVO();
		vo.setYear(year1); vo.setMonth(month1); vo.setDay(day); vo.setEmpno(empno);
		vo.setEmpno(empno); vo.setContents(contents); vo.setNum(num);
	
		sdao.deleteSchedule(vo);
		month1 -= 1;
		
		return "redirect:/schedule/chooseday?year="+year1+"&month="+month1+"&day="+day;
	}
	
	@RequestMapping("/schedule/calendarForm")
	public String Calendar(HttpServletRequest request) throws Exception{
		Calendar cal= Calendar.getInstance();
		
	    int currentYear = cal.get(Calendar.YEAR); 
	    int currentMonth = cal.get(Calendar.MONTH);
	    int currentDate = cal.get(Calendar.DATE);
	    String Year = request.getParameter("year"); //나타내고자 하는 날짜
	    String Month = request.getParameter("month");
	    int year, month;
	    
	    if(Year == null && Month == null){ //처음 호출했을 때
			    year = currentYear;
			    month = currentMonth;
	    }
	    else { //나타내고자 하는 날짜를 숫자로 변환
			     year = Integer.parseInt(Year);
			     month = Integer.parseInt(Month);
			     if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
			     if(month>11) { month=0; year=year+1; }
	    }
	    
	    
	    cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
	    int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	    int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	    int br = 0; //7일마다 줄 바꾸기
	    int count = 0;
	 
	    
	     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 String empno = auth.getName();
		 
		 ArrayList<ScheduleVO> check = new ArrayList<>();
		 check = sdao.getschedule(empno);

		 
	     
		  request.setAttribute("year", new Integer(year));
		  request.setAttribute("month", new Integer(month));
		  request.setAttribute("currentYear", new Integer(currentYear));
		  request.setAttribute("currentMonth", new Integer(currentMonth));
		  request.setAttribute("currentDate", new Integer(currentDate));
		  request.setAttribute("startDay", new Integer(startDay));
		  request.setAttribute("end", new Integer(end));
		  request.setAttribute("br", br);
		  request.setAttribute("empno", empno);
		  request.setAttribute("count", count);
		  request.setAttribute("check", check);
		  return "/schedule/calendar";
		}
		
	
	
	
		@RequestMapping("/schedule/chooseday")
		public String ChooseDay(HttpServletRequest request){
			Calendar cal= Calendar.getInstance();
			
		    int currentYear = cal.get(Calendar.YEAR); 
		    int currentMonth = cal.get(Calendar.MONTH);
		    int currentDate = cal.get(Calendar.DATE);
		    String Year = request.getParameter("year"); //나타내고자 하는 날짜
		    String Month = request.getParameter("month");
		    int year, month;
		    
		    if(Year == null && Month == null){ //처음 호출했을 때
				    year = currentYear;
				    month = currentMonth;
		    }
		    else { //나타내고자 하는 날짜를 숫자로 변환
				     year = Integer.parseInt(Year);
				     month = Integer.parseInt(Month);
				     if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
				     if(month>11) { month=0; year=year+1; }
		    }
		    
		    
		    cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
		    int startDay=cal.get(Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
		    int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
		    int br = 0; //7일마다 줄 바꾸기
			
			int year1= Integer.parseInt(request.getParameter("year"));
			int month1 = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("day"));
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String empno = auth.getName();
			ArrayList<ScheduleVO> list;
			
			ScheduleVO vo = new ScheduleVO();
			vo.setYear(year1); vo.setMonth(month1+1); vo.setDay(day); vo.setEmpno(empno);
		    list = sdao.selectOne(vo);
		    int count = sdao.countSchedule(vo);
			
		    ArrayList<ScheduleVO> check = new ArrayList<>();
			check = sdao.getschedule(empno);
		      
		      request.setAttribute("month1", month1+1);
			  request.setAttribute("year", new Integer(year));
			  request.setAttribute("month", new Integer(month));
			  request.setAttribute("day", new Integer(day));
			  request.setAttribute("currentYear", new Integer(currentYear));
			  request.setAttribute("currentMonth", new Integer(currentMonth));
			  request.setAttribute("currentDate", new Integer(currentDate));
			  request.setAttribute("startDay", new Integer(startDay));
			  request.setAttribute("end", new Integer(end));
			  request.setAttribute("br", br);
			  request.setAttribute("empno", empno);
			  request.setAttribute("vo", list);
			  request.setAttribute("count", count);
			  request.setAttribute("check", check);
			  
			  
			  return "/schedule/calendar";
		}
	}
	

