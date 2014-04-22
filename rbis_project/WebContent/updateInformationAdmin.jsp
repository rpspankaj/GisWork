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
   <h1></h1>
    <ul>
      <li>First<a href="http://localhost:8080/geoserver/web/" target="_blank"> Add and Publish(click here) </a>the shapefiles to the geoserver.</li>
      <li><a href="http://docs.geoserver.org/2.1.4/user/gettingstarted/shapefile-quickstart/index.html" target="_blank">Instruction(click here)</a>to add Shapefiles.</li>
      <li>Second Add the River basin information given below.</li>
      <li>The Shape file name must be same to the corresponding shape file name in Geoserver.</li>
   	  <li>In this table all fields are required. </li>
   	  <li>In the first field give the Location for which your inserting information.</li>
   	  <li>In the second field give the River basin Name </li>
   	  <li>In the third field give the name of the Owner</li>
   	  <li>In the fourth field give the Shape File Name.</li>
   	  <li>In the fifth field give the description of the Shape File.</li>
    </ul>
    <h1></h1>
    <form action="UpdateInformation.rbis" method="post" id="UpdateInformation">
    	<h2><font color=#02ACEE >Add The Informations</font></h2>
    	<table summary="Summary Here" cellpadding="0" cellspacing="0">
	<thead>
			<tr>
				
				<th>Attributes</th>
				<th>Values</th>
				
			</tr>
		</thead>
		<tbody>
			<tr class="light">
				<td>Location</td><td><select id="nop" name="nop"  class="validate[required]">
										
										<option value="Kerala" selected>Kerala</option>
										
										
					</select></td>
			</tr>
			<tr class="dark">
				<td>River</td><td><select name="address" id="address"  class="validate[required,custom[onlyLetterSp],maxSize[30]] " >
				<option value="achankovil" selected>Achankovil</option>
				</select>
				</td>
			</tr>
			<tr class="light">
				<td>Ownership</td><td><select name="ownership" id="ownership"  class="validate[required,maxSize[30]] "  >
				<option value="Government" selected>Government</option>
				<option value="Private" selected>Private</option>
				</select>
				</td>
			</tr>
			<tr class="dark">
				<td>Shape File</td><td><input type="text" name="localbody" id="localbody" class="validate[required,maxSize[30]] "></td>
			</tr>
			<tr class="light">
				<td>Description</td><td><input type="text" name="area" id="area" class="validate[required,maxSize[30]] "></td>
			</tr>
		<tr>
				<td><input type="hidden" name="flag"  id="flag" value="1"/></td>
			
				<!--  <td>Picture</td><td><input type="file" name="photo" id="photo" ></td>-->
			</tr>
		<tr class="dark">		
		<td><input type="submit" value="Submit"></td>
		<td><input type="reset" value="reset"></td>
		</tr>	
			
		</tbody>
	</table>
		</form>
			<p>Thanks for coming here to support us.</p>
	<p>With regards,</p>
	<p>Kerala State Remote Sensing And Environment Center</p>
	<p>Vikash Bhavan,Thiruvananthapuram-33</p>	
	</div>
	       <div id="column">
        	<div class="subnav">
        	<h2><font color=#02ACEE> Adding Shape files</font></h2>
					<img src="images/demo/logo.gif" width="240" height="255">
					<p><a href="http://localhost:8080/geoserver/web/" target="_blank"><input name="addshape" type="button" id="addshape" value="ADD SHAPEFILES" tabindex="5"></a></p>
					<p><a href="http://docs.geoserver.org/2.1.4/user/gettingstarted/shapefile-quickstart/index.html" target="_blank"><input name="instruction" type="button" id="instruction" value="Instruction" tabindex="5"></a></p>
					<p><a href="approve.jsp" target="_blank"><input name="approve" type="button" id="approve" value="Approve" tabindex="5"></a></p>
			</div>
           </div>
		    
      <!-- ####################################################################################################### -->
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<%@include file="footer.jsp" %>
