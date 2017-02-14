package com.thesis.featuretreeanalytics;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Handles requests for the application home page.
 */
@Controller
public class IndicatorController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(IndicatorController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addIndicator", method = RequestMethod.GET)
	public String addIndicator(Locale locale, Model model) {
		logger.info("Welcome indicator add! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "indicator_add";
	}
	
	
	@RequestMapping(value = "/saveIndicator", method = RequestMethod.POST)
	public String saveIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome indicator save! the client locale is "+ locale.toString());
		
		String indicatorName 	= request.getParameter("indicatorName");
		String indicatorDesc 	= request.getParameter("indicatorDesc");
		
		String query = "INSERT INTO indicator(name,description) VALUES('"+indicatorName+"','"+indicatorDesc+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Indicator Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/editIndicator", method = RequestMethod.GET)
	public String editIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome indicator edit! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String id = request.getParameter("id");
		String query = "SELECT * FROM indicator WHERE id="+id;
		ArrayList indicators = sql.executeDbQuerySelect(query); 
		model.addAttribute("indicators", indicators);
		
		return "indicator_edit";
	}
	
	@RequestMapping(value = "/updateIndicator", method = RequestMethod.POST)
	public String updateFeature(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome indicator update! the client locale is "+ locale.toString());
		
		String indicatorId 	= request.getParameter("indicatorId");
		String indicatorName 	= request.getParameter("indicatorName");
		String indicatorDesc 	= request.getParameter("indicatorDesc");
		
		String query = "UPDATE indicator SET name='"+indicatorName+"', description='"+indicatorDesc+"' WHERE id="+indicatorId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Indicator Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/";
	}
}
