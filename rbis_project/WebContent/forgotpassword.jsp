<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>
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
String str="light";
String str1="dark";
%>

<div class="wrapper row3">

  <div class="rnd">
  <div align="center" style="color: red">
  
  <%if(request.getParameter("message_error")!=null){ %>
  			<%=request.getParameter("message_error")%>
  		<%} %></div>
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        				<h1>Retrieve Password </h1> 

				<img class="imgl" src="images/demo/imgl.gif" alt="" width="125"
					height="125" />
				<p>
					KRSEC, Vikas Bhavan ,Thiruvananthapuram provides online facility to know about
					the River Basins and water sheds <a href="index.jsp"><strong>River Basin Information system.</strong>
					</a> RBIS is a user friendly software through which you can easily get location of the River Basins of Kerala state.
				</p>
				
        
        
        <form action="CommonAction?action=forgotpassword" method="post" id="regForm">
							<table summary="Summary Here" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th>Email</th>
										<th>Value</th>
									</tr>
								</thead>
								<tbody>
									<tr class="<%=str%>">
										<td>Enter your email</td>
										<td><input type="text" name="email" id="email" size="30" class="validate[required,validate[custom[email]]]" />
										</td>
										
									</tr>
									<tr class="<%=str1%>">
										<td><input type="submit" value="submit"></td>
										<td></td>
										<%-- <td><div id="retrievePassword" ><%=message %></div></td> --%>
										
									</tr>
									
								</tbody>
							</table>
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
<%@include file="footer.jsp" %>
