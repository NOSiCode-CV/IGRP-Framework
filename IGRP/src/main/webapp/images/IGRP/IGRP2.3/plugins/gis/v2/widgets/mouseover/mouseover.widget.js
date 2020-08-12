(function(){
	
	var Utils = GIS.module('Utils'),
	
		Templates  = GIS.module('Templates');
	
	function Mouseover( widget, app ){
		
		var Map = app.viewer(),
		
			Layers = app.layers.getLayers(),
			
			data   = widget.data(),
			
			pop    = null;	
						
		function SetWindowContent(data, feature){
						
			var properties    = [],
							
				attributes = data.attributes;
			
			for(var key in attributes){
				
				if(feature.properties.hasOwnProperty(key)){
					
					properties[key] = {
							
						name : attributes[key],
						
						value : feature.properties[key],
						
						isImage  : data.image.includes(key) ? true : false		
						
					}
				}
					
			}		
			
			var content = Utils.feature.properties.toHTML(properties);
									
			return content;
			
		};
		
		function onLayerMouseover(e, data){
			
			if(!widget.active) return false;
			
			var feature = e.layer && e.layer.feature ? e.layer.feature : null;
															
			pop = L.popup().setLatLng(e.latlng).setContent( SetWindowContent(data, feature) ).openOn(Map);

		};
		
		function addHooks(){
			
			data.forEach(function(l){
				
				Layer = app.layers.get( l.layer );
				
				if(Layer){
															
					Layer.on('mouseover', function(e){
						
						onLayerMouseover(e, l)
						
					});	
					
					Layer.on('mouseup', function(e){
						
						if(pop) pop.remove();
						
					});	
					
				}				
				
			});
			
		}
				
		(function(){
			
			widget.on('activate', function(){			
				
				addHooks();
				
			});	
			
			widget.on('deactivate', function(){	
				
				if(pop) pop.remove();
				
			});	
			
						
		})();
		
	}

	GIS.widgets.register('mouseover', {
		
		init : Mouseover
		
	});
	
})();