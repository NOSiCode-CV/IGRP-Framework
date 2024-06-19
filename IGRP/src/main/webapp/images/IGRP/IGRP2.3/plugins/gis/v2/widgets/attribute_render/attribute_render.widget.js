(function(){
	
	var utils = GIS.module('Utils');
		
	function AttributeRenderWidget( widget, app ){
		
		var Map    = app.map.view,
		
			Layers = app.layers.getLayers();
		
		function getRenders(legend){
			
			var rtn = [],
			
				rules = legend.rules;
			
			for(var key in rules){
				
				var o = {field : '', condition : '',  value : '', style : ''}, 
					
					rule = rules[key],
					
					filter = rule.filter || '',
				
					symbolizers  = rule.symbolizers[0];
					
				o.style = symbolizers.Polygon || (symbolizers.Point ? symbolizers.Point.graphics[0] : '') || symbolizers.Line || '';
													
				if(filter){
					
					var str = filter.replace('[','');
					
						str = str.replace(']','');
					
					    filterList = str.split('\'');
					    
					o.value = filterList[1];	
						
				    o.field = filterList[0].split(' ')[0];
						
					o.condition = filterList[0].split(' ')[1];									
				
				    if(o.condition == 'BETWEEN')
				    	
				    	o.value = [o.value, filterList[3]]						    		
																		
				}
				
				rtn.push(o);
				
			}
			
			return rtn;
			
		}
		
		/*• Styler Test PropertyIsEqualTo
		• Styler Test PropertyIsGreaterThanOrEqualTo
		• Styler Test PropertyIsLessThanOrEqualTo
		• Styler Test PropertyIsGreaterThan
		• Styler Test PropertyIsLessThan
		• Styler Test PropertyIsLike
		• Styler Test PropertyIsBetween*/
		
		function trataCondition(condition) {
			
			var rtn = '';
			
			switch(condition){
			
				case '=' : 
				
					rtn  = {
						isValid: function(r,p){
							
							var value = p[r.field];						 
														
							if(value)
							
								return !isNaN(value*1) ? (value == r.value) : (value.toLowerCase() == r.value.toLowerCase());
							
							return false;
								
						}
					}
					
					break;
					
				case '=>' : 
					
					rtn = 'PropertyIsGreaterThanOrEqualTo';
					
					break;
					
				case '<=' : 
					
					rtn = 'PropertyIsLessThanOrEqualTo';
					
					break;
				
				case '>' : 
					
					rtn = 'PropertyIsGreaterThan';
					
					break;
				
				case '<' : 
					
					rtn = 'PropertyIsLessThan';
					
					break;
					
				case 'like' : 
					
					rtn = 'PropertyIsLike';
					
					break;
				
				case 'BETWEEN' :
				case 'between' : 
					
					rtn = 'PropertyIsBetween';
					
					break;
					
				case '' :
					
					rtn  = {
						isValid: function(r,p){
							
							return r.style  || false;
								
						}
					}
					
					break;
			
			}
			
			return rtn;			
			
		}
		
		function setLayerStyles(layer, styles, type){
			
			var properties = layer.feature.properties;				
			
			for(var key in styles){
				
				var rule = styles[key],
				
				    condition = trataCondition(rule.condition),
				
					isValid = condition.isValid(rule, properties);
								
				if(isValid && type == utils.geometry.line)
					
					layer.setStyle({color: rule.style.stroke, fillOpacity: rule.style['stroke-opacity'], stroke:true, weight: rule.style['stroke-width']});

				else if (isValid && type == utils.geometry.polygon)
					
					layer.setStyle({fillColor: rule.style.fill, color: rule.style.stroke, fill: true, fillOpacity: rule.style['fill-opacity']});
			
			}			
			
		}

		
		(function(){
			
			Layers.forEach(function(layer){
				
				layer.on('data-loaded', function(d){					
									
					if(layer.getGeometryType() !== utils.geometry.point){						
						
						if(layer.Legend){
							
							var styles = getRenders(layer.Legend);
							
							if(styles)
								
								layer.eachLayer(function(fl) {
																											
									setLayerStyles(fl, styles, layer.getGeometryType())
									
								});
							
						}												
						
					}
					
				})	
				
			 });	
			 
		})();
		
	}

	GIS.widgets.register('attribute_render', {
		
		init : AttributeRenderWidget
		
	});
	
})();