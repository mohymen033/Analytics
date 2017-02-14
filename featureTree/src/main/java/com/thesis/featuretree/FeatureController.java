package com.thesis.featuretree;

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
public class FeatureController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(FeatureController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addFeature", method = RequestMethod.GET)
	public String addFeature(Locale locale, Model model) {
		logger.info("Welcome feature add! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "feature_add";
	}
	
	
	@RequestMapping(value = "/saveFeature", method = RequestMethod.POST)
	public String saveFeature(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome feature save! the client locale is "+ locale.toString());
		
		String featureName 		= request.getParameter("featureName");
		String featureStatus	= request.getParameter("featureStatus");
		String featureDesc 		= request.getParameter("featureDesc");
		
		String query = "INSERT INTO feature(name,description,is_active) VALUES('"+featureName+"','"+featureDesc+"','"+featureStatus+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Feature Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		return "redirect:/managementFeature";
	}
	
	@RequestMapping(value = "/editFeature", method = RequestMethod.GET)
	public String editFeature(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome feature edit! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String id = request.getParameter("id");
		String query = "SELECT * FROM feature WHERE id="+id;
		ArrayList features = sql.executeDbQuerySelect(query); 
		model.addAttribute("features", features);
		
		return "feature_edit";
	}
	
	@RequestMapping(value = "/updateFeature", method = RequestMethod.POST)
	public String updateFeature(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome feature update! the client locale is "+ locale.toString());
		
		String featureId 	= request.getParameter("featureId");
		String featureName 	= request.getParameter("featureName");
		String featureStatus	= request.getParameter("featureStatus");
		String featureDesc 	= request.getParameter("featureDesc");
		
		String query = "UPDATE feature SET name='"+featureName+"', description='"+featureDesc+"', is_active='"+featureStatus+"' WHERE id="+featureId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Feature Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementFeature";
	}
	
	
	/// 
	/// CODE FOR PM SITE
	///
	@RequestMapping(value = "/addFeaturePM", method = RequestMethod.GET)
	public String addFeaturePM(Locale locale, Model model) {
		logger.info("Welcome PMfeature add! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/PM/feature_add";
	}
	
	
	@RequestMapping(value = "/saveFeaturePM", method = RequestMethod.POST)
	public String saveFeaturePM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome PMfeature save! the client locale is "+ locale.toString());
		
		String featureName 		= request.getParameter("featureName");
		String featureStatus	= request.getParameter("featureStatus");
		String featureDesc 		= request.getParameter("featureDesc");
		
		String query = "INSERT INTO pmsite_feature(name,description,is_active) VALUES('"+featureName+"','"+featureDesc+"','"+featureStatus+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Feature Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		return "redirect:/managementFeaturePM";
	}
	
	@RequestMapping(value = "/editFeaturePM", method = RequestMethod.GET)
	public String editFeaturePM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome PMfeature edit! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String id = request.getParameter("id");
		String query = "SELECT * FROM pmsite_feature WHERE id="+id;
		ArrayList features = sql.executeDbQuerySelect(query); 
		model.addAttribute("features", features);
		
		return "/PM/feature_edit";
	}
	
	@RequestMapping(value = "/updateFeaturePM", method = RequestMethod.POST)
	public String updateFeaturePM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome PMfeature update! the client locale is "+ locale.toString());
		
		String featureId 	= request.getParameter("featureId");
		String featureName 	= request.getParameter("featureName");
		String featureStatus	= request.getParameter("featureStatus");
		String featureDesc 	= request.getParameter("featureDesc");
		
		String query = "UPDATE pmsite_feature SET name='"+featureName+"', description='"+featureDesc+"', is_active='"+featureStatus+"' WHERE id="+featureId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Feature Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/managementFeaturePM";
	}

}
