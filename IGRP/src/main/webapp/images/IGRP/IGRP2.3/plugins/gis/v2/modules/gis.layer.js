(function(){
	
	var utils = GIS.module('utils');

	var Classes = {

		WMS : function(data){

			var layer   = null;

				options = $.extend({

					transparent : true,

					format : 'image/png',

					srs : 'EPSG:4826'

				}, data.options );
				
			layer = L.tileLayer.wms(data.url, options);

			return layer;

		},

		WFS : function(data,app){
			
			var layer   = L.geoJSON(null,{
				
					onEachFeature : function(feature,layer){
					
				           layer.bindPopup( 'ID: '+feature.id );
	
					}
					
				}),

				map     = app.viewer(),
				
				queryRequest = null,
				
				options = {};

			layer.request = null;

			layer.visible   = data.visible;
			
			layer.highlighted = [];
			
			layer.query = function(o){

				var def    = jQuery.Deferred(),
				
					fields = o.fields || [],
					
					value  = o.value || '',
					
					cql    = '';
				
				if(value){
					
					if(queryRequest && queryRequest.abort)
						
						queryRequest.abort();
					
					for(var i=0; i < fields.length; i++){
						
						var field 	   = fields[i],
						
							isNumber   = utils.feature.properties.isNumber[field],
							
							comparison = isNumber ? "LIKE '%"+value+"%'" : "LIKE '%"+value.toLowerCase()+"%'",
									
							field      = isNumber ? field : "strToLowerCase("+field+")";
						
						cql+= field +' '+ comparison;
						
						if(i < fields.length - 1)
							
							cql+= ' OR '
					}
					
					var queryOptions = $.extend({
						
						cql_filter : cql
						
					}, options);
					
					delete queryOptions.maxFeatures;
					
					delete queryOptions.bbox;
					
					queryRequest = $.get( data.url, queryOptions );/*.then(function(v){
						
						def.resolve(v);
						
					});*/
					
				}	
				
				return queryRequest;
				
			};
			
			//find object in layer
			layer.find = function(fid){
			
				var layers = layer.getLayers();
				
				var res = null;
				
				for(var i=0; i < layers.length; i++){
					
					var flayer = layers[i],
					
						feature = flayer.feature;
					
					if(feature.id ){

						if( feature.id == fid ){
							
							res = flayer;
							
							break;
							
						}	
						
					}

				}

				return res;
				
			};
			
			layer.unHighlightAll = function(){
			
				$('.gis-feature-highlighted').each(function(){
					
					var elm = $(this);
					
					elm.removeClass('gis-feature-highlighted')
					
					elm.css({
						
						marginLeft: elm.data('gis-feature-margin-left'),
						
						marginTop: elm.data('gis-feature-margin-top')
						
					})
					
				})
				
				layer.eachLayer(function(fl) {
					
					layer.resetStyle(fl)
			 
				});
				
				layer.highlighted = [];
				
			}
			
			layer.highlight = function(fid){
				
				var featureLayer = layer.find( fid );
				
				layer.unHighlightAll();
				
				if(featureLayer){
					
					//highlight lines
					if(featureLayer.feature.geometry.type.indexOf('Line') >=0){
						
						featureLayer.setStyle({fillColor: '#3f0', color: '#0f0',fill:true});
						
						featureLayer.bringToFront();
						
					}
					//highlight polygns
					if(featureLayer.feature.geometry.type.indexOf('Polygon') >=0 ){
						
						featureLayer.setStyle({fillColor: '#3f0', color: '#0f0',fill:true});
						
						featureLayer.bringToFront();
					
					}
					//highlight points
					if(featureLayer.feature.geometry.type == 'Point' ){
						
						var elm 	   = $(featureLayer.getElement()),
						
							originalMarginLeft = elm.data('gis-feature-margin-left') || elm.css('margin-left'),
							
							originalMarginTop = elm.data('gis-feature-margin-top') || elm.css('margin-top'),
						
							marginLeft = originalMarginLeft.split('px')[0]*1,
							
							marginTop  = originalMarginTop.split('px')[0]*1;
						
						elm.data('gis-feature-margin-left', originalMarginLeft);
						
						elm.data('gis-feature-margin-top', originalMarginTop);
						
						elm.css({
							
							marginLeft: marginLeft -5,
							
							marginTop : marginTop - 5
							
						});
						
						elm.addClass('gis-feature-highlighted');
						
					}
					
					layer.highlighted.push( featureLayer );
					
					layer.fire('feature-highlighted', { featureLayer : featureLayer  });
					
				}else{
					
					layer.once('data-loaded', function(t){
						
						layer.highlight(fid);

					});
					
				}

			}

			if(data.url){

				options = $.extend({

					version : '1.0.0',

					service : 'WFS',

					request : 'GetFeature',

					outputFormat:'application/json',

					maxFeatures : 600

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
							
							layer.fire('data-loaded', { data:geo });

							if(callback)

								callback( geo );
							
							if(layer.highlighted.length)
								
								layer.highlighted.forEach(function(hl){
									
									layer.highlight(hl.feature.id);
									
								});
								

						}).always(function(){

							app.loading(false);

						})

					}

				};

				map.on('moveend', function(){
					
					GetData();
					
				});

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
		
		layer.highlight  = layer.highlight || function(){};
		
		layer.find 		 = layer.find || function(){};
		
		layer.data = function(){
			
			return data;
			
		};
		
		layer.query 	 = layer.query || function(){
			
			var def = jQuery.Deferred();
			
			return def.promise();
			
		};

		layer.show = function(){

			layer.visible = true;

			layer.addTo( layer.container );

			layer.draw();
			
		};

		layer.hide = function(){

			layer.visible = false;

			layer.container.removeLayer( layer );

		};

		layer.on('add', function(){

			if(!layer.added)
				
				layer.added = true;
			
		});

		layer.addTo( layer.container );

		return layer;
			
	});

})();