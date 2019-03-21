(function(){
	
	function SearchWidget( widget, app ){
		
		var input, 
		
			layers,
			
			data = widget.data();
		
		function Search(){
			
			
			
		};
		
		function GetLayers(){
			
			if(data){
				
				if(data.layers && data.layers[0]){
					
					data.layers.forEach(function(l){
						
						var layer = app.layers.get( l.layer );
						
						console.log(layer)
						
					})
					
				}
				
			}
			
		};
		
		function SetEvents(){
			
			input = $('input',widget.html);
			
			input.on( 'keyup', Search );
			
		};
		
		(function(){
			
			widget.on( 'load-html', SetEvents );
			
			GetLayers();
			
		})();
	}

	GIS.widgets.register('search', SearchWidget);
	
})();