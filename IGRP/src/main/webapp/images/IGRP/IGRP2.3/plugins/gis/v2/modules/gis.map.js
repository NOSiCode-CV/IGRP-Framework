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

			}, o );


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
			
			Utils.control.locate.init(map.view);
						
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
			
			map.view.locateOptions = {disativated: true};
			
			Utils.control.mousePosition.add(map.view, settings);
			
			var scale = Utils.control.scale.add(map.view);
			
			map.view.utils = {scale : scale}
						
		};

		(function(){

			map.view = L.map(settings.id+'-map', {

				zoomControl : false,
				
				editable: true,
				
			}).setView(settings.center, settings.zoom);			
			
			SetControllers();

			SetGraphics();
			
		})();

	});

})();