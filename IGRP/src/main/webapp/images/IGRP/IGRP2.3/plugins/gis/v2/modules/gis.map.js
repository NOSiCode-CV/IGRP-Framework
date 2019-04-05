(function(){

	GIS.module('Map', function(app, o){

		var map 	 = this,

			settings = $.extend({

				id     : 'map',

				center : [16,-24],

				zoom   : 8,

				controls : {

					zoomControl: false

				}

			},o);

		map.addLayer = function(layer){

			layer.addTo( map.view );

		};

		map.setCenter = function(center){

		};

		map.zoomIn = function(){

			map.view.zoomIn();

		};

		map.zoomOut = function(){

			map.view.zoomOut();

		};

		app.viewer = function(){

			return map.view;

		};

		function SetControllers(){

			$('.gis-zoom-in', app.dom).on('click', map.zoomIn);

			$('.gis-zoom-out', app.dom).on('click',map.zoomOut);

		};

		(function(){

			map.view = L.map(settings.id+'-map', {

				zoomControl : false,
				
				//crs: proj4.defs("EPSG:4826","+proj=lcc +lat_1=15 +lat_2=16.66666666666667 +lat_0=15.83333333333333 +lon_0=-24 +x_0=161587.83 +y_0=128511.202 +datum=WGS84 +units=m +no_defs")

			}).setView(settings.center, settings.zoom);
			
			
			SetControllers();

		})();

	});

})();