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

<script> 
 $.ajax({

	url : "FeedbackAction.rbis?action=rcvfeedback",
	type : 'get',
	dataType : 'html',
	beforeSend : function() {
	},
	complete : function() {
	},
	success : function(html) {

		var tab_item = document.getElementById("commentlist");
		try {
			tab_item.innerHTML = html;
		} catch (e) {
			tab_item.innerText = html;

		}
	}
});

 </script>

<div class="wrapper row3">
  <div class="rnd">
  
  <div align="center" style="color: red">
<%if(request.getParameter("feedback")!=null){ %>
					<%=request.getParameter("feedback") %>
				<%} %></div>
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        			<h1><font color=#02ACEE >Give Feedback</font></h1>
				<img class="imgr" src="images/demo/vikas-bhavan.jpg" alt="" width="125"
					height="125" />
				<p>Kerala State Remote Sensing And Environment Centre
				Vikas Bhavan, Thiruvananthapuram-33.</p>
				<p>
					The state of kerala known as <a href="http://en.wikipedia.org/wiki/God's_Own_Country" target="_balank">'God's own country'</a> 
					for it's natural beauty, rich rare medicinal plants, inherited culture and Art.
					Kerala is also known for its overall high performance in
					the literacy and health standards in country. 
				</p>
				<img class="imgl" src="images/demo/email-send.ico" alt="" width="125"
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
				<h1></h1>
      
        <div id="comments">
          <font color=#02ACEE ><h1>Comments</h1></font>
          <ul class="commentlist" id="commentlist">
            
          </ul>
        </div>
        <h2>Write A Comment</h2>
        <div id="respond">
        <form method="post" action="FeedbackAction.rbis?action=postfeedback" id="regForm">
		<table>
			<tr>
				<td>Email ID:</td>
				<td><input type="text" name="emailid" id="emailid" class="validate[required,custom[email]]"></td>
			</tr>
			
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" id="name" class="validate[required,custom[onlyLetterSp],minSize[6]]"></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone" id="phone" class="validate[required,custom[phone],minSize[10],maxSize[12]]"></td>
			</tr>
			<tr>
				<td>Subject:</td>
				<td><input type="text" name="subject" id="subject" class="validate[required]"></td>
			</tr>
			
			<tr>
				<td>Feedback:</td>
				<td><textarea name="feedback" id="feedback" rows="4" cols="50" class="validate[required,custom[onlyLetterSp],maxSize[500]]"></textarea></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="Submit Comment" id="submit" name="submit"></td>
				<td><input type="reset" value="Reset Comment" id="reset" name="submit"></td>	
			</tr>
		</table>
	</form>
        
        </div>
      </div>
      <div id="column">
       	<div id="featured">
					<ul>
						<li>
							<h2>Aim Of RBIS</h2>
								<img src="images/demo/Waterfall_stream.gif" width="240" height="240" />
				
							<p>The Project aim is to develop an online web 
							application that complete information of RiverBasins 
							and help to plan welfare projects 
							in the state and build modern facilities.</p>
							<p class="readmore">
								<a href="#">Continue Reading &raquo;</a>
							</p></li>
					</ul>
				</div>
		 </div>
      <!-- ####################################################################################################### -->
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<%@include file="footer.jsp" %>