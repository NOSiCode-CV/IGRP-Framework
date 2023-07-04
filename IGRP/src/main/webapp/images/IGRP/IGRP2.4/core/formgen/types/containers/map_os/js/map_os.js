(function(){

	var GEN = VARS.getGen(),

		layersList,

		layersOptions;

	GEN.Request.get( path+'/core/formgen/types/containers/map_os/layers.list.json', {

		then : function(list){

			if(typeof list === 'string')
				
				list = JSON.parse(list);
			
			layersList = list;

			layersOptions = $.map( layersList, function (obj) {

				var r = {};
			  	
			  	r.text = obj.name;

			  	r.value = obj.id;

			  	return r;

			});

		}

	});

	GEN.declareContainer({

		name	  : 'map_os',

		container : function(name, params){
			
			var container = this;

			CONTAINER.call(container,name,params);

			container.contextMenu = {

				type   : 'map_widget',

				holder : '.gis-widgets-controller',

				menu   : {

					selector: '>*'

				}
			};

			container.includes = {

				css : [ 
					{ path : '/plugins/leaflet/library/css/leaflet.css' },
					{ path : '/plugins/leaflet/library/plugins/markercluster/MarkerCluster.css' }, 
					{ path : '/plugins/leaflet/library/plugins/markercluster/MarkerCluster.Default.css' }, 
					{ path : '/plugins/gis/styles/igrp.gis.css' }, 
					
					{ path : 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css' },
					
				],
				
				js  : [ 
					{ path : '/plugins/leaflet/library/js/leaflet.js' },
					{ path : '/plugins/leaflet/library/plugins/basemap-provider/leaflet-providers.js' },
					{ path : '/plugins/leaflet/library/plugins/ajax/leaflet.ajax.min.js' },
					
					{ path : '/plugins/leaflet/library/plugins/proj4leaflet/proj4.js' },
					{ path : '/plugins/leaflet/library/plugins/proj4leaflet/proj4leaflet.js' },
					
					{ path : '/plugins/leaflet/library/plugins/markercluster/leaflet.markercluster-src.js' },
					
					{ path : '/plugins/leaflet/library/plugins/draw/leaflet.draw.js' },
					
					{ path : '/plugins/leaflet/library/plugins/draw/Leaflet.Editable.js' },
					
					{ path : 'https://npmcdn.com/leaflet-geometryutil@0.9.3/src/leaflet.geometryutil.js'},
					
					{ path : '/plugins/handlebars/handlebars-v4.1.1.js' },
					
					{ path : '/plugins/leaflet/library/plugins/pattern/leaflet.pattern.js' },
					
					{ path : '/plugins/gis/v2/gis.js' },
					{ path : '/plugins/gis/v2/modules/gis.utils.js' },
					{ path : '/plugins/gis/v2/modules/gis.config.js' },
					{ path : '/plugins/gis/v2/modules/gis.templates.js' },
					{ path : '/plugins/gis/v2/modules/gis.map.js' },
					{ path : '/plugins/gis/v2/modules/gis.basemaps.js' },
					{ path : '/plugins/gis/v2/modules/gis.query.js' },
					{ path : '/plugins/gis/v2/modules/gis.layers.js' },
					{ path : '/plugins/gis/v2/modules/gis.layer.js' },
					{ path : '/plugins/gis/v2/modules/gis.widgets.js' },
					{ path : '/plugins/gis/v2/modules/gis.widget.js' },
					{ path : '/plugins/gis/v2/modules/gis.panels.js' },
					{ path : '/plugins/gis/v2/modules/gis.graphics.js' },
					{ path : '/plugins/gis/v2/modules/gis.legends.js' },
				
				],
				xsl : [ 'gis.map' ]
			};

			function GetMapData(){

				var json = {

						groupLayers : [],

						baseMaps    : [],

						widgets     : []

					},

					groups   = container.GET.fieldsByType( 'map_layer' ),

					basemaps = container.GET.basemaps(),

					widgets  = container.GET.contextMenuFields();

				groups.forEach(function(g){

					var layers = g.GET.layers(),

						group  = {

							title : g.GET.label(),

							visible : g.GET.visible(),

							layers : []

						};

					layers.forEach(function(l){

						var layer = $.grep( layersList, function (obj) {

							return obj.id == l.layer;

						})[0];

						if(layer){

							layer.visible = l.visible;

							group.layers.push(layer);

						}

					});

					json.groupLayers.push( group );

				});

				basemaps.forEach(function(b){

					json.baseMaps.push({

						name : b.basemap,

						default : b.default

					})

				});

				widgets.forEach(function(w){
					
					var options = {};
					
					for(var o in w.proprieties){
						
						if(w.propertiesOptions[o] && w.propertiesOptions[o].widgetAttr)
							
							options[o] = w.GET[o]();
						
					};
					
					json.widgets.push({
						name  	 : w.GET.tag(),
						title 	 : w.GET.label(),
						icon  	 : w.GET.icon(),
						type  	 : w.GET.widget_type(),
						position : w.GET.widget_position(),
						css      : w.GET.css(),
						js		 : w.GET.js(),
						html     : w.GET.html(),
						active   : w.GET.active(),
						control  : {
							button : w.GET.buttonControl()
						},
						data 	 : options
					})

				});

				return json;

			};

			container.xml.getStructure = function(o){

				var xml    = '';

					//data   = JSON.stringify(GetMapData());

				xml+='<fields>'+

						'<'+container.GET.tag()+'_data type="text" name="p_'+container.GET.tag()+'_data" maxlength="8000" persist="true">'+
							'<label>Map Data</label>'+
							'<value>'+path+'/core/formgen/types/containers/map_os/config.example.json</value>'+
							//'<value>'+data.replace(/"/g, '\\"')+'</value>'+
						'</'+container.GET.tag()+'_data>'+

					 '</fields>'

				return xml;
			};

			container.onMap_layerFieldSet = function(f){

				f.setPropriety({

					name  :'layers',

					label : '	',

					type  : 'formlist',

					fields : {

						layer : {

							type : 'select',

							options : layersOptions

						},

						visible : {

							type : 'checkbox',

							checked : true

						}

					},

					sortable : true,

					value : {

						value : f.proprieties && f.proprieties.layers || []

					},

					size : 12

				});

				f.setPropriety({
					name : 'visible',
					value : true
				})

			};

			container.onContextMenuSet = function(f){

				GEN.setImgAttr(f,{
					name : 'icon',
					value : 'fa-dot-circle-o'
				});
				
			}
			
			container.getLayersComboBox = function(){
				
				return layersOptions
				
			};
			
			container.getLayer = function(id){
				
				console.log(id)
				
				var rtn = $.grep( layersOptions, function(n,i){
					
					console.log(n);
					
					console.log(i);
					
				} )
				
			};
			
			container.getActiveLayers = function(){
				
				var Themes = container.GET.fields(),
				
					Layers = [];
				try{
					
					if(Themes && Themes[0])
						
						Themes.forEach(function(t){
							
							Layers = Layers.concat(t.GET.layers())
							
						});
					
					/*Layers.forEach(function(l){
						
						var layerID = l.layer;
						
						console.log(container.getLayer(layerID));
						
					});*/
					
				}catch(e){
					console.log(e);
				}
				
				
				

				return Layers;
			};
			
			container.getActiveLayersCombo = function(){
				
				var Layers = container.getActiveLayers(),
				
					rtn    = [];
				
				Layers.forEach(function(l){
					
					var layerID = l.layer;
					
					var layer = $.grep(layersOptions, function(n,i){
						
						return n.value == layerID
						
					})[0];
					
					if(layer)
						
						rtn.push(layer);
				});
				
				return rtn;
				
			};

			container.ready = function(){

				container.setPropriety({

					name : 'basemaps',

					label : ' ',

					type : 'formlist',
					
					//value : 'OpenStreetMap',

					size: 12,

					sortable : true,

					fields : {

						basemap : {

							type : 'select',

							options : function(){

								var arr = [

									{ text : 'Black And White (OSM)', value : 'OpenStreetMap.BlackAndWhite' },

									{ text : 'CartoDB', value : 'CartoDB' },

									{ text : 'Esri World Imagery', value:'Esri.WorldImagery' },

									{ text : 'Open Street Map', value : 'OpenStreetMap' },

									{ text : 'Open Topo Map', value : 'OpenTopoMap' },

									{ text : 'Wikimedia', value : 'Wikimedia' },

									{ text : 'Google Street', value : 'GoogleStreet' },

									{ text : 'Google Hybrid', value : 'GoogleHybrid' },

									{ text : 'Google Satellite', value : 'GoogleSatellite' },

									{ text : 'Google Terrain', value : 'GoogleTerrain' }

								]
								
								return arr.sort();

							}

						},

						default : {

							type : 'radio',

							checked : false

						}

					},

					value : {

						value : container.proprieties && container.proprieties.basemaps || [{"basemap":"Wikimedia","default":true,"gen-map_os_1_basemaps_id":""},{"basemap":"OpenStreetMap","default":false,"gen-map_os_1_basemaps_id":""},{"basemap":"GoogleSatellite","default":false,"gen-map_os_1_basemaps_id":""},{"basemap":"Esri.WorldImagery","default":false,"gen-map_os_1_basemaps_id":""}]

					}

				});

			};

			container.onDrawEnd = function(){
				
				GIS.init( $('.igrp-map-os-wrapper', container.holder) );
				
				//console.log(container.GET.basemaps())

			};

			GEN.on('save', function(){


				console.log(container);

			})

		}

	});

})();