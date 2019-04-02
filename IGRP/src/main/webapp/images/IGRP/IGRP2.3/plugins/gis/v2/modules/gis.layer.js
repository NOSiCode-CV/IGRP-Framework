(function(){
	
	var utils = GIS.module('Utils'),
	
		Query = GIS.module('Query');

	var Classes = {

		WMS : function(data){

			var layer   = null;

				options = $.extend({

					transparent : true,

					format : 'image/png',

					srs : 'EPSG:4826'

				}, data.options );
				
			layer = L.tileLayer.wms(data.url, options);

			layer.updateData= function(){
				console.log('updateee')
				layer.setParams({}, false);
				
			}
			
			return layer;

		},

		WFS : function(data,app){
			
			var layer   = L.geoJSON(null,{
				
					style: function (feature) {
				        
						return {
							weight: 1,
							opacity : 0.5
				        	
				        };
				        
				    },
				
					onEachFeature : function(feature,layer){
					
				           layer.bindPopup( 'ID: '+feature.id );
	
					}
					
				}),

				map     = app.viewer(),
				
				queryRequest = null,
				
				options = {};
			
			console.log(layer)

			layer.request = null;

			layer.visible   = data.visible;
			
			layer.highlighted = [];
			
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
			
			layer.highlight = function(fid, callback){
				
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
					
					//highlight points (css padding, so we have to hack the margin so the point stays in right place)
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
					
					if(callback)
						
						callback( featureLayer );
					
				}else{
					
					layer.once('data-loaded', function(t){
						
						layer.highlight(fid, callback);

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
				
				
				layer.requestOptions = options;
				
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
				
				layer.updateData = GetData;

			};

			if( data.geojson )

				layer.addData(o.geojson);
			
			return layer;

		}

	};

	GIS.module('Layer',function(data, app){

		var layer     	 = Classes[data.type] ? Classes[data.type](data, app) : null,

			map 	  	 = app.viewer(),

			container 	 = data.group ?  data.group : map,
					
			queryRequest = null;

		layer.id   		 = data.id; 

		layer.added 	 = false;

		layer.controller = $( GIS.module('Templates').Layers.layer(data) );

		layer.container  = container;

		layer.visible    = data.visible;
		
		layer.Info 		 = GetLayerInfo(),
		
		layer.updateData       = layer.updateData || function(){};
		
		layer.unHighlightAll   = layer.unHighlightAll || function(){};
		
		layer.highlight  = layer.highlight || function(){};
		
		layer.find 		 = layer.find || function(){};

		layer.data = function( name ){
			
			return name ? data[name] : data;
			
		};
		
		layer.getGeometryType = function(){
			
			var type = "";
			
			if(layer.Description.geometryType.indexOf('Polygon') >= 0 )
				
				type = 'Polygon';
			
			if(layer.Description.geometryType.indexOf('Line') >= 0 )
				
				type = 'Line';
			
			if(layer.Description.geometryType.indexOf('Point') >= 0 )
				
				type = 'Point';
			
			return type;
			
		};

		layer.query = function(o){
			
			if(queryRequest)
				
				queryRequest.abort();
			
			queryRequest = new Query.cql(layer, {
				
				attributes : o.attributes,
				
				value 	   : o.value
				
			});
			
			return queryRequest;
			
		};

		layer.show = function(){

			layer.visible = true;

			layer.addTo( layer.container );

			layer.updateData();
			
		};

		layer.hide = function(){

			layer.visible = false;

			layer.container.removeLayer( layer );

		};

		layer.on('add', function(){

			if(!layer.added)
				
				layer.added = true;
			
		});
		
		function GetLayerInfo(){
			
			var layerData      = data,
			
				workSpaceLayer = layerData.options.typeName || layerData.options.layers || '',
			
				workSpace	   = workSpaceLayer.split(':')[0],
				
				indexOfWMS     =  layerData.url.lastIndexOf('/wms'),
				
				owsUrl 		   = layerData.url;
			
			if(indexOfWMS >= 0)
				
				owsUrl = layerData.url.substring(0,indexOfWMS)+'/ows';
			
			return {
				
				workspace 	   : workSpace,
				
				workspaceLayer : workSpaceLayer,
				
				workspaceLink  : 'https:/www.nosi.cv/INSP_GIS',
				
				owsURL  	   : owsUrl
				
			}
			
		}
		
		function GetDescribeData(){
			
			var geomAttrs = {
					
					geom : true,
					
					the_geom:true
				},
				
				res = {
					
					attributes   : {},
					
					geometryType : ""
					
				};
			
			$.get(layer.Info.owsURL+'?service=wfs&request=DescribeFeatureType&typeName='+layer.Info.workspaceLayer+'&version=1.0.0').then(function(xml){
				
				var attrsElements = $(xml).find('xsd\\:sequence xsd\\:element')
				
				attrsElements.each(function(){
					
					var name = $(this).attr('name');
					
					if( geomAttrs[name] )
						
						res.geometryType = $(this).attr('type')
						
					else
						
						res.attributes[name] = $(this).attr('type').split('xsd:')[1]

				});
				
			});
			
			layer.Description = res;
			
		};
		
		GetDescribeData();

		layer.addTo( layer.container );

		return layer;
			
	});

})();