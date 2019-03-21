(function(){

	var Classes = {

		WMS : function(data){

			var layer   = null;

				options = $.extend({

					transparent : true,

					format : 'image/png',

					srs : 'EPSG:4826'

				}, data.options );

			layer = L.tileLayer.wms(data.url, options);
			
			layer.filter = function(){
				
			};

			return layer;

		},

		WFS : function(data,app){

			var layer = L.geoJSON(),

				map   = app.viewer();

			layer.request = null;

			layer.visible   = data.visible;

			if(data.url){

				var options = $.extend({

					version : '1.0.0',

					service : 'WFS',

					request : 'GetFeature',

					outputFormat:'application/json',

					maxFeatures : 500

				}, data.options );

				var GetData = function(callback){

					if(layer.visible){

						if(layer.request)
						
							layer.request.abort();

						app.loading(true);

						options.bbox = map.getBounds().toBBoxString();

						layer.request = $.get( data.url, options );

						layer.request.then(function(geo){

							layer.clear = layer.clearLayers;

							layer.clear();

							layer.addData(geo);

							if(callback)

								callback( geo );

						}).always(function(){

							app.loading(false);

						})

					}

				};

				map.on('moveend', GetData);

				GetData();

				layer.draw = GetData;

			};

			if( data.geojson )

				layer.addData(o.geojson);

			return layer;

		}

	};

	GIS.module('Layer',function(data, app){

		var layer     = Classes[data.type] ? Classes[data.type](data, app) : null,

			map 	  = app.viewer(),

			container = data.group ?  data.group : map;

		layer.id   		 = data.id; 

		layer.added 	 = false;

		layer.controller = $( GIS.module('Templates').Layers.layer(data) );

		layer.container  = container;

		layer.visible    = data.visible;

		layer.draw       = layer.draw || function(){};
		
		layer.filter = function(){
			
		};

		layer.show = function(){

			layer.visible = true;

			layer.addTo( layer.container );

			layer.draw();
		};

		layer.hide = function(){

			layer.visible = false;

			layer.container.removeLayer( layer )

		};

		layer.on('add', function(){

			if(!layer.added)
				
				layer.added = true;
			
		});

		layer.addTo( layer.container );

		return layer;
			
	});

})();