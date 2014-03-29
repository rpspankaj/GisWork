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
int i=0,role=0;
String name="",email="",gender="",str="";
String query="select user_name,email_id,role_id,gender from t_usermaster";
connection=DatabaseConnection.getConnection();
pst=connection.prepareStatement(query);
rs=pst.executeQuery();

%>
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
		
		 <h2>Table(s)</h2>
        <table summary="Summary Here" cellpadding="0" cellspacing="0">
          <thead>
            <tr>
              <th>Serial</th>
              <th>Name</th>
              <th>Email</th>
              <th>Role</th>
              <th>Gender</th>
             	
            </tr>
          </thead>
          <tbody>
          <% 
             while(rs.next()){
            	 name=rs.getString("user_name");
            	 email=rs.getString("email_id");
            	 role=rs.getInt("role_id");
            	 gender=rs.getString("gender");
            	 if(i%2==0)
     				str="light";
     			else
     				str="dark";
     			i++;
     			 
          %>
            <tr class="<%=str%>">
                    <td ><%=i %></td>
					<td><%=name %></td>
					<td ><%=email%></td>
					<td ><%=role%></td>
					<td><%=gender%></td>
			 </tr>
			 <%} %>
          </tbody>
        </table> 
     </div>
  </div>
</div>
</body>
<%@ include file="footer.jsp"%>
