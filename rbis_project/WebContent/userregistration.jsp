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
<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<div class="rnd">
			<div id="container" class="clear">
				<%if(request.getAttribute("sucessreg")!=null){ %>
					<%=request.getAttribute("sucessreg") %>
				<%} %>
				<!-- ####################################################################################################### -->
				<div id="portfolio">
					<ul>
						<li><img src="images/demo/rivermap.jpg" width="300" height="700" />
							<h2>Metridiculis conseque quis</h2>
							<p>Orciinterdum condimenterdum nullamcorper elit nam
								curabitur laoreet met praesenean et iaculum. Metridiculis
								conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
							<p class="readmore">
								<a href="#">Read More Here &raquo;</a>
							</p></li>
						<li class="last"><form action="useraction.rbis?action=save" id="regForm"
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
											<td><input type="password" id="password" name="password" class="validate[required]"></td>
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
														<%while(rs.next()){ %>
														<option value="<%=rs.getInt("role_autoid")%>"><%=rs.getString("role_name")%></option>
														<%}
														connection.close();
														%>
													</select>
											
											</td>
										</tr>

										<tr>
											<td>Email Id <span style="color: red">*</span> </td>
											<td><input type="text"  name="email_id" id="email_id" class="validate[required,email]"></td>
										</tr>
										<!-- <tr>
											<td>DOB <span style="color: red">*</span></td>
											<td><input type="date" name="dob"></td>
										</tr> -->
										<tr>
											<td>Phone<span style="color: red">*</span></td>
											<td><input type="text" name="phone" ></td>
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
							</form></li>
						<li></li>
					</ul>
				</div>
				<!-- ####################################################################################################### -->
			</div>
		</div>
	</div>
</body>

</html>
 --%>
 <div class="wrapper row3">

  <div class="rnd">
  <div align="center" style="color: red">
<%if(request.getParameter("sucessreg")!=null){ %>
					<%=request.getParameter("sucessreg") %>
				<%} %></div>
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        
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
											<td><input type="password" id="password" name="password" class="validate[required]"></td>
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
														<%while(rs.next()){ %>
														<option value="<%=rs.getInt("role_autoid")%>"><%=rs.getString("role_name")%></option>
														<%}
														connection.close();
														%>
													</select>
											
											</td>
										</tr>

										<tr>
											<td>Email Id <span style="color: red">*</span> </td>
											<td><input type="text"  name="email_id" id="email_id" class="validate[required,email]"></td>
										</tr>
										<!-- <tr>
											<td>DOB <span style="color: red">*</span></td>
											<td><input type="date" name="dob"></td>
										</tr> -->
										<tr>
											<td>Phone<span style="color: red">*</span></td>
											<td><input type="text" name="phone" ></td>
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
							<p class="imgholder">
								<img src="images/demo/240x90.gif" alt="" />
							</p>
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