(function(){

	GIS.module('Utils', {
		
		test : 'Test',

		feature : {
			
			getData : function(feature){
				
				var res = {},
					
					center,
					
					bounds;
				
				switch(feature.geometry.type){
					
					case 'Point':
						
						var point = L.latLng( feature.geometry.coordinates );
				
						bounds = L.latLngBounds(point, point);
						
					break;
					
					case 'MultiLineString':
						
						var line = L.polyline( feature.geometry.coordinates );
						
						bounds =  line.getBounds();
						
					break;
					
					case 'Polygon':
					case 'MultiPolygon':
						
						var polygon  = L.polygon( feature.geometry.coordinates );
						
						bounds   =  polygon.getBounds();

					break;
				
				}
				
				center   = bounds.getCenter();
				
				return {
					
					center : JSON.stringify(center),
					
					bounds : JSON.stringify(bounds),
					
					id : feature.id
					
				}
				
			},
			
			properties : {

				isNumber : {

					id : true,

					objectid : true,

					shape_area : true,

					shape_len : true

				},
				
				toHTML : function(props){
					
					var html = $('<ul class="gis-feature-properties-view" />');
					
					if(props){
						
						for(var p in props){
							
							var prop = props[p] || '';
							
							html.append(
								'<li name="'+p+'">'+
									'<span class="gis-feature-property-label" text-color="primary">'+p+'</span>'+
									'<span class="gis-feature-property-value">'+prop+'</span>'+
								'</li>'
							);
							
						}
						
					}
					
					console.log(html)
					
					return html[0];
					
				}

			}

		},
		
		geometry : {
			
			
			
		}
		

	});
	
	/* HandleBars Functions */
	var utils = GIS.module('Utils');
	
	//get feature center helper to use inside widget html
	Handlebars.registerHelper('GetFeatureData', function(feature, v) {
		
		var object = utils.feature.getData( feature );
		
		return object[v] || '';
		
	});
	//check if index is 0 and return given class name
	Handlebars.registerHelper('FirstTabActiveClass', function(index, clss) {
		
		clss = clss || 'active';
	
		return index == 0 ? clss : '';

	});

})();