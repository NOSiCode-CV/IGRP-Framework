(function ( jQ ) { 
    jQ.fn.Anexacao = function() {
    	var id = this.attr('id');
		var anex = new Widget(id);
		var set = false;

		anex.canSelect = true;

		anex.Layers = [];
		anex.Features = [];
		anex.selected = false;
		anex.geomsArr = [];
		anex.currentLayer = null;
		anex.graphicLayer = null;
		anex.result = null;

		anex.field_join = null;
		anex.field_child = null;

		anex.objects = null;

		anex.onUnionConfirm = function(){}


		anex.onInit = function(){
			anex.includeCss('anexacao.style');
			anex.getLayers();
			anex.interfaceControl();
		}

		anex.onActivate = function(){
			LayersManager.hideLayerMenu();
			LayersManager.lock();

			anex.setGraphicLayer();

			Mapp.isEditing = true;
			
			if(anex.Features[0]){
				anex.setActiveStep('get',2);
			}else{
				anex.unsetActiveStep('get',2);
				anex.setActiveStep('get',1);
			}
		}

		anex.onDeactivate = function(){
			anex.currentLayer = null;
			anex.geomsArr = [];
			anex.Features = [];
			anex.result = null;
			anex.unsetGraphicLayer();
			LayersManager.deselectAll();
			set = false;
			anex.canSelect = true;
			anex.Html.find('.widget-step[step="1"]').removeClass('error');
		}

		anex.onMapClick = function(e){
			if(anex.canSelect){
				if(e.graphic){
					if(e.graphic.getLayer()){
						if(anex.checkLayer(e.graphic.getLayer().id)){
							var _layerid = e.graphic.getLayer().id;
							var idAttr = LayersManager.getLayerObjectIdField(_layerid);
							var _objectid = e.graphic.attributes[idAttr];
							var _method = 'SELECTION_ADD';
							
							anex.currentLayer = _layerid;

							for(i=0; i < LayersManager.getSelectedFeatures(_layerid).length; i++){
								if(LayersManager.getSelectedFeatures(_layerid)[i].attributes[idAttr] == _objectid){ //remove from selection if is alrd selected
									_method = 'SELECTION_SUBTRACT';
									break
								}
							}
							if(!set){
								LayersManager.select({
									layerid: _layerid,
									objectid: _objectid,
									method:_method,
									callback:function(e){
										if(LayersManager.getSelectedFeatures(_layerid).length > 1){
											anex.setActiveStep('get',2);
										}else{
											anex.unsetActiveStep('get',2);
										}
									}
								});
							}
						}
					}
				}
			}
		}

		anex.setGraphicLayer = function(){
			var graphicLayer = new esri.layers.GraphicsLayer({
				id:anex.id+'-glayer'
			});
			anex.graphicLayer = graphicLayer;
			map.addLayer(anex.graphicLayer);
		}
		anex.unsetGraphicLayer = function(){
			map.removeLayer(anex.graphicLayer);
		}

		anex.checkLayer = function(layerid){
			var rtn =false;
			anex.Layers.forEach(function(l){
				if(l == layerid){
					rtn = true;
				}
			});
			return rtn;
		}

		anex.getLayers = function(){
			jQ.each(anex.Html.find('layers layer'),function(idx,_layer){
				var layer = jQ(_layer).attr('id');
				
				anex.Layers.push(layer);

				anex.field_join = jQ(_layer).find('field_join').attr('name');
				
				anex.field_child = jQ(_layer).find('field_child').attr('name');
			});
		}
		
		anex.getGeometries = function(features){
			var rtn = [];
			features.forEach(function(f){
				rtn.push(f.geometry);
			})
			return rtn;
		}

		anex.drawUnion = function(e){
			var symbol = new esri.symbol.SimpleLineSymbol();

			var graphic = new esri.Graphic(esri.geometry.webMercatorToGeographic(e),symbol);
			anex.graphicLayer.add(graphic);

			anex.unsetActiveStep('get',1);
			anex.setStepDone('get',3);			
		}
		var onUnionError = function(){
			anex.Features = [];
			anex.result = null;
			anex.Html.find('.widget-step[step="1"]').addClass('error');
			anex.unsetActiveStep('get',3);
			anex.unsetStepDone('get',2);
			anex.setActiveStep('get',2);
			set = false;
			
		}
		anex.interfaceControl = function(){
			anex.Html.find('#confirm-join').on('click',function(){
				anex.unsetActiveStep('get',2);
				anex.setActiveStep('get',3);
				set = true;

				anex.Features = LayersManager.getSelectedFeatures(anex.currentLayer);

				console.log(anex.Features);

				try{
					GeometryService.union({
						geometries:anex.getGeometries(LayersManager.getSelectedFeatures(anex.currentLayer)),
						callback:function(e){
							anex.result = e;
							try{
								anex.Html.find('.widget-step[step="1"]').removeClass('error');
								anex.drawUnion(e);
							}catch(error){
								console.log(error);
								onUnionError();
							}
							
						},
						error:function(e){
							onUnionError();
						}
					});
				}catch(err){
					console.log(err);
					onUnionError();
				}
				return false;
			});

			anex.Html.find('#confirm-join-values').on('click',function(){
				return false;
			});

			anex.Html.find('#cancel-join').on('click',function(){
				anex.currentLayer = null;
				anex.geomsArr = [];
				anex.Features = [];
				LayersManager.deselectAll();
				anex.graphicLayer.clear();
				anex.clearSteps();
				anex.setActiveStep('get',1);
				set = false;
				return false;
			});

			anex.Html.find('#confirm-anex-values').on('click',function(){
				try{
					var arrIds = [];
					anex.Features.forEach(function(obj){
						arrIds.push(obj.attributes['OBJECTID']);
					});
	
					jQ('input[name="'+anex.field_child+'"]').val(arrIds);
					
					console.log(GeometryService.convertGeometry(anex.result));

					jQ('input[name="'+anex.field_join+'"]').val(GeometryService.convertGeometry(anex.result));

					Mapp.ErrorHandler({
			 			text:'Opera\u00e7\u00e3o realizada com sucesso!'
			 		});

			 		anex.onUnionConfirm({
						objectIds:arrIds,
						result:GeometryService.convertGeometry(anex.result),
						fieldName:anex.field_join
					});

					anex.Html.removeClass('active');
			 		//WidgetManager.deactivateWidget(anex.id);
					
				}catch(confError){
					console.log(confError)
				}

				return false;
			});
		}

	}
}( jQuery ));
