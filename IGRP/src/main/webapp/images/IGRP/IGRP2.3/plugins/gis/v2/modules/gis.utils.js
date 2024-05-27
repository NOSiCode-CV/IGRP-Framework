(function(){

	GIS.module('Utils', {
		
		feature : {
			
			getData : function(feature){
								
				var res = {},
					
					center,
					
					bounds,
					
					type;
				
				switch(feature.geometry.type){
					
					case 'Point':
						
						var point = L.latLng( feature.geometry.coordinates );
				
						bounds = L.latLngBounds(point, point);
						
						type  = 'Point';
						
					break;
					
					case 'LineString':
					case 'MultiLineString':
						
						var line = L.polyline( feature.geometry.coordinates );
						
						bounds =  line.getBounds();
						
						type  = 'Line';
						
					break;
					
					case 'Polygon':
					case 'MultiPolygon':
						
						var polygon  = L.polygon( feature.geometry.coordinates );
						
						bounds   =  polygon.getBounds();
						
						type  = 'Polygon';

					break;
				
				}
				
				center   = bounds.getCenter();
				
				return {
					
					type   : type,
					
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
							
							var prop = props[p] || '', name = p;
							
							if (props[p] && typeof props[p] != 'string'){
								
								prop = props[p].isImage ? '</br><img style="max-width:220px" src="'+props[p].value+'"/>' : (props[p].value ? props[p].value : '');
								
								name  = props[p].name;
							} 
							
							if(name || prop)
								html.append(
									'<li name="'+name+'">'+
										'<span class="gis-feature-property-label" style="'+ (name == '' ? 'margin-right: 0;' : '') +'" text-color="primary">'+name+'</span>'+
										 '<span class="gis-feature-property-value">' + prop  +'</span>' +
									'</li>'
								);
							
						}
						
					}
					
					var content = $('<div/>');
					
					content.prepend('<div id="gis-context-view" />');
					
					content.prepend(html);
										
					return content[0];
					
				}

			}

		},
		
		geometry : {
			
			point   : 'Point',
			
			pointCluster : 'PointCluster',
			
			polygon : 'Polygon',
			
			line    : 'Line'
			
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
		
		control : {
			
			mousePosition: {
				
				setMousePosition: function(e){
										
					var lat = L.Util.formatNum(e.latlng.lat, 6);
					
					var lng = L.Util.formatNum(e.latlng.lng, 6);
					
					var value = lat + ',' + lng;
					
					this._mouse_position = L.DomUtil.get('gis-mouse-position');
					
					this._mouse_position.innerHTML  = value;
					
				},
				
				setDefaultMousePosition: function(settings){
					
					if(!settings.center) return;
					
					this._mouse_position = L.DomUtil.get('gis-mouse-position');
					
					this._mouse_position.innerHTML  = L.Util.formatNum(settings.center[0], 6) + ',' + L.Util.formatNum(settings.center[1], 6);
					
				},
				
				add: function(map, settings){
					
					this.setDefaultMousePosition(settings);
					
					map.on('mousemove', this.setMousePosition, this);
								
					map.off('mousemove', this.setMousePosition);
					
				},
				
			},
			
			locate: {
				
				Clear: function(map){
					
					if(map.locateOptions.marker){
						
						map.removeLayer(map.locateOptions.marker)
						
						map.removeLayer(map.locateOptions.circle)
						
					}
						
					map.locateOptions.marker = null;
					
					map.locateOptions.circle = null;
					
				},
				
				onLocationFound: function(e, map) {
					
					this.Clear(map)
					
				    var radius = e.accuracy;

					map.locateOptions.marker = L.marker(e.latlng, {
						
						icon: L.divIcon({
		        			
		        		    html: '<i class="fa fa-lg fa-map-pin" style="color: #0085BA"></i>',
		        		    
		        		    iconSize: [30, 30],
		        		    
		        		    className: 'locate-marker-icon'
		        		    	
		        		  })
		        		  
					}).addTo(map).bindPopup("Você está aqui :)").openPopup();

					map.locateOptions.circle = L.circle(e.latlng, radius/3).addTo(map);
									    				    
				},
				
				onLocationError: function(e) {
				    console.log("Location Error:: " + e.message);
				},
				
				init: function(map){
					
					self = this;
					
					map.locateOptions.disativated  = false;	
					
					if(map.locateOptions.marker){
						
						this.Clear(map)
						
						return false;
						
					}
					
					map.locate({setView: true, watch: true});
					
					map.on('locationfound', function(e){
						
						self.onLocationFound(e, map)
						
					});
					
					map.on('locationerror', this.onLocationError);	
					
					map.on('moveend', function() {
						
						map.locateOptions.disativated = true;
		            	
		            	map.stopLocate()
		            	
					})
										
				},
				
			},
			
			scale: {
				
				_updateScale: function ( label, ratio, maxWidth) {
										
					this._label = L.DomUtil.get('gis-scale-label');
					
					this._label.innerHTML  = label;
					
					this._ruler = L.DomUtil.get('gis-scale-ruler');
										
					this._ruler.style.width = Math.round(maxWidth * ratio) + 'px';
										
				},
				
				_update: function (map) {
					
					var maxWidth = 100,
					
					    y = map.getSize().y / 2,
					
					    maxMeters = map.distance(
							map.containerPointToLatLng([0, y]),
							map.containerPointToLatLng([maxWidth, y]));
										
					    scale = new L.control.scale(),
					
					    meters = scale._getRoundNum(maxMeters);
					
					    label = meters < 1000 ? meters + ' m' : (meters / 1000) + ' km';
					
					this._updateScale(label, meters / maxMeters, maxWidth);
					    
				},
								
				add: function(map){
					
					this._update(map);
					
					map.on('move', function(){
						
						map.utils.scale._update(map)
						
					});	
					
					return this;
								
				}
				
			},
			
			lock: {
				
				add: function(map, settings){
					
					var bounds = localStorage.getItem("bounds-map"),
					
						highlight  = localStorage.getItem("highlightdivadmin-map");
					
					    _lock  = L.DomUtil.get('gis-lock-bounds');
					    					
					if(bounds){
						
						bounds = JSON.parse(bounds);						
					
						var ne = L.latLng([ bounds._northEast.lat, bounds._northEast.lng]),
							
							sw = L.latLng([ bounds._southWest.lat, bounds._southWest.lng]);
						
						map.fitBounds( L.latLngBounds(sw,ne) );		
						
						_lock.innerHTML = '<i class="fa fa-lock" aria-hidden="true"></i>';
						
					}
					
					if(highlight){
						
						highlight  = JSON.parse(highlight);
												
						$.getJSON(highlight.url, function(json) {
							
							L.geoJson(json, {
							    filter: function(feature, layer) {
							    	return feature.properties['code'] === highlight['code'];
							    },
							    style: function(feature) {
							    	if(feature.properties['code'] == highlight['code']){
							    		return {fillColor: '#3f0', color: '#0f0',fill:true, fillOpacity: 0.2}
							    	}
							    }
							}).addTo(map);
													
						});
						
					}
					
					return this;
								
				},
				
				click: function(map){
					
					var bounds = localStorage.getItem("bounds-map"),
					
					    _lock  = L.DomUtil.get('gis-lock-bounds');
					
					if(bounds){		
						
						_lock.innerHTML = '<i class="fa fa-unlock" aria-hidden="true"></i>';
						
						localStorage.removeItem("bounds-map");	
						
						localStorage.removeItem("highlightdivadmin-map");	
						
						if(map.highlightLayer)
							
							map.removeLayer(map.highlightLayer);
						
					}else{
						
						_lock.innerHTML = '<i class="fa fa-lock" aria-hidden="true"></i>';
						
						localStorage.setItem("bounds-map", JSON.stringify(map.getBounds()));	
						
						if (map.highlightdivadmin !== undefined)
							
							localStorage.setItem("highlightdivadmin-map", JSON.stringify(map.highlightdivadmin));	
						
					}				
					
				}
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
	
	//parse to int
	Handlebars.registerHelper('_toInt', function(str) {
				
		str = str || 0;
				
		return parseInt(str,10);

	});
	
	//parse to int
	Handlebars.registerHelper('Ative', function(otpion, value) {
						
		return otpion === value ? true : false;

	});
	
	Handlebars.registerHelper("inputIt", function(v, pclass, name, placeholder){
				
		var html = "";
		
		 //Generate the Input		  
		switch (typeof v) {
			
			  case "string":
			    v = Handlebars.Utils.escapeExpression(v);
			    html = '<input type="text" name="' 
			          + name + '" class="'+ pclass +'" placeholder="'+ placeholder +'" value="' + v + '" />';
			    break;
			  case "number":
			    html = '<input type="number" name="' 
			          + name + '" class="'+ pclass +'" placeholder="'+ placeholder +'" value="' + v + '" />';
			    break;
			  case "boolean":
			    var checked = (v) ? "checked" : "";
			    html = '<input type="checkbox" name="'
			          + name + '" ' + checked + ' class="'+ pclass +'" placeholder="'+ placeholder +'" />';
			        break;
		 }
		
		return new Handlebars.SafeString(html);
			
	});
})();