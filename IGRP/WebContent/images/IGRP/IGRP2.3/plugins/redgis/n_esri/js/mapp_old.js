var mapId,
	map,
	Mapp,
	layers,
	layerSelectionSymbol,
	markerSelectionSymbol,
	currentLayer = null,
	currentFeature = null,
	ctxMenuTimer,
	layerHover = false;

(function ( jQ ) { 
	
    jQ.fn.mapp = function( options ) {
	jQ('body').addClass('mapp-loading');
	
	if(!Mapp){
		try{
			Mapp = new Object({
				id: this.attr('id'),
				mapId:this.attr('mapid'),
				zoom: this.attr('zoom'),
				center: [this.attr('center_long'),this.attr('center_lat')],
				//basemap:this.attr('basemap').toString(),
				basemap:{
					id   : this.find('basemap id').text(),
					name : this.find('basemap name').text(),
					url  : this.find('basemap url').text(),
					type : this.find('basemap type').text()
				},
				layers:getLayers(this),
				symbols:{
					polygon:null
				},
				getGraphicsExtent:function(graphics,expand){
					map.setExtent(GraphicZoomIn(graphics,expand));	
				},
				path:this.attr('path'),
				points: getMapPoints(this),
				settings:{
					basemap:{
						currentBaseMap:null,
						getDefaultBaseMap:function(){
							//open streetMap
							var layer = new esri.layers.ArcGISTiledMapServiceLayer('http://services.arcgisonline.com/arcgis/rest/services/ESRI_StreetMap_World_2D/MapServer');
						},
						set:function(bm,center,zoom){
							console.log(JSON.stringify(bm));
							//map.setBasemap(bm.name);
							switch(bm.type){
								case 'ESRI':
								case'Feature Access':
									if(Mapp.settings.basemap.currentBaseMap)
										map.removeLayer(Mapp.settings.basemap.currentBaseMap);
									
									var _layer = new esri.layers.ArcGISTiledMapServiceLayer(bm.url);
									
									Mapp.settings.basemap.currentBaseMap = _layer;
					                map.addLayer(_layer)
					                map.reorderLayer(_layer, 0);
								
								break;
							}

							map.on('load',function(){
			                	var ext = new esri.geometry.Extent(parseFloat(center[0]),parseFloat(center[1]),parseFloat(center[0]),parseFloat(center[1]), map.spatialReference);
								Mapp.focusOn({
									extent:esri.geometry.geographicToWebMercator(ext),
									zoom:zoom
								});
			                });
							
						}
					}
				},
				getBaseMap:function(){
					return this.basemap;	
				},

				getTemplate:function(){
					console.log(this)
					//return jQ()
				},
				getHeight:function(){
					return jQ('#'+this.id).height();
				},
				getWidth:function(){
					return jQ('#'+this.id).width();
				},
				externalUrlHolder: jQ('.mapp-external-holder'),
				setExternalUrl:function(url){
					var oFrame = Mapp.externalUrlHolder.find('iframe');
					var nFrame = oFrame.clone();
					
					nFrame.attr('src',url);
					oFrame.replaceWith(nFrame);
					
					BackgroundFade(true);
					ExternalPopup(true);
					Mapp.externalUrlHolder.find('iframe').addClass('loading')
					nFrame.bind('load',function(){
						//Mapp.externalUrlHolder.find('iframe').css('display','block');
						Mapp.externalUrlHolder.find('iframe').removeClass('loading')
						//ExternalPopup(true);
					}); 		
					return false;	
				},
				snapManager: null,
				focusOn:function(p){
					var extent = p.extent ? p.extent : centerExt;
					if(extent){
						var projectParams = new esri.tasks.ProjectParameters();  
						projectParams.geometries = [extent];  
						projectParams.outSR = map.spatialReference;  

						var defer = Mapp.geometryService.project(projectParams);  
						dojo.when(defer, function (projectedGeometry) {  
						    if (projectedGeometry.length > 0) {  
						       	console.log(p)
						       	console.log(JSON.stringify(projectedGeometry[0]))
						        map.setExtent(projectedGeometry[0]);  

						      	if(p.zoom){
						      		var zoom = p.zoom <= map.getMaxZoom() ? p.zoom : map.getMaxZoom();
						      		setTimeout(function(){
						      			map.setZoom(zoom);
						      		},400)
						      	}
						      	
						    }  
						}); 
					}
				},
				setMapExtent:function(extent,expand){
					try{
						if(extent){
							if(expand){
								map.setExtent(extent.expand(expand));
							}else{
								map.setExtent(extent);
							}
						}
					}catch(e){console.log(e)}
				},
				isDrawing:false,
				isEditing:false,
				ErrorHandler:function(p){
					var html = jQ('#mapp-holder #mapp-error-handler');
					var msg = jQ('#mapp-holder #mapp-error-handler #mapp-error-message');

					var error;

					if(p.text){
						error = p.text;
					}
					if(p.object){
						error = p.object.message;
					}

					msg.text(error);
					html.show();

					html.css({
						"margin-top":-(html.height())
					});

					html.addClass('active');

					setTimeout(function(){
						html.removeClass('active');
						setTimeout(function(){
							html.hide();
						},900)
					},3500)

				},
				onWidgetStart:function(){}
				/*onLayerAddResult:function(p){
					map.on('layer-add-result',function(e){
						p.callback(e);
					});	
				}*/
			});
		}catch(e){ console.log(e); }
		
		this.bind("contextmenu",function(e) {
	           return false;
	    });
		
		MapToolsConfig();
		
		dojo.ready(function(){
			esriMap();
			configGSWMSLayer();
		});
	}
}
}( jQuery ));
function esriMap(){

	if(!map){
		esri.config.defaults.io.alwaysUseProxy = false;
		esri.config.defaults.io.proxyUrl = path+"/extentions/n_esri/proxy.php";
		Mapp.geometryService = new esri.tasks.GeometryService("//tasks.arcgisonline.com/ArcGIS/rest/services/Geometry/GeometryServer")
		
		//var bMap = typeof Mapp.basemap == 'object' ? :'osm' : 

		map = new esri.Map(Mapp.id,{
			center			 :Mapp.center,
			zoom			 :Mapp.zoom,
			isZoomSlider 	 :true,
			basemap			 :'osm',//Mapp.basemap,
			navigationMode   :'css-transforms',
			force3DTransforms:true,
			spatialReference:new esri.SpatialReference(4826)
			//spatialReference: new esri.SpatialReference('PROJCS["WGS_1984_Cape_Verde_Grid",GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",161587.83],PARAMETER["False_Northing",128511.202],PARAMETER["Central_Meridian",-24.0],PARAMETER["Standard_Parallel_1",15.0],PARAMETER["Standard_Parallel_2",16.66666666666667],PARAMETER["Latitude_Of_Origin",15.83333333333333],UNIT["Meter",1.0]]')
			
		});

		//console.log(map.spatialReference)

		var scalebar = new esri.dijit.Scalebar({
	          map: map,
	          scalebarUnit: "metric"
			//  scalebarStyle:"dual"
	    });

	    //tstUrl(path+"/extentions/n_esri/proxy.php?//rai-gv-gis-02.gov.cv:6443/");
		
		MapHandlers();

		//Mapp.settings.basemap.set(Mapp.basemap,Mapp.center,Mapp.zoom);

	}
}


function setExntentEvtListener(p){
	map.on('extent-change',function(e){
		p.callback(e);	
	});
}

function MapHandlers(){
	//LayersManager = WidgetManager.getWidget('layersManager')
	map.isDrawing = false;
	map.isEditing = false;
	
	/*map.on('layer-add-result',function(results){
	});*/
	/*map.on('layers-add-result',function(){
		alert('layadd')
	});*/
	/*map.on('click',function(e){
		console.log(e)
	});*/
	
	map.on('load',function(){
		if(Mapp.layers){
			//	LoadLayers();
		}
		map.showZoomSlider();
		MappReady();
		setMappSymbols();
		var fullscreen = getParamByName('p_fullscreen');
		if(fullscreen == 'true'){
			setFullScreen(true);	
		}
		map.graphics.id = "Mapp-"+Mapp.mapId;
		WidgetManager.init();

		Mapp.onWidgetStart(WidgetManager);
	});
};
function GetFeatureInfo(){
	var layer = currentFeature.getLayer();
	if(layer && layer != null){
		var outFields = layer._outFields;
		var list = jQ('layer#'+layer.id+' .layer-options infomenu .feature-info');
		list.html('');
		outFields.forEach(function(el,i){
			list.append('<li><span class="info-field">'+el+'</span>:<span class="info-value">'+
			currentFeature.attributes[el]+'</span></li>');
		});
	}
}
function setMappSymbols(){
	Mapp.symbols.polygon = new esri.symbol.SimpleFillSymbol().setStyle(esri.symbol.SimpleFillSymbol['STYLE_SOLID']);

};
function GraphicZoomIn(graphics,expand) {
  var geometry, extent, ext;
  dojo.forEach(graphics, function(graphic, i) {
    geometry = graphic.geometry;
    if (geometry instanceof esri.geometry.Point) {
      ext = new esri.geometry.Extent(geometry.x - 1, geometry.y - 1, geometry.x + 1, geometry.y + 1, geometry.spatialReference);
    }
    else if (geometry instanceof esri.geometry.Extent) {
      ext = geometry;
    }
    else {
      ext = geometry.getExtent();
    }
    if (extent) {
      extent = extent.union(ext);
      
    }
    else {
      extent = new esri.geometry.Extent(ext);
    }
  });
  console.log(extent);
  return extent.expand(expand);
};

function configGSWMSLayer(){
	dojo.declare("WMS", esri.layers.DynamicMapServiceLayer, {		
		
		constructor: function(url,layers,params) {
			this.url = url;
			this.layers = layers;
			this.spatialReference = new esri.SpatialReference({wkid:102100});
			this.loaded = true;
			this.onLoad(this);

			if(params.id)		 this.id 		= params.id;
			if(params.visible) 	 this.visible   = params.visible;
			if(params.isDefault) this.isDefault = params.isDefault;
			if(params.visible)   this.visible   = params.visible;
			
			if(params.format)	 
				this.format	= params.format;
			else 				
				this.format	= "image/png";

			if(params.request)
				this.request = params.request;
			else
				this.request = "GetMap";
			
			if(params.srs)
				this.srs = params.srs;
			else
				this.srs = "EPSG:4326";

		},
		getImageUrl: function(_extent, width, height, callback) {
			console.log(_extent)
			var extent = esri.geometry.webMercatorToGeographic(_extent);
			var params = {
				service:"WMS",
				request:this.request,
				transparent:true,
				format:this.format,
				version:"1.3.0",
				layers:this.layers,
				styles:"",
				bbox: extent.xmin + "," + extent.ymin + "," + extent.xmax + "," + extent.ymax,
				srs: this.srs,
				width: width,
				height: height
			};
			callback(this.url + dojo.objectToQuery(params));
		}
	});
}


function GlobalConfig(){}

