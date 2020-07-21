(function(){
	
	var utils = GIS.module('Utils'),
	
		styles = {};
	
	GIS.module('Legends', {
		
		Get: function(data, feature){
			
			styles[data.id] = styles[data.id] || this.getRenders(data.Legend);
			
			return this.getStyle(feature, styles[data.id], data.geomType);			
		     		    										
		},
		
		GetLegend: function(data){
			
			if(data.type == 'WFS')
			
				$.get(data.url+'?service=WMS&request=GetLegendGraphic&layer='+data.options.typeName+'&version=1.0.0&format=application/json').then(function(json){
					
					data.Legend = json.Legend[0];
					
				});

		},
		
		getRenders: function(legend){
			
			var rtn = [],
			
				rules = legend !== undefined ? legend.rules : [];
									
			for(var key in rules){
				
				var o = {field : '', condition : '',  value : '', style : ''}, 
					
					rule = rules[key],
					
					filter = rule.filter || '',
				
					symbolizers  = rule.symbolizers[0];
					
				o.style = symbolizers.Polygon || (symbolizers.Point ? symbolizers.Point.graphics[0] : '') || symbolizers.Line || '';
													
				if(filter)
					
					o.condition = this.replace(filter)
					
				rtn.push(o);
				
			}
			
			return rtn;
			
		},
		
		getStyle: function(feature, styles, type){
			
			var rtn = {},
			
				properties = feature.properties;				
			
			for(var key in styles){
				
				var rule = styles[key],
				
				    isValid = this.isValid(rule, properties);				
				
				if(isValid && type == utils.geometry.line)
					
					rtn = {color: rule.style.stroke, fillOpacity: rule.style['stroke-opacity'], stroke:true, weight: rule.style['stroke-width']};
	
				else if (isValid && type == utils.geometry.polygon)
					
					rtn = {fillColor: rule.style.fill, color: rule.style.stroke, fill: true, fillOpacity: rule.style['fill-opacity'], weight: rule.style['stroke-width']};
				
				else if (isValid && type == utils.geometry.point)
					
					rtn = {color: rule.style.fill, fillOpacity: rule.style['fill-opacity']};
			
			}	
			
			return rtn;
			
		},
		
		replace: function(str){
			
			return str.replace('[','').replace(']','').replaceAll(' AND ',' && ').replaceAll(' OR ',' || ').replaceAll(' = ',' == ');
										
		},
		
		isReplaced: function(string, substring){
			
			if(string.indexOf(substring) !== -1)
				
				return true;				
				
			return	false;
		},
		
		isValid: function(r, properties){
			
			var condition = r.condition,  quote = '\'', space = ' ';
			
			if(!condition && r.style)
				
				return true;
						
			for(var key in properties){
				
				var value = !isNaN(properties[key]*1) ? properties[key] : quote + properties[key] + quote;
						
				condition = this.isReplaced(condition, key + space) ? condition.replaceAll(key + space, value + space) : condition;
				
			}
				
			return eval(condition);
		},
		
	});
	
})();