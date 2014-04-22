<%@page import="org.owasp.esapi.ESAPI"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="com.rbis.listner.*"%>
<%@include file="headerlogin.jsp"%>
<%@include file="adminmenu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script language="javascript" type="text/javascript">
<!--
	function popitup(url) {	
		//alert(url);
		newwindow = window.open(url, 'name', 'height=600,width=600',
				'scrollbar=yes');
		if (window.focus) {
			newwindow.focus();
		}
		return false;
	}
// -->
</script>


<script type="text/javascript">
	function deletecomment() {

		var url = "DeleteComments.rbis?p=12";

		var xmlhttp;
		var checked_comments = document.getElementsByName("allcomments");
		//alert(checked_comments.length);
		var length = checked_comments.length;
		var flag = false;
		for ( var i = 0; i < length; ++i) {
			if (checked_comments[i].checked == true) {
				flag = true;
				url = url + "&comment_id=" + checked_comments[i].id;
				//alert(url);
			}
		}
		//alert(url); 

		if (flag && confirm("Are you sure")) {
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
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					for ( var i = 0; i < checked_comments.length; ++i) {
						if (checked_comments[i].checked == true) {
							console.log("commentid=" + checked_comments[i].id);
							var ulid = "comment" + checked_comments[i].id;
							console.log(ulid);
							var node = document.getElementById(ulid);
							if (node.parentNode) {
								node.parentNode.removeChild(node);
							}
						}
					}
					document.getElementById("MSG").innerHTML = xmlhttp.responseText;
				}

			}
			xmlhttp.open("Post", url, true);
			//location.reload(true);
			xmlhttp.send(null);

		}
	}
</script>

<script language="JavaScript">
	function toggle(source) {
		checkboxes = document.getElementsByName('allcomments');
		for ( var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>

</head>
<body>
	<%-- <%
		if (session.getAttribute("name") == null) {
			//response.sendRedirect("index.jsp");
		}
	%>
	<%
		if (session.getAttribute("name") != null
				&& session.getAttribute("role").toString()
						.equalsIgnoreCase("admin")) {
	%> --%>
	
	<%-- <%
		} else {
			response.sendRedirect("home.jsp");
		}
	%> --%>

<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
	
				<h1><font color=#02ACEE >Feedbacks</font></h1>
				<img class="imgr" src="images/demo/email-send.ico" alt="" width="125"
					height="125" />
				<p>Kerala State Remote Sensing And Environment Centre
				Vikas Bhavan, Thiruvananthapuram-33.</p>
				<p>
					The state of kerala known as <a href="http://en.wikipedia.org/wiki/God's_Own_Country" target="_balank">'God's own country'</a> 
					for it's natural beauty, rich rare medicinal plants, inherited culture and Art.
					Kerala is also known for its overall high performance in
					the literacy and health standards in country. 
				</p>
				<img class="imgl" src="images/demo/vikas-bhavan.jpg" alt="" width="125"
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
				<h1></h1>
				<%
					Connection connection;
					PreparedStatement pst;
					ResultSet rs;
					String qry;
					int i;
					String comment_position;
					String name;
					String comment;
					String date_of_comment;
					String email;
					int id;
				%>

				<%
					i = 0;
					comment_position = "comment_even";
					String query="select * from t_feedback";
					connection = DatabaseConnection.getConnection();
					pst = connection.prepareStatement(query);
					rs = pst.executeQuery();
				%>


				<div id="comments">
					<h2><font color="red">Delete Comments</font></h2>
					<p>
						<strong>Select All</strong> <input type="checkbox"
							onClick="toggle(this)"> <strong>Delete <input
							type="button" id="startbutton" value="Delete"
							onclick="deletecomment()"></strong>
					</p>
					<%
						while (rs.next()) {
					%>
					<ul id="<%="comment" + rs.getString("feedback_autoid")%>" class="commentlist">

						<%
							if (i % 2 == 0) {
									comment_position = "comment_odd";
								} else {
									comment_position = "comment_even";
								}
								name = rs.getString("name");
								comment = rs.getString("feedback");
								date_of_comment = rs.getString("date");
								id = rs.getInt("feedback_autoid");
								email = rs.getString("email_id");
								i++;
						%>

						<li class="<%=comment_position%>">
							<p>
								<input type="checkbox" id="<%=id%>" name="allcomments"
									value="<%=id%>">
							</p>
							<div class="author">
								<img class="avatar" src="images/demo/avatar.gif" width="32"
									height="32" alt="" /> <span class="name"><a
									href="mailSend.jsp"
									onclick="return popitup('mailSend.jsp?email=<%=email%>&name=<%=name%>')"><%=name%></a>
								</span> <span class="wrote">wrote:</span>
							</div>

							<div class="submitdate">
								<input type="hidden" name="email" id="email" value="<%=email%>">
								<a href="mailSend.jsp"
									onclick="return popitup('mailSend.jsp?email=<%=email%>&name=<%=name%>')"><%=date_of_comment%></a>
							</div>
					
							<p><%=comment%></p>

						</li>

					</ul>
					<%
						}
					%>
					<p>
						<strong>Select All</strong> <input type="checkbox"
							onClick="toggle(this)"> <strong>Delete</strong> <input
							type="button" id="endbutton" value="Delete"
							onclick="deletecomment()">
					</p>
				</div>


			</div>
			 <div id="column">
        	<div id="featured">
					<ul>
						<li>
							<h1>Aim Of RBIS</h1>
							
								<img src="images/demo/Waterfall_stream.gif"  height="200" width="240" />
								
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
		</div>
		</div>	
	</div>
</body>
</html>
<%@include file="/footer.jsp"%>




