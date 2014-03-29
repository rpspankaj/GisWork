<div class="wrapper row2">
  <div class="rnd">
    
    <div id="topnav">
      <ul>
        <li class="active"><a href="mainbody.jsp">Home</a></li>
        <li><a href="viewprofile.jsp">Profile setting</a></li>
        <li><a href="resetpass.jsp">Change password</a></li>
        <!-- <li><a href="newOverlayes.html">Layer preview</a></li> -->
        <li><a href="updateInformationUser.jsp">Add Information</a></li>
        <li><a href="contactus.jsp">Feedback</a></li>
      </ul>
    </div>
   
  </div>
</div>

<%
		if (session.getAttribute("currentUser") == null) {
			response.sendRedirect("index.jsp");
		}
	%>