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