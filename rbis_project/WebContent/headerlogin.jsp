<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<html >
<head >
<title>RBIS|GIS</title>

<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />

<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="scripts/jquery.tabs.setup.js"></script>

</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="mainbody.jsp">River Basin Information System</a></h1>
      </div>
    <div class="fl_right">
      
      <form method="post" action="useraction.rbis?action=logout">
		
		 <fieldset>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</fieldset>
		 <fieldset>	
			<h4 style="color: white;">
			<%if(session.getAttribute("currentUser")!=null){ %>
				<strong>Welcome&emsp;</strong><%=session.getAttribute("name") %>
				&emsp;&emsp;<a href="#" ><button type="submit">Sign Out</button></a></h4>
			<%} %>
		 </fieldset>
	
	</form>
    </div>
  </div>
</div>
</body>
</html>