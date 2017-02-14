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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LinkSaveController extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(LinkSaveController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/linksave", method = RequestMethod.GET)
	public String linksave(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		logger.info("Welcome linksave! the client locale is "+ locale.toString());
		
		String txtTuna=request.getParameter("txtTuna");
		
		String query = "INSERT INTO test(test) VALUES ('"+ txtTuna +"')";
		
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost:3306/test";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
		    Connection con=  (Connection) DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			int i = stmt.executeUpdate(query);
			stmt.close();
			con.close();
			
			model.addAttribute("adddatabase", "Successfully Saved");
			return "linksave";
		}
		catch (Exception e) {
			model.addAttribute("adddatabase", e.getMessage().toString());
			return "linksave";
		}
	}
}
