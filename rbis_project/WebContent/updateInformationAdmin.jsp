<%@include file="headerlogin.jsp" %>
<%@include file="adminmenu.jsp" %>
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
		$("#UpdateInformation").validationEngine();
	});
</script>
<%
String str="light";
String str1="dark";
%>

<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="content">
        				 <p><strong style="color:#02ACEE ">Steps to Update the information</strong></p>
    <ul>
      <li>First<a href="http://localhost:8080/geoserver/web/" target="_blank"> Add and Publish(click here) </a>the shapefiles to the geoserver.</li>
      <li><a href="http://docs.geoserver.org/2.1.4/user/gettingstarted/shapefile-quickstart/index.html" target="_blank">Instruction(click here)</a>to add Shapefiles.</li>
      <li>Second Add the sports local bodies information given below.</li>
      <li>The local bodies name must be same to the corresponding shapefile name.</li>
   	  <li>The information that you are adding can only be updated after approval.</li>
   	  <li>In this table there are six fields all are required. </li>
   	  <li>In the first field give the name of place for which your inserting information.</li>
   	  <li>In the second field give the correct address of sports local body.</li>
   	  <li>In the third field give the name of the owner of sports local body</li>
   	  <li>In the fourth field give the local bodies name like Playground, swimming pool and all.</li>
   	  <li>In the fifth field give the area of ground or pound.</li>
   	  <li>In the sixth field load the corresponding picture of the local bodies.</li>
    </ul>
    <form action="UpdateInformation.rbis" method="post" id="UpdateInformation">
    	<h2>Add The Informations</h2>
    	<table summary="Summary Here" cellpadding="0" cellspacing="0">
	<thead>
			<tr>
				
				<th>Attributes</th>
				<th>Valuse</th>
				
			</tr>
		</thead>
		<tbody>
			<tr class="light">
				<td>Name of Place</td><td><select id="nop" name="nop"  class="validate[required]">
										
										<option value="Kerala" selected>Kerala</option>
										
										
					</select></td>
			</tr>
			<tr class="dark">
				<td>Address</td><td><input type="text" name="address" id="address"  class="validate[required,custom[onlyLetterSp],maxSize[30]] " ></td>
			</tr>
			<tr class="light">
				<td>Ownership</td><td><input type="text" name="ownership" id="ownership"  class="validate[required,maxSize[30]] "   ></td>
			</tr>
			<tr class="dark">
				<td>LocalBody</td><td><input type="text" name="localbody" id="localbody" class="validate[required,maxSize[30]] "></td>
			</tr>
			<tr class="light">
				<td>Area</td><td><input type="text" name="area" id="area" class="validate[required,maxSize[30]] "></td>
			</tr>
			<tr class="dark">
				<td><input type="hidden" name="flag"  id="flag" value="1"/></td>
				<!--  <td>Picture</td><td><input type="file" name="photo" id="photo" ></td>-->
			</tr>
				
		
			
			
		</tbody>
	</table>
		<p><input type="submit" value="Submit">
		<input type="reset" value="reset"></p>
	</form>
			<p>Thanks for coming here to support us.</p>
	<p>With regards,</p>
	<p>Kerala State Remote Sensing And Environment Center</p>
	<p>Vikash Bhavan,Thiruvananthapuram-33</p>	
	</div>
	       <div id="column">
        	<div class="subnav">
					<img src="images/demo/logout.gif" width="250" height="150">
					<p><a href="http://localhost:8080/geoserver/web/" target="_blank"><input name="addshape" type="button" id="addshape" value="ADD SHAPEFILES" tabindex="5"></a></p>
					<p><a href="http://docs.geoserver.org/2.1.4/user/gettingstarted/shapefile-quickstart/index.html" target="_blank"><input name="instruction" type="button" id="instruction" value="Instruction" tabindex="5"></a></p>
					<p><a href="approve.jsp" target="_blank"><input name="approve" type="button" id="approve" value="Approve" tabindex="5"></a></p>
			</div>
            <div id="featured">
					<ul>
						<li>
							<h2>Aim Of RBIS</h2>
							<p class="imgholder">
								<img src="images/demo/240x90.gif" alt="" />
							</p>
							<p>The Project aim is to develop an online web 
							application that utilize the facilities available
							in the state and build modern sports facilities at
							grass root level on par with international level.</p>
							<p class="readmore">
								<a href="#">Continue Reading &raquo;</a>
							</p>
							</li>
					</ul>
				</div>
				
					<!-- <div class="holder">
					<h2>Data Use Policy</h2>
					<p>Information we receive and how it is used
						Learn about the types of information we 
						receive, and how that information is used.</p>
					<ul>
						
						<li>Sharing and finding data </li>
						<li><a href="#">Spatial and non-spatial data</a>
						</li>
					</ul>
					<p>
						Learn about things like local bodies
						 and how information is shared.
						
						</p>
					<p class="readmore">
						<a href="#">Continue Reading &raquo;</a>
					</p>
				</div>  -->  
		    </div>
		    
      <!-- ####################################################################################################### -->
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<%@include file="footer.jsp" %>
