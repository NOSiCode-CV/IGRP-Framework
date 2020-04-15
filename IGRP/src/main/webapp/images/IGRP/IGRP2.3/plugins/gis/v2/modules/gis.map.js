(function(){
	
	GIS.module('Map', function(app, o ){

		var Utils    = GIS.module('Utils'),
		
			Graphics =  GIS.module('Graphics'),
		
			map 	 = this,

			settings = $.extend({

				id     : 'map',

				center : [16,-24],

				zoom   : 8,

				controls : {

					zoomControl: false

				}

			}, o ),
			
			locate = null, markerLocate = null, DisactivedLocate = true;

		map.addLayer = function(layer){

			layer.addTo( map.view );

		};

		map.setCenter = function(center){};

		map.zoomIn = function(){

			map.view.zoomIn();
			
			return false;

		};

		map.zoomOut = function(){

			map.view.zoomOut();
			
			return false;

		};
		
		map.zoomHome = function(){
			
			map.view.flyTo(settings.center, settings.zoom);
			
			return false;

		};
		
		map.locate = function(){
			
			DisactivedLocate = false;	
			
			if(locate){
				
				ClearLocate()
				
				return false;
				
			}
			
			map.view.locate({setView: true, watch: true})
			
			.on('locationfound', function(e){
				
				if(locate){
					
					ClearLocate()
					
				}
								
	        	markerLocate = L.marker([e.latitude, e.longitude],{
	        		
	        		icon: L.divIcon({
	        		    html: '<i class="fa fa-lg fa-map-pin" style="color: #0085BA"></i>',
	        		    iconSize: [30, 30],
	        		    className: 'locate-marker-icon'
	        		  })
	        		
	        	}).bindPopup('Your are here :)').openPopup();
						            
	        	locate = L.circle([e.latitude, e.longitude], e.accuracy/2, {
	                
	                color: 'blue',
	                
	                fillColor: '#136AEC',
	                
	                fillOpacity: 0.15,
	                
	                weight:      0
	                
	            });
	        	
	            map.view.addLayer(markerLocate);
	            
	            map.view.addLayer(locate);
	            
	            setTimeout(function(){
	            	
	            	DisactivedLocate = true;
	            	
	            	map.view.stopLocate()
	            
	            }, 3000)
	            	            
	        })
	       .on('locationerror', function(e){
	    	   
	            console.log("Location access denied :: " + e);
	            
	        });
						
			return false;
		};

		
		map.expand = function(){
			
			$(app.dom).toggleClass('expand');
			
			map.view.invalidateSize();
			
			return false;
		};

		app.viewer = function(){

			return map.view;

		};
		
		function ClearLocate(){
			
			if(locate){
				
				map.view.removeLayer(locate)
				
				map.view.removeLayer(markerLocate)
				
			}
				
			locate = null;
			
		}
		
		function SetGraphics(){
			
			if(o.graphics && o.graphics[0]){

				map.graphicsLayer = new L.FeatureGroup();
				
				o.graphics.forEach(function(g){
					
					if(g.features && g.features[0]){
						
						g.features.forEach(function(feature){
							
							if(feature && feature.geometry){
								
								var graphic = Graphics.create( feature );
								
								if(graphic){
	
									if(g.infoWindow)
										
										graphic.bindPopup( Utils.feature.properties.toHTML( feature.properties ) );

									graphic.addTo(map.graphicsLayer);
								}
								
							}
							
						});
						
					}
					
				});
				
				map.graphicsLayer.addTo( map.view );
				
				map.view.fitBounds(  map.graphicsLayer.getBounds() );
				
			}

		}
		
		function SetControllers(){

			$('.gis-zoom-in', app.dom).on('click', map.zoomIn);

			$('.gis-zoom-out', app.dom).on('click', map.zoomOut);
			
			$('.gis-zoom-home', app.dom).on('click', map.zoomHome);
			
			$('.gis-locate', app.dom).on('click', map.locate);
			
			$('.gis-expand', app.dom).on('click', map.expand);
			
			if(settings.fullscreen)
				
				map.expand();
			
			map.view.on('move', function(){
			
				if	(DisactivedLocate) ClearLocate()
				
			})

		};

		(function(){

			map.view = L.map(settings.id+'-map', {

				zoomControl : false,
				
				editable: true,
				
				//crs: proj4.defs("EPSG:4826","+proj=lcc +lat_1=15 +lat_2=16.66666666666667 +lat_0=15.83333333333333 +lon_0=-24 +x_0=161587.83 +y_0=128511.202 +datum=WGS84 +units=m +no_defs")

			}).setView(settings.center, settings.zoom);			
			
			SetControllers();

			SetGraphics();
			
		})();

	});

})();