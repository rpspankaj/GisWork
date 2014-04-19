<%@page import="com.rbis.common.Security"%>
<%@page import="com.rbis.listner.DatabaseConnection"%>
<%@page import="com.rbis.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ include file="headerlogin.jsp"%>
<%@ include file="adminmenu.jsp"%>
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



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<div class="rnd">
			<div id="container" class="clear">
				
				<div id="portfolio">
					<ul>
						<!-- <li><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li class="last"><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>-->

						<li><img src="images/demo/rivermap.jpg" alt="" />
							<h2>Metridiculis conseque quis</h2>
							<p>Orciinterdum condimenterdum nullamcorper elit nam
								curabitur laoreet met praesenean et iaculum. Metridiculis
								conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
							<p class="readmore">
								<a href="#">Read More Here &raquo;</a>
							</p></li>
						<li class="last"><form action="useraction.rbis?action=update" method="post" id="regForm">

								<fieldset>
									<legend>Registration Info:</legend>
					                <table bgcolor="#06213F" style="font: medium; color: white">
										<tr>
											<td>User name:</td>
											<td><input type="text" name="user_name" value="<%=session.getAttribute("currentUser")%>" readonly="readonly"></td>
										</tr>
										<tr>
											<td>Password:</td>
											<td><input type="password" name="password" id="password" class="validate[required]" ></td>
										</tr>
										<tr>

											<td>Role Id</td>
											<td>
													<input type="text" name="role" id="role" value="<%=session.getAttribute("role")%>">												
											</td>
										</tr>

										<tr>
											<td>Email Id</td>
											<td><input type="text" name="email_id" value="<%=session.getAttribute("email")%>" readonly="readonly"></td>
										</tr>
									    <tr>
											<td>Gender</td>
											<td><input type="text" name="gender" value="<%=session.getAttribute("gender")%>"></td>
										</tr> 
										<tr>
											<td>Phone</td>
											<td><input type="text" name="phone" value="<%=session.getAttribute("phone") %>"></td>
										</tr>
										<tr>
											<td>First Name</td>
											<td><input type="text" name="fname" value="<%=session.getAttribute("fname") %>"></td>
										</tr>
										<tr>
											<td>Last Name</td>
											<td><input type="text" name="lname" value="<%=session.getAttribute("lname") %>"></td>
										</tr>
										<tr>
											<td><input type="submit" name="submit" value="update"></td>
											<td><input type="reset" name="reset"></td>
										</tr>


									</table>
								</fieldset>
							</form></li>
						<li></li>
					</ul>
				</div>
				<!-- ####################################################################################################### -->
				<div class="pagination">
					<ul>
						<li class="prev"><a href="#">&laquo; Previous</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li class="splitter">&hellip;</li>
						<li><a href="#">6</a></li>
						<li class="current">7</li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li class="splitter">&hellip;</li>
						<li><a href="#">14</a></li>
						<li><a href="#">15</a></li>
						<li class="next"><a href="#">Next &raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
<%@ include file="footer.jsp"%>
