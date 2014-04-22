<%@include file="headerlogin.jsp"%>
<%@include file="adminmenu.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="com.rbis.listner.*"%>


<html>
<head>
<script type="text/javascript">
	function deleteuser() {
		if (confirm("Are You Sure")) {
			var url = "DeleteUser.rbis?p=12";

			var xmlhttp;
			var checked_users = document.getElementsByName("alluser");
			alert(checked_users.length);
			var length = checked_users.length;
			for (var i = 0; i < length; ++i) {
				if (checked_users[i].checked == true) {
					url = url + "&users_id=" + checked_users[i].id;
				}
			}
			alert(url);

			try {
				xmlhttp = new XMLHttpRequest();
			} catch (e) {
				try {
					xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						alert("Your browser does not support AJAX!");
						return false;
					}
				}
			}

			//var url='DeleteComments?id='+chkbox;
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4)
						location.reload(true);

			};
			xmlhttp.open("Post", url, true);
			
			xmlhttp.send(null);
		}
	}
</script>

<script language="JavaScript">
	function toggle(source) {
		//return confirm("Are you sure want to select all to delete");
		checkboxes = document.getElementsByName('alluser');
		for ( var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>

</head>
<body>

	<%
		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String qry;
		String username;
		String email;

		String phone;
		String name;
		String role;
		String creationDate;
		String modifiedDate;
		String str;
		int i = 0;
	%>
	
	<%
		qry = "select t_usermaster.user_name,t_rolemasteruser.role_name,t_usermaster.fname,t_usermaster.lname,t_usermaster.email_id,t_usermaster.phone,t_usermaster.creation_date,t_usermaster.modified_date from t_usermaster,t_rolemasteruser where  t_usermaster.role_id=t_rolemasteruser.role_autoid;";
		connection = DatabaseConnection.getConnection();
		pst = connection.prepareStatement(qry);
		rs = pst.executeQuery();
	%>

	<div class="wrapper row3">
		<div class="rnd" >
			<div id="container" class="clear" >
				<h1><font color=#02ACEE >Registered Users</font></h1>
				<p>
					<samp style="color: #02ACEE">
						<strong>Select All</strong><input type="checkbox"
							onClick="toggle(this)" /><strong>Delete</strong><input
							type="button" id="startbutton" value="Delete"
							onclick="deleteuser()" />
					</samp>
				</p>
			<div style="overflow: scroll; height:400px;" >
				<table summary="Summary Here" cellpadding="0" cellspacing="0"
					border="1" >
					<thead>
						<tr>
							<th>Select</th>
							<th>User Name</th>
							<th>Role</th>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile No.</th>
							<th>Creation Date</th>
							<th>Last Profile Modified</th>

						</tr>
					</thead>
					<%
						while (rs.next()) {
							username = rs.getString(1);
							role = rs.getString(2);

							name = rs.getString(3) + " " + rs.getString(4);
							email = rs.getString(5);
							phone = rs.getString(6);
							creationDate = rs.getString(7);
							modifiedDate = rs.getString(8);

							if (i % 2 == 0)
								str = "light";
							else
								str = "dark";
							i++;
					%>
					<tbody>
						<tr class="<%=str%>">
							<td><input type="checkbox" id="<%=email%>" name="alluser"></td>
							<td><%=username%></td>
							<td><%=role%></td>
							<td><%=name%></td>
							<td><%=email%></td>
							<td><%=phone%></td>
							<td><%=creationDate%></td>
							<td><%=modifiedDate%></td>
						</tr>

					</tbody>

					<%
						}
					%>

				</table>
				</div>
				<p>
					<samp style="color: #02ACEE">
						<strong>Select All</strong><input type="checkbox"
							onClick="toggle(this)" /><strong>Delete</strong> <input
							type="button" id="endbutton" value="Delete"
							onclick="deleteuser()" />
					</samp>
				</p>


				<p>The User who are listed here are all the member of the
					organization RBIS.Their role is only to see the local bodies of
					sports.</p>
				<ul>
					<li>All the user listed here having role as general user not
						as admin.</li>
					<li>The user can be deleted in the case of their information
						is wrong.</li>
					<li>After deleting the user they are not able to register
						again to RBIS.</li>
					<li>Even though here Admin can delete all user but other admin
						still have account that are not listed here.</li>
					<li>As per the security level same level of user have same
						access right.</li>
				</ul>
							</div>
		</div>
	</div>

</body>
</html>

<%@include file="/footer.jsp"%>