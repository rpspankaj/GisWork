package com.rbis.listner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DatabaseConnection  {
	
	
	private static Connection connection=null;
	
	
	
	
	
public static Connection getConnection(){
		try {
			Class.forName("org.postgresql.Driver");
			connection=DriverManager.getConnection("jdbc:postgresql://localhost:54321/db_rbis","postgres","password");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
	}
	
public static void main(String []args){
	System.out.println(getConnection());
}

}
