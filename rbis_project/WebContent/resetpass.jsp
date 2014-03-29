
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
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        				<h1>Retrieve Password </h1>
				<img class="imgr" src="images/demo/contact.jpg" alt="" width="125"
					height="125" />
				<p>Kerala State Remote Sensing And Environment Centre
				Vikas Bhavan, Thiruvananthapuram-33.</p>
				<p>
					The state of kerala known as <a href="http://en.wikipedia.org/wiki/God's_Own_Country" target="_balank">'God's own country'</a> 
					for it's natural beauty, rich rare medicinal plants, inherited culture and Art.
					Kerala is also known for its overall high performance in
					the literacy and health standards in country. 
				</p>
				<img class="imgl" src="images/demo/imgl.gif" alt="" width="125"
					height="125" />
				<p>
					KRSEC, Vikas Bhavan ,Thiruvananthapuram provides online facility to know about
					the River Basins and water sheds <a href="index.jsp"><strong>River Basin Information system.</strong>
					</a> RBIS is a user friendly software through which you can easily get location of the River Basins of Kerala state.
				</p>
				<p>
					You can give your comments. If you are interested in RBIS 
					than join us,<strong>register yourself on our website.
					</strong> You will get your confirmation of joining on your mail.
				</p>
				<p>If you have any information about River Basins of Kerala State
				that still unknown to us than share with us.If your information is useful for us than we will make
				that available on our website. </p>
				

	<form action="CommonAction?action=resetpassword" method="post" id="regForm">
	
			<table summary="Summary Here" cellpadding="0" cellspacing="0">
		
		<thead>
									<tr>
										<th>Old Password</th>
										<th>New Password</th>
										<th>Confirm</th>
									</tr>
		</thead>
			<tbody>			
		<tr class=<%=str1%>>
		    	<td><input type="password" name="password"  id="password" class="validate[required]" ></td>
				<td><input type="password" name="newpassword" id="newpassword" class="validate[required,minSize[6],maxSize[30]]"></td>
				<td><input type="password" name="rtypassword" id="rtypassword" class="validate[required,equals[newpassword]]"></td>
			</tr>
			<tr class=<%=str%>>
				<td><input type="submit" name="save" value="Save"></td>
				<td><input type="reset" name="clear" value="Clear"></td>
			</tr>
       </tbody>		

		</table>
	</form>
<%-- <table summary="Summary Here" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th>Old Password</th>
										<th>New Password</th>
										<th>Confirm</th>
									</tr>
								</thead>
								<tbody>
									<tr class="light">
										<td><input type="hidden" id="password" name="password" value="<%=password %>">
										<input type="password" name="oldpassword" id="oldpassword" class="validate[required,equals[password]]" /></td>
										<td><input type="password" name="newpassword" id="newpassword"  class="validate[required,minSize[6],maxSize[30]]" /></td>
										<td><input type="password" name="confirm" id="confirm"   class="validate[required,equals[newpassword]]"/></td>
										
										
									</tr>
									<tr class="dark">
										<td><input type="submit" value="submit"></td>
										
										<td><div id="changepassword" ></div></td>
										<td></td>
									</tr>
									
								</tbody>
							</table>
</body>
</html> --%>
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
				<div class="holder">
					<h2>Data Use Policy</h2>
						<p>Information we receive and how it is used
						Learn about the types of information we 
						receive, and how that information is used.</p>
					<ul>
						
						<li>Sharing and finding data </li>
						<li><a href="#">Spatial and non-spatial data</a>
						</li>
					</ul>
					<p>
						Learn about things like local bodies
						 and how information is shared.
						
						</p>
					<p class="readmore">
						<a href="#">Continue Reading &raquo;</a>
					</p>
				</div>      </div>
      <!-- ####################################################################################################### -->
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<%@include file="footer.jsp" %>
