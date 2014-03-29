<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RBIS | </title>
<script language="javascript" src="scripts/jquery-1.2.6.min.js"></script><br>
<script language="javascript" src="scripts/jquery.timers-1.0.0.js"></script>
<script type="text/javascript">
	debugger;
$(document).ready(function(){
	   var j = jQuery.noConflict();
		j(document).ready(function()
		{
			j(".refresh").everyTime(1000,function(i){
				j.ajax({
				  url: "FeedbackAction.rbis?action=rcvfeedback",
				  cache: false,
				  success: function(html){
					  var tab_item = document.getElementById("feedbackval");
						try {
							tab_item.innerHTML = html;
						} catch (e) {
							tab_item.innerText = html;

						}

					  
					j(".refresh").html(html);
				  }
				});
			});
		});
	   j('.refresh').css({color:"green"});
	});
</script>
</head>
<body>
	<div id="feedbackval">
	
	
	
	</div>
	
<form method="post" action="FeedbackAction.rbis?action=postfeedback">
		<table align="center">
			<tr>
				<td>Email ID:</td>
				<td><input type="text" name="emailid" id="emailid"></td>
			</tr>
			
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td>Subject:</td>
				<td><input type="text" name="subject" id="subject"></td>
			</tr>
			
			<tr>
				<td>Feedback:</td>
				<td><textarea name="feedback" id="feedback" rows="4" cols="50"></textarea></td>
			</tr>
			
			<tr align="center">
				<td><input type="submit" value="Send" id="send"></td>
				
			</tr>
		</table>
	</form>

</body>
</html>