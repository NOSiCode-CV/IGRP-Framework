//https://weblab.gov.cv/weblabtour/index.htm
//"https://www.mapbox.com/bites/00188/patricia_nasa.webm",
//"https://www.mapbox.com/bites/00188/patricia_nasa.mp4"
(function(){
			
	function VideoWidget( widget, app ){
		
		var Map    = app.map.view,
		
			data = widget.data(),
			
			overlay = null;
			
		function SetResult(){
								
			var videoUrls = data.videoUrls,
			
			bounds = data.bounds ? L.latLngBounds( data.bounds ) : Map.getBounds();
					
			Map.fitBounds(bounds);
		
			overlay = L.videoOverlay(videoUrls, bounds, {
				opacity: 0.8,
				interactive: false,
				autoplay: true,
				crossOrigin: "anonymous"
			});
			
			Map.addLayer(overlay);	
		}
		
		function remove(){		
				
			 overlay.remove();
		}
		
		(function(){
			
			 widget.on('activate', function(){		
				 
				 SetResult();		 
				
			})
			
			widget.on('deactivate', function(){		
				 
				 remove();		 
				
			})
			
		})();
		
	}

	GIS.widgets.register('video', {
		
		init : VideoWidget
		
	});
	
})();