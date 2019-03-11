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

			map.view = L.map(settings.id+'-map',{

				zoomControl : settings.zoomControl

			}).setView(settings.center, settings.zoom);


			SetControllers();

		})();

	});

})();