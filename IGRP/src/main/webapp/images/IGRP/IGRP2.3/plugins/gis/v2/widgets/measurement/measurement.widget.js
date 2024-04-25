(function(){
	
	var utils = GIS.module('Utils');
	
	function MeasurementWidget( widget, app ){
		
		var Result = {length : null, area: null, lastPoint: {}}, LastPoint = {},
		
		 	Map     = app.map.view,
		 	
		 	DrawLayer, DrawControl, DrawTool, EditTool, isMeasurement = false;
		
		widget.drawStart = null;
		
		widget.drawHelp = null;
			
		function Clear(){
			
			if(DrawTool && DrawTool.disable)
				
				DrawTool.disable();
			
			if(EditTool && EditTool.disable)
				
				EditTool.disable();
			
			if(DrawLayer)
			
				DrawLayer.clearLayers();				
			
			SetResult(Result);
			
			widget.drawStart = null;
						
		};
		
		function getLength(obj) {
			 
		    var distance =  L.GeometryUtil.length(obj.getLatLngs());
		    
		    //@param {String} unit 'metric' or 'imperial'
		    return L.GeometryUtil.readableDistance(distance,'metric');
		    
		};
		
		function getArea(obj) {
			
			var latLngs  =  obj.getLatLngs();
			 			
		    var area =  L.GeometryUtil.geodesicArea(latLngs[0]);
		    
			return utils.L.Geometry.readableArea(area, 'metric');
		  
		}
		
		function SetResult(result){
			
			widget.setTemplateParam('measurement', {
				
				length  	     : result.length,
				
				area			 : result.area,
				
				lastPoint        : result.lastPoint
				
			});
			
			Result = {}
			
		}
		
		function Init(){

			DrawLayer   = new L.FeatureGroup();
			
			DrawControl = new L.Control.Draw({
			    
			    edit: {
			    	
			        featureGroup: DrawLayer
			        
			    }
			    
			});
						
			EditTool   = new L.EditToolbar.Edit( Map, DrawControl.options.edit );
									
			DrawLayer.addTo( Map );
	
			Map.on( L.Draw.Event.CREATED, function (e) {
				
				var layer = e.layer;
				
				widget.actions.drawend(layer);
													
			});
			
			Map.on( L.Draw.Event.DRAWVERTEX, function (e) {
				
				var point = null;
				
				e.layers.eachLayer(function(layer){
					
					 point = layer.getLatLng();
					 					
				})
				
				LastPoint.lat = point.lat.toFixed(6);
					 
				LastPoint.lng = point.lng.toFixed(6);
				
				LastPoint.lat_c = utils.L.Geometry.toDMS_lat(LastPoint.lat);
				
				LastPoint.lng_c = utils.L.Geometry.toDMS_lng(LastPoint.lng);
				 				
				Result.lastPoint = LastPoint;
				
				SetResult(Result);
								
				widget.html.find('.widget-step[step-id="help"]').removeClass('active');
																	
			});			
			
		};
					    
		widget.action('measure-length', function(){
			
			Clear();
												
			DrawTool = new L.Draw.Polyline( Map );
			
			DrawTool.enable();
						
			widget.drawStart = true;
			
			widget.drawHelp  = true;
									
		});
		

		widget.action('measure-area', function(){			
			
			Clear();
						
			DrawTool = new L.Draw.Polygon( Map );
			
			DrawTool.enable();
			
			widget.drawStart = true;
			
			widget.drawHelp  = true;
			
		});
		
		widget.action('finish', function(){
			
			DrawTool.disable();
			
			widget.toggle();
			
		});
		
		widget.action('cancel', function(){

			Clear();	
						
		});
		
		widget.action('drawend', function(layer){
			
			DrawLayer.addLayer(layer);
			
			if (layer instanceof L.Polygon) {
				
				Result.area = getArea(layer);
									
			}else if(layer instanceof L.Polyline){
				
				Result.length = getLength(layer);
				
			}
			
			Result.lastPoint = LastPoint;
			
			SetResult(Result);
			
			widget.drawHelp  = null;
						
		});
		
		(function(){
			
			widget.on('activate', function(){
				
				Init();
				
				widget.steps.measure.activate();
				
			});
									
			widget.on('deactivate', function(){
				
				Clear();
								
			});
			
		})();
	}
	
	GIS.widgets.register('measurement', {
				
		init : MeasurementWidget
		
	});
	
})();