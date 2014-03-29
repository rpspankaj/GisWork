package com.rbis.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.rbis.common.Utility;
import com.rbis.model.RbisFeedbackTO;


@WebServlet("/FeedbackAction.rbis")
public class FeedbackAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		PrintWriter out =response.getWriter();
    		boolean flag=false;
    		
    		String emailid=request.getParameter("emailid");
    		String name=request.getParameter("name");
    		String phone=request.getParameter("phone");
    		String subject=request.getParameter("subject");
    		String feedback=request.getParameter("feedback");
    		String action=request.getParameter("action");
    		 
    		String cmnt="";
    		if(action.equalsIgnoreCase("postfeedback")){
    			RbisFeedbackTO objRbisFeedbackTO=new RbisFeedbackTO();
        		objRbisFeedbackTO.setEmailid(emailid);
        		objRbisFeedbackTO.setFeedback(feedback);
        		objRbisFeedbackTO.setName(name);
        		objRbisFeedbackTO.setPhone(phone);
        		objRbisFeedbackTO.setSubject(subject);
        		       flag=Utility.feedback(objRbisFeedbackTO);
        			if(flag)
        				response.sendRedirect("contactus.jsp?success");
        			else
        				response.sendRedirect("contactus.jsp?failure");
        		
    		
    		}
    		
    	else if(action.equalsIgnoreCase("rcvfeedback")){
    			
    			ArrayList<RbisFeedbackTO> al= Utility.contactus();
    			
    			int i=0;
    			for(RbisFeedbackTO obj:al){
    				if(i%2==0)
    					cmnt="comment_odd";
    				else
    					cmnt="comment_even";
    				out.print("<li class="+cmnt+"><div class=author><img class=avatar src=images\\demo\\avatar.gif width=32 height=32  /><span class=name><a href=#>"
    				+obj.getName()+"</a></span> <span class=wrote>wrote:</span></div>"+
    				"  <div class=submitdate><a href=#>"+obj.getFeedbackDate()+"</a></div>"
    				+"  <p>"+obj.getFeedback()+"</p> </li>");
    				i++;
    			}
    		
    		/*while (rs.next()) {
                    System.out.println("values exist");
                   String field = rs.getString(1);
                   // System.out.println("working");
                   System.out.println(field);
                   JSONObject layerInfo = new JSONObject();
                   layerInfo.put("Field", rs.getString(1));
                   array.add(layerInfo);
               }
               JSONObject jObjDevice = new JSONObject();
               jObjDevice.put("device", array);
               JSONObject jObjDeviceList = new JSONObject();
               jObjDeviceList.put("devicelist", jObjDevice);

               out.println(jObjDevice.toString());
           } finally {            
               out.close();
           }*/
    			
    			
    		}
    		
    	}
}
