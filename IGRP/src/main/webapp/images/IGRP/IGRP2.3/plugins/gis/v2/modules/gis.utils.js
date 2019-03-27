(function(){

	GIS.module('utils', {
		
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

})();