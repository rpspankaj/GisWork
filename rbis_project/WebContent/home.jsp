<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@include file="headerlogin.jsp"%>
	<%@include file="adminmenu.jsp"%>
<html>
<head>
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript">
      history.forward();
        
    </script>
</head>

<body >
	

	

	

	<div class="wrapper col3">
		<div id="container">
			<div id="content"><b>Available Sport facilities</b>
			
				<%@include file="newOverlayes.html"%>
			</div>


			<div id="column">
				<div class="subnav">
				<h1>Welcome To The GEOSSIS</h1>
			
				<img src="images/sport.gif" alt="" height="250px" width="250px"/>
				<p>By clicking on the overlays you can get the entire 
				details of that region.</p>
				<p><a href="addInformationUser.jsp" target="_blank"><input name="update" type="button" id="update" value="Add New Information" tabindex="5"></a></p>
			</div>
		</div>
		</div>
	</div>
</body>
</html>
<%-- <%@include file="/footer.jsp"%> --%>