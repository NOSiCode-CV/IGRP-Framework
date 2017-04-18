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
	LayersManager.snapped = false;
	LayersManager.isLabelLayer = false;

	LayersManager.labelLayer = null;

	LayersManager._certOk = true;
	
	LayersManager.HighLightLayer = null;

	//LayersManager.connector = dojo._base.connect;
	LayersManager.onInit = function(){
		LayersManager.layersMenuHolder = jQ('#layer-ctx-menu');
		LayersManager.activate();
		LayersManager.ToolsConfig();
		
		map.on('layer-add-result',LayersManager.LayerAdded);

		map.on('layers-add-result',LayersManager.LayersAddedHandler);

		map.on('layer-reorder',LayersManager.LayerReorder);

		LayersManager.configLayerLookUp();

		LayersManager.snapManager = map.enableSnapping({
			snapKey:esri.sniff("mac") ? dojo.keys.META : dojo.keys.CTRL
		});
		try{
			LayersManager.LoadLayers();
		}catch(e){
			console.log(e);
		}
	};
	
	LayersManager.ToolsConfig = function(){
		/*LAYER MENU CONFIG*/
		//$( ".selector" ).sortable({ handle: ".handle" });
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
				var point = new esri.geometry.Point([center[0],center[1]],map.spatialReference);
				var ext = new esri.geometry.Extent(center[0],center[1],center[0],center[1], map.spatialReference);

				Mapp.focusOn({
					extent:esri.geometry.geographicToWebMercator(ext),
					zoom:zoom
				});
				/*var point = new esri.geometry.Point([center[0],center[1]]);
			 	map.centerAndZoom(esri.geometry.geographicToWebMercator(point),zoom)*/
			}
		});
		LayersManager.layersMenuHolder.on('click','.layer-menu',function(){
			var _id 	  = jQ(this).attr('menu-id'),
				_target	  = jQ(this).attr('target'),
				_url	  = jQ(this).attr('url'),
				_layerid  = jQ(this).attr('layerid');
				_attrName = jQ(this).attr('attr-name');
				_pNames = jQ(this).attr('param-names');
				_pValues = jQ(this).attr('param-values');

				if(_url && _target ){
					LayersManager.openMenu({
						url:_url,
						target:_target,
						layerid:_layerid,
						fields:[],
						attrName:_attrName,
						paramNames:_pNames,
						paramValues:_pValues	
					});
				}
		});
		//CERTIFICATE CHECKER CLOSER
		jQ('#mapp-holder #mapp-cert-checker #reloader').on('click',function(){
			location.reload();
		});
		jQ('#mapp-holder #mapp-cert-checker .closer').on('click',function(){
			BackgroundFade(false);
			jQ(this).parent().removeClass('active');
		});

		

	}
	/*EVENTS*/
	LayersManager.onMapClick = function(e){
		//LayersManager.mapPoint = e.mapPoint;
		//console.log(e);
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
			LayersManager.deselectAll();
			LayersManager.mapPoint = e.mapPoint;
			if(e.graphic){
				if(e.graphic.getLayer()){
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
		  e.objectId = [] ids
		  e.layerid = layer id
		  e.callback = after do it callback
		*/
		var SelectQuery = new esri.tasks.Query();
		var _method = "SELECTION_NEW";
		var layer = LayersManager.getLayer(e.layerid);

		if(e.method){
			_method = e.method;
		}

		if(layer){
			SelectQuery.objectIds = [e.objectId];
			layer.selectFeatures(SelectQuery,esri.layers.FeatureLayer[_method], function(features) {
				if(e.callback){
					if(features.length == 1){
						LayersManager.currentFeature = features[0];
					}
					e.callback(features);	
				}
			});
		}else{
			Mapp.ErrorHandler({
				text:'no layer found'
			});
		}
	};
	LayersManager.orderLayersIds = function(p){
		var rtn = [];
		var Layers = p.array;
		
		LayersManager.Layers.forEach(function(_layer){

			for(var i=0;i < Layers.length; i++){
				if(p.attr){
					if(_layer.id == Layers[i][p.attr]){
						rtn.unshift(Layers[i]);
						break;
					}
				}else{
					if(_layer.id == Layers[i]){
						rtn.unshift(Layers[i]);
						break;
					}
				}
			}

		});
		return rtn;
	}
	
	LayersManager.query = function(p){
		/*
		 * layerid
		 * objectid
		 * objectids []
		 * geometry
		 * query
		 * callback
		 */
		var SelectQuery = new esri.tasks.Query();	

		try{
		 	var layer = LayersManager.getLayer(p.layerid);
		 	if(layer){
		 		if(p.geometry){
		 			SelectQuery.geometry = p.geometry;
		 		}
		 		if(p.query){
		 			SelectQuery.where = p.query; 
		 		}
		 		if(p.objectid){
		 			SelectQuery.objectIds = [p.objectid];
		 		}else if(p.objectids){
		 			SelectQuery.objectIds = p.objectids;
		 		}

		 		if(p.spatialRelationship)
		 			SelectQuery.spatialRelationship = p.spatialRelationship;

		 		layer.queryFeatures(SelectQuery, function(results) {
		 			if(p.callback){
		 				p.callback(results);
		 			}
		 		},function(err){
		 			if(p.error){
		 				p.error(err);
		 			}
		 		});
		 	}
		 }catch(e){
		 	Mapp.ErrorHandler({
		 		object:e
		 	})
		 }

	}

	LayersManager.select = function(p){
		/* layerid
		 * objectid
		 * objectids[]
		 * geometry
		 * query
		 * callback
		 * method
		 */
		 var SelectQuery = new esri.tasks.Query();
		 var method = "SELECTION_NEW";
		 try{
		 	var layer = LayersManager.getLayer(p.layerid);
		 	if(layer){
		 		if(p.geometry){
		 			SelectQuery.geometry = p.geometry;
		 		}
		 		if(p.query){
		 			SelectQuery.where = p.query; 
		 		}
		 		if(p.objectid){
		 			SelectQuery.objectIds = [p.objectid];
		 		}
		 		if(p.objectids){
		 			SelectQuery.objectIds = p.objectids;
		 		}
		 		if(p.method){
		 			method = p.method;
		 		}

		 		layer.selectFeatures(SelectQuery,esri.layers.FeatureLayer[method], function(features) {
		 			if(p.callback){
		 				p.callback(features);
		 			}
		 		});
		 	}
		 }catch(e){
		 	Mapp.ErrorHandler({
		 		object:e
		 	})
		 }
	}

	LayersManager.getExtent = function(p){
		/*objectids:[],
		 *layerid
		 *callback
		 */
		 var layer = LayersManager.getLayer(p.layerid);
		 if(layer){
		 	var Query = new esri.tasks.Query();
		 	
		 	if(p.objectids){
		 		Query.objectIds = p.objectids;
		 	}
		 	layer.queryFeatures(
		 		Query,
		 		function(e){ 			
		 			var extent = esri.graphicsExtent(e.features);
		 			if(p.callback){
		 				p.callback(extent);
		 			}
		 		}
		 	)
		 }


		 
	}

	LayersManager.getLayerType = function(layerId){
		var r = false;
		var type = jQ('mapdata layers layer#'+layerId).attr('type');
		console.log(type)
		if(type){
			r = type;
		}
		return r;
	}

	LayersManager.getSelectedFeatures = function(layerid){
		var layer = LayersManager.getLayer(layerid);
		if(layer){
			return layer.getSelectedFeatures();
		}
	}

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
						if(e.graphic.attributes){
							var ObjIdField = layer.objectIdField;
							SelectQuery.objectIds = [e.graphic.attributes[ObjIdField]];
						}
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
						if(callback){ //callback execution(features [] as param)
							callback(features);	
						}
						
					});//end selection
				}catch(e){ return null; }
			}else{//not editable
				//LayersManager.deselectFeatures();	
				Mapp.ErrorHandler({
					text:'no layer found'
				});
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
			try{
				if(layer){
					console.log(SelectQuery);
					layer.queryFeatures(SelectQuery, function(results) {
						if(p.callback){
							p.callback(results);	
						}
					});
				}
			}catch(e){ 
				Mapp.ErrorHandler({
					object:e
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
		p.objectIds []
		*/
		var SelectQuery = new esri.tasks.Query();
		if(p.featureId){
			SelectQuery.objectIds = [parseInt(p.featureId)];
		}else{
			SelectQuery.objectIds = p.objectIds;
		}
		

		var layer = LayersManager.getLayer(p.layerId);
		
		if(layer){
			console.log(SelectQuery)
			 layer.queryFeatures(SelectQuery, function(featureSet) {
  			  if(featureSet.features.length > 0){
  			  	if(p.callback){
					p.callback(featureSet)  
			  	}
  			  }else{
  			  	Mapp.ErrorHandler({
					text:'no data found'
				});
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
		
		if(p.feature){
			//console.log(p.feature)
			var extent = esri.geometry.webMercatorToGeographic(p.feature.geometry.getExtent());
			return extent;
		}else{
			LayersManager.getFeature({
				featureId:p.featureId,
				layerId:p.layerId,
				callback:function(featureSet){
					console.log(featureSet)
					if(featureSet.features.length > 0){
						if(p.callback){
							console.log(featureSet.features[0].geometry.getExtent())
							//	console.log(featureSet.features[0].geometry.spatialReference.isWebMercator()) 
							var extent = featureSet.features[0].geometry.spatialReference.isWebMercator() ? esri.geometry.webMercatorToGeographic(featureSet.features[0].geometry.getExtent()) : featureSet.features[0].geometry.getExtent() ;
							p.callback(extent);
						}
					}else{
						Mapp.ErrorHandler({
							text:'no data found'
						});
					}
				}
			});
		}
	}

	LayersManager.getFeatureCoordinates = function(feature){
		var rtn = null;
		if(feature.geometry) rtn = esri.geometry.webMercatorToGeographic(feature.geometry);
		return rtn;
	}

	LayersManager.hightLightFeature = function(p){
	/*
	 *p.objectid
	 *p.layerid
	 */	
	 try{
	 	if(p.layerid){
	 		var layer = LayersManager.getLayer(p.layerid);
	 		if(layer){
	 			LayersManager.getFeature({
					featureId:p.objectid,
					layerId:p.layerid,
					callback:function(featureSet){
						if(featureSet.features.length == 1){
							var geometry = featureSet.features[0].geometry;
							var symbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color('yellow'));
							
							var graphic = new esri.Graphic(geometry,symbol);
							map.graphics.add(graphic)

							//console.log(feature.geometry)
						}else{
							return false;
						}
						
					}
				});
	 		}
	 	}
	 }catch(e){
	 	Mapp.ErrorHandler({
			object:e
		});
	 }
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
				Mapp.ErrorHandler({
					object:e
				}); 
			}
			return rtn;
		}else{/*hack : remove later - same as LayersManager.onLayerAddResult(p)*/
			map.on('layer-add-result',function(result){
				if(result.layer.id == p.layerid){
					layer = result.layer;
					if(p._event == 'load' || p._event == 'onLoad'){
						p.callback(layer.id)	
					}else{
						try{
							result.layer.on(p._event,p.callback);
						}catch(err){
							console.log(err)
						}
						
					}
				}
			});
		}
	}
	LayersManager.unsetEventListener = function(_e){
		try{
			_e.remove();
		}catch(e){
			console.log(e);
		}
		
	}
	
	LayersManager.deselectAll = function(p){
		var excpt = p && p.except ? p.except : null;

		LayersManager.Layers.forEach(function(l){
			try{
				if(excpt != l.id){
					l.clearSelection();
				}
			}catch(e){ 
				
			}
		});	
		LayersManager._unset();
	}
	LayersManager.deselect = function(layerid){
		var layer = LayersManager.getLayer(layerid);
		if(layer){
			try{
				layer.clearSelection()
			}catch(e){
				console.log(e);
			}
		}
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
		return rtn;
	};
	LayersManager.isValid = function(_id){
		var rtn = false;
		//console.log(LayersManager.Layers)

		for(var i = 0; i < LayersManager.Layers.length; i++){
			var layer = LayersManager.Layers[i];
			if(layer.id == _id && layer.onMap){
				rtn = true;
				break;
			}
		}
		return rtn;
	}
	LayersManager.onLayerAddResult = function(p){
		map.on('layers-add-result',function(result){
			var lResult = result.layers;
			//console.log(p)
			if(p.layerid && p.callback){

				lResult.forEach(function(lr){
					if(!lr.error){
						var layer = lr.layer;

						if(layer.id == p.layerid){
							p.callback(layer);
						}
					}
				});
			}else{
				if(p.callback){
					p.callback(result.layers);
				}
			}

			
			/*if(p.layerid && p.callback){
				if(result.layer.id == p.layerid){
				
					p.callback(result.layer);	
				}
			}else{
				//if(result.layer.id != 'layer0' && !result.layer._TILE_FORMATS){
					if(p.callback){
						p.callback(result.layer);
					}
					
				//}
			}*/
			
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
		p.menu[]: id, target, url, label, icon, onClick()
		*/
		var layer = LayersManager.getLayer(p.layerId);
		try{
		if(layer){
			p.menu.forEach(function(menu){
				
				var _menu = jQ(document.createElement('div'));
				_menu.attr('layerid',layer.id);
				//_menu.attr('alpha','template');
				_menu.attr('border','template');
				_menu.attr('alpha','reverse');
				_menu.attr('hover-text','reverse');
				_menu.attr('hover-border','reverse');
				_menu.attr('hover-alpha','template');

				_menu.addClass('layer-menu');
				if(menu.class)
					_menu.addClass(menu.class);		
				
				if(menu.id)
					_menu.attr('menu-id',menu.id);
				
				if(menu.label){
					//_menu.attr('alt',menu.label);
					//_menu.attr('title',menu.label);
				}
				
				if(menu.target)
					_menu.attr('target',menu.target);

				if(menu.url)
					_menu.attr('url',menu.url);

				if(menu.attrName)
					_menu.attr('attr-name',menu.attrName);

				if(menu.paramNames)
					_menu.attr('param-names',menu.paramNames);

				if(menu.paramValues)
					_menu.attr('param-values',menu.paramValues);
				
				if(menu.icon){
					var d = new Date();
					var t = d.getTime();

					var img = jQ(document.createElement('img')).attr({
						'id':'s-menu-'+t,
						'class':'selection-menu-icon',
						'src':Mapp.path+'/extentions/n_esri/widgets/img/'+menu.icon,
						'alpha' : 'template',
						'border': 'template'
					});

					_menu.append(img);
				}
				
				if(menu.text){
					_menu.append('<span>'+menu.text+'</span>');	
				}
				
				if(menu.onClick){
					_menu.on('click',function(e){
						menu.onClick(e);	
					});	
				}		
				LayersManager.layersMenuHolder.append(_menu)		
			});
		}else{
			console.log(p.layerId + ' Not found or not Loaded')
		}
		}catch(e){
			Mapp.ErrorHandler({
				object:e
			});
		}
	}	


	LayersManager.getFeatureMenu = function(feature){
		if(feature.getLayer()._layerType){ /* KML Hack MENU*/
			var type = feature.getLayer()._layerType;
			if(type == 'KML'){
				LayersManager.currentFeature = feature;
				LayersManager.enableLayerMenu(feature.getLayer()._layerid);
			} 
		}else{
			this.selectFeatures({
				graphic:feature,
				type:'id',
				callback:function(features){
					console.log(features)
					LayersManager.enableLayerMenu();//
				}
			});
		}
			
	}
	LayersManager.getLayerName = function(layerid){
		rtn = null;
		var name = jQ('layers.data-content layer.onMap#'+layerid+' h3.layer-name').text();
		if(name != ''){
			rtn = name;	
		}
		return name;
	}
	
	LayersManager.getLayerMenuPosition = function(){
		if(LayersManager.currentFeature){
			var feature = LayersManager.currentFeature;
			var layerId = feature.getLayer().id;
			var menuHolder = LayersManager.layersMenuHolder;
			
			var menuIdx = parseInt(menuHolder.attr('menuIdx'));
	
			var MenuItemW = 28;//menuHolder.width();
			var MenuItemH = 28;//menuHolder.height();
			//var topDif = jQ('#'+Mapp.id).offset().top;
			var topDif = 0;
			var point = esri.geometry.toScreenPoint(map.extent,
						jQ('#'+Mapp.id).width(),
						jQ('#'+Mapp.id).height(),
						LayersManager.mapPoint);
			//console.log(jQ('#'+Mapp.id).width())
			//console.log(jQ('#'+Mapp.id).height())
			//console.log(jQ('#'+Mapp.id).offset().top)
			
			menuHolder.css({
				top: point.y - MenuItemW/2 + topDif,
				left:point.x + ((MenuItemW - MenuItemW*menuIdx) - MenuItemW/2)	
			});
		}
	};
	
	LayersManager.showLayerMenu = function(_layerId){
		var layerId = _layerId ? _layerId : LayersManager.currentLayer.id;
		LayersManager.layersMenuHolder.addClass('on');
		LayersManager.layersMenuHolder.find('.layer-menu').removeClass('active');
		LayersManager.layersMenuHolder.find('.layer-menu[layerid="'+layerId+'"]').addClass('active');		
	};
	
	LayersManager.hideLayerMenu = function(){
		LayersManager.layersMenuHolder.removeClass('on');
	}
	LayersManager.enableLayerMenu = function(layerId){

		var p = layerId ? layerId : null;
		//if(LayersManager.currentLayer){
		  if(LayersManager.mapPoint){
			  LayersManager.getLayerMenuPosition();
			  LayersManager.showLayerMenu(p);
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
			var field = "p_objectid";
			if(p.url.indexOf(c) != -1){
					c = "&";
			}

			if(LayersManager.currentFeature){
				var fAttr = LayersManager.getLayerType(p.layerid) == 'KML' ? "id": "OBJECTID";
				var paramsStr = "";
				
				if(p.attrName){
					var nameArr = [];
					var splitArr = p.attrName.split(',');
					splitArr.forEach(function(_name,i){
						var name  = jQ.trim(_name);
						var value = LayersManager.currentFeature.attributes[name] ?
									LayersManager.currentFeature.attributes[name] : "";

						var cnct  = (i<splitArr.length-1) ? "&" : "";
						paramsStr = paramsStr+
									'p_param_name='+name+'&'+
									'p_param_value='+value+cnct;
					});
				}

				if(p.paramNames && p.paramValues){
					var pNames = p.paramNames.split(',');
					var pVals  = p.paramValues.split(',');
					var str = "";
					
					pNames.forEach(function(pName,x){
						try{
							var name   = $.trim(pName);
							var val    = $.trim(pVals[x]);
							var concat = x < pNames.length-1 ? '&' : '';
						
							str = str+'p_param_name='+name+'&p_param_value='+val+concat;

						}catch(errrr){
							console.log(errrr)
						}
					});

					paramsStr = paramsStr ? paramsStr+'&'+str : str;
				}
				
				Mapp.setExternalUrl(
					p.url+c+
					field+'='+LayersManager.currentFeature.attributes[fAttr]+
					'&p_layer_id='+p.layerid+ (paramsStr ? '&'+paramsStr : '') //'&'+paramsStr
				);	
			}
			
		}else{
			window.open(p.url, '_blank');
		}
	};

	/* LAYER TOPOLOGY VALIDATION*/
	LayersManager.setLayerTopoRule = function(p){
		var layer = LayersManager.getLayer(p.id);
		if(layer){
			layer.topologyRules = {
				layers:p.layers,
				userCanChange:p.userCanChange,
				validateOnSubmit:p.validateOnSubmit
			}
			console.log(layer.topologyRules)
		}
	}

	var queryResult = {}

	var queryTopoOperations = function(p,idx){
		var indx = idx >= 0 ? idx : 0;
		
		if(indx < p.operations.length){ 
			var operationObj  = p.operations[indx];
			var operationName = 'SPATIAL_REL_'+operationObj.name.toUpperCase();
			var operationVal  = operationObj.value == 'N' ? false : true;

			var Query = new esri.tasks.Query();
     		
     		Query.geometry = p.geometry;
     		
     		Query.spatialRelationship = esri.tasks.Query[operationName];

     		 p.layer.queryFeatures(Query,function(e){

     		 	console.log(e);
     		 	console.log('Q RES')
     		 	
     		 	queryResult[operationObj.name] = e.features;

     		 	queryTopoOperations(p,indx+1);

     		 });

		}else{
			if(p.callback) p.callback(queryResult)
			queryResult = {};
		}
		//console.log(p)
	}
	
	var graphTopoArr = [];
	var validateGraphicTopo = function(p,idx){
		var indx = idx >= 0 ? idx : 0;
		if(indx < p.graphics.length){
			var graphic = p.graphics[indx];
			var layer = LayersManager.getLayer(p.layer.id);
			if(layer){

				queryTopoOperations({
					layer      : layer,
					geometry   : graphic.geometry,
					operations : p.layer.operations,
					callback:function(result){
						//console.log(result);

						graphTopoArr.push(result/*{
							graphic : graphic,
							result  : result
						}*/);
						validateGraphicTopo(p,indx+1);
					}
				})
			}
		}else{
			if(p.callback) p.callback(graphTopoArr);
			graphTopoArr = [];
		}
	}

	LayersManager.getTopologyResultXML = function(layerid,layers){
		var rtn = '<topology><title id="'+layerid+'">'+LayersManager.getLayerName(layerid)+'</title>';
		for(var layerid in layers){
			rtn+='<layer id="'+layerid+'" name="'+LayersManager.getLayerName(layerid)+'">';
				layers[layerid].forEach(function(operationsPerGraphic){
					rtn+='<graphic>';
					for(var operation in operationsPerGraphic){
						rtn+='<operation name="'+operation.toLowerCase()+'">';
						operationsPerGraphic[operation].forEach(function(feature){
							var idField = feature.getLayer().objectIdField;
							rtn+='<feature>'+feature.attributes[idField]+'</feature>';
						});
						rtn+='</operation>'
					}
					rtn+='</graphic>';
				});

			rtn+="</layer>";
		}
		rtn+='</topology>';
		console.log($.parseXML(rtn))
		return $.parseXML(rtn);
	}

	var validRtnObj = {};

	LayersManager.topologyValidation = function(p,control){
		var index = control >= 0 ? control : 0;
		var layer = LayersManager.getLayer(p.layerId);
		
		if(layer && p.graphics[0] && p.rules){
			if(index < p.rules.layers.length){
				var tlayer = p.rules.layers[index];
				
				validateGraphicTopo({
					layer:tlayer,
					graphics:p.graphics,
					callback:function(result){
						validRtnObj[tlayer.id.toString()] =  result;
						LayersManager.topologyValidation(p,index+1)
					}
				});
			}else{
				console.log(p.window)
				if(p.window){
					p.window.XMLTransform({
						xml 	: LayersManager.getTopologyResultXML(p.layerId,validRtnObj),
						xsl 	: path+'/extentions/n_esri/tmpl/IGRP-MAPP.topologyWindow.xsl',
						loading  : false,
						complete :function(){
							configTopoWindow(p.window,p);
							if(p.callback) p.callback(validRtnObj);
							validRtnObj = {};
						}
					});
				}else{
					if(p.callback) p.callback(validRtnObj);
						validRtnObj = {};
				}
				
			}		
		}
	}	

	var configTopoWindow = function(_window,p){
		_window.find('.topo-v-lyr h3').click(function(){
			var content = $(this).next('.topo-v-operations');
			content.toggleClass('hide');
		});

		/*GRAPHIC HOLDER HOVER*/
		var hoverGraph;
		var graphDefaultSymbol;
		_window.find('.topo-v-graphic-holder').hover(
			function(){//in
				var index   = ($(this).attr('index'))*1 - 1;
				var graphic = p.graphics[index];
				try{
					var highlightSymbol = new esri.symbol.SimpleFillSymbol(
			          esri.symbol.SimpleFillSymbol.STYLE_SOLID, 
			          new esri.symbol.SimpleLineSymbol(
			            esri.symbol.SimpleLineSymbol.STYLE_SOLID, 
			            new dojo._base.Color([255,0,0]), 1
			          ), 
			          new dojo._base.Color([125,125,125,0.35])
			        );
			        hoverGraph         = graphic;
					graphDefaultSymbol = graphic.symbol;
					graphic.setSymbol(highlightSymbol);

				}catch(e){
					console.log(e);
				}	
			},
			function(){//out
				hoverGraph.setSymbol(graphDefaultSymbol);
				_window.find('.topo-v-op-holder').removeClass('active');
				
				LayersManager.deselectAll({
					except:p.holdSelection
				});
				
				return;
			}
		)

		/*GRAPHIC HOLDER HOVER*/
		_window.find('.topo-v-op-holder').click(function(){
			_window.find('.topo-v-op-holder').removeClass('active');
			var features = $(this).attr('features');
			var fIds     = features.substring(0, features.length - 1).split(',');
			var layerId = $(this).parents('.topo-v-lyr').attr('id');

			LayersManager.deselectAll();
			
			if(fIds[0]){
				
				$(this).addClass('active');
				
				LayersManager.setLayerVisibility(layerId,true);

				LayersManager.select({
					layerid   : layerId,
					objectids : fIds,
					callback:function(res){
						//console.log(res);
					}
				});
			}
		});
	}





	LayersManager.onFeaturesAddSuccess = function(p){}
	/* APPLY EDITS GLOBAL*/

	LayersManager.addFeatures = function(p){
		console.log(p);
		var layer 	= p.layer ? p.layer : LayersManager.getLayer(p.layerId);
		var errCallback = p.error ? p.error : function(e){console.log(e)};
		if(layer){
			layer.applyEdits(p.graphics,null,null,function(addResult){
				if(addResult && addResult[0] && addResult[0].success){
					p.success(addResult);
					LayersManager.onFeaturesAddSuccess({
						layer :layer.id,
						result:addResult
					});
				}else{
					console.log('added:');
					console.log(addResult);
				}

				//if(p.callback) p.callback();
			},errCallback);
		}
	}

	LayersManager.updateFeatures = function(p){
		var layer 	= p.layer    ? p.layer : LayersManager.getLayer(p.layerId);
		if(layer){
			layer.applyEdits(null,p.graphics,null,function(a,updResult,d){
				if(updResult && updResult[0] && updResult[0].success)
					p.success(updResult);

				if(p.callback) p.callback();
			},function(err){
				console.log(err)
				Mapp.ErrorHandler({ text:err });
			});
		}
	}

	LayersManager.deleteFeatures = function(p){
		var layer 	= p.layer    ? p.layer : LayersManager.getLayer(p.layerId);
		if(layer){
			layer.applyEdits(null,null,p.graphics,function(a,u,deleteResult){
				if(deleteResult && deleteResult[0] && deleteResult[0].success)
					p.success(deleteResult);

				if(p.callback) p.callback();
			},function(err){
				console.log(err)
				Mapp.ErrorHandler({ text:err });
			});
		}
	}


	/* + + + */



	
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
			//layer.setVisibility(op);
			if(op){
				layer.show();
			}else{
				layer.hide();
			}

			jQ('mapdata layers layer[id="'+layer.id+'"] .layer-visibility').prop('checked',op);
			jQ('mapdata layers layer[id="'+layer.id+'"] .layer-visibility').prop('attr',op);	

			//if(!op) LayersManager.deselectFeatures();
		}	
	}
	LayersManager.getLayerVisibility = function(layerId){//recieve a layer id and returs if it is visible or not
		var rtn = null;
		var layer = LayersManager.getLayer(layerId);
		if(layer) rtn = layer.visible;
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
			
		});
		
	};
	//Layers from HTML to MAP
	LayersManager.LoadLayers = function(){
		var MapLayers = [];
		var token = $('mapdata token').text();
		var tokenParam = token != '' && token != 'NO_TOKEN' ? '?token='+token : '';
		console.log(tokenParam);
		
		Mapp.layers.forEach(function(_layer,_i){
			if(_layer.url && _layer.url != ''){
				var layer;

				if(_layer.type.toUpperCase() == "FEATURE ACCESS"){//FeatureAccess
					layer = new esri.layers.FeatureLayer(_layer.url+tokenParam,{
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
					if(_layer.label != ''){//set layer legend label
						layer.labelField = _layer.label;
					}
					LayersManager.setFALayerEvents(layer);
				}
				if(_layer.type == "WMS"){//WMS - TO IMPLEMENT
					layer = WMS(_layer.url, _layer.wmsLayers,{
						id:_layer.id,
						visible:_layer.visible,
						format: _layer.outfields[0] == 'image/jpeg' ? 'image/jpeg' : 'image/png'
					});
				}
				if(_layer.type == "WFS"){
					console.log('WFS');
				};

				if(_layer.type == "GEOJSON"){
					
					require([path+"/extentions/n_esri/js/geojsonlayer/geojsonlayer.js"],function (GeoJsonLayer ) {
						
						layer = new GeoJsonLayer({
			                url: _layer.url,
			                id:_layer.id,
							visible:_layer.visible
			            });

				    });
				};

				if(_layer.type.toUpperCase() == "KML"){
					layer = new esri.layers.KMLLayer(_layer.url,{
						visible:_layer.visible
					});
					layer.id = _layer.id;

					layer.on('load',function(e){
						layer.getLayers().forEach(function(_l){
							console.log(_l)
							_l._layerType = "KML";
							_l._layerid   = _layer.id
						});
					});
					
				}
				if(layer){
					layer.order 	= _i;
					layer.isDefault = true;
					console.log(layer)
					MapLayers.push(layer);
				}
			}
		});
		LayersManager.addLayers(MapLayers);
		//LayersManager._CertificateHack();
	}

	LayersManager.setLayerLabel = function(layer){
		try{
			var color = rgbValidation(layer.renderer.symbol.color,true);//true = inverse

			if(!color){
				color = rgbValidation(layer.renderer.symbol.outline.color,true);//true = inverse
			}
			var textSymbol = new esri.symbol.TextSymbol().setColor(new dojo.Color(color));
	        textSymbol.font.setSize("10pt");
	        textSymbol.font.setFamily(getMappFontFam());

	        var LabelRenderer = new esri.renderer.SimpleRenderer(textSymbol);

	        LayersManager.labelLayer.addFeatureLayer(layer, LabelRenderer, "{" + layer.labelField + "}");

		}catch(e){
			console.log(e);
		}
	}

	//Layer Render Config
	LayersManager.setLayerAttRenderer = function(p){
		/*
		p.layerid 
		p.fieldlaye
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
		layer.setRenderer(LayersManager.LayerAttRenderer(field,values,colors,labels,defaultSymbol));
		}catch(e){ 
			console.log(e)
			Mapp.ErrorHandler({
				object:e
			});
		}
	};
	//Layer Renderer Definition
	LayersManager.LayerAttRenderer = function(field,values,colors,labels,defaultSymbol){
			var attRender = new esri.renderer.UniqueValueRenderer(defaultSymbol, field.toString());
			if(colors.length == values.length){
				values.forEach(function(value, i){

					var color = colors[i],
						symbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color(color)),
						label = labels[i];
				
					if(value == '[notnull]'){
						value=" ";
						var s = attRender.defaultSymbol;
						attRender.defaultSymbol = symbol;
						symbol = s;
					}
					attRender.defaultLabel = "Outros";
					attRender.addValue({
						value:value,
						symbol:symbol,
						label:label
					});
				})
			};
			return attRender;
	}
	LayersManager.LayerReorder = function(e){
		if(e.layer.isDefault){ //layer is from application
			LayersManager.setOrder({
				layer:e.layer,
				order:e.index,
				callback:function(){
					
				}
			});
		}
	}
	LayersManager.setOrder = function(p){
		//p.layer.order = p.order;
	}
	//Layers Add To Map
	LayersManager.LayersAdded = function(results){
		var _Layers = results.layers;
		//LayersManager.Layers
	};
	LayersManager.setLayerControl = function(id){
		jQ('mapdata layer#'+id).addClass('onMap');
	}
	LayersManager.LayersAddedHandler = function(results){
		//console.log(results)
		//certificate OK
		LayersManager._certOk = true;
		//console.log(results)
		if(!LayersManager.labelLayer){ //add labelLayerToMap
			LayersManager.labelLayer = new esri.layers.LabelLayer({ id: "LayersManager-labelLayer" });
	 		map.addLayer(LayersManager.labelLayer);
		}
		var idx = 0;
		var total = results.layers.length-1;
		
		results.layers.forEach(function(l,i){
			if(!l.error){
				l.layer.onMap = true;
				LayersManager.setLayerControl(l.layer.id);
				//console.log(l.layer.id+'->>'+l.layer.order);
				LayersManager.Layers[l.layer.order] = l.layer;
				if(l.layer.labelField){
					LayersManager.setLayerLabel(l.layer);
				}
				idx++;
			}else{
				jQ('mapdata layer#'+l.layer.id).remove();
				console.log(l);
			}
		});

		var c = cleanArray(LayersManager.Layers);//clear whitespaces on Layers[]
		LayersManager.Layers = c;

		jQ.each(jQ('.layer-theme'),function(i,theme){ //show theme if layer is on MAP and not hidden
			if(jQ(theme).find('layer.onMap:not([hidden="true"])').length == 0){
				jQ(theme).addClass('no-visible-layers');
			}
		});
		
		if(jQ('mapdata layer.onMap:not([hidden="true"])').length > 0){
			jQ('.layers-controller').addClass('active');
		}


		/* SnapManager */
		try{
			if(!LayersManager.snapped){
				var infos = [];
				results.layers.forEach(function(l){
					if(!l.error){
						var info = {
							layer:l.layer
						}
						infos.push(info);
					}
				});
				LayersManager.snapManager.setLayerInfos(infos);
				LayersManager.snapped = true;
			}
		}catch(e){
			console.log(e);
		}
		
		LayersManager.configSortableLayers();
	}


	LayersManager.addLayers = function(layers){
		/* layers [] */
		try{
			map.addLayers(layers);	
		}catch(err){
			console.log(err);
		}
	}
	
	LayersManager.LayerAdded = function(result){
		console.log(result.layer.id)
	};

	LayersManager.resortLayers = function(ui){
		//console.log(ui);
		var controller = 0;
		var clone = [];
		for(var x = jQ('mapdata layer').length-1; x >= 0 ; x--){
			var item = jQ(jQ('mapdata layer')[x]);
			var id   = item.attr('id');
			var layer=LayersManager.getLayer(id);
			if(layer){
				clone[controller] = layer;
				layer.order = controller;
				map.reorderLayer(layer,controller);
				controller++;	
			}
		}
		LayersManager.Layers = clone;
	}
	LayersManager.configSortableLayers = function(){
		jQ('mapdata layers').sortable({
			items:'.layer-theme',
			delay:150,
			helper:'clone',
			update:function(e,ui){
				try{
					LayersManager.resortLayers(ui);
				}catch(err){
					console.log(err)
				}
			}
		});
		jQ('.layer-theme').sortable({
			items:'layer.onMap',
			helper:'clone',
			delay:150,
			update:function(e,ui){
				try{
					LayersManager.resortLayers(ui);
				}catch(err){
					console.log(err)
				}
			}
		});
		jQ('.layer-theme').disableSelection();
	}
	
	LayersManager.getSelectionColor = function(layerid){
		var rtn = null;
		var layer = LayersManager.getLayer(layerid);
		if(layer && layer.getSelectionSymbol()){
			var color = layer.getSelectionSymbol().color;
			rtn = color;
		}
		return rtn;
	}
	//Layers Selection Symbol
	LayersManager.getSelectionSymb = function (layer){

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


	LayersManager.configLayerLookUp = function(){
		try{
			var lookupParam = getParamByName('p_lookup');
			if(lookupParam != ''){
				/* 
				 p_lookup=layerid:582|parent_tag:poligono_id,tag2,tag3|field:objectid,attr1,attr2
				*/
				var lookUpSplit = lookupParam.split('|');

				var layerP  = lookUpSplit[0];//layerid:582
				var tagsP   = lookUpSplit[1];//parent_tag:poligono_id,tag2,tag3
				var fieldsP = lookUpSplit[2];//field:objectid,attr1,attr2
				

				var layerids = (layerP.split(':'))[1];//582
				var tags    = (tagsP.split(':')[1]).split(',');//poligono_id,tag2,tag3
				var fields   = (fieldsP.split(':')[1]).split(',')//objectid,attr1,attr2
				
				if(layerids){

					var layerArr = layerids.split(',');
					
					layerArr.forEach(function(layerid){

						if(tags.length == fields.length){
							
							var tagsObjs = []; //array de tags [{name:'tag_name',field:'field_name'}]
							
							for(var i=0;i<tags.length;i++){
								var _t = {
									name:tags[i],
									field:fields[i]
								}
							
								tagsObjs.push(_t);
							
							}

							var _menu = {
								id:'layer-'+layerid+'-lookupMenu',
								label:'Escolher',
								text:'Escolher',
								icon:'lookupchoose.png',
								onClick:function(e){
									var opener = window.opener ? window.opener : window.parent;
									if(opener){
										if(LayersManager.currentFeature){
											parseOpenerValues({
												form: $(opener.document.forms['formular_default']),
												tags:tagsObjs,
												feature:LayersManager.currentFeature,
												close:true
											});
										}
									}
								}
							}
							LayersManager.onLayerAddResult({
								layerid:layerid,
								callback:function(layer){
									LayersManager.setLayerMenu({
										layerId:layer.id,
										menu:[_menu]
									});
								}	
							});					
						}

					});

					
				}

				
			}
		}catch(err){
			console.log(err);
		}
	}
	LayersManager._CertificateHack = function(){
		setTimeout(function(){
			if(!LayersManager._certOk){
				BackgroundFade(true);
				jQ('#mapp-holder #mapp-cert-checker').addClass('active');
			}
		},8000)
		
	}
/*LAYERS MANAER END*/
