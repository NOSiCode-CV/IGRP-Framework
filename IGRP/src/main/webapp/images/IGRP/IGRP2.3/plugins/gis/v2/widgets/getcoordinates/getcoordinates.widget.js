(function(){
	
	var utils = GIS.module('Utils');
	
	function GetCoordinatesWidget( widget, app ){
		
		var Map = app.map.view,
		
		    data   = widget.data(),
		
			DrawLayer, DrawControl, DrawTool, EditTool;
		
		widget.action('start', function(){
			
			if(!widget.addedMarker)
				
				DrawTool.enable();
			
		});
		
		widget.action('drawend', function(marker){
			
			try{
				
				widget.addedMarker = marker;
				
				if(DrawLayer)
				
					widget.addedMarker.addTo(DrawLayer);
				
				if( widget.data().editable != false )
				
					EditTool.enable();
				
				widget.events.trigger('draw-end');
				
			}catch(err){
				
				console.log(err);
				
			}
			
		})
		
		widget.action('confirm', function(){
			
			var latLng = widget.addedMarker.getLatLng();
			
			if(data){
				
				if(data.parent_field_name){
					
					var parent      = window.parent,
					
						parentField = $('[name="'+data.parent_field_name+'"]',parent.document);
					
					parentField.val( latLng.lat+','+latLng.lng );

					if(parentField.hasClass('IGRP_change') || parentField.attr('change') == 'true' || parentField.is('[igrp-remote]')){

						if( parentField[0].events ){
							parentField[0].events.execute('lookup-change',{
								o : parentField
							});
						}
					}
					
					data.latLng = [ latLng.lat, latLng.lng ];
					
					try{
						
						if(parent && parent.$.IGRP.components.iframeNav)
							
							parent.$.IGRP.components.iframeNav.hide()
						
					}catch(error){
						
						console.log(error);
						
					}
					
					Disable();
					
				}
				
			}
			
		});
		
		widget.action('cancel', function(){
			
			Clear();
			
			widget.actions.start();
			
		});

		
		function Clear(){
			
			if(DrawTool && DrawTool.disable)
				
				DrawTool.disable();
			
			if(EditTool && EditTool.disable)
				
				EditTool.disable();
			
			DrawLayer.clearLayers();
			
			widget.addedMarker = null;			
						
		}
		
		function Disable(){
			
			//DrawTool.disable();
					
		}
		
		function LoadData(){
			
			if(data && data.latLng){
				
				var marker  	  = L.marker( data.latLng ),
				
					latLngs 	  = [ marker.getLatLng() ],
				 
				 	markerBounds  = L.latLngBounds(latLngs),
				 	
				 	maxZoom       = data.zoom || null;			
				 
				 Map.fitBounds(markerBounds, {maxZoom : maxZoom});
				 
				 widget.actions.drawend( marker );
				
				 widget.on('load-html', function(){
					 
					 widget.actions.drawend( marker );
					
				 });		
				 
			}		
			
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
			
			LoadData();
						
		}
		
		(function(){
			
			Init();
						
			widget.on('activate', function(){
				
				widget.actions.start()
							
			});
			
			widget.on('deactivate', function(){				
				
				Clear();
				
				LoadData();
				
			});			
			
		})();
		
	};

	GIS.widgets.register('getcoordinates', {
		
		init : GetCoordinatesWidget
		
	});
	
})();
