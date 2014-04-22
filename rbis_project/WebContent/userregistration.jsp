<%@page import="com.rbis.listner.DatabaseConnection"%>
<%@page import="com.rbis.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<script type="text/javascript" src="scripts/temp/jquery-1.7.1.min.js"></script>
<link href="scripts/temp/validationEngine.jquery.css"
	rel="stylesheet" type="text/css" />
<script src="scripts/temp/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<script src="scripts/temp/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>

<script>
	$(document).ready(function() {
		$("#regForm").validationEngine();
	});
</script>

<%
	Connection connection=null;
		connection=DatabaseConnection.getConnection();	
		//connection=DatabaseConnection.getConnection();
		String query="select * from vwt_rolemasteruserlist";
		PreparedStatement pst=null;
		ResultSet rs=null;
		pst=connection.prepareStatement(query);
		rs=pst.executeQuery();
			
%>

 <div class="wrapper row3">

  <div class="rnd">
  <div align="center" style="color: red">
<%if(request.getParameter("sucessreg")!=null){ %>
					<%=request.getParameter("sucessreg") %>
				<%} %></div>
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        <font color=#02ACEE ><h1>User Registration</h1></font>
        <form action="useraction.rbis?action=save" id="regForm"
								method="post">

								<fieldset>
									<legend>Registration Info:</legend>
									<table bgcolor="#06213F" style="font: medium; color: white">
										<tr>
											<td>User name <span style="color: red">*</span></td>
											<td><input type="text" id="user_name" name="user_name" class="validate[required,custom[onlyLetterSp],minSize[6]] "></td>
										</tr>
										<tr>
											<td>Password <span style="color: red">*</span> </td>
											<td><input type="password" id="password" name="password" class="validate[required]">
											<input type="hidden" name="outside" value="<%=1%>"></td>
										</tr>
										
									   <tr  >
									        <td>Gender <span style="color:red">*</span>
									        </td>
											<td><input type="radio" name="gender" value="male" checked />Male <input
													type="radio" name="gender" value="female" />Female
									<div id="genderError" class="red"></div>
											</td>
										</tr>
										
										<tr>

											<td>Role <span style="color: red">*</span> </td>
											<td>
													<select name="role_id">
														<%-- <%while(rs.next()){ %> --%>
														<option value="<%-- <%=rs.getInt("role_autoid")%> --%>2"><%-- <%=rs.getString("role_name")%> --%> User</option>
														
													</select>
											
											</td>
										</tr>

										<tr>
											<td>Email Id <span style="color: red">*</span> </td>
											<td><input type="text"  name="email_id" id="email_id" class="validate[required,custom[email]]"></td>
										</tr>
										<!-- <tr>
											<td>DOB <span style="color: red">*</span></td>
											<td><input type="date" name="dob"></td>
										</tr> -->
										<tr>
											<td>Phone<span style="color: red">*</span></td>
											<td><input type="text" name="phone" id="phone" class="validate[required,custom[phone],minSize[10],maxSize[12]]"></td>
										</tr>
										<tr>
											<td>First Name</td>
											<td><input type="text" name="fname" id="fname" class="validate[required,custom[onlyLetterSp],minSize[6]] "></td>
										</tr>
										<tr>
											<td>Last Name</td>
											<td><input type="text" name="lname" id="lname" class="validate[required,custom[onlyLetterSp],minSize[6]] "></td>
										</tr>
										<tr>
											<td><input type="submit" name="submit" value="Register"></td>
											<td><input type="reset" name="reset"></td>
										</tr>


									</table>
								</fieldset>
							</form>
							
				        

      </div>
       <div id="column">
        	<div id="featured">
					<ul>
						<li>
							<h2>Aim Of RBIS</h2>
							
								<img src="images/demo/Waterfall_stream.gif" height="200" width="240" />
						
							<p>The Project aim is to develop an online web 
							application that complete information of RiverBasins 
							and help to plan welfare projects 
							in the state.</p>
							<p class="readmore">
								<a href="#">Continue Reading &raquo;</a>
							</p></li>
					</ul>
				</div>
				 
		    </div>
		    
      <!-- ####################################################################################################### -->
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>

 
 <%@ include file="footer.jsp"%>