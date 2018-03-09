/*LAYERS MANAER*/
var LayersManager = new Widget('layersManager');
	var w = LayersManager;
	LayersManager.Layers = [];//array de layers
	LayersManager.currentLayer = null; //layer selecionado
	LayersManager.currentFeature = null; //feature selecionado
	LayersManager.mapPoint = null; //ponto do mapa que foi clicado
	LayersManager.multipleFeatures = null;
	LayersManager.layersMenuHolder = null;
	LayersManager.enabled = true;


	//LayersManager.connector = dojo._base.connect;
	LayersManager.onInit = function(){
		LayersManager.layersMenuHolder = jQ('layers #layer-ctx-menu');
		console.log(LayersManager.layersMenuHolder)
		LayersManager.activate();
		LayersManager.ToolsConfig();
		//map.on('layers-add-result',LayersManager.LayersAdded);
		map.on('layer-add-result',LayersManager.LayerAdded)
		//LayersManager.initEditTool();
		LayersManager.LoadLayers();
	};
	
	LayersManager.ToolsConfig = function(){
		/*LAYER MENU CONFIG*/
		/*jQ('.widget-controller.layer-menu').on('click',function(){
			if(LayersManager.currentFeature){
				var fields =  (jQ(this).attr('fields')).split('|');
				var url = jQ(this).attr('url');
				var op = getUrlParamConcat(url);
				var serialize = "";
				fields.forEach(function(f,i){
					var value = LayersManager.currentFeature.attributes[f];
					if( value == null){
						value = '';
					}
					serialize = serialize+op+f+'='+value;
					op = '&';
				})
				var call = url+serialize;
				alert(call)
			}	
		});*/
		
		jQ('mapp .layer-visibility').change(function(e){//click to change layer visibility
			var layerId = jQ(this).parent().parent().attr('id');
			if(jQ(this).is(':checked')){
				LayersManager.setLayerVisibility(layerId,true)
			}else{
				LayersManager.setLayerVisibility(layerId,false)
			}
		});
		
		jQ('layers.data-content layer h3.layer-name').on('click',function(){
			var _center = jQ(this).parents('layer').attr('center');
			var zoom = parseInt(jQ(this).parents('layer').attr('zoom'))
			if(_center && _center != '' ){
				var center = _center.split(',');
				var point = new esri.geometry.Point([center[0],center[1]]);
			 	map.centerAndZoom(esri.geometry.geographicToWebMercator(point),zoom)
			}
		});
		
		LayersManager.layersMenuHolder.on('click','.layer-menu',function(){
			var _id 	= jQ(this).attr('menu-id'),
				_target	= jQ(this).attr('target'),
				_url	= jQ(this).attr('url');
				
				if(_url && _target ){
					LayersManager.openMenu({
						url:_url,
						target:_target,
						fields:[]	
					});
				}
		});
	}
	
	/*EVENTS*/
	LayersManager.onMapClick = function(e){
		//LayersManager.mapPoint = e.mapPoint;
		if(LayersManager.enabled){
			LayersManager.deselectAll();
			
			if(!e.graphic){
				//LayersManager.deselectFeatures();
			}else{
				if(e.graphic.getLayer()){
					//LayersManager.getFeatureMenu(e.graphic);
					if(!e.graphic.getLayer()._editable){
						//LayersManager.deselectFeatures();
					}/*else{
						if(parseInt(jQ('layer#'+e.graphic.getLayer().id).attr('editable')) == 1){ //XML EDITABLE
						}
					}*/
				}	
			}
		}
	};
	LayersManager.onMapRightClick = function(e){
		if(LayersManager.enabled){
			LayersManager.mapPoint = e.mapPoint;
			if(e.graphic){
				if(e.graphic.getLayer()){
					//alert(e.graphic.getLayer().id)
					LayersManager.getFeatureMenu(e.graphic);
				}	
			}else{
				//LayersManager.deselectFeatures()
			}
		
		}
	}
	
	
	LayersManager.onPanStart = function(e){
		if(LayersManager.enabled){
			LayersManager.hideLayerMenu();
		}
	}
	LayersManager.onPanEnd = function(e){
		//LayersManager.enableLayerMenu();
	}
	LayersManager.onZoomStart = function(e){
		if(LayersManager.enabled){
			LayersManager.hideLayerMenu();
		}
	}
	LayersManager.onZoomEnd = function(e){
		//LayersManager.enableLayerMenu();
	}
	
	LayersManager.selectFeatureById = function(e){
		/*
		  e.objectid = [] ids
		  e.layerid = layer id
		  e.callback = after do it callback
		*/
		var SelectQuery = new esri.tasks.Query();
		var layer = LayersManager.getLayer(e.layerid);
		SelectQuery.objectIds = [e.objectId];
		layer.selectFeatures(SelectQuery,esri.layers.FeatureLayer.SELECTION_NEW, function(features) {
			console.log(features)
			if(e.callback){
				e.callback(features);	
			}
		});
	};
	LayersManager.selectFeatures = function(e){
		var SelectQuery = new esri.tasks.Query();
		var callback = e.callback;
		
		if(e.graphic && e.graphic.getLayer()){
			/*GET LAYER*/
			var layer;
			if(e.layer){ //if params have layer
				layer = e.layer;
			}else{//otherwise - layer is the graphic layer
				if(e.graphic.getLayer()){
					layer = e.graphic.getLayer();
				}	
			}
			if(layer){// ._editable// editable
				LayersManager.setCurrentLayer(layer);
				var SelectQuery = new esri.tasks.Query();
				switch (e.type){						
					case 'id':
						var ObjIdField = layer.objectIdField;
						SelectQuery.objectIds = [e.graphic.attributes[ObjIdField]];
					break;
					case 'geometry':
						 var geometry = e.graphic.geometry;
						 SelectQuery.geometry = geometry;
					break;	
				}
				try{
					layer.selectFeatures(SelectQuery,esri.layers.FeatureLayer.SELECTION_NEW, function(features) {
						if(features.length == 1){
							LayersManager.currentFeature = features[0];
						}else if(features.length > 1 ){
							LayersManager.multipleFeatures = features;
						}
						console.log(LayersManager.currentFeature);
						if(callback){ //callback execution(features [] as param)
							callback(features);	
						}
						
					});//end selection
				}catch(e){ console.log(e) }
			}else{//not editable
				//LayersManager.deselectFeatures();	
				alert('no layer')
			}
		}else{// no layer
			//LayersManager.deselectFeatures();
		}
	};
	
	LayersManager.queryFeatures = function(p){
		/*
			e.layerId = layer ID
			e.geometry = geometry
			e.queryString = string query
			e.callback = after done function
		*/
		var SelectQuery = new esri.tasks.Query();
		//try{
			SelectQuery.where = p.queryString;		
			if(p.geometry){
				SelectQuery.geometry = p.geometry;
			}
			
			var layer = LayersManager.getLayer(p.layerId);
			
			if(layer){
				layer.queryFeatures(SelectQuery, function(results) {
					if(p.callback){
						p.callback(results);	
					}
				});
			}	
		/*}catch(e){
			console.log(e);	
		}*/
	};
	
	LayersManager.getFeature = function(p){
		/*
		p.featureId,
		p.layerId,
		*/
		var SelectQuery = new esri.tasks.Query();
		SelectQuery.objectIds = [p.featureId];
		
		var layer = LayersManager.getLayer(p.layerId);
		if(layer){
			 layer.queryFeatures(SelectQuery, function(featureSet) {
  			  if(p.callback){
				p.callback(featureSet)  
			  }
				
			 });
		}
	}
	
	LayersManager.getFeatureExtent = function(p){//return extent
		/*
		p.featureId,
		p.layerId,
		callback() // expects a extent
		*/
		LayersManager.getFeature({
			featureId:p.featureId,
			layerId:p.layerId,
			callback:function(featureSet){
				if(featureSet.features.length > 0){
					if(p.callback){
						p.callback(esri.geometry.webMercatorToGeographic(featureSet.features[0].geometry.getExtent()));
					}
				}
			}
		});
	}
	LayersManager.hightLightFeature = function(p){
		
	}
	LayersManager.setCurrentLayer = function(layer){
		LayersManager.currentLayer = layer;
	};
	LayersManager._unset = function(){
		LayersManager.currentLayer = null;
		LayersManager.currentFeature = null;
		LayersManager.mapPoint = null;
		LayersManager.hideLayerMenu();
	};
	
	LayersManager.setEventListener = function(p){
		/* p.layerid = id
		   p._event = evento
		   p.callback
		 */
		var layer = null;
		var rtn = false;
		
		if(p.layerid){
			layer = LayersManager.getLayer(p.layerid);
		}

		if(layer){
			try{
				var evt = layer.on(p._event, p.callback);
				rtn =  evt;
			}catch(e){ 
				console.log(e) 
			}
			return rtn;
		}else{/*hack : remove later - same as LayersManager.onLayerAddResult(p)*/
			map.on('layer-add-result',function(result){
				if(result.layer.id == p.layerid){
					alert(p.layerid)
					layer = result.layer;
					if(p._event == 'load' || p._event == 'onLoad'){
						p.callback(layer.id)	
					}else{
						alert('layerid:'+p.layerid+'; event:'+p._event)	
					}
				}
			});
		}
	}
	LayersManager.unsetEventListener = function(_e){
		_e.remove();
	}
	
	LayersManager.deselectAll = function(){
		LayersManager.Layers.forEach(function(l){
				try{l.clearSelection() }catch(e){ console.log(e) }
			});	
		LayersManager._unset();
	}
	
	LayersManager.deselectFeatures = function(){
		if(LayersManager.currentLayer){
			try{ LayersManager.currentLayer.clearSelection() }catch(e){ console.log(e) }
			LayersManager.hideLayerMenu();
		}else{
			LayersManager.deselectAll();
		}
		
		//jQ('layer-ctx-menu .widget-controller').removeClass('active')
	};
	
	LayersManager.LayerClearSelection = function(layerid){
		var layer = LayersManager.getLayer(layerid);
		try{layer.clearSelection() }catch(e){ console.log(e) }
	};
	LayersManager.getLayer = function(layerId){
		var rtn = false;
		LayersManager.Layers.forEach(function(l){
			if(l.id == layerId){
				rtn = l;	
			}
		});
		LayersManager.setCurrentLayer(rtn);
		console.log(layerId+' = '+rtn.id)
		return rtn;
	};
	
	LayersManager.onLayerAddResult = function(p){
		map.on('layer-add-result',function(result){
			if(p.layerid && p.callback){
				if(result.layer.id == p.layerid){
				
					p.callback(result.layer);	
				}
			}else{
				//if(result.layer.id != 'layer0' && !result.layer._TILE_FORMATS){
					if(p.callback){
						p.callback(result.layer);
					}
					
				//}
			}
			
		});
	}
	LayersManager.onLayersAddResult = function(p){
		map.on('layers-add-result',function(results){
			if(p.callback){
				p.callback(results.layers)
			}
			
		});
	}
	/* LAYER MENU */
	LayersManager.setLayerMenu = function(p){
		/*
		p.layerId
		p.menu[]: id, target, url, label, icon
		*/
		
		var layer = LayersManager.getLayer(p.layerId);
		try{
		if(layer){
			p.menu.forEach(function(menu){
				var _menu = jQ(document.createElement('div'));
				_menu.attr('layerid',layer.id);
				
				_menu.addClass('layer-menu');
				if(menu.class){
					_menu.addClass(menu.class);		
				}
				
				if(menu.id){
					_menu.attr('menu-id',menu.id);
				}
				
				if(menu.label){
					_menu.attr('alt',menu.label);
					_menu.attr('title',menu.label);
				}
				
				if(menu.target){
					_menu.attr('target',menu.target);
				}
				
				if(menu.url){
					_menu.attr('url',menu.url);
				}
				
				if(menu.icon){
					_menu.append('<img src="'+Mapp.path+'/extentions/n_esri/widgets/img/layermenu/'+menu.icon+'"/>');	
				}
				
				if(menu.text){
					_menu.text(menu.text);	
				}
				
				if(menu.onClick){
					_menu.on('click',function(e){
						menu.onClick(e);	
					});	
				}
				
				_menu.attr('border','template');
				
				LayersManager.layersMenuHolder.append(_menu)		
			});
		}
		}catch(e){ console.log(e) }
	}
	LayersManager.getFeatureMenu = function(feature){
		this.selectFeatures({
			graphic:feature,
			type:'id',
			callback:function(features){
				LayersManager.enableLayerMenu();//
			}
		});			
	}
	LayersManager.getLayerName = function(layerid){
		rtn = null;
		var name = jQ('layers.data-content layer#'+layerid+' h3.layer-name').text();
		if(name != ''){
			rtn = name;	
		}
		return name;
	}
	
	LayersManager.getLayerMenuPosition = function(){
		if(LayersManager.currentLayer){
			var feature = LayersManager.currentFeature;
			var layerId = LayersManager.currentLayer.id;
			var menuHolder = LayersManager.layersMenuHolder;
			
			var menuIdx = parseInt(menuHolder.attr('menuIdx'));
	
			var MenuItemW = 28;//menuHolder.width();
			var MenuItemH = 28;//menuHolder.height();
			var point = esri.geometry.toScreenPoint(map.extent,
						jQ('#'+Mapp.id).width(),
						jQ('#'+Mapp.id).height(),
						LayersManager.mapPoint);
			
			menuHolder.css({
				top: point.y - MenuItemW/2,
				left:point.x + ((MenuItemW - MenuItemW*menuIdx) - MenuItemW/2)	
			});
		}
	};
	
	LayersManager.showLayerMenu = function(){
		var layerId = LayersManager.currentLayer.id;
		LayersManager.layersMenuHolder.addClass('on');
		LayersManager.layersMenuHolder.find('.layer-menu').removeClass('active');
		LayersManager.layersMenuHolder.find('.layer-menu[layerid="'+layerId+'"]').addClass('active');		
	};
	
	LayersManager.hideLayerMenu = function(){
		LayersManager.layersMenuHolder.removeClass('on');
	}
	LayersManager.enableLayerMenu = function(){
		//if(LayersManager.currentLayer){
		  if(LayersManager.mapPoint){
			  LayersManager.getLayerMenuPosition();
			  LayersManager.showLayerMenu();
		  }else{
			  LayersManager.hideLayerMenu();
		  }
		/*}else{
			LayersManager.hideLayerMenu();
		}*/
	};
	
	LayersManager.openMenu = function(p){
		if(p.target == '_self'){
			var c = "?";
			var field = "OBJECTID";
			if(p.url.indexOf(c) != -1){
					c = "&";
			}
			if(LayersManager.currentFeature){
				Mapp.setExternalUrl(p.url+c+field+'='+LayersManager.currentFeature.attributes[field]);	
			}
			
		}else{
			window.open(p.url, '_blank');
		}
	};
	
	LayersManager.lock = function(){
		LayersManager.enabled = false;
	}
	
	LayersManager.unlock = function(){
		LayersManager.enabled = true;
	}
	
	/* LAYERS METHODS */
	LayersManager.setLayerVisibility = function(layerId,op){//set layer visibility by id 
		var layer = LayersManager.getLayer(layerId);
		if(layer){
			layer.setVisibility(op);	
			if(!op) LayersManager.deselectFeatures();
		}	
	}
	LayersManager.getLayerVisibility = function(layerId){//recieve a layer id and returs if it is visible or not
		var rtn = null;
		var layer = LayersManager.getLayer(layerId);
		if(layer){
			rtn = layer.visible;
		}
		return rtn;
	}
	LayersManager.getActiveLayersId = function(){//get the ID of Visible Layers
		var rtn = [];
		LayersManager.Layers.forEach(function(layer){
			if(layer.visible){
			rtn.push(layer.id);	
			}	
		})	
		return rtn;
	}
	LayersManager.getLayerObjectIdField = function(layerid){
	/* RETURNS THE ID FIELD OF OBJECTS OF THE GIVEN LAYER ID*/
		var objectIdField = null;
		if(layerid != ''){
			var layer = LayersManager.getLayer(layerid);
			if(layer){
				objectIdField = layer.objectIdField;
			}	
		}
		return objectIdField;
	}
	LayersManager.setFALayerEvents = function(layer){
		layer.on('selection-clear',function(e){
			LayersManager._unset();
		});
		layer.on('click',function(e){
			if(!DrawingTool.isDrawing){
				//LayersManager.deselectFeatures();
			}
		});
		
	};
	//Layers from HTML to MAP
	LayersManager.LoadLayers = function(){
		MapLayers = []
		Mapp.layers.forEach(function(_layer){
			if(_layer.url && _layer.url != ''){
			if(_layer.type.toUpperCase() == "FEATURE ACCESS"){//FeatureAccess
				var layer = new esri.layers.FeatureLayer(_layer.url,{
					mode: esri.layers.FeatureLayer.MODE_ONDEMAND,
					outFields:_layer.outfields,
					id:_layer.id,
					visible:_layer.visible				
				});
				
				if(_layer.queries && _layer.queries != ""){
					layer.setDefinitionExpression(_layer.queries)
				};
				if(_layer.selectionSymbol.length > 0){
					layer.setSelectionSymbol(LayersManager.getSelectionSymb(_layer));
				};
				layer.on('load',function(e){
					//Render by Attribute
					if(_layer.attRenderer.length > 0){
						//LayersManager.setLayerAttRenderer(layer,_layer.attRenderer);
					}
				});
				LayersManager.setFALayerEvents(layer);
				//map.addLayer(layer);	
				MapLayers.push(layer);
			}
			if(_layer.type == "WMS"){//WMS - TO IMPLEMENT
			}
			if(_layer.type == "WFS"){}//WFS - TO IMPLEMENT
		
		}
		});
		map.addLayers(MapLayers);		
	}
	//Layer Render Config
	LayersManager.setLayerAttRenderer = function(p/*layer,renderersOption*/){
		/*
		p.layerid 
		p.field
		p.render : color, label, operator, value
		*/
		try{
		var layer = LayersManager.getLayer(p.layerId);
		var defaultSymbol = layer.renderer.symbol;
		
		var field = p.field;
		
		var values = [];
		var colors = [];
		var labels = [];
		p.render.forEach(function(r){
			if(typeof r.color === 'string'){
				var _color = r.color.split(',');
				_color.forEach(function(i,x){
					_color[x] = +_color[x];
				})
			}else{
				_color = r.color;
			}
			
			colors.push(_color);
			labels.push(r.label);
			values.push(r.value);
		})
		layer.setRenderer(LayersManager.LayerAttRenderer(field,values,colors,defaultSymbol));
		}catch(e){ 
			console.log(e) 
		}
	};
	//Layer Renderer Definition
	LayersManager.LayerAttRenderer = function(field,values,colors,defaultSymbol){
			var attRender = new esri.renderer.UniqueValueRenderer(defaultSymbol, field.toString());
			if(colors.length == values.length){
				values.forEach(function(value, i){
					var color = colors[i],
					symbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color(color));
					if(value == '[notnull]'){
						value=" ";
						var s = attRender.defaultSymbol;
						attRender.defaultSymbol = symbol;
						symbol = s;
					}
					attRender.addValue(value, symbol);
				})
			};
			return attRender;
	}
	//Layers Add To Map
	LayersManager.LayersAdded = function(results){
		var _Layers = results.layers;
		jQ('.layers-controller').addClass('active');
		_Layers.forEach(function(layers){
			var layer  = layers.layer;
			jQ('layer#'+layer.id).addClass('onMap');
			LayersManager.Layers.push(layer)
			
		});
		//LayersManager.Layers
	};
	
	LayersManager.LayerAdded = function(result){
		var layer = result.layer;
		if(layer.id != 'layer0'){
			jQ('.layers-controller').addClass('active');
			jQ('layer#'+layer.id).addClass('onMap');
			LayersManager.Layers.push(layer)
		}
		
		
		//jQ('.layers-controller').addClass('active');
		/*_Layers.forEach(function(layers){
			var layer  = layers.layer;
			jQ('layer#'+layer.id).addClass('onMap');
			LayersManager.Layers.push(layer)
			
		});*/
		//LayersManager.Layers
	};
	
	//Layers Selection Symbol
	LayersManager.getSelectionSymb = function (layer){
		console.log(layer)
		if(layer.geometryType == 'POLIGONO'){
			var outline = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_LONGDASH,
						  new dojo.Color(layer.selectionSymbol), 2);
			var Bgopacity = layer.selectionSymbol;
				Bgopacity.push(0.2);
				
			var layerSelectionSymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID, 
									   outline, new dojo.Color(Bgopacity));
			return layerSelectionSymbol;
		}
	};
/*LAYERS MANAER END*/

/*DRAWING MANAGER*/
var DrawingTool = new Widget('Draw');
var dt = DrawingTool;
dt.tool = null;
dt.isDrawing = false;
dt.init = function(){
	dt.tool = new esri.toolbars.Draw(map);
	if(Mapp.points.length > 0){
		dt.DrawMapPoints();
	}
}
dt.onDrawComplete = function(callback){
	//callback();
}
dt.activate = function(p){
	if(p.symbol){
		p.tool.setFillSymbol(p.symbol);
	}
	p.tool.activate(p.type)
	dt.isDrawing = true;
	jQ('body').addClass('isDrawing');
	
}
dt.deactivate = function(tool){
	tool.deactivate();
	dt.isDrawing = false;	
	jQ('body').removeClass('isDrawing');
}
dt.getTool = function(drawOptions,drawEnd){
	var tool = new esri.toolbars.Draw(map,drawOptions);
	tool.on('draw-end',drawEnd);
	return tool;
}
dt.DrawMapPoints = function(){
	Mapp.points.forEach(function(p){
		var point = new esri.geometry.Point({
			latitude: p.lat,
			longitude: p.long,
			spatialReference:map.spatialReference
	   });
		var sms = new esri.symbol.SimpleMarkerSymbol().setStyle(
    				   esri.symbol.SimpleMarkerSymbol.STYLE_SQUARE).setColor(
   		 			   new dojo.Color([255,0,0,0.5]));

		var graphic = new esri.Graphic(esri.geometry.geographicToWebMercator(point),sms);
		graphic.setAttributes(p)
		
		map.graphics.add(graphic);
	})
};

dt.onMapClick = function(e){
	if(e.graphic){
		if(isFromMap(e.graphic)){
			dt.setInfoWindowVals(e.graphic.attributes)
		}	
	}
};
dt.setInfoWindowVals = function(attrs){
	//console.log(attrs)
	jQ.each(jQ('#'+Mapp.id+' mappoints info_window .mapp-point-info'),function(i,holder){
		var label = jQ(holder).find('label');
		var value = jQ(holder).find('.mapp-point-info-value');
		for(var attr in attrs){
			if (attr == label.attr('rel')){
				value.text((attrs[attr]));
			}
		}
	});
};