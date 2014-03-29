<div class="wrapper row2">
  <div class="rnd">
    
    <div id="topnav">
      <ul>
        <li class="active"><a href="mainbody.jsp">Home</a></li>
        <li><a href="viewprofile.jsp">Profile setting</a></li>
        <li><a href="userdetailjsp.jsp">User setting</a></li>
        <li><a href="deleteComments.jsp">Feedback setting</a></li>
        <li><a href="updateInformationAdmin.jsp">Add Information</a></li>
        <li><a href="logdetails.jsp">Log Details</a></li>
      </ul>
    </div>
   
  </div>
</div>
<%
		if (session.getAttribute("currentUser") == null) {
			response.sendRedirect("index.jsp");
		}
	%>