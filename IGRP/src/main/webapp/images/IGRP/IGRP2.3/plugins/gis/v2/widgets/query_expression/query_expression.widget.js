//p_query_expression=layerid:2301|objectid:10
(function(){
	
	var Utils = GIS.module('Utils');
		
	function QueryExpressionWidget( widget, app ){
		
		var Map    = app.map.view,
		
			data = widget.data(),
			
			reqs = [];
		
		widget.layer = null;
		
		widget.attribute = {}; 
		
		widget.features  = null;	
		
		widget.queryexpression = null;
		
		function GetParameters(){
			
			var params = $.IGRP.utils.url.getParams();
			
			    param  = params['p_query_expression'] || params['query_expression']; 
			
			if(param){
				
				try{
								
					widget.queryexpression = decodeURIComponent(param);
					
				}catch(err){
					
					console.log(err)
					
				}
	
			}
			
		};
		
		function SetParameters (){
			
			GetParameters();
						
			data.query = data.query || widget.queryexpression;
			
			if(!data.query) return false;
			
			var params = data.query.split('|'),
			
				layerParam   = params[0],
			    
			    attributes   = params[1],
			
			    layerId      = layerParam.split(':')[1];
			    
			 widget.layer = app.layers.get( layerId );
			 			    
			 if(!widget.layer.visible)
				 
				 widget.layer.show();
			 				 
			 if(attributes){
				 
				 widget.attribute.name = attributes.split(':')[0],
					
				 widget.attribute.value = attributes.split(':')[1];

			}	
			 			 
		}
		
		function getAttr(attr){
			
			if (!widget.layer.Description) return attr;
			
			var attributes  = widget.layer.Description.attributes;
						
			if (attributes.hasOwnProperty(attr.toLowerCase())) return attr.toLowerCase();
			
			else if (attributes.hasOwnProperty(attr.toUpperCase())) return attr.toUpperCase();
		
			return attr;
		}
		
		function GetFeatures(){
			
			var val = widget.attribute.value,
			
			    str  = Number(val),
			    
			    quote = "\'";  
			    
			if(isNaN(str)) val = quote + val.toLowerCase() + quote;
							
			var	cqlFilters =  getAttr(widget.attribute.name) + '=' + val, 
				
				req = widget.layer.query({cql : cqlFilters });
			
			req.then(function(f){
				
				if(f.totalFeatures) widget.features = f.features;
				
			});
			
			reqs.push( req );
			
		}
				
		function SetExtent(layer){
			
			var bounds = layer.bounds,
			
			   id  = layer.id;
			
			if(bounds){
				
				bounds = JSON.parse(bounds);
				
				var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??
					
					sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched
				
				app.viewer().fitBounds( L.latLngBounds(sw,ne) );
				
				widget.layer.highlight( id );

			}
			
		}
		
		function SetResult(){
								
			if(!widget.layer || !widget.attribute.value || !widget.attribute.name ) return false;
									
			widget.layer.request.done(function(l){
				
				widget.layer.requestDescription.done(function(e){
					
					GetFeatures();
					
					$.when.apply(undefined,reqs).then(function(){
						
						var feature = widget.features[0];
						
						var  layer  = Utils.feature.getData(feature)
						
						SetExtent(layer)
				
					})				
				})
			})
		}
		
		(function(){
			
			 widget.on('activate', function(){		
				 
				 SetParameters();
 				
				 SetResult();				 
				
			})
			
		})();
		
	}

	GIS.widgets.register('query_expression', {
		
		init : QueryExpressionWidget
		
	});
	
})();