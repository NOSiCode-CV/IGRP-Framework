(function(){
	
	var utils = GIS.module('utils');
	
	function AddPointWidget( widget, app ){
		
		var data   = widget.data(), 
		
			Layers = [];

		function GetLayers(){
			
			if(data){
				
				if(data.layers && data.layers[0]){
					
					data.layers.forEach(function(l){
				
						var layer = app.layers.get( l.layer );
			
						if(layer)
							
							Layers.push({
								
								layer : layer,
								
								fields : l.fields ? l.fields.split(' ') : []
								
							});
						
					});
					
				}
				
			}
			
		};
		
		(function(){
			
			GetLayers();
			
			widget.on('activate', function(){
				
				console.log('active')
			
			});
			
			
		})();
		
	}

	GIS.widgets.register('addpoint', AddPointWidget);
	
})();