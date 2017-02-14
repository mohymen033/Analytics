package com.thesis.featuretree;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class GuielementController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(GuielementController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addGuielement", method = RequestMethod.GET)
	public String addGuielement(Locale locale, Model model) {
		
		DbController sql = new DbController();
		
		logger.info("Welcome requirement add! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query = "SELECT id, name FROM requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query); 
		model.addAttribute("requirements", requirements);		
		
		return "add_element_with_properties";
		
	
	}
	
	@RequestMapping(value = "/addGuielementvisit", method = RequestMethod.GET)
	public String addGuielementvisit(Locale locale, Model model,HttpServletRequest request) {
		
		DbController sql = new DbController();
		logger.info("Welcome requirement save! the client locale is "+ locale.toString());
		
		
				
		String guielementidname 	= request.getParameter("eventvalue");
		String visitorAddress 	= request.getParameter("visitorAddress");
		String sessionId=request.getParameter("sessionId");
		String ipaddress=request.getParameter("ipaddress");
		
		String selquery= "SELECT * FROM `gui_element_visit` WHERE `visitelementname`='"+guielementidname+"' and `elementvisitsessionid`='"+sessionId+"'";
		int elementvisitcount=sql.executeDbQueryResult(selquery, "elementvisitcount");
		
		if(elementvisitcount<0)
		//String query = "INSERT INTO gui_element_visit(requirement_id,name,description) VALUES('Anonymous','sdsds','"+guiDesc+"')";
		
		{
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			String formattedDate=sdf.format(date);
			
			String query=" INSERT INTO `feature_tree`.`gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementlastvisittime`, `elementvisitsessionid`, `visitoraddress`, `elementfirstvisittime`,`ipaddress`) VALUES (NULL, 'Anonymous','"+guielementidname+"', '1', '"+formattedDate+"', '"+sessionId+"', '"+visitorAddress+"', '"+formattedDate+"','"+ipaddress+"') ";
			
		//String query="INSERT INTO `feature_tree`.`gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementfirstvisittime`, `elementvisitsessionid`,`visitoraddress`) VALUES (NULL, 'Anonymous', '"+guielementidname+"', '1', '"+formattedDate+"', '"+sessionId+"','"+visitorAddress+"')";
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui element Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
	}
		else
		{
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			String formattedDate=sdf.format(date);
			
			elementvisitcount=elementvisitcount+1;
					
			String query="UPDATE `gui_element_visit` SET `elementvisitcount`='"+elementvisitcount+"', `elementlastvisittime`='"+formattedDate+"' WHERE `visitelementname`='"+guielementidname+"' and `elementvisitsessionid`='"+sessionId+"' ";
			//String query="INSERT INTO `feature_tree`.`gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elemntvisittime`, `elementvisitsessionid`) VALUES (NULL, 'Anonymous', '"+guiDesc+"', '"+id+"', '2012-08-15 00:00:00', '10')";
			String saveMsg = sql.executeDbQuerySave(query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Added!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
			
		}
		elementvisitcount=0;
		//list.remove(0);
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/saveGuielement", method = RequestMethod.POST)
	public String saveRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirement save! the client locale is "+ locale.toString());
		
		String requiremntId = request.getParameter("requiremntId");
		String guiName 	= request.getParameter("guiName");
		String guiDesc 	= request.getParameter("guiDesc");
		
		String query = "INSERT INTO guielement(requirement_id,name,description) VALUES('"+requiremntId+"','"+guiName+"','"+guiDesc+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui element Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/";
	}

	@RequestMapping(value = "/editGuielement", method = RequestMethod.GET)
	public String editRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome requirement edit! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query_requirement = "SELECT id, name FROM requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query_requirement); 
		model.addAttribute("requirements", requirements);
		
		String id = request.getParameter("id");
		String query_guielemnt = "SELECT * FROM guielement WHERE id=" + id;
		ArrayList guielements = sql.executeDbQuerySelect(query_guielemnt); 
		model.addAttribute("guielements", guielements);		
		
		return "edit_element_with_properties";
	}

	
	@RequestMapping(value = "/updateGuielement", method = RequestMethod.POST)
	public String updateRequirement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirement update! the client locale is "+ locale.toString());
		
		String guielementId	= request.getParameter("guielementId"); 
		String requirementId 		= request.getParameter("requirementId");
		String guielementName 	= request.getParameter("guielementName");
		String guielementDesc 	= request.getParameter("guielementDesc");
		
		String query = "UPDATE guielement SET requirement_id='"+requirementId+"', name='"+guielementName+"', description='"+guielementDesc+"' WHERE id="+guielementId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui Element Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/mapGuielement", method = RequestMethod.GET)
	public String mapGuielement(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		DbController sql = new DbController();
		logger.info("Welcome requirement map with element! the client locale is "+ locale.toString());
		
		String clickedEvent	= request.getParameter("eventId");
		model.addAttribute("clickedEvent", clickedEvent);
		
		String query = "SELECT id, name FROM requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query); 
		model.addAttribute("requirements", requirements);		
		
		return "map_element_with_requirements";
		
	
	}
	
	@RequestMapping(value = "/saveMappedGuielement", method = RequestMethod.GET)
	public String saveMappedGuielement(Locale locale, Model model,HttpServletRequest request) {
		
		DbController sql = new DbController();
		logger.info("Welcome saveMappedGuielement! the client locale is "+ locale.toString());
		
		String guiElementId		= request.getParameter("guiElementIdName");
		String requirementId 	= request.getParameter("requirementId");
		
		String selquery= "SELECT * FROM `guielement` WHERE `name`='"+guiElementId+"'";
		int id=sql.executeDbQueryResult(selquery, "id");
		logger.info("saveMappedGuielement::id "+ id);
		
		if(id<0){
			String query="INSERT INTO `guielement` (`id`, `requirement_id`, `name`) VALUES (NULL, '"+requirementId+"', '"+guiElementId+"')";
			logger.info("saveMappedGuielement::query "+ query);
			String saveMsg = sql.executeDbQuerySave(query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Mapped!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
		}
		
		else{
			//id=id+1;

			String query="UPDATE `guielement` SET `requirement_id`='"+requirementId+"' WHERE `name`='"+guiElementId+"'";
			String saveMsg = sql.executeDbQuerySave(query);
			logger.info("saveMappedGuielement::query "+ query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Mapped!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
			
		}
		//id=0;
		return "map_element_with_requirements";
		
	}
	
	//
	// CODE FOR PM SITE :: GUI ELEMENT
	//
	@RequestMapping(value = "/addGuielementPM", method = RequestMethod.GET)
	public String addGuielementPM(Locale locale, Model model) {
		
		DbController sql = new DbController();
		
		logger.info("Welcome requirementPM add! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query = "SELECT id, name FROM pmsite_requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query); 
		model.addAttribute("requirements", requirements);		
		
		return "/PM/add_element_with_properties";
		
	
	}
	
	@RequestMapping(value = "/addGuielementvisitPM", method = RequestMethod.GET)
	public String addGuielementvisitPM(Locale locale, Model model,HttpServletRequest request) {
		
		DbController sql = new DbController();
		logger.info("Welcome requirementPM save! the client locale is "+ locale.toString());
		
		String guielementidname 	= request.getParameter("eventvalue");
		String visitorAddress 	= request.getParameter("visitorAddress");
		String sessionId=request.getParameter("sessionId");
		String ipaddress=request.getParameter("ipaddress");
		
		String selquery= "SELECT * FROM `pmsite_gui_element_visit` WHERE `visitelementname`='"+guielementidname+"' and `elementvisitsessionid`='"+sessionId+"'";
		int elementvisitcount=sql.executeDbQueryResult(selquery, "elementvisitcount");
		
		if(elementvisitcount<0)
		//String query = "INSERT INTO gui_element_visit(requirement_id,name,description) VALUES('Anonymous','sdsds','"+guiDesc+"')";
		
		{
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			String formattedDate=sdf.format(date);
			
			String query=" INSERT INTO `feature_tree`.`pmsite_gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementlastvisittime`, `elementvisitsessionid`, `visitoraddress`, `elementfirstvisittime`,`ipaddress`) VALUES (NULL, 'Anonymous','"+guielementidname+"', '1', '"+formattedDate+"', '"+sessionId+"', '"+visitorAddress+"', '"+formattedDate+"','"+ipaddress+"') ";
			
		//String query="INSERT INTO `feature_tree`.`gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementfirstvisittime`, `elementvisitsessionid`,`visitoraddress`) VALUES (NULL, 'Anonymous', '"+guielementidname+"', '1', '"+formattedDate+"', '"+sessionId+"','"+visitorAddress+"')";
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui element Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
	}
		else
		{
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			String formattedDate=sdf.format(date);
			
			elementvisitcount=elementvisitcount+1;
					
			String query="UPDATE `pmsite_gui_element_visit` SET `elementvisitcount`='"+elementvisitcount+"', `elementlastvisittime`='"+formattedDate+"' WHERE `visitelementname`='"+guielementidname+"' and `elementvisitsessionid`='"+sessionId+"' ";
			//String query="INSERT INTO `feature_tree`.`gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elemntvisittime`, `elementvisitsessionid`) VALUES (NULL, 'Anonymous', '"+guiDesc+"', '"+id+"', '2012-08-15 00:00:00', '10')";
			String saveMsg = sql.executeDbQuerySave(query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Added!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
			
		}
		elementvisitcount=0;
		//list.remove(0);
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/saveGuielementPM", method = RequestMethod.POST)
	public String saveRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM save! the client locale is "+ locale.toString());
		
		String requiremntId = request.getParameter("requiremntId");
		String guiName 	= request.getParameter("guiName");
		String guiDesc 	= request.getParameter("guiDesc");
		
		String query = "INSERT INTO pmsite_guielement(requirement_id, name, description) VALUES('"+requiremntId+"','"+guiName+"','"+guiDesc+"')";
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui element Successfully Added!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/";
	}

	@RequestMapping(value = "/editGuielementPM", method = RequestMethod.GET)
	public String editRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM edit! the client locale is "+ locale.toString());
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		String query_requirement = "SELECT id, name FROM pmsite_requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query_requirement); 
		model.addAttribute("requirements", requirements);
		
		String id = request.getParameter("id");
		String query_guielemnt = "SELECT * FROM pmsite_guielement WHERE id=" + id;
		ArrayList guielements = sql.executeDbQuerySelect(query_guielemnt); 
		model.addAttribute("guielements", guielements);		
		
		return "/PM/edit_element_with_properties";
	}

	
	@RequestMapping(value = "/updateGuielementPM", method = RequestMethod.POST)
	public String updateRequirementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		DbController sql = new DbController();
		logger.info("Welcome requirementPM update! the client locale is "+ locale.toString());
		
		String guielementId	= request.getParameter("guielementId"); 
		String requirementId 		= request.getParameter("requirementId");
		String guielementName 	= request.getParameter("guielementName");
		String guielementDesc 	= request.getParameter("guielementDesc");
		
		String query = "UPDATE pmsite_guielement SET requirement_id='"+requirementId+"', name='"+guielementName+"', description='"+guielementDesc+"' WHERE id="+guielementId;
		
		String saveMsg = sql.executeDbQuerySave(query);
		if(saveMsg == "success"){
			model.addAttribute("saveMsg", "Gui Element Successfully Updated!");
		} 
		else
		{
			model.addAttribute("saveMsg", saveMsg);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/mapGuielementPM", method = RequestMethod.GET)
	public String mapGuielementPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		DbController sql = new DbController();
		logger.info("Welcome requirementPM map with element! the client locale is "+ locale.toString());
		
		String clickedEvent	= request.getParameter("eventId");
		model.addAttribute("clickedEvent", clickedEvent);
		
		String query = "SELECT id, name FROM pmsite_requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query); 
		model.addAttribute("requirements", requirements);		
		
		return "/PM/map_element_with_requirements";
		
	
	}
	
	@RequestMapping(value = "/saveMappedGuielementPM", method = RequestMethod.GET)
	public String saveMappedGuielementPM(Locale locale, Model model,HttpServletRequest request) {
		
		DbController sql = new DbController();
		logger.info("Welcome saveMappedGuielementPM! the client locale is "+ locale.toString());
		
		String guiElementId		= request.getParameter("guiElementIdName");
		String requirementId 	= request.getParameter("requirementId");
		
		String selquery= "SELECT * FROM `pmsite_guielement` WHERE `name`='"+guiElementId+"'";
		int id=sql.executeDbQueryResult(selquery, "id");
		logger.info("saveMappedGuielementPM::id "+ id);
		
		if(id<0){
			String query="INSERT INTO `pmsite_guielement` (`id`, `requirement_id`, `name`) VALUES (NULL, '"+requirementId+"', '"+guiElementId+"')";
			logger.info("saveMappedGuielementPM::query "+ query);
			String saveMsg = sql.executeDbQuerySave(query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Mapped!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
		}
		
		else{
			//id=id+1;

			String query="UPDATE `pmsite_guielement` SET `requirement_id`='"+requirementId+"' WHERE `name`='"+guiElementId+"'";
			String saveMsg = sql.executeDbQuerySave(query);
			logger.info("saveMappedGuielementPM::query "+ query);
			if(saveMsg == "success"){
				model.addAttribute("saveMsg", "Gui element Successfully Mapped!");
			} 
			else
			{
				model.addAttribute("saveMsg", saveMsg);
			}
			
		}
		//id=0;
		return "/PM/map_element_with_requirements";
		
	}

}