(function(){
	
	var utils = GIS.module('Utils');
	
	function LegendWidget( widget, app ){
		
		var Map = app.map.view,
		
			addedLegend = false,
					
			Layers  = app.layers.getLayers(),
			
			timeout = function(){};
			
		function UniqueID(){
			
			 return Date.now();
			 
		}
		
		function getCSS(jsonCSS) {
			
		     var style = '';
		    
		     for (var prop in jsonCSS) {
		         style += prop + ":" + jsonCSS[prop] + '; ';
		     }
		     
			 return style;
		}
				
		function Load(){
			
			var Results = [], filters = [];
			
			Layers.forEach(function(l){
												
				var items = [],				
											    
				    layer = l.data(),
				    
				    legend = l.Legend;
				
				if(!l.visible) return this;
												
				var rules = legend !== undefined ? legend.rules : '';
				
				if(!rules) return this;
												
				for (var i in rules) {
										
					var item = {},
					
						symbolizers = rules[i].symbolizers[0];	
					
					if(rules.length > 1)
						
						item.label = rules[i].name;
					
					var id = layer.id + i;
					
					filters.push({active: true, id: id, layerid: layer.id, filter: rules[i].filter});
										
					items.push(item);
					
					item.id = id;
					
					if(symbolizers.Point){
						
						var point = symbolizers.Point,
						
							style = point.graphics[0],
							
							o     = {};
						
						o.color = style.fill; 
						
						item.icon = point.url && style.mark !== 'x' ? point.url : GIS.module('Templates').Layers.svg(o);
						
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
	                    
	                    var entries = colormap ? colormap.entries : [];
	                    
	                    for(var i3 in entries){
	                        
	                        item.style =  "color: "+ entries[i3].color;
	
	                        item.label = entries[i3].label + ' - ' + entries[i3].quantity;
	                    	
							item.raster = true;
	                        
	                    }
	                }
					
				}
								
				widget.filters = filters;
									
				Results.push({
					
					title : layer.name,
					
					items : items,
					
					layerId : layer.id
					
				});	
								
				SetResults( Results );
				
				addedLegend = true;
					
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
		
		function getFilter(object, layer, callback){
			
			var res = '', allActive = true,
			
				filters	= widget.filters.filter(function(b){ return b.layerid == layer.id }) || {};

			for (var key  in filters){
				
				if (allActive) allActive = filters[key].active ? true : false;
					
				res += filters[key].active ? filters[key].filter : '';
				
			}
					
			res = res.replace('][',' OR ').replace(']','').replace('[','');
			
			layer.options.cql_filter = !allActive ? ( res ? res : '1 = 0' ) : '';
						
			if(callback)
				
				callback();			
			
		}
		
		function SetEvents(){
						
			Load();
			
			Map.on('removelayer', Load);
			
			Map.on('addlayer', Load);
			
			Map.on('legend-added', Load);
			
			widget.html.on('change', '.legend-check', function(){
								
				var item    = $(this),				
				
					id 	    = item.attr('legend-id'),
					
					layerid = item.attr('layer-id'),
					
					layer   = app.layers.get(layerid);
								
				var	filter	= widget.filters.filter(function(b){ return b.id == id })[0] || {};
								
				if (!this.checked) {
					
					item.parent().removeClass('active');
					
					filter.active = false;
					
				}else{
					
					item.parent().addClass('active');
					
					filter.active = true;
					
				}
				
				getFilter(widget.filters, layer, function(){
					
					layer.updateData();
					
				});
								
			});
			
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