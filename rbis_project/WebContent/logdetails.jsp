<%@page import="com.rbis.common.Security"%>
 <%@page import="com.rbis.listner.DatabaseConnection"%>
<%@page import="com.rbis.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="headerlogin.jsp"%>
<%@ include file="adminmenu.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<body>
<% 
Connection connection;
PreparedStatement pst=null;
ResultSet rs= null;
int i=0,role=0,isLoggedIn=0;
String session_id="",ip_address="",login_time="",logout_time="",str="";
String query="select session_id,ip_address,login_time,logout_time,is_loggedin from t_userlogdetail";
connection=DatabaseConnection.getConnection();
pst=connection.prepareStatement(query);
rs=pst.executeQuery();

%>
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
		
		 <h2> <font color=#02ACEE>LOG DETAILS</font></h2>
        <table summary="Summary Here" cellpadding="0" cellspacing="0">
          <thead>
            <tr>
              <th>Serial</th>
              <th>Session id</th>
              <th>Ip Address</th>
              <th>Login time</th>
              <th>Logout time</th>
              <th>Logged In</th>	
            </tr>
          </thead>
          <tbody>
          <% 
             while(rs.next()){
            	 session_id=rs.getString("session_id");
            	 ip_address=rs.getString("ip_address");
            	 login_time=rs.getString("login_time");
            	 logout_time=rs.getString("logout_time");
            	 isLoggedIn=rs.getInt("is_loggedin");
            	 if(i%2==0)
     				str="light";
     			else
     				str="dark";
     			i++;
     			 
          %>
            <tr class="<%=str%>">
                    <td ><%=i %></td>
					<td><%=session_id %></td>
					<td ><%=ip_address%></td>
					<td ><%=login_time%></td>
					<td ><%=logout_time%></td>
					<td ><%=isLoggedIn%></td>
			 </tr>
			 <%} %>
          </tbody>
        </table> 
     </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp"%>
