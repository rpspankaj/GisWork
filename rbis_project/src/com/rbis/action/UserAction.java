package com.rbis.action;

import java.io.IOException;
import java.net.InetAddress;
//import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.Session;

import com.rbis.common.Security;
import com.rbis.common.Utility;
import com.rbis.model.RbisuserTO;

@WebServlet("/useraction.rbis")
public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		boolean flag = false;
		String action = request.getParameter("action");
		RbisuserTO objRbisuserTO = new RbisuserTO();
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		objRbisuserTO.setUser_name(user_name);
		objRbisuserTO.setPassword(password);
		int role_id = 0;
		if (action.equalsIgnoreCase("save") || action.equalsIgnoreCase("update")) {

			String email_id = request.getParameter("email_id");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String phone = request.getParameter("phone");
			String gender=request.getParameter("gender");
			//String dob=request.getParameter("dob");
			
   
			if (request.getParameter("role_id") != null)
				role_id = Integer.parseInt(request.getParameter("role_id"));

			objRbisuserTO.setAction(action); 
			//objRbisuserTO.setDob(Timestamp.valueOf(dob));
			objRbisuserTO.setEmail_id(email_id);
			objRbisuserTO.setFname(fname);
			objRbisuserTO.setLname(lname);
			objRbisuserTO.setGender(gender);
			objRbisuserTO.setRole_id(role_id);
			objRbisuserTO.setActive_status(1);
			objRbisuserTO.setPhone(phone);
			objRbisuserTO.setCreator_id(1);
			flag = Utility.registration(objRbisuserTO);
			if (flag && action.equalsIgnoreCase("save")){
						response.sendRedirect("userregistration.jsp?sucessreg=Registered Successfully..!!!");
				
			}else if(flag && action.equalsIgnoreCase("update")){
						response.sendRedirect("viewprofile.jsp?sucess=Profile Updated Successfully..!!!");
			}
			else
				response.sendRedirect("userregistration.jsp?sucessreg=Some Exception occurred Contact Your Admin");

		} else if (action.equalsIgnoreCase("list")) {

			flag = Utility.login(objRbisuserTO);
			if (flag) {
				HttpSession session = request.getSession(true);
				Security.setId(session.getId());
				Security.setIp_address(request.getRemoteAddr().toString());
				//Security.setUser_name(objRbisuserTO.getUser_name());
				session.setAttribute("currentUser", Security.getUser_name());
				session.setAttribute("role",Security.getRole_id());
				role_id=Security.getRole_id();
				session.setAttribute("password", Security.getPassword());
				session.setAttribute("email", Security.getEmail());
				session.setAttribute("name", Security.getFname() + " "
						+ Security.getLname());
				session.setAttribute("phone",Security.getPhone());
				session.setAttribute("fname",Security.getFname());
				session.setAttribute("lname",Security.getLname());
				session.setAttribute("gender",Security.getGender());
				Utility.logindetail();
				if(role_id==1){
					response.sendRedirect("mainbody.jsp?sucess");
				}
				else{
					response.sendRedirect("userlogin.jsp?sucess");
				}
			}

			else
				response.sendRedirect("forgotpassword.jsp?message_error=The username or password you entered is incorrect.");

		} else if (action.equalsIgnoreCase("logout")) {
			Utility.logout();
			HttpSession session = request.getSession(true);

			session.removeAttribute("currentUser");
			session.removeAttribute("password");
			session.removeAttribute("email");
			session.removeAttribute("name");

			session.invalidate();
			response.sendRedirect("index.jsp");
		}

	}
}
