(function(){
	
	var utils = GIS.module('Utils');
	
	function LegendWidget( widget, app ){
		
		var Map = app.map.view,
		
		request = null, addedLegend = false,
				
		Layers  = app.layers.getLayers(),
		
		timeout = function(){};
		
		function getCSS(jsonCSS) {
			
		     var style = '';
		    
		     for (var prop in jsonCSS) {
		         style += prop + ":" + jsonCSS[prop] + '; ';
		     }
		     
			 return style;
		}
		
		function GetRequest(l){
												
			var params = {
				
	            request: 'GetLegendGraphic',
	            
	            service: 'WMS', 
	            
	            version: '1.1.0',
	            
	            layer: l.workspaceLayer,  
	            
	            format : 'application/json',
	            
	        };
			
			return $.get( l.owsURL, params );
		
		}
		
		function Load(){
			
			var reqs    = [],
			
				Results = [];
			
			Layers.forEach(function(l){
								
				var info = l.Info,
				
				    req  = GetRequest(info),
				    
				    layer = l.data();
				
				if(!l.visible) return this;
				
				req.then(function(f){
					
					var legend = f.Legend[0];
															
					var rules = legend.rules,
					
						items = [];
										
					for (var i in rules) {
						
						var symbolizers = rules[i].symbolizers[0];	
						
						var label = rules[i].name !== 'rule1' ? rules[i].name : '',
							
							item = {label : label};
						
						items.push(item);
						
						if(symbolizers.Point){
							
							var point = symbolizers.Point;
							
							item.style = getCSS(point.graphics[0]);
							
							item.point = true;
							
                        }else if(symbolizers.Polygon){
                        	
                        	item.style = getCSS(symbolizers.Polygon);
                        	
							item.polygon = true;
							
                        }else if(symbolizers.Line){

                        	item.style = getCSS(symbolizers.Line);
                        	
							item.line = true;

                        }else if(symbolizers.Raster){

                            var raster = symbolizers.Raster;
                            
                            var colormap = raster.colormap;
                            
                            var entries = colormap.entries;
                            
                            for(var i3 in entries){
                                
                                item.style =  "color: "+ entries[i3].color;

                                item.label = entries[i3].label + ' - ' + entries[i3].quantity;
                            	
    							item.raster = true;
                                
                            }
                        }
						
					}
										
					Results.push({
						
						title : layer.name,
						
						items : items
						
					});	
					
					SetResults( Results );
					
					addedLegend = true;
					
				});
				
				//widget.loading(false);
				
			});	
					
			SetResults( Results );
			
		};
		
		function SetResults(legends){
			
			try{

				widget.setTemplateParam('legends', {
					
					total  	      	 : legends.length,
		 	 		
		 	 		noResultsMessage : 'Não foram encontrados legenda.',
		 	 		
		 	 		legends     	 : legends
					
				});
												
			}catch(err){
				
				console.log(err)
				
			}
			
		};
		
		function SetEvents(){
			
			/*clearTimeout(timeout);

			timeout = setTimeout(Load, 600 );
			
			widget.loading(true);*/
			
			Load();
			
			Map.on('removelayer', Load);
			
			Map.on('addlayer', Load);
			
		};
		
		
		(function(){
			
			widget.on( 'activate', function(){
				
				SetEvents();
				
			});
											
		})();
	}
	
	GIS.widgets.register('legend', {
				
		init : LegendWidget
		
	});
	
})();