<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
     <link rel="stylesheet" href="theme/default/google.css" type="text/css">
   
    <!--  <link rel="stylesheet" href="theme/default/style.css" type="text/css">-->
     <script src='http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyCZkyRi_n_mfMIq6uEdKDWaxt09t6bB-OE'></script>
    <script src="OpenLayers.js"></script>
    <script type="text/javascript">
        var map, measureControls;
        function init(){
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

           // map = new OpenLayers.Map('map',options);
            var road = new OpenLayers.Layer.WMS(
                    "road",
                    "http://localhost:8080/geoserver/wms?",
                    {layers: "geossis:road",transparent: true},
                    {visibility: false},
                    {'attribution': 'road of tvm'}
                    
                );
            
            
        	
           var Tvm=new OpenLayers.Layer.WMS(
               	"tvm",
               	"http://localhost:8080/geoserver/wms?",
               	{layers:"geossis:tvm",transparent: true,format: "image/png"},
				{isBaseLayer: true},
               	{'attribution': 'Areas of tvm dist.'},
               	{opacity:0.1}
               	
                  );
           
           
            var wmsLayer = new OpenLayers.Layer.WMS( "OpenLayers WMS", 
                "http://vmap0.tiles.osgeo.org/wms/vmap0?", {layers: 'basic'}); 
            var osm = new OpenLayers.Layer.OSM();
            
            //4 base layers
			var map = new OpenLayers.Map("map",options);
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
            
            //end of 4 base layers
                      
           var achabound=new OpenLayers.Layer.WMS(
                  	"achabound",
                  	"http://localhost:8080/geoserver/wms?",
                  	{layers:"rbis:achabound",transparent: true},
                  	{'attribution': 'boundry'},
                  	{visibility: true}
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
              
              
           map.addLayers([osm,gphy,gmap,ghyb,gsat,Tvm,achabound,achdrainp]);
           map.addControl(new OpenLayers.Control.LayerSwitcher());
           map.addControl(new OpenLayers.Control.MousePosition());
           
            // style the sketch fancy
            var sketchSymbolizers = {
                "Point": {
                    pointRadius: 4,
                    graphicName: "square",
                    fillColor: "white",
                    fillOpacity: 1,
                    strokeWidth: 1,
                    strokeOpacity: 1,
                    strokeColor: "#333333"
                },
                "Line": {
                    strokeWidth: 3,
                    strokeOpacity: 1,
                    strokeColor: "#666666",
                    strokeDashstyle: "dash"
                },
                "Polygon": {
                    strokeWidth: 2,
                    strokeOpacity: 1,
                    strokeColor: "#666666",
                    fillColor: "white",
                    fillOpacity: 0.3
                }
            };
            var style = new OpenLayers.Style();
            style.addRules([
                new OpenLayers.Rule({symbolizer: sketchSymbolizers})
            ]);
            var styleMap = new OpenLayers.StyleMap({"default": style});
            
            // allow testing of specific renderers via "?renderer=Canvas", etc
            var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
            renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

            measureControls = {
                line: new OpenLayers.Control.Measure(
                    OpenLayers.Handler.Path, {
                        persist: true,
                        handlerOptions: {
                            layerOptions: {
                                renderers: renderer,
                                styleMap: styleMap
                            }
                        }
                    }
                ),
                polygon: new OpenLayers.Control.Measure(
                    OpenLayers.Handler.Polygon, {
                        persist: true,
                        handlerOptions: {
                            layerOptions: {
                                renderers: renderer,
                                styleMap: styleMap
                            }
                        }
                    }
                )
            };
            
            var control;
            for(var key in measureControls) {
                control = measureControls[key];
                control.events.on({
                    "measure": handleMeasurements,
                    "measurepartial": handleMeasurements
                });
                map.addControl(control);
            }
            
            map.setCenter(tvm_center,6);
            
            document.getElementById('noneToggle').checked = true;
        }
        
        function handleMeasurements(event) {
            var geometry = event.geometry;
            var units = event.units;
            var order = event.order;
            var measure = event.measure;
            var element = document.getElementById('output');
            var out = "";
            if(order == 1) {
                out += "measure: " + measure.toFixed(3) + " " + units;
            } else {
                out += "measure: " + measure.toFixed(3) + " " + units + "<sup>2</" + "sup>";
            }
            element.innerHTML = out;
        }

        function toggleControl(element) {
            for(key in measureControls) {
                var control = measureControls[key];
                if(element.value == key && element.checked) {
                    control.activate();
                } else {
                    control.deactivate();
                }
            }
        }
        
        function toggleGeodesic(element) {
            for(key in measureControls) {
                var control = measureControls[key];
                control.geodesic = element.checked;
            }
        }
        
        function toggleImmediate(element) {
            for(key in measureControls) {
                var control = measureControls[key];
                control.setImmediate(element.checked);
            }
        }
    </script>
  </head>
  <body onload="init()">
    <h1 id="title">Measure Area and Distance</h1>
    <div id="tags">
       
    </div>
    
    <div id="map" class="smallmap"></div>
    <div id="options">
        <div id="output">
        </div>
        <ul id="controlToggle">
            <li>
                <input type="radio" name="type" value="none" id="noneToggle"
                       onclick="toggleControl(this);" checked="checked" />
                <label for="noneToggle">navigate</label>
            </li>
            <li>
                <input type="radio" name="type" value="line" id="lineToggle" onclick="toggleControl(this);" />
                <label for="lineToggle">measure distance</label>
            </li>
            <li>
                <input type="radio" name="type" value="polygon" id="polygonToggle" onclick="toggleControl(this);" />
                <label for="polygonToggle">measure area</label>
            </li>
            <li>
                <input type="checkbox" name="geodesic" id="geodesicToggle" onclick="toggleGeodesic(this);" />
                <label for="geodesicToggle">use geodesic measures</label>
            </li>
            <li>
                <input type="checkbox" name="immediate" id="immediateToggle" onclick="toggleImmediate(this);" />
                <label for="immediateToggle">use immediate measures</label>
            </li>
        </ul>
        <p>Note that the geometries drawn are planar geometries and the
        metrics returned by the measure control are planar measures by
        default.  If your map is in a geographic projection or you have the
        appropriate projection definitions to transform your geometries into
        geographic coordinates, you can set the "geodesic" property of the control
        to true to calculate geodesic measures instead of planar measures.
        Also you have the possibility to set the "immediate" property to true
        to get a new calculated value once the mouse has been mooved.</p>
    </div>
  </body>
</html>