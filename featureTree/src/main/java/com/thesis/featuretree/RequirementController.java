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
public class RequirementController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addRequirement", method = RequestMethod.GET)
	public String addRequirement(Locale locale, Model model) {
		DbController sql = new DbController();
		logger.info("Welcome requirement add! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query = "SELECT id, name FROM feature";
		ArrayList features = sql.executeDbQuerySelect(query); 
		model.addAttribute("features", features);		
		
		return "requirement_add";
	}
	
	@RequestMapping(value = "/saveRequirement", method = RequestMethod.POST)
	public String saveRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirement save! the client locale is "+ locale.toString());
		
		String featureId 			= request.getParameter("featureId");
		String requirementName 	= request.getParameter("requirementName");
		String requirementDesc 	= request.getParameter("requirementDesc");
		
		String query = "INSERT INTO requirement(feature_id,name,description) VALUES('"+featureId+"','"+requirementName+"','"+requirementDesc+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Requirement Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementRequirement";
	}

	@RequestMapping(value = "/editRequirement", method = RequestMethod.GET)
	public String editRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome requirement edit! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query_feature = "SELECT id, name FROM feature";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);
		
		String id = request.getParameter("id");
		String query_requirement = "SELECT * FROM requirement WHERE id=" + id;
		ArrayList requirements = sql.executeDbQuerySelect(query_requirement); 
		model.addAttribute("requirements", requirements);		
		
		return "requirement_edit";
	}

	@RequestMapping(value = "/updateRequirement", method = RequestMethod.POST)
	public String updateRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirement update! the client locale is "+ locale.toString());
		
		String requirementId	= request.getParameter("requirementId"); 
		String featureId 		= request.getParameter("featureId");
		String requirementName 	= request.getParameter("requirementName");
		String requirementDesc 	= request.getParameter("requirementDesc");
		
		String query = "UPDATE requirement SET feature_id='"+featureId+"', name='"+requirementName+"', description='"+requirementDesc+"' WHERE id="+requirementId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Requirement Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementRequirement";
	}
	
	//
	// CODE FOR PM SITE :: REQUIREMENTS
	//
	@RequestMapping(value = "/addRequirementPM", method = RequestMethod.GET)
	public String addRequirementPM(Locale locale, Model model) {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM add! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query = "SELECT id, name FROM pmsite_feature";
		ArrayList features = sql.executeDbQuerySelect(query); 
		model.addAttribute("features", features);		
		
		return "/PM/requirement_add";
	}
	
	@RequestMapping(value = "/saveRequirementPM", method = RequestMethod.POST)
	public String saveRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM save! the client locale is "+ locale.toString());
		
		String featureId 			= request.getParameter("featureId");
		String requirementName 	= request.getParameter("requirementName");
		String requirementDesc 	= request.getParameter("requirementDesc");
		
		String query = "INSERT INTO pmsite_requirement(feature_id,name,description) VALUES('"+featureId+"','"+requirementName+"','"+requirementDesc+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Requirement Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementRequirementPM";
	}

	@RequestMapping(value = "/editRequirementPM", method = RequestMethod.GET)
	public String editRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM edit! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query_feature = "SELECT id, name FROM pmsite_feature";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);
		
		String id = request.getParameter("id");
		String query_requirement = "SELECT * FROM pmsite_requirement WHERE id=" + id;
		ArrayList requirements = sql.executeDbQuerySelect(query_requirement); 
		model.addAttribute("requirements", requirements);		
		
		return "/PM/requirement_edit";
	}

	@RequestMapping(value = "/updateRequirementPM", method = RequestMethod.POST)
	public String updateRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM update! the client locale is "+ locale.toString());
		
		String requirementId	= request.getParameter("requirementId"); 
		String featureId 		= request.getParameter("featureId");
		String requirementName 	= request.getParameter("requirementName");
		String requirementDesc 	= request.getParameter("requirementDesc");
		
		String query = "UPDATE pmsite_requirement SET feature_id='"+featureId+"', name='"+requirementName+"', description='"+requirementDesc+"' WHERE id="+requirementId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Requirement Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementRequirementPM";
	}

}
