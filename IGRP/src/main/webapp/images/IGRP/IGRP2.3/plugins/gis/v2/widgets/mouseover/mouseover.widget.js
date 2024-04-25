(function(){
	
	var Utils = GIS.module('Utils'),
	
		Templates  = GIS.module('Templates');
	
	function Mouseover( widget, app ){
		
		var Map = app.viewer(),
		
			Layers = app.layers.getLayers(),
			
			data   = widget.data(),
			
			pop    = null,
			
			delay = 600, 

            overTimeout;
						
		function SetWindowContent(data, feature){
						
			var properties    = [],
							
				attributes = data.attributes;
			
			for(var i in attributes){
				
				var key = attributes[i].name,
				
				    value = attributes[i].value,
				    
				    type = attributes[i].type;	
				
				if(feature.properties.hasOwnProperty(key.toLowerCase())){
										
					properties[key.toLowerCase()] = {
							
						name : value,
						
						value : type === 'DATE' && feature.properties[key.toLowerCase()] ? new Date(feature.properties[key.toLowerCase()]).toLocaleDateString("pt") : feature.properties[key.toLowerCase()],
						
						isImage  : type === 'IMAGE' ? true : false		
						
					}
				}
				
				if(feature.properties.hasOwnProperty(key.toUpperCase())){
					
					properties[key.toLowerCase()] = {
							
						name : value,
						
						value : type === 'DATE' && feature.properties[key.toUpperCase()] ? new Date(feature.properties[key.toUpperCase()]).toLocaleDateString("pt") : feature.properties[key.toUpperCase()],
						
						isImage  : type === 'IMAGE' ? true : false		
						
					}
					
				}
									
			}		
						
			var content = Utils.feature.properties.toHTML(properties);
									
			return content;
			
		};
		
		function onLayerMouseover(e, data){
						
			if(!widget.active) return false;
			
			var feature = e.layer && e.layer.feature ? e.layer.feature : null;
												
			overTimeout = setTimeout(function(){
				
				pop = L.popup().setLatLng(e.latlng).setContent( SetWindowContent(data, feature) ).openOn(Map);
			
				Map.fire('addMouseover', data);
				
			}, delay);
		};
		
		function addHooks(){
			
			data.forEach(function(l){
				
				Layer = app.layers.get( l.layer );
				
				if(Layer){
															
					Layer.on('mouseover', function(e){
						
						onLayerMouseover(e, l)
						
					});	
					
					Layer.on('mouseup', function(e){
						
						if(pop) pop.remove();
						
					});	
					
					Layer.on('mouseout', function(e){
						
						var target = e.originalEvent.toElement || e.originalEvent.relatedTarget;
						
						if(!target) return false;
												
						if (_getParent(target, "leaflet-popup")) {
							
							if(pop)
								
								L.DomEvent.on(pop._container, "mouseout", _popupMouseOut, this);
							
							return true;
		 
						}
						
						if(pop) pop.remove();
						
                        clearTimeout(overTimeout);

                        clearSelected();
                        
                     });
					
				}				
				
			});
			
		}
		
		function _popupMouseOut(e){
						
			L.DomEvent.off(pop, "mouseout", _popupMouseOut, this);
	 
			var target = e.toElement || e.relatedTarget;
			
			if (_getParent(target, "leaflet-popup"))
				return true;
			
			if (target == this._icon)
				return true;
			
			if(pop) pop.remove();
		}
		
		function clearSelected(){

            $(widget.html, 'image[selected="true"]').each(function(i,img){

              img.removeAttribute('selected');

            });
           
        }
		
		function _getParent(element, className) {
			
			if(!element.parentNode)
				
				 return false;
			
			var parent = element.parentNode;
			
			while (parent != null) {
				
				if (parent.className && L.DomUtil.hasClass(parent, className))
					return parent;
				
				parent = parent.parentNode;
				
			}
			
			return false;
			
		}
				
		(function(){
			
			jQuery(document).on('mousedown contextmenu',function(){

			    if(pop) pop.remove();

                clearTimeout(overTimeout);

                clearSelected();

            });
			
			Map.on('zoomstart',function(){

			  if(pop) pop.remove();

              clearTimeout(overTimeout);

              clearSelected();

           });
			
			widget.on('activate', function(){			
				
				setTimeout(function(){
					
					addHooks();
					
				},500);
							
			});	
			
			widget.on('deactivate', function(){	
				
				if(pop) pop.remove();
				
			});	
						
		})();
		
	}

	GIS.widgets.register('mouseover', {
		
		init : Mouseover
		
	});
	
})();