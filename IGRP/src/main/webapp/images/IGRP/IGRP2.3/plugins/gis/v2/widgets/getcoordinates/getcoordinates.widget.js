(function(){
	
	var utils = GIS.module('utils');
	
	function GetCoordinatesWidget( widget, app ){
		
		var Map = app.map.view,
		
			DrawLayer, DrawControl, DrawTool, EditTool;

		widget.action('activate', function(){
			
			if(!widget.addedMarker)
				
				DrawTool.enable();
			
		});
		
		widget.action('drawend', function(marker){
			
			try{
				
				widget.addedMarker = marker;
				
				widget.addedMarker.addTo(DrawLayer);
				
				if( widget.data().editable != false )
				
					EditTool.enable();
				
				widget.events.trigger('draw-end');
				
			}catch(err){
				
				console.log(err);
				
			}
			
		})
		
		widget.action('confirm', function(){
			
			var data   = widget.data(),
			
				latLng = widget.addedMarker.getLatLng();
			
			if(data){
				
				if(data.parent_field_name){
					
					var parent      = window.parent,
					
						parentField = $('[name="'+data.parent_field_name+'"]',parent.document);
					
					parentField.val( latLng.lat+','+latLng.lng );
					
					try{
						
						if(parent && parent.$.IGRP.components.iframeNav)
							
							parent.$.IGRP.components.iframeNav.hide()
						
					}catch(error){
						
						console.log(error);
						
					}

				}
				
			}
			
		});
		
		widget.action('cancel', function(){
			
			Clear();
			
			widget.actions.activate();
			
		});

		
		function Clear(){
			
			if(DrawTool && DrawTool.disable)
				
				DrawTool.disable();
			
			if(EditTool && EditTool.disable)
				
				EditTool.disable();
			
			DrawLayer.clearLayers();
			
			widget.addedMarker = null;
			
		}
		
		function Init(){

			DrawLayer   = new L.FeatureGroup();
			
			DrawControl = new L.Control.Draw({
			    
			    edit: {
			    	
			        featureGroup: DrawLayer
			        
			    }
			    
			});
			
			DrawTool   = new L.Draw.Marker( Map );
			
			EditTool   = new L.EditToolbar.Edit( Map, DrawControl.options.edit );
			
			DrawLayer.addTo( Map );
			
			Map.on( L.Draw.Event.CREATED, function (e) {
				
				widget.actions.drawend( e.layer );
				
			});
			
			if(widget.options.data && widget.options.data.latLng){
				
				var marker  	  = L.marker( widget.options.data.latLng ),
				
					latLngs 	  = [ marker.getLatLng() ],
				 
				 	markerBounds  = L.latLngBounds(latLngs);
				 
				 Map.fitBounds(markerBounds);
				
				 widget.on('load-html', function(){
				 	
					 widget.actions.drawend( marker );
					
				 });
				
			}

			widget.on('activate', widget.actions.activate );
			
			widget.on('deactivate', Clear );

		}
		
		Init();
		
	};

	GIS.widgets.register('getcoordinates', {
		
		dependencies : {
				
			js  : [ 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js' ],
			
			css : [ 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css' ]
				
		},
		
		init : GetCoordinatesWidget
		
	});
	
})();
