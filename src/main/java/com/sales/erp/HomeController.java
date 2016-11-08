package com.sales.erp;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	//After login page
	@RequestMapping(value = "/main")
	public String main(Model model) {

		return "main/main";
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
