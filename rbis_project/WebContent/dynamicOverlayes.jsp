
<%@page import="java.sql.*" %>
<%@page import="com.rbis.listner.*" %>

<%-- <%@ include file="headerlogin.jsp" %>
<%@ include file="adminmenu.jsp" %> --%>
<html>
<head>
    <title></title>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

   
     <link rel="stylesheet" href="layersjs/theme/default/google.css" type="text/css">
    <!-- <link rel="stylesheet" href="layersjs/style.css" type="text/css"> -->
    <!-- this gmaps key generated for http://openlayers.org/dev/ -->
    
    <script src='http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyCZkyRi_n_mfMIq6uEdKDWaxt09t6bB-OE'></script>
    <script src="OpenLayers.js"></script>
    </head>

 <body onload="addLayer()">
 
 
				<%
					Connection connection= null;
					PreparedStatement pst=null;
					ResultSet rs=null;	
					String qry="select TRIM(localbody),id from t_riveravailabledata";
					int i=0;
					
				%>
				
				<%
					connection=DatabaseConnection.getConnection();
					pst=connection.prepareStatement(qry);
					rs=pst.executeQuery();
				%>
				<%while(rs.next()){ %>
				<input type="hidden" name="allLayers" id="<%=rs.getString(2) %>" value=<%=rs.getString(1) %> >
				<%} %>
				
 
 
 
    <div id="map-id" class="caption"></div>
       
    	  
    <script>
	/*This is the sports local bodies layer of Thiruvananthapuram district that are overlayed on the 6 different layers Developed & designed by Pankaj kumar sharma*/		
	/*While facing any problem in to depict your own layer along with the existing layers you can directly contact me on rpspankaj2010@gmail.com*/
	var layer;
	function addLayer(){
		
		
		
	var allLayers = document.getElementsByName("allLayers");
	
	var length = allLayers.length;
	 for(var i=0;i<length;++i){
		
			layer =allLayers[ i ].value;
		//alert(layer);
	}
		
	var info;
	var geographic = new OpenLayers.Projection("EPSG:4326");
    var mercator = new OpenLayers.Projection("EPSG:900913");

    var world = new OpenLayers.Bounds(-180, -89, 180, 89).transform(
        geographic, mercator
    );
    var tvm_center = new OpenLayers.LonLat(77,8.5).transform(
        geographic, mercator
    );

    var options = {
        projection: mercator,
        displayProjection: geographic,
        units: "m",
        maxExtent: world,
        maxResolution: 156543.0399
        
    };
    //5 base layers
	var map = new OpenLayers.Map("map-id",options);
    	var gphy = new OpenLayers.Layer.Google(
            "Google Physical",
            {type: G_PHYSICAL_MAP,sphericalMercator:true}
        );
        var gmap = new OpenLayers.Layer.Google(
            "Google Streets", // the default
            {numZoomLevels: 22,sphericalMercator:true}
        );
        var ghyb = new OpenLayers.Layer.Google(
            "Google Hybrid",
            {type: G_HYBRID_MAP, numZoomLevels: 22,sphericalMercator:true}
        );
        var gsat = new OpenLayers.Layer.Google(
            "Google Satellite",
            {type: G_SATELLITE_MAP, numZoomLevels: 22 ,sphericalMercator:true}
			 

        );
        
        var KERALADISTRICT=new OpenLayers.Layer.WMS(
             	"KERALADISTRICT",
              	"http://localhost:8080/geoserver/wms?",
              	{layers:"geossis:KERALADISTRICT",transparent: true,format: "image/png"},
              	{opacity:0.5},
              	{isBaseLayer: true},
              	{'attribution': 'KERALADISTRICT'}
              	
              );
          
    
    //end of 5 base layers
              
   
  
   var osm = new OpenLayers.Layer.OSM();
    

   // map.addLayer(osm);
   
   for(var i=0;i<length;++i){
	   var layer = new OpenLayers.Layer.WMS(
			   allLayers[ i ].value,
		        "http://localhost:8080/geoserver/wms?",
		        {layers:"rbis:"+allLayers[ i ].value,transparent: true},
		        
		        {visibility: false}
		    );
	   
	   
	   
	   
   		map.addLayers([osm,gphy,gmap,ghyb,gsat,layer,KERALADISTRICT]);
   }
   	map.setCenter(tvm_center,10);
   	map.addControl(new OpenLayers.Control.EditingToolbar(KERALADISTRICT));	
    map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.addControl(new OpenLayers.Control.MousePosition());
    

  
   
   //feature info
   		
   				info = new OpenLayers.Control.WMSGetFeatureInfo({
   					url: 'http://localhost:8080/geoserver/wms',
   					title: 'get feature info',
   					queryVisible: true,
   					
   					eventListeners: {
   					getfeatureinfo: function(event) {
   					clon=(map.getLonLatFromPixel(event.xy)).lon.toFixed(7);
   					clat=(map.getLonLatFromPixel(event.xy)).lat.toFixed(7);
   					
   					map.addPopup(new OpenLayers.Popup.FramedCloud(
                   "chicken",
                   map.getLonLatFromPixel(event.xy),
                   null,
                   	
                   event.text,
                   null,
                   true
                   
		           
               ));
           }
       }
   				
   });
   	map.addControl(info);
   	info.activate();
 }  

  
   
    
  

    
    </script>
     <script >
     OpenLayers.ProxyHost = "layersjs/proxy.cgi?url=";
    </script>
      	
    	 <div id="nodelist">
    	 
    	 </div>
   
      
 </body>
 </html>