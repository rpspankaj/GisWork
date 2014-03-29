package com.rbis.listner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener{
			static private Connection connection;
	
	public static Connection getConnection(){
		return connection;
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
		try {
			connection.commit();
			connection.close();
		} catch (SQLException e) {
			
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent conetextListener) {
		ServletContext sc = conetextListener.getServletContext();
		String driver = sc.getInitParameter("driver");
		String url = sc.getInitParameter("url");
		String db = sc.getInitParameter("db");
		String user = sc.getInitParameter("user");
		String dbPwd = sc.getInitParameter("password");
		System.out.println(driver);
		try {
			Class.forName(driver);
			System.out.println("driver loaded"+url+db+user+dbPwd);			
			connection = DriverManager.getConnection(url+db	, user, dbPwd);
			System.out.println("connected");
			
			sc.setAttribute("con", connection);
			
		} catch (ClassNotFoundException e) {
			
		} catch (SQLException e) {
			
		}
		
	}
	public static void main(String []args){
		System.out.println(getConnection());
	}
}
