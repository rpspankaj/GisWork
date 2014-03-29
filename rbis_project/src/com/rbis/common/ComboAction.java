package com.rbis.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rbis.model.RbisuserTO;


@WebServlet("/ComboAction.rbis")
public class ComboAction extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Security.setRequest(request);
	}
	public static void combolist(){
		HttpServletRequest request = Security.getRequest();
		ArrayList<RbisuserTO> al=Utility.rolecombo();
		Map<String, String> rolelist = new HashMap<String, String>();
		for(RbisuserTO o:al){
			rolelist.put("roleid",String.valueOf(o.getRole_id()));
			
			rolelist.put("rolename",o.getRole_name());
		}
			request.setAttribute("rolelist", rolelist); 
	}
	

}
