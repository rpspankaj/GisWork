<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<title>RBIS|GIS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />

<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="scripts/jquery.tabs.setup.js"></script>
<script>
	history.forward();
</script>
</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="index.jsp">River Basin Information System</a></h1>
      </div>
    <div class="fl_right">
      
      <form method="post" action="useraction.rbis?action=list">
		
		 <fieldset><strong>&nbsp;UserName</strong>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<strong>Password</strong></fieldset>
		 <fieldset>	
				<input type="text" name="user_name" id="user_name" size="25"/>
				<input type="password" name="password" id="password" size="25" />
				<input type="submit" value="Sign In" id="submit" />
			
		 </fieldset>
	<fieldset>
	<font color="white"><input type="checkbox" checked><strong>Remember Me</strong>
	<a href="forgotpassword.jsp"><strong>&emsp;&nbsp;&nbsp;&nbsp;Forgot Password</strong></a></font>
	</fieldset>
	</form>
	   </div>
  </div>
</div>
</body>