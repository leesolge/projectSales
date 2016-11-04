package com.sales.erp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(Model model) {
		
		String hello = "Hello Sales Team";
		model.addAttribute("hello", hello);

		return "hello";
	}
	
	@RequestMapping("/employee/test")
	public String admin(Locale locale, Model model) {

		/*SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		String empno = auth.getName();
		
		model.addAttribute("empno", empno);*/

		return "ee";
	}
	
	@RequestMapping("/admin/test")
	public String employee(Locale locale, Model model) {

		SecurityContext context = SecurityContextHolder.getContext();
		

		return "admin";
	}
	
	@RequestMapping("/login")
	public String login(Locale locale, Model model) {


		return "login";
	}
	
	@RequestMapping("/loginfail")
	public String loginfail(Locale locale, Model model) {


		return "loginfail";
	}

}
