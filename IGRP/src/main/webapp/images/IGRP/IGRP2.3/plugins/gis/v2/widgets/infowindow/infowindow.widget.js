(function(){

	function InfoWindowWidget(widget, app){
		
		var Utils  = GIS.module('Utils'),
		
			data   = widget.data(),
		
			Layers = [];
		
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
		
		function SetWindowContent(feature, attributes){
			
			var visibleAttrs = !attributes || attributes == '*' ? feature.properties : GetFeatureProperties(feature,attributes),
					
				content 	 = Utils.feature.properties.toHTML( visibleAttrs );
			
			return content;
			
		};
		
		function GetLayers(){
			
			if(data && data.layers && data.layers[0]){
				
				data.layers.forEach(function(l){
					
					var layer = app.layers.get( l.layer );
					
					if(layer){
						
						layer.on('click', function (e) {
							
							var feature = e.layer && e.layer.feature ? e.layer.feature : null;
							
							if(feature)
						
								var pop = L.popup().setLatLng(e.latlng).setContent( SetWindowContent(feature, l.attributes) ).openOn(app.viewer());

						});
						
					}
					
				});
				
			}
			
		};
		
		GetLayers();
		
	};
	
	GIS.widgets.register('infowindow', {
		
		init : InfoWindowWidget
		
	});
	
})();