			/*This is the sports local bodies layer of Thiruvananthapuram district that are overlayed on the 6 different layers Developed & designed by Pankaj kumar sharma*/		
			/*While facing any problem in to depict your own layer along with the existing layers you can directly contact me on rpspankaj2010@gmail.com*/

			var info;
			var geographic = new OpenLayers.Projection("EPSG:4326");
            var mercator = new OpenLayers.Projection("EPSG:900913");

            var world = new OpenLayers.Bounds(-180, -89, 180, 89).transform(
                geographic, mercator
            );
            var tvm_center = new OpenLayers.LonLat(76.9720,8.5074).transform(
                geographic, mercator
            );

            var options = {
                projection: mercator,
                displayProjection: geographic,
                units: "m",
                maxExtent: world,
                maxResolution: 156543.0399
                
            };
            //4 base layers
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
                
                var Tvm=new OpenLayers.Layer.WMS(
                       	"tvm",
                       	"http://localhost:8080/geoserver/wms?",
                       	{layers:"geossis:tvm",transparent: true,format: "image/png"},
        				{isBaseLayer: true},
                       	{'attribution': 'Areas of tvm dist.'},
                       	{opacity:0.1}
                       	
                          );
            
                var KERALADISTRICT=new OpenLayers.Layer.WMS(
                     	"KERALADISTRICT",
                      	"http://localhost:8080/geoserver/wms?",
                      	{layers:"geossis:KERALADISTRICT",transparent: true,format: "image/png"},
                      	{isBaseLayer: true},
                      	{'attribution': 'KERALADISTRICT'},
                      	{opacity:0.1}
                      );
            //end of 4 base layers
                      
           
          
           var osm = new OpenLayers.Layer.OSM();
            

           // map.addLayer(osm);
           var road = new OpenLayers.Layer.WMS(
                "road",
                "http://localhost:8080/geoserver/wms?",
                {layers: "geossis:road",transparent: true},
                {'attribution': 'road of tvm'},
                {visibility: false}
            );
			
          var Council=new OpenLayers.Layer.WMS(
        		"Council",
        		"http://localhost:8080/geoserver/wms?",
        		{layers:"geossis:Council",transparent:true},
        		{attribution:"Council"}
          
          
          );
            
          /* var achabound=new OpenLayers.Layer.WMS(
        	"achabound",
        	"http://localhost:8080/geoserver/wms?",
        	{layers:"rbis:achabound",transparent: true},
        	{'attribution': 'boundry'},
        	{visibility: false}
           );
           */
           var achabound=new OpenLayers.Layer.WMS(
               	"achabound",
               	"http://localhost:8080/geoserver/wms?",
               	{layers:"rbis:achabound",transparent: true},
               	{'attribution': 'boundry'},
               	{visibility: false}
                  );
           var achdrainp=new OpenLayers.Layer.WMS(
               	"achdrainp",
               	"http://localhost:8080/geoserver/wms?",
               	{layers:"rbis:achdrainp",transparent: true},
               	{'attribution': 'boundry'},
               	{visibility: false}
                  );
           var akdrainl=new OpenLayers.Layer.WMS(
               	"akdrainl",
               	"http://localhost:8080/geoserver/wms?",
               	{layers:"rbis:akdrainl",transparent: true},
               	{'attribution': 'boundry'},
               	{visibility: false}
                  );
           var DrainPolygon=new OpenLayers.Layer.WMS(
               	"DrainPolygon",
               	"http://localhost:8080/geoserver/wms?",
               	{layers:"rbis:drainp",transparent: true},
               	{'attribution': 'boundry'},
               	{visibility: false}
                  );
           
           var PhysicalEdn=new OpenLayers.Layer.WMS(
                  	"PhysicalEdn",
                   	"http://localhost:8080/geoserver/wms?",
                   	{layers:"geossis:PhysicalEdn",transparent: true,format: "image/png"},
                   	{'attribution': 'PhysicalEdn'}
                   );
           
           /*var KERALADISTRICT=new OpenLayers.Layer.WMS(
                 	"KERALADISTRICT",
                  	"http://localhost:8080/geoserver/wms?",
                  	{layers:"geossis:KERALADISTRICT",transparent: true,format: "image/png"},
                  	{'attribution': 'KERALADISTRICT'}
                  );*/
          
			/*var clon,clat;
           map.events.register("click", map, function(e) {
        	   var position = map.getLonLatFromPixel(e.xy);

        	   OpenLayers.Util.getElement("nodelist").innerHTML = 
        	         position.lon.toFixed(7) + ', ' + position.lat.toFixed(7);

        	 });*/
           
           
           //find distance
          
  		//end
  			

          
           
           //feature info
           			function init(){
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
      
           
           map.addControl(new OpenLayers.Control.EditingToolbar(Tvm));		
			
           map.addLayers([osm,gphy,gmap,ghyb,gsat,KERALADISTRICT,DrainPolygon,achabound,achdrainp,akdrainl]);
           map.setCenter(tvm_center,6);
                  
            map.addControl(new OpenLayers.Control.LayerSwitcher());
            map.addControl(new OpenLayers.Control.MousePosition());

            map.addControl(featureInfo);
            featureInfo.activate();
           
            
          
