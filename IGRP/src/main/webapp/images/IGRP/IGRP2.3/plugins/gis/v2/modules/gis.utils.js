(function(){

	GIS.module('Utils', {
		
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
										
					var title = $('<h3 class="title" />');
					
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
										
					return html[0];
					
				}

			}

		},
		
		geometry : {
			
			point   : 'POINT',
			
			polygon : 'POLYGON',
			
			line    : 'LINE'
			
		},
		
		templates : {
			
			render : function(template, data){
				
				var template = Handlebars.compile( template );
				
		 	 	return  template( data );
				
			}
			
		},
		
		L : {
			
			Geometry : {
				
				readableArea: function (area, isMetric) {
					
					var areaStr;
	
					if (isMetric) {
						
						if (area >= 10000) {
							
							areaStr = (area * 0.0001).toFixed(2) + ' ha';
							
						} else {
							
							areaStr = area.toFixed(2) + ' m²';
							
						}
						
					} else {
						
						area *= 0.836127; // Square yards in 1 meter
	
						if (area >= 3097600) { //3097600 square yards in 1 square mile
							
							areaStr = (area / 3097600).toFixed(2) + ' mi²';
							
						} else if (area >= 4840) {//48040 square yards in 1 acre
							
							areaStr = (area / 4840).toFixed(2) + ' acres';
							
						} else {
							
							areaStr = Math.ceil(area) + ' yd²';
							
						}
						
					}
	
					return areaStr;
				},				
			
				toDegreesMinutesAndSeconds: function(coordinate) {
					
				    var absolute = Math.abs(coordinate);
				    
				    var degrees = Math.floor(absolute);
				    
				    var minutesNotTruncated = (absolute - degrees) * 60;
				    
				    var minutes = Math.floor(minutesNotTruncated);
				    
				    var seconds = ((minutesNotTruncated - minutes) * 60).toFixed(2);
	
				    return degrees + "° " + minutes + "' " + seconds + '"';
				    
				},
				
				toDMS_lat: function(lat) {
					
				    var latitude = this.toDegreesMinutesAndSeconds(lat);
				    
				    var latitudeCardinal = lat >= 0 ? "N" : "S";
	
				    return latitude + " " + latitudeCardinal;
				    
				},
				
				toDMS_lng: function(lng) {
					
				    var longitude = this.toDegreesMinutesAndSeconds(lng);
				    
				    var longitudeCardinal = lng >= 0 ? "E" : "W";
	
				    return longitude + " " + longitudeCardinal;
				    
				}
			
			}
			
		},
		
		shp: {
			
			getFile: function(files){
						        
		        if (files.length == 0) return;				

		        var file = files[0];

		        if (file.name.slice(-3) != 'zip'){ 
		        	
		            $.IGRP.notify({
		            	
		            	message : 'Select .zip file!',
	        			
	        			type    : 'warning'
		            	
		            })
		            
		            return;
		            
		        } else {
		        	
		            return file;
		            
		        }

		    },
		    
		    HandleZipFile: function(file){
		    	
		    	return new Promise(function(resolve, reject) {
				
					var reader = new FileReader();
					
			        reader.onload = function(){
			        	
			            if (reader.readyState != 2 || reader.error){
			            	
			                return;
			                
			            } else {
			            				            	
			            	resolve(reader.result)
			                
			            }
			        }
			        
			        reader.readAsArrayBuffer(file);
			        
		    	});
				
			},
		},

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