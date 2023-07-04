(function(){
   
	function InfoWindowWidget(widget, app){
		
		var utils  = GIS.module('Utils'),
		
			data   = widget.data(),
		
			Layers = app.layers.getLayers(),
			
			Layer  = null,
			
			pop    = null;
		
		function GetFeatureProperties(feature, wich){
			
			var properties = {};
			
			if(wich){
				
				var arr = typeof wich === 'string' ? wich.split(',') : wich;

				arr.forEach(function(a){
					
					if(feature.properties.hasOwnProperty(a))
						
						properties[a] = feature.properties[a];
					
				});
				
			}
			
			return properties;
			
		};
		
		function SetWindowContent(feature, attributes, area){
			
			var visibleAttrs = !attributes || attributes == '*' ? feature.properties : GetFeatureProperties(feature, attributes);
			
			if(area) visibleAttrs.area_calculada = area;
					
			var	content 	 = utils.feature.properties.toHTML( visibleAttrs );
			
			return content;
			
		};
		
		function getArea(obj) {
			
			if(obj instanceof L.Marker || obj instanceof L.CircleMarker) return;
			
			var latLngs  =  obj.getLatLngs();
						 			
		    var area =  L.GeometryUtil.geodesicArea(latLngs[0][0]);
	
			return utils.L.Geometry.readableArea(area, 'metric');
		  
		};
		
		function onLayerClick(e){
								
			var feature = e.layer && e.layer.feature ? e.layer.feature : null,
				
			 	area = getArea(e.layer);
												
			if(feature)
		
				pop = L.popup().setLatLng(e.latlng).setContent( SetWindowContent(feature, Layer.attributes, area) ).openOn(app.viewer());

		};
		
		function Enabled(){
		
			if(Layers){
				
				Layers.forEach(function(l){
					
					Layer = app.layers.get( l.id );
									
					if(Layer)
						
						Layer.on('click', onLayerClick, this);	
					
				});
				
			}
			
		};
		
		function Disable(){
			
			if(Layers){
				
				Layers.forEach(function(l){
					
					var layer = app.layers.get( l.id );
					
					if(layer)
						
						layer.off('click', onLayerClick, this);
						
				});
				
			}
			
			if(pop)
				
				pop.remove();
			
		};
		
		
		(function(){
			
			widget.on( 'activate', function(){
				
				Enabled();
				
			});
			
			widget.on( 'deactivate', function(){
				
				Disable();
				
			});
									
		})();
		
	};
	
	GIS.widgets.register('infowindow', {
		
		init : InfoWindowWidget
		
	});
	
})();