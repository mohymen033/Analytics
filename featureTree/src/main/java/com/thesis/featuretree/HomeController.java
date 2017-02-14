package com.thesis.featuretree;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.util.JSONStringer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
// Chart4j
import com.googlecode.charts4j.*;
import static com.googlecode.charts4j.Color.*;
import com.google.gson.*;


import com.googlecode.charts4j.XYLine;
import com.googlecode.charts4j.XYLineChart;


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
	public String home(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/managementFeature", method = RequestMethod.GET)
	public String managementFeature(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_feature = "SELECT * FROM feature";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);
		
		return "feature_management";
	}
	
	@RequestMapping(value = "/managementRequirement", method = RequestMethod.GET)
	public String managementRequirement(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_req = "SELECT * FROM requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query_req); 
		model.addAttribute("requirements", requirements);
		
		return "requirement_management";
	}	

	@RequestMapping(value = "/managementGuielement", method = RequestMethod.GET)
	public String managementGuielement(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_guielemnt = "SELECT * FROM guielement ";
		ArrayList guielements = sql.executeDbQuerySelect(query_guielemnt); 
		model.addAttribute("guielements", guielements);		
		
		return "gui_element_management";
	}	

	@RequestMapping(value = "/managementIndicator", method = RequestMethod.GET)
	public String managementIndicator(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_indicator = "SELECT * FROM indicator";
		ArrayList indicators = sql.executeDbQuerySelect(query_indicator); 
		model.addAttribute("indicators", indicators);		
		
		return "indicator_management";
	}	

	@RequestMapping(value = "/managementSubIndicator", method = RequestMethod.GET)
	public String managementSubIndicator(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_req = "SELECT * FROM sub_indicator";
		ArrayList sub_indicators = sql.executeDbQuerySelect(query_req); 
		model.addAttribute("sub_indicators", sub_indicators);
		
		return "sub_indicator_management";
	}	

	@RequestMapping(value = "/featureTree", method = RequestMethod.GET)
	public String featureTree(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_ftree = "SELECT f.id as featureId, f.name as featureName, r.id as reqId, r.feature_id as reqFeatureId, r.name as reqName FROM feature f, requirement r WHERE f.id = r.feature_id ORDER BY featureId";
		ArrayList feature_trees = sql.executeDbQuerySelect(query_ftree); 
		model.addAttribute("feature_trees", feature_trees);
		
		return "feature_tree";
	}	

	@RequestMapping(value = "/statisticsIndicator", method = RequestMethod.GET)
	public String statisticsIndicator(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_subindicator = "SELECT i.id as indicatorId, i.name as indicatorName, si.id as subIndicatorId, si.indicator_id as subIndIndicatorId, si.name as subIndicatorName, si.url as subIndicatorUrl FROM indicator i, sub_indicator si WHERE i.id = si.indicator_id ORDER BY indicatorId";
		ArrayList indicator_stats = sql.executeDbQuerySelect(query_subindicator); 
		model.addAttribute("indicator_stats", indicator_stats);
		
		return "indicator_statistics";
	}	

	@RequestMapping(value = "/graphOfIndicator", method = RequestMethod.GET)
	public String graphOfIndicator(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

		DbController sql = new DbController();
		logger.info("Welcome getIndicator! the client locale is "+ locale.toString());

		// Features
		String query_feature = "SELECT id, name FROM feature WHERE is_active = 1";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);		

		// Indicator & Sub-Indicator
		String query_subindicator = "SELECT i.id as indicatorId, i.name as indicatorName, si.id as subIndicatorId, si.indicator_id as subIndIndicatorId, si.name as subIndicatorName, si.url as subIndicatorUrl FROM indicator i, sub_indicator si WHERE i.id = si.indicator_id AND si.is_active = 1 ORDER BY subIndicatorId";
		ArrayList indicator_stats = sql.executeDbQuerySelect(query_subindicator); 
		model.addAttribute("indicator_stats", indicator_stats);
		
		// From & To DateFormat: e.g., 10/01/2012
		// FromDate
		String fromDate = "09/20/2012";
		model.addAttribute("fromDate", fromDate);
		
		// ToDate
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		String toDate = dateFormat.format(date);
		model.addAttribute("toDate", toDate);

		return "graph_of_indicator";
	}
	
	@RequestMapping(value = "/getAjaxResponse", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> getAjaxResponse(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome getIndicator! the client locale is "+ locale.toString());

		String featureId	= request.getParameter("featureId");
		//String indicatorId	= request.getParameter("indicatorId");
		String subIndicatorId	= request.getParameter("subIndicatorId");
		String graphType	= request.getParameter("graphType");
		String from	= request.getParameter("from");
		String to	= request.getParameter("to");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		//logger.info("parameter"+ featureId+subIndicatorId+from+to);
		
		// Graph Code Start
		Gson gson = new Gson();
		int year=0;
		int month=0;
		int day=0;

		Date visitdate = new Date();
		Calendar calendar = Calendar.getInstance();

		String readingvisitvalue="[";

		//Arraylist for add element with google visualization format
		ArrayList <String> arrayofelementforvisualgraph=new ArrayList<String>();

		if(Integer.parseInt(subIndicatorId)==1){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				//logger.info("vElement2 "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
					+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
					+" FROM GUI_ELEMENT_VISIT GEV,GUIELEMENT GE," 
					+" REQUIREMENT RE,FEATURE FE " 
					+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID "
					+" group by firstvisitdate ";

			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM GUI_ELEMENT_VISIT GEV,GUIELEMENT GE," 
						+" REQUIREMENT RE,FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
						+" DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
						+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y') group by firstvisitdate ";
				
			}
			
			// Feature Statistics
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM GUI_ELEMENT_VISIT GEV,GUIELEMENT GE," 
						+" REQUIREMENT RE,FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID "
						+" AND FE.ID="+featureId+""
						+" group by firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM GUI_ELEMENT_VISIT GEV,GUIELEMENT GE," 
						+" REQUIREMENT RE,FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID "
						+" AND FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
						+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y') group by firstvisitdate ";
				
			}
			
			//logger.info("sdsd"+ query_track_ftree_totalvisit_bydate);
			ArrayList eVisits = sql.executeDbQuerySelect(query_track_ftree_totalvisit_bydate); 
			model.addAttribute("eVisits", eVisits);

			for( Object evisit : eVisits ){
				String jsonevisit=gson.toJson(evisit);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				//logger.info("vElement2 "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
					//logger.info("SSDS"+month);
				} 
				catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("guiVisitCount").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
				//logger.info("vElement3 "+ sp500[7]);
			}
		}

		//TODO:second ?? (What is that?? BAD Documentation!!! Name it specifically by its name Mirza)   
		if(Integer.parseInt(subIndicatorId)==7){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				//logger.info("vElement2 "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_uniquevisitor_bydate=
					" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
							+" A.firstvisitdate  FROM ( "
							+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
							+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
							+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
							+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID"
							+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";

			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')"
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
			}
			
			// Feature Statistics	
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" "
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')"
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
				
			}
			
			ArrayList eVisits_byuniqueuser = sql.executeDbQuerySelect(query_track_ftree_uniquevisitor_bydate); 
			model.addAttribute("eVisits_byuniqueuser", eVisits_byuniqueuser);

			for( Object eVisit_byuniqueuser : eVisits_byuniqueuser ){
				String jsonevisit=gson.toJson(eVisit_byuniqueuser);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				//logger.info("vElement2 "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
					//logger.info("SSDS"+month);
				} 
				catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("uniqueuser").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
			}
		}
		//total unique user

		//total visit time
		if(Integer.parseInt(subIndicatorId)==3){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				//logger.info("vElement2 "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_totalvisittime_bydate = 
					"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
							+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
							+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
							+" gev.elementfirstvisittime, "
							+" gev.elementlastvisittime, "
							+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
							+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
							+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
							+" FE.ID="+featureId+" "
							+" GROUP BY firstvisittime,elementfirstvisittime "
							+"	) B GROUP BY B.firstvisitdate ";

			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')" 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
			}
			
			// Feature Statistics	
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" " 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')" 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
				
			}
			
			ArrayList eVisits_bytotalvisittime = sql.executeDbQuerySelect(query_track_ftree_totalvisittime_bydate); 
			model.addAttribute("eVisits_bytotalvisittime", eVisits_bytotalvisittime);

			for( Object eVisit_bytotalvisittime : eVisits_bytotalvisittime ){
				String jsonevisit=gson.toJson(eVisit_bytotalvisittime);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				//logger.info("vElement2 "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
					//logger.info("SSDS"+month);
				} 
				catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("totalvisitduration").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
			}
		}
		// Graph Code End
		
		logger.info("Ajax:: featureId: "+featureId+", subIndicatorId: "+subIndicatorId+", graphType: "+graphType+", from: "+from+", to: "+to);
		logger.info("dff"+arrayofelementforvisualgraph);
		//String featureIdRspn = "Server Side Rspn:: FID: "+featureId+", SID: "+subIndicatorId+", GT: "+graphType+", FMD: "+from+", TD: "+to;
		return arrayofelementforvisualgraph;
	}

	///
	/// CODE FOR PM SITE
	///
	@RequestMapping(value = "/managementFeaturePM", method = RequestMethod.GET)
	public String managementFeaturePM(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome PMhome! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_feature = "SELECT * FROM pmsite_feature";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);
		
		return "/PM/feature_management";
	}
	
	@RequestMapping(value = "/managementRequirementPM", method = RequestMethod.GET)
	public String managementRequirementPM(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome homePM! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_req = "SELECT * FROM pmsite_requirement";
		ArrayList requirements = sql.executeDbQuerySelect(query_req); 
		model.addAttribute("requirements", requirements);
		
		return "/PM/requirement_management";
	}	

	@RequestMapping(value = "/managementGuielementPM", method = RequestMethod.GET)
	public String managementGuielementPM(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome homePM! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_guielemnt = "SELECT * FROM pmsite_guielement ";
		ArrayList guielements = sql.executeDbQuerySelect(query_guielemnt); 
		model.addAttribute("guielements", guielements);		
		
		return "/PM/gui_element_management";
	}	

	@RequestMapping(value = "/featureTreePM", method = RequestMethod.GET)
	public String featureTreePM(Locale locale, Model model,HttpServletRequest request) {
		DbController sql = new DbController();
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		String query_ftree = "SELECT f.id as featureId, f.name as featureName, r.id as reqId, r.feature_id as reqFeatureId, r.name as reqName FROM pmsite_feature f, pmsite_requirement r WHERE f.id = r.feature_id ORDER BY featureId";
		ArrayList feature_trees = sql.executeDbQuerySelect(query_ftree); 
		model.addAttribute("feature_trees", feature_trees);
		
		return "/PM/feature_tree";
	}	

	@RequestMapping(value = "/graphOfIndicatorPM", method = RequestMethod.GET)
	public String graphOfIndicatorPM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

		DbController sql = new DbController();
		logger.info("Welcome getIndicatorPM! the client locale is "+ locale.toString());

		// Features
		String query_feature = "SELECT id, name FROM pmsite_feature WHERE is_active = 1";
		ArrayList features = sql.executeDbQuerySelect(query_feature); 
		model.addAttribute("features", features);		

		// Indicator & Sub-Indicator
		String query_subindicator = "SELECT i.id as indicatorId, i.name as indicatorName, si.id as subIndicatorId, si.indicator_id as subIndIndicatorId, si.name as subIndicatorName, si.url as subIndicatorUrl FROM indicator i, sub_indicator si WHERE i.id = si.indicator_id AND si.is_active = 1 ORDER BY subIndicatorId";
		ArrayList indicator_stats = sql.executeDbQuerySelect(query_subindicator); 
		model.addAttribute("indicator_stats", indicator_stats);

		// From & To DateFormat: e.g., 10/01/2012
		// FromDate
		String fromDate = "11/11/2012";
		model.addAttribute("fromDate", fromDate);
		
		// ToDate
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		String toDate = dateFormat.format(date);
		model.addAttribute("toDate", toDate);

		return "/PM/graph_of_indicator";
	}
	
	@RequestMapping(value = "/getAjaxResponsePM", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> getAjaxResponsePM(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		DbController sql = new DbController();
		logger.info("Welcome getIndicatorPM! the client locale is "+ locale.toString());

		String featureId	= request.getParameter("featureId");
		String subIndicatorId	= request.getParameter("subIndicatorId");
		String graphType	= request.getParameter("graphType");
		String from	= request.getParameter("from");
		String to	= request.getParameter("to");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		logger.info("parameter"+ featureId+subIndicatorId+from+to);
		
		// Graph Code Start
		Gson gson = new Gson();
		int year=0;
		int month=0;
		int day=0;

		Date visitdate = new Date();
		Calendar calendar = Calendar.getInstance();

		String readingvisitvalue="[";

		//Arraylist for add element with google visualization format
		ArrayList <String> arrayofelementforvisualgraph=new ArrayList<String>();

		if(Integer.parseInt(subIndicatorId)==1){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				logger.info("vElement2PM "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
					+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
					+" FROM PMSITE_GUI_ELEMENT_VISIT GEV, PMSITE_GUIELEMENT GE," 
					+" PMSITE_REQUIREMENT RE, PMSITE_FEATURE FE" 
					+" WHERE GEV.VISITELEMENTNAME = GE.NAME AND GE.REQUIREMENT_ID = RE.ID AND RE.FEATURE_ID = FE.ID"
					+" group by firstvisitdate ";
			
			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM PMSITE_GUI_ELEMENT_VISIT GEV, PMSITE_GUIELEMENT GE," 
						+" PMSITE_REQUIREMENT RE, PMSITE_FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME = GE.NAME AND GE.REQUIREMENT_ID = RE.ID AND RE.FEATURE_ID = FE.ID"
						+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
						+" AND DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y') group by firstvisitdate ";
			}
			
			// Feature Statistics
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM PMSITE_GUI_ELEMENT_VISIT GEV, PMSITE_GUIELEMENT GE," 
						+" PMSITE_REQUIREMENT RE, PMSITE_FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME = GE.NAME AND GE.REQUIREMENT_ID = RE.ID AND RE.FEATURE_ID = FE.ID"
						+" AND FE.ID="+featureId+" "
						+" group by firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				
				query_track_ftree_totalvisit_bydate=" SELECT FE.ID,sum(gev.elementvisitcount) as guiVisitCount, "
						+" DATE(gev.elementfirstvisittime ) as firstvisitdate,gev.elementfirstvisittime as firstvisittime "
						+" FROM PMSITE_GUI_ELEMENT_VISIT GEV, PMSITE_GUIELEMENT GE," 
						+" PMSITE_REQUIREMENT RE, PMSITE_FEATURE FE " 
						+" WHERE GEV.VISITELEMENTNAME = GE.NAME AND GE.REQUIREMENT_ID = RE.ID AND RE.FEATURE_ID = FE.ID"
						+" AND FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
						+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y') group by firstvisitdate ";
			}

			logger.info("Query: "+ query_track_ftree_totalvisit_bydate);
			ArrayList eVisits = sql.executeDbQuerySelect(query_track_ftree_totalvisit_bydate); 
			model.addAttribute("eVisits", eVisits);

			for( Object evisit : eVisits ){
				String jsonevisit=gson.toJson(evisit);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				logger.info("vElement2PM: "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
					//logger.info("SSDS"+month);
				} 
				catch (ParseException e) {
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("guiVisitCount").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
			}
		}

		//second 
		if(Integer.parseInt(subIndicatorId)==7){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				logger.info("vElement2PM: "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_uniquevisitor_bydate=
					" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
							+" A.firstvisitdate  FROM ( "
							+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
							+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
							+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
							+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID"
							+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";

			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')"
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
			}
			
			// Feature Statistics	
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" "
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				query_track_ftree_uniquevisitor_bydate=
						" SELECT COUNT(ROW_COUNT()) AS uniqueuser,A.firstvisittime as firstvisittime, "
								+" A.firstvisitdate  FROM ( "
								+" SELECT ipaddress,gev.elementfirstvisittime as firstvisittime,DATE(gev.elementfirstvisittime ) as "
								+" firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount "
								+" FROM  gui_element_visit gev,requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')"
								+" GROUP BY ipaddress) A GROUP BY A.firstvisitdate ";
				
			}
			
			ArrayList eVisits_byuniqueuser = sql.executeDbQuerySelect(query_track_ftree_uniquevisitor_bydate); 
			model.addAttribute("eVisits_byuniqueuser", eVisits_byuniqueuser);

			for( Object eVisit_byuniqueuser : eVisits_byuniqueuser ){
				String jsonevisit=gson.toJson(eVisit_byuniqueuser);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				logger.info("vElement2PM: "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
				} 
				catch (ParseException e) {
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("uniqueuser").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
			}
		}
		//total unique user

		//total visit time
		if(Integer.parseInt(subIndicatorId)==3){
			String subindicator_title="Select SI.name as subindicatorname from sub_indicator SI " +
					" Where SI.ID="+subIndicatorId+"";

			ArrayList esubindicator_titles = sql.executeDbQuerySelect(subindicator_title); 
			model.addAttribute("esubindicator_titles", esubindicator_titles);

			for( Object esubindicator_title : esubindicator_titles ){
				String jsonesubindicator_title=gson.toJson(esubindicator_title);
				JsonParser parser = new JsonParser();
				JsonObject jsonesubindicator_titleObject = (JsonObject)parser.parse(jsonesubindicator_title);   
				logger.info("vElement2PM: "+ jsonesubindicator_titleObject.getAsJsonObject());//.get("guiElementName"));

				String subindicatortitle=jsonesubindicator_titleObject.getAsJsonObject().get("subindicatorname").toString().replace("\"", "");
				arrayofelementforvisualgraph.add(subindicatortitle);
			}

			// Product Statistics
			String query_track_ftree_totalvisittime_bydate = 
					"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
							+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
							+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
							+" gev.elementfirstvisittime, "
							+" gev.elementlastvisittime, "
							+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
							+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
							+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
							+" FE.ID="+featureId+" "
							+" GROUP BY firstvisittime,elementfirstvisittime "
							+"	) B GROUP BY B.firstvisitdate ";

			if ((Integer.parseInt(featureId) == 0) && (from !="") && (to!=""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')" 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
			}
			
			// Feature Statistics	
			if((Integer.parseInt(featureId) != 0) && (from == "") && (to == ""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" " 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
			}
			
			if ((Integer.parseInt(featureId) != 0) && (from !="") && (to!=""))
			{
				query_track_ftree_totalvisittime_bydate = 
						"SELECT SUM(B.visitduration) as totalvisitduration,B.firstvisittime as firstvisittime FROM "
								+"(SELECT gev.elementfirstvisittime as firstvisittime, DATE(gev.elementfirstvisittime ) as "
								+"firstvisitdate, SUM(gev.elementvisitcount) as guiVisitCount," 
								+" gev.elementfirstvisittime, "
								+" gev.elementlastvisittime, "
								+" TIME_TO_SEC(TIMEDIFF(gev.elementlastvisittime, gev.elementfirstvisittime))/60 "
								+" as visitduration FROM  gui_element_visit gev, requirement re,guielement ge,feature fe "
								+" WHERE GEV.VISITELEMENTNAME=GE.NAME AND GE.REQUIREMENT_ID=RE.ID AND RE.FEATURE_ID=FE.ID AND "
								+" FE.ID="+featureId+" AND DATE(gev.elementfirstvisittime )>=STR_TO_DATE('"+from+"','%m/%d/%Y') "
								+" and DATE(gev.elementfirstvisittime )<=STR_TO_DATE('"+to+"','%m/%d/%Y')" 
								+" GROUP BY firstvisittime,elementfirstvisittime "
								+"	) B GROUP BY B.firstvisitdate ";
				
			}
			
			ArrayList eVisits_bytotalvisittime = sql.executeDbQuerySelect(query_track_ftree_totalvisittime_bydate); 
			model.addAttribute("eVisits_bytotalvisittime", eVisits_bytotalvisittime);

			for( Object eVisit_bytotalvisittime : eVisits_bytotalvisittime ){
				String jsonevisit=gson.toJson(eVisit_bytotalvisittime);
				JsonParser parser = new JsonParser();
				JsonObject jsonevisitObject = (JsonObject)parser.parse(jsonevisit);   
				logger.info("vElement2PM: "+ jsonevisitObject.getAsJsonObject());//.get("guiElementName"));

				String firstvisittime=jsonevisitObject.getAsJsonObject().get("firstvisittime").toString().replace("\"", "");
				try {
					SimpleDateFormat sdf =  new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
					visitdate = sdf.parse(firstvisittime);

					calendar = Calendar.getInstance();
					calendar.setTime(visitdate);
					year = calendar.get(Calendar.YEAR);
					month=calendar.get(Calendar.MONTH);
					day=calendar.get(Calendar.DAY_OF_MONTH);
					//logger.info("SSDS"+month);
				} 
				catch (ParseException e) {
					e.printStackTrace();
				}

				readingvisitvalue ="[".concat("new Date("+year+","+month+","+day+")").concat(", ").concat(""+jsonevisitObject.getAsJsonObject().get("totalvisitduration").toString()+"]");
				arrayofelementforvisualgraph.add(readingvisitvalue);
			}
		}
		// Graph Code End
		
		String featureIdRspn = "Server Side Rspn:: FID: "+featureId+", SID: "+subIndicatorId+", GT: "+graphType+", FMD: "+from+", TD: "+to;
		return arrayofelementforvisualgraph;
	}

}