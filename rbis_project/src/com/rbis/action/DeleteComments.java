package com.rbis.action;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rbis.listner.DatabaseConnection;

import java.sql.*;


@WebServlet("/DeleteComments.rbis")
public class DeleteComments extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	String id[]=new String[300];
	
	Connection connection=null;
	ResultSet rs=null;
	PreparedStatement pst=null;
	String qry,s;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		id=request.getParameterValues("comment_id");
		
		connection=DatabaseConnection.getConnection();
		
		
		for(int i=0;i<id.length;i++){
			if(i==0)
				s="'"+id[i]+"'";
			else
				s=s+",'"+id[i]+"'";
			//System.out.println(s);
			
			
		}
		qry="delete from t_feedback where feedback_autoid in("+s+")";
		try {
			
			pst=connection.prepareStatement(qry);
			//pst.setString(1, s);
			int n=pst.executeUpdate();
			//System.out.println(pst);
			//pst.addBatch(qry);
			if(n>0){
				System.out.println("Success");
			
				out.print(n+" Comments deleted");
			}
		} catch (SQLException e) {
			System.out.println("=========");
			System.out.println("Exception ="+e);
			e.printStackTrace();
		}
		
				
	}

}
