package com.rbis.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rbis.common.Security;
import com.rbis.common.Utility;


@WebServlet("/CommonAction")
public class CommonAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean flag=false;
		String action=request.getParameter("action");
		String password=request.getParameter("password");
		String newpassword=request.getParameter("newpassword");
		String rtypassword=request.getParameter("rtypassword");
		String email=request.getParameter("email");
	
		if(action.equalsIgnoreCase("resetpassword")){
			
		if(Security.getPassword().equals(password) && newpassword.equals(rtypassword)){
			
			flag=Utility.resetPass(newpassword);
			
		}
		if(flag){
			response.sendRedirect("resetpass.jsp?resetpass=your password has been changed successfully!!!");
			//response.sendRedirect("adminforgotpass.jsp?success=your password has been send to your mail !!!");
			
		}
		else{
			response.sendRedirect("resetpass.jsp?resetpass=Some Error Occured Contact Admin !!!");
		}
			
			
			
			
			
		}
		else if(action.equalsIgnoreCase("forgotpassword")){
			flag=Utility.forgot(email);
			if(flag){
				response.sendRedirect("forgotpassword.jsp?forgotpass=Your Password has been Send to your Mail check your Inbox !!!");
			}
			else{
				response.sendRedirect("forgotpassword.jsp?forgotpass=Some Error Occured Contact Admin !!!");
			}
		}
			
			
			
		}
		
		
}


