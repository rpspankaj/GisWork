package com.rbis.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rbis.listner.DatabaseConnection;

@WebServlet("/DeleteUser.rbis")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection connection=null;
	ResultSet rs=null;
	PreparedStatement pst=null;
	String qry,s;
	
	String id[]=new String[300];

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		id=request.getParameterValues("users_id");
		connection=DatabaseConnection.getConnection();
		for(int i=0;i<id.length;i++){
			s=id[i];
			System.out.println("id="+s);
			qry="delete from t_usermaster where email_id='"+s+"'";
			try {
				System.out.println("sql=="+qry);
				pst=connection.prepareStatement(qry);
				int n=pst.executeUpdate();
				//pst.addBatch(qry);
				if(n>0)
					System.out.println("Success");
			} catch (SQLException e) {
				System.out.println("=========");
				System.out.println("Exception ="+e);
				
			}
		}
		
	}

}
