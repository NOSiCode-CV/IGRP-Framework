(function(){

	var Templates = GIS.module('Templates');

	GIS.module('BaseMaps', function(app, list){

		var basemaps 		= this,

			viewer   	    = app.viewer(),

			list            = list || [ { name : 'Wikimedia', default : true } ],

			defaultBaseMap	= list.filter(function(b){ return b.default })[0],

			selectedBaseMap = false;

		basemaps.set = function(basemap, callback){

			var baseMapLayer = typeof basemap === 'string' ?  L.tileLayer.provider(basemap) : basemap;

			if(baseMapLayer){

				viewer.addLayer( baseMapLayer, true )

				if(selectedBaseMap)

					selectedBaseMap.remove();

				selectedBaseMap = baseMapLayer;

				if(callback)

					callback(baseMapLayer);

				selectedBaseMap.bringToBack();

			};
				
		};

		basemaps.getSelected = function(){

			return selectedBaseMap;

		};

		basemaps.drawList = function(){

			list.forEach(function(bm){

				$('.gis-basemaps', app.dom).append( Templates.BaseMaps.item( bm ) );

			});

			$('.gis-basemap-item', app.dom).on('click', function(){

				var controller = $(this),

					name 	   = controller.attr('basemap-name');

				basemaps.set(name, function(){

					$('.gis-basemap-item', app.dom).removeClass('active');

					controller.addClass('active');

				});

			});

		};

		basemaps.drawList();

		if(defaultBaseMap)

			basemaps.set( defaultBaseMap.name );

		return  basemaps;

	});

})();