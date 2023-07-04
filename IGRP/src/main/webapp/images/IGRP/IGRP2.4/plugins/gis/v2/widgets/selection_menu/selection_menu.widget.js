(function(){
	
	var Utils = GIS.module('Utils'),
	
		Templates  = GIS.module('Templates');
	
	function SelectionMenuWidget( widget, app ){
		
		var Map = app.viewer(),
		
			Layers = app.layers.getLayers(),
			
			data   = widget.data();	
		
		function getParamenters(item, properties){
			
			var params = {},
			
			    attributes = item.attributes ? item.attributes.split(',') : [],
			    		
			    param_name = item.param_name ? item.param_name.split(',') : [],
			    		
			    param_value = item.param_value ? item.param_value.split(',') : [];
		    
		    
		    for(var key in properties){ 
		    			    	
		    	if (attributes.includes(key.toLowerCase())) params['p_' + key.toLowerCase()] = properties[key];
				
				else if (attributes.includes(key.toUpperCase())) params['p_' + key.toLowerCase()] = properties[key];
		    }
			
			if(param_name.length = param_value.length )
				
				for(var key in param_name) params[param_name[key]] = param_value[key];
			
			return params;
		}
		
		function toIGRPParam(pParams){
	
			var res = '';
			
			for (var key in pParams){
				
				res += (res ? '|' : '') + key + ':' + pParams[key];
					
			}
			
			return {p_param : res};
		}
				
		function SetWindowContent(menu, feature){
						
			var content    = '<ul class="list-group">',
			
				properties = feature.properties;
			
			menu.forEach(function(item){
				
				var params = getParamenters(item, properties);
				
				if(item.type && item.type == 'IGRP')
					
					params = toIGRPParam(params);
									
				content += Templates.Widgets.selectionMenu( item, params );
			
			});
			
			return content + '</ul>';
			
		};
		
		function onLayerClick(e, menu){
						
			var feature = e.layer && e.layer.feature ? e.layer.feature : null;
									
			L.popup({className: 'widget-selection-menu'}).setLatLng(e.latlng).setContent( SetWindowContent(menu, feature) ).openOn(Map);

		};
		
		function Init(){
			
			data.menus.forEach(function(l){
				
				Layer = app.layers.get( l.layer );
				
				if(Layer){
					
					if(data.display !== 'mouseover')
						
						Layer.on('contextmenu', function(e){
							
							onLayerClick(e, l.menu)
							
						});	
					
					else
						
						Layer.on('mouseover', function(e){
							
							var feature = e.layer && e.layer.feature ? e.layer.feature : null;
							
							Map.on('addMouseover', function(data){
															
								var html = $('#gis-context-view')
								
								html.empty();
								
								if(data.layer == l.layer)
									
									html.append(SetWindowContent(l.menu, feature));
								
							})
							
						});
					
				}
					
			});
			
		}
		
		(function(){
			
			Init();
			
		})();
		
	}

	GIS.widgets.register('selection_menu', {
		
		init : SelectionMenuWidget
		
	});
	
})();