package com.rbis.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
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

@WebServlet("/UpdateInformation.rbis")
public class UpdateInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection connection = null;
	PreparedStatement pst;
	ResultSet rs;
	String qry;
	String nop;
	String ownership;
	String address;
	String localbody;
	String area;
	String photo;
	int i=0;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { connection = DatabaseConnection.getConnection();
    nop = request.getParameter("nop");
    ownership = request.getParameter("ownership");
    address = request.getParameter("address");
    localbody = request.getParameter("localbody");
    area = request.getParameter("area");
    //x = Integer.parseInt(request.getParameter("flag"));
    try
    {
      qry = "insert into t_riveravailabledata(nameofplace,address,ownership,localbody,area,flag) values(?,?,?,?,?,?)";
      pst = connection.prepareStatement(qry);
      pst.setString(1, nop);
      pst.setString(2, address);
      pst.setString(3, ownership);
      pst.setString(4, localbody);
      pst.setString(5, area);
      pst.setInt(6, 1);

      i = pst.executeUpdate();
      if (i > 0) {
        request.setAttribute("success", "Dataupdated succefully");
        response.sendRedirect("updateInformationAdmin.jsp?Success");
      }
    } catch (SQLException e) { response.sendRedirect("updateInformationAdmin.jsp?exception=The localbody information already exists");

      e.printStackTrace();
    }
  }
}