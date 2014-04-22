<%@page import="com.rbis.common.Security"%>
<%@page import="com.rbis.listner.DatabaseConnection"%>
<%@page import="com.rbis.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="headerlogin.jsp"%>
<%@ include file="adminmenu.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<script type="text/javascript" src="scripts/temp/jquery-1.7.1.min.js"></script>
<link href="scripts/temp/validationEngine.jquery.css" rel="stylesheet"
	type="text/css" />
<script src="scripts/temp/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8"></script>
<script src="scripts/temp/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8"></script>


<script>
	$(document).ready(function() {
		$("#regForm").validationEngine();
	});
</script>
<div class="wrapper row3">

	<div class="rnd">
		<div align="center" style="color: red">
			<%
				if (request.getParameter("sucessreg") != null) {
			%>
			<%=request.getParameter("sucessreg")%>
			<%
				}
			%>
		</div>
		<div id="container" class="clear">
			<!-- ####################################################################################################### -->
			<div id="content">
				<h1>
					<font color=#02ACEE>Edit Profile</font>
				</h1>
				<form action="useraction.rbis?action=update" method="post"
					id="regForm">

					<fieldset>
						<legend>Registration Info:</legend>
						<table bgcolor="#06213F" style="font: medium; color: white">
							<tr>
								<td>User name:</td>
								<td><input type="text" name="user_name"
									value="<%=session.getAttribute("currentUser")%>"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="password" name="password" id="password"
									class="validate[required]"></td>
							</tr>
							<tr>

								<td>Role Id</td>
								<td><input type="text" name="role_id" id="role"
									value="<%=session.getAttribute("role")%>" readonly="readonly">
								</td>
							</tr>

							<tr>
								<td>Email Id</td>
								<td><input type="text" name="email_id"
									value="<%=session.getAttribute("email")%>" readonly="readonly"></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td> <select
									name="gender" id="gender"
									class="validate[required,maxSize[30]] ">
										<option value="<%=session.getAttribute("gender")%>" selected><%=session.getAttribute("gender")%></option>
										<%if(session.getAttribute("gender").toString().equalsIgnoreCase("male")){ %> 
										 <option value="female" >female</option>
										 <%}else{ %>
										 <option value="male" >male</option>
										 <%} %>
								</select></td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><input type="text" name="phone"
									value="<%=session.getAttribute("phone")%>"></td>
							</tr>
							<tr>
								<td>First Name</td>
								<td><input type="text" name="fname"
									value="<%=session.getAttribute("fname")%>"></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text" name="lname"
									value="<%=session.getAttribute("lname")%>"></td>
							</tr>
							<tr>
								<td><input type="submit" name="submit" value="update"></td>
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
							<h2>Aim Of RBIS</h2> <img src="images/demo/Waterfall_stream.gif"
							height="200" width="240" />

							<p>The Project aim is to develop an online web application
								that complete information of RiverBasins and help to plan
								welfare projects in the state.</p>
							<p class="readmore">
								<a href="#">Continue Reading &raquo;</a>
							</p>
						</li>
					</ul>
				</div>

			</div>

			<!-- ####################################################################################################### -->
			<!-- ####################################################################################################### -->
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>
