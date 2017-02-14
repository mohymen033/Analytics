package com.spring.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PasswordGenController {
	
	private static final Logger logger = LoggerFactory.getLogger(PasswordGenController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	@RequestMapping(value = "/passwordgen", method = RequestMethod.GET)
	public String passwordgen(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome passwordgen! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String s=request.getParameter("value");
		model.addAttribute("test",s);
		
		return "passwordgen";
	}
	
}
