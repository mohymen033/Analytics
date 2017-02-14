package com.thesis.featuretree;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DbController {
	
	private static final Logger logger = LoggerFactory.getLogger(DbController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	public String executeDbQuerySave(String query){
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost:3306/feature_tree";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");

			Connection con=  DriverManager.getConnection(url, username, password);
			Statement stmt = con.createStatement();
			stmt.executeUpdate(query);
			stmt.close();
			con.close();
			
			String saveMsg = "success";
			return saveMsg;
		}
		catch (Exception e) {
			return e.getMessage().toString();
		}
	}
	
	public ArrayList executeDbQuerySelect(String query){
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost:3306/feature_tree";
		ArrayList records = new ArrayList();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");

			Connection con	=  DriverManager.getConnection(url, username, password);
			Statement stmt 	= con.createStatement();
			ResultSet rs 	= stmt.executeQuery(query);
			ResultSetMetaData metadata = rs.getMetaData();
            int columns 	= metadata.getColumnCount();
            
            while (rs.next()){
                HashMap row = new HashMap();
                records.add(row);
                for(int i=1; i<=columns; i++){
                    row.put(metadata.getColumnName(i), rs.getObject(i));
                }
            }
        	
			stmt.close();
			con.close();
			rs.close();
		}
		catch (Exception e) {
			e.getMessage().toString();
		}
		
		return records;
	}
	
	public int executeDbQueryResult(String query, String db_field){
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost:3306/feature_tree";
		//ArrayList records = new ArrayList();
		ResultSet rs=null;
		 int id=-1;
		try{
			Class.forName("com.mysql.jdbc.Driver");

			Connection con	=  DriverManager.getConnection(url, username, password);
			Statement stmt 	= con.createStatement();
			rs 	= stmt.executeQuery(query);
			
			while (rs.next()) {
                // Read values using column name
                id = rs.getInt(db_field);
                
                 
                //System.out.printf("%s. %s, %s, %d, %f\n", id, title, publisher, year, price);
            }
        
	        
			stmt.close();
			con.close();
			rs.close();
		}
		catch (Exception e) {
			e.getMessage().toString();
		}
		
		return id;
	 }
}





