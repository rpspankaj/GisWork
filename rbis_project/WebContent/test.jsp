
<%@ include file="headerlogin.jsp" %>
<%@ include file="adminmenu.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="styles/logout.css" type="text/css" />
<script>
history.forward();
</script>

</head>

<body>


	<div class="wrapper col3">

		<div id="content">
			<strong>Available Sport facilities</strong>

			<%@include file="newOverlayes.html"%>
		</div>


		<div id="column">
			<div class="subnav">
				<h1>Welcome To The GEOSSIS</h1>

				<img src="images/sport.gif" alt="" height="250px" width="250px" />
				<p>By clicking on the overlays you can get the entire details of
					that region.</p>
				<div id="response">

					<p>
						<a href="updateInformation.jsp" target="_blank"><input
							name="update" type="button" id="update"
							value="Add New Information" tabindex="5"></a>
					</p>
					<p>
						<a href="deleteInformation.jsp" target="_blank"><input
							name="deleteInformation" type="button" id="deleteInformation"
							value="Delete Information" tabindex="5"></a>
					</p>
					<p>
						<a href="adminPasswordChange.jsp" target="_blank"><input
							name="passwordChange" type="button" id="passwordChange"
							value="Change Password" tabindex="5"></a>
					</p>
					<p>
						<a href="deleteComment.jsp" target="_blank"><input
							name="deleteComments" type="button" id="deleteComments"
							value="View Comments" tabindex="5"></a>
					</p>
					<p>
						<a href="deleteUser.jsp" target="_blank"><input
							name="deleteUser" type="button" id="deleteUser"
							value="View Users" tabindex="5"></a>
					</p>

				</div>
			</div>
			<div id="respond"></div>
		</div>

	</div>
</body>
</html>
<%@include file="/footer.jsp"%>