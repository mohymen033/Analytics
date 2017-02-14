package com.thesis.featuretree;

import java.sql.SQLException;
import java.text.DateFormat;
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

import java.util.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SubIndicatorController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(SubIndicatorController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addSubIndicator", method = RequestMethod.GET)
	public String addSubIndicator(Locale locale, Model model) {
		DbController sql = new DbController();
		logger.info("Welcome SubIndicator add! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query = "SELECT id, name FROM indicator";
		ArrayList indicators = sql.executeDbQuerySelect(query); 
		model.addAttribute("indicators", indicators);		
		
		return "sub_indicator_add";
	}
	
	@RequestMapping(value = "/saveSubIndicator", method = RequestMethod.POST)
	public String saveSubIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome SubIndicator save! the client locale is "+ locale.toString());
		
		String indicatorId 			= request.getParameter("indicatorId");
		String subIndicatorName 	= request.getParameter("subIndicatorName");
		String subIndicatorStatus 	= request.getParameter("subIndicatorStatus");
		String subIndicatorURL		= request.getParameter("subIndicatorURL");
		String subIndicatorDesc 	= request.getParameter("subIndicatorDesc");
		
		String query = "INSERT INTO sub_indicator(indicator_id,name,url,description,is_active) VALUES('"+indicatorId+"','"+subIndicatorName+"','"+subIndicatorURL+"','"+subIndicatorDesc+"','"+subIndicatorStatus+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Sub Indicator Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementSubIndicator";
	}

	@RequestMapping(value = "/editSubIndicator", method = RequestMethod.GET)
	public String editSubIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome SubIndicator edit! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query_indicator = "SELECT id, name FROM indicator";
		ArrayList indicators = sql.executeDbQuerySelect(query_indicator); 
		model.addAttribute("indicators", indicators);
		
		String id = request.getParameter("id");
		String query_sub_indicator = "SELECT * FROM sub_indicator WHERE id=" + id;
		ArrayList sub_indicators = sql.executeDbQuerySelect(query_sub_indicator); 
		model.addAttribute("sub_indicators", sub_indicators);		
		
		return "sub_indicator_edit";
	}

	@RequestMapping(value = "/updateSubIndicator", method = RequestMethod.POST)
	public String updateSubIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome SubIndicator update! the client locale is "+ locale.toString());
		
		String subIndicatorId		= request.getParameter("subIndicatorId"); 
		String indicatorId 			= request.getParameter("indicatorId");
		String subIndicatorName 	= request.getParameter("subIndicatorName");
		String subIndicatorStatus 	= request.getParameter("subIndicatorStatus");
		String subIndicatorURL 		= request.getParameter("subIndicatorURL");
		String subIndicatorDesc 	= request.getParameter("subIndicatorDesc");
		
		String query = "UPDATE sub_indicator SET indicator_id='"+indicatorId+"', name='"+subIndicatorName+"', url='"+subIndicatorURL+"', description='"+subIndicatorDesc+"', is_active='"+subIndicatorStatus+"' WHERE id="+subIndicatorId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "SubIndicator Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementSubIndicator";
	}
}
