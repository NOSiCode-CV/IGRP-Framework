(function ( jQ ) { 
    jQ.fn.FeatureEditDB = function() {
    	var id = this.attr('id');
		var fEdit = new Widget(id);
		fEdit.Layers = [];

		var selectedLayer = null;
		var layerGeomType = null;
		fEdit.shapeLayers  = [];

		fEdit.feature = null;
		fEdit.featureLayer = null;
		fEdit.editTool = null;
		fEdit.drawTool = null;
		fEdit.pointsTool = {
			adder: fEdit.Html.find('#point-add'),
			table: fEdit.Html.find('#point-table'),
			xInput:fEdit.Html.find('#xInput'),
			yInput:fEdit.Html.find('#yInput'),
			points:[],
			geometry: null,
			graphic: null,
			rings:[]
		}
		fEdit.snapManager = null;
		fEdit.drawLayer= null;
		/*interface vars*/
		fEdit.options = [];
		fEdit._option = "";
		fEdit.drawResult = null;
		fEdit.droppedFiles = null;
		fEdit.deleteFeaturesLayer = null;
		fEdit.toolEventsFirst  = ['graphic-first-move', 'rotate-first-move', 'scale-first-move', 'vertex-first-move'];
		fEdit.toolEventsChange = ['graphic-move-stop','rotate-stop','scale-stop','vertex-move-stop'];
		fEdit.canChange = true;

		
		fEdit.onInit = function(){
			fEdit.includeCss('featureeditdb.style');
			fEdit.getLayers();
			fEdit.configEdition();
			fEdit.configDrawing();
			fEdit.configPointsAdder();
			fEdit.configShapeLoad();
			fEdit.configDropCVS();
			fEdit.configTools();
			fEdit.setDrawingLayer();

			configEvents();
			
			fEdit.pointsTool.geometry = new esri.geometry.Polygon();
			fEdit.pointsTool.graphic = new esri.Graphic();
			fEdit.pointsTool.graphic.setSymbol(Mapp.symbols.polygon);

		}
		fEdit.setDrawingLayer = function(){
			var dlayer = new esri.layers.GraphicsLayer({
				id:fEdit.id+'-drawlayer'
			});
			fEdit.drawLayer = dlayer;
			map.addLayer(fEdit.drawLayer);
		}

		fEdit.onActivate = function(){
			LayersManager.lock();
		}

		fEdit.onDeactivate = function(){
			DEACTIVATEALL();
			clearTopoValid();
		}

		fEdit.onMapClick = function(e){
			try{
				if(fEdit._option == 'drop'){
					if(e.graphic){
						if(e.graphic.getLayer()){
							if(e.graphic.getLayer().id == fEdit.drawLayer.id){//click on drawLayer
								fEdit.setGraphicEdition(e.graphic);
							}
						}else{
							fEdit.editTool.deactivate();
						}
					}else{
						fEdit.editTool.deactivate();
					}
				}
				if(fEdit._option == 'edit'){
					if(!fEdit.feature){
						if(e.graphic){
							if(e.graphic.getLayer()){
								var layerId = e.graphic.getLayer().id;

								//for(var count = 0; count < fEdit.Layers.length; count++){
									//var l = fEdit.Layers[count];
									if(SELECTEDLAYER.id == layerId){
										LayersManager.selectFeatures({
											graphic:e.graphic,
											type:'id',
											callback:function(f){
												fEdit.setFeature(f[0]);
												fEdit.starEdition();
												//fEdit.setStepDone(1);
											}
										});
										//break;
									}
								//}
							}
						}
					}
				}
				if(fEdit._option == 'delete'){
					if(e.graphic){
						if(e.graphic.getLayer()){
							var layerId = e.graphic.getLayer().id;
							//fEdit.Layers.forEach(function(l){
								if(SELECTEDLAYER.id == layerId){
									fEdit.deleteFeaturesLayer = layerId;
									LayersManager.selectFeatureById({
										objectId:e.graphic.attributes['OBJECTID'],
										layerid:layerId,
										method:'SELECTION_ADD',
										callback:function(features){
											//console.log(features)
											if(features.length > 0){
												fEdit.setStepDone('delete',1);
											}
										}
									})
								}
							//})
						}
					}				
				}
			}catch(err){
				console.log(err);
			}
		}
		fEdit.setFeature = function(_feature){
			fEdit.feature = _feature;
			fEdit.featureLayer = _feature.getLayer().id;
		}

		fEdit.unsetFeature = function(_feature){
			fEdit.feature = null;
			fEdit.featureLayer = null;
		}

		var getCookie = function(name) {
		  var value = "; " + document.cookie;
		  var parts = value.split("; " + name + "=");
		  if (parts.length == 2) return parts.pop().split(";").shift();
		}

		var getUserName = function(){
			return getCookie('nosiactiv');
		}

		var getBeforeApplyEditsAttrs = function(){
			var rtn = {};
			var fields = jQ('input[name="p_luis_max_field_value"]');
			
			jQ.each(fields,function(i,f){
				var val    = jQ(f).val();
				var valArr = val.split(',');
				var layer = jQ.trim(valArr[0]);
				var fName = jQ.trim(valArr[1]);
				var fVal  = jQ.trim(valArr[2]);

				if(!rtn[layer])
					rtn[layer] = {};

				rtn[layer][fName] = fVal;

			});
			return rtn;
		}

		console.log( getBeforeApplyEditsAttrs() )

		var setUserAttr = function(layer,graphic,op){
			
			var aEditsAttrs = getBeforeApplyEditsAttrs();
			var attributes = {};
			
			console.log(op);

			if(aEditsAttrs[layer.id]){
				for(var i = 0; i < layer.fields.length; i++){
					var f = layer.fields[i];

					if(aEditsAttrs[layer.id][f.name]){
						var val = f.type == 'esriFieldTypeDouble' || f.type == 'esriFieldTypeSmallInteger' ? Number( aEditsAttrs[layer.id][f.name] ) : aEditsAttrs[layer.id][f.name];

						if(op == 'edit')
							graphic.attributes[f.name] = val;
						else
							attributes[f.name] = val;

					}

				}

				if(op =='draw')
					graphic.setAttributes(attributes);
			}

		}

		fEdit.configDrawing = function(){
			fEdit.drawTool = new esri.toolbars.Draw(map, {
				showTooltips:false
			});
			fEdit.drawTool.on('draw-end',fEdit.drawEnd);
			fEdit.Html.find('#save-add').on('click',function(){
				try{
					clearTopoValid();
					if(fEdit.drawResult){
						var layer = LayersManager.getLayer(SELECTEDLAYER.id);

						setUserAttr(layer,fEdit.drawResult,'draw');
						
						LayersManager.addFeatures({
							layer    : layer,
							graphics : [fEdit.drawResult],
							success  : function(result){
								Mapp.ErrorHandler({ text:'Criado com sucesso' });
								layer.refresh();
							},
							callback      :function(){
								fEdit.drawResult = null;
								fEdit.unsetActiveStep('add',2);
								fEdit.unsetStepDone('add',1);
								fEdit.unsetActiveStep('add',1);
								fEdit.startOption('add');
							},
							error:function(err){
								Mapp.ErrorHandler({ text:err });
							}
						});
						/*LayersManager.applyEdits({
							layer        :layer,
							adds         :[fEdit.drawResult],
							onAddSuccess :function(result){
								Mapp.ErrorHandler({ text:'Criado com sucesso :)' });
								layer.refresh();
							},
							callback      :function(){
								fEdit.drawResult = null;
								fEdit.unsetActiveStep('add',2);
								fEdit.unsetStepDone('add',1);
								fEdit.unsetActiveStep('add',1);
								fEdit.startOption('add');
							}
						});*/
						
						/*layer.applyEdits([fEdit.drawResult],null,null,function(add,update,_delete){
							console.log(add);
							if(add[0].success){
								Mapp.ErrorHandler({ text:'Criado com sucesso :)' });
								layer.refresh();
							}
							fEdit.drawResult = null;
							fEdit.unsetActiveStep('add',2);
							fEdit.unsetStepDone('add',1);
							fEdit.unsetActiveStep('add',1);
							fEdit.startOption('add');
						});*/
					}
				}catch(e){console.log(e)}
				return false;
			});

			fEdit.Html.find('#cancel-add').on('click',function(e){
				e.preventDefault();
				try{
					fEdit.drawLayer.clear();
					fEdit.drawResult = null;
					fEdit.unsetActiveStep('add',2);
					fEdit.unsetStepDone('add',1);
					fEdit.unsetActiveStep('add',1);
					fEdit.startOption('add');
					clearTopoValid();

				}catch(e){
					Mapp.ErrorHandler({
						object:e
					});
				}
				return false;
			});
			
		}
		fEdit.configEdition = function(){
			var EditionCallback = function(){
				try{
					clearTopoValid();
					var objId = fEdit.feature.attributes['OBJECTID'];
					var layerId = fEdit.featureLayer;
					var layer = LayersManager.getLayer(layerId);
					var edits = GeometryService.convertRings([fEdit.feature.geometry],'|');

					setUserAttr(layer,fEdit.feature,'edit');

					console.log(fEdit.feature);

					LayersManager.updateFeatures({
						layer    : layer,
						graphics : [fEdit.feature],
						success  : function(result){
							Mapp.ErrorHandler({ text:'Editado com sucesso' });
							layer.refresh();
						},
						callback      :function(){
							LayersManager.deselectAll();
							fEdit.feature = null;
							fEdit.unsetActiveStep('edit',2);
							fEdit.unsetStepDone('edit',1);
							fEdit.unsetActiveStep('edit',1);
							fEdit.startOption('edit');
							fEdit.editTool.deactivate();
							fEdit.canChange = true;
						}
					});
				}catch(e){
					Mapp.ErrorHandler({
						object:e
					});
				}
				return false;
			}

			fEdit.editTool = esri.toolbars.Edit(map);
			fEdit.editTool.on('deactivate',function(e){
				if(e.info.isModified){
					//e.graphic.getLayer().refresh();
					Mapp.Editing = false;
				}
			});
			fEdit.toolEventsFirst.forEach(function(e){
				fEdit.editTool.on(e,function(info){
					fEdit.setStepDone('edit',2);
					fEdit.canChange = false; //cannot change menu. graphic on edition
				})
			});


			fEdit.toolEventsChange.forEach(function(ev){
				/*fEdit.editTool.on(ev,function(info){
					clearTopoValid();
					
					graphicsValidation({
						graphics:[info.graphic],
						callback:function(){
							fEdit.editTool.deactivate();
						}
					});

				})*/
			});

			fEdit.Html.find('#confirm-edition-0').on('click',function(){
				fEdit.editTool.deactivate();
				if(getTopoValidation(SELECTEDLAYER.id)){
					graphicsValidation({
						graphics:[fEdit.feature],
						callback:function(){
							fEdit.unsetActiveStep('edit',2);
							fEdit.setActiveStep('edit',3);
							fEdit.editTool.deactivate();
						}
					});

				}else{
					EditionCallback();
				}
				/*graphicsValidation({
					graphics:[fEdit.feature],
					callback:function(){
						//fEdit.editTool.deactivate();
					}
				});*/
				return false;
			});

			fEdit.Html.find('#re-edition-0').on('click',function(){
				return false;
			});
			


			fEdit.Html.find('#confirm-edition').on('click',function(){
				EditionCallback();
				return false;
			});

			fEdit.Html.find('#cancel-edition').on('click',function(){
				try{

					fEdit.unsetActiveStep('edit',3);
					fEdit.unsetStepDone('edit',2);
					fEdit.setActiveStep('edit',2);

					fEdit.setGraphicEdition(fEdit.feature);
					console.log(fEdit.feature._option);
					/*fEdit.editTool.deactivate();
					LayersManager.deselectAll();
					fEdit.feature = null;

					LayersManager.getLayer(SELECTEDLAYER.id).refresh();
					
					fEdit.unsetActiveStep('edit',3);
					fEdit.unsetActiveStep('edit',2);
					fEdit.unsetStepDone('edit',1);
					fEdit.unsetActiveStep('edit',1);

					fEdit.startOption('edit');
					fEdit.canChange = true;*/
					clearTopoValid();
				}catch(err){
					Mapp.ErrorHandler({
						object:err
					});
				}
				return false;
			});

		}
		fEdit.configTools = function(){
			jQ.each(fEdit.Html.find('.widget-option'),function(){
				fEdit.options.push(jQ(this).attr('rel'));
			});
			
			fEdit.Html.find('.widget-option-group li').on('click',function(){
				if(fEdit.canChange){
					if(!jQ(this).hasClass('active')){
						var option = jQ(this).attr('rel');
						fEdit.Html.find('.widget-option-group li').removeClass('active');
						jQ(this).addClass('active')

						fEdit.clearOptions();
						fEdit.startOption(option);
						
						if(option == 'coords')
							fEdit.pointsTool.xInput.focus();

						clearTopoValid();
					}
				}else{
					/*Mapp.ErrorHandler({
						text:'Escolha uma opção.'
					})*/
				}
				
			});
			fEdit.Html.find('#confirm-delete').on('click',function(){
				try{
					clearTopoValid();
					//var layer = LayersManager.getLayer(fEdit.deleteFeaturesLayer);
					var layer = LayersManager.getLayer(SELECTEDLAYER.id);
					var selectedFeatures = layer.getSelectedFeatures();
					//console.log(selectedFeatures);
					layer.applyEdits(null,null,selectedFeatures,function(add,update,_delete){
						if(_delete[0].success){
							Mapp.ErrorHandler({ text:'Eliminado com sucesso' })
						}
						fEdit.deleteFeaturesLayer = null;
						fEdit.unsetActiveStep('delete',2);
						fEdit.unsetStepDone('delete',1);
						fEdit.unsetActiveStep('delete',1);
						fEdit.startOption('delete');
						
					});
				}catch(e){
					console.log(e);
				}
				return false;
			});
			/*shapefile control*/
			fEdit.Html.find('#save-shapefile').on('click',function(){
				clearTopoValid();
				
				var layer = LayersManager.getLayer(SELECTEDLAYER.id);
				
				if(layer){
					
					var graphs = (fEdit.shapeLayers[0].graphics);
					
					graphs.forEach(function(g){
						setUserAttr(layer,g,'draw');
					});

					console.log(graphs)

					LayersManager.addFeatures({
						layer    : layer,
						graphics : graphs,
						success  : function(result){
							console.log(result);
							Mapp.ErrorHandler({ text:'Criado com sucesso' });
							layer.refresh();
							fEdit.removeShapes();
						},
						callback      :function(){
							console.log('cb')
							layer.refresh();
							fEdit.removeShapes();
						},
						error:function(err){
							console.log(graphs)
							layer.refresh();
							fEdit.removeShapes();
							console.log(err);
						}
					});

					/*layer.applyEdits(graphs,null,null,function(a,u,d){
						layer.refresh();
						fEdit.removeShapes();
						
					},function(err){
						layer.refresh();
						fEdit.removeShapes();
						console.log(err);
					});*/

					fEdit.unsetStepDone('shapefile',2);
					fEdit.unsetActiveStep('shapefile',2);
				}

				return false;
			});

			fEdit.Html.find('#cancel-shapefile').on('click',function(){
				fEdit.unsetStepDone('shapefile',2);
				fEdit.unsetActiveStep('shapefile',2);
				fEdit.removeShapes();
				clearTopoValid();
				return false;
			});

			/* DROP */
			fEdit.Html.find('#cancel-drop').on('click',function(e){
				e.preventDefault();
				try{
					fEdit.drawLayer.clear();
					fEdit.unsetActiveStep('drop',1);
					WidgetManager.deactivateWidget(fEdit.id);

				}catch(e){
					Mapp.ErrorHandler({object:e});
				}
				clearTopoValid();
				return false;
			});

			fEdit.Html.find('#confirm-drop').on('click',function(e){
				e.preventDefault();
				clearTopoValid();
				try{
					if(fEdit.droppedFiles[0]){
						//var layer = LayersManager.getLayer(fEdit.Layers[0]);
						var layer = LayersManager.getLayer(SELECTEDLAYER.id);
						if(layer){
							layer.applyEdits(fEdit.droppedFiles,null,null,function(add,update,_delete){
								if(add[0].success){
									Mapp.ErrorHandler({ text:'Criado com sucesso' });
									layer.refresh();
								}
								fEdit.drawLayer.clear();
								fEdit.unsetActiveStep('drop',1);
								
							});
						}
					}
				}catch(e){console.log(e)}
				return false;				
			});

			fEdit.Html.find('#reset-layer').on('click',function(){
				DEACTIVATEALL();
			});

		}
		fEdit.drawEnd = function(evt){
			//console.log(evt)
			var symbol,geom;
			switch (evt.geometry.type) {
				case "point":
				case "multipoint":
					symbol = new esri.symbol.SimpleMarkerSymbol();
				break;
				case "polyline":
					symbol = new esri.symbol.SimpleLineSymbol();
				break;
				default:
					symbol = new esri.symbol.SimpleFillSymbol().setStyle(esri.symbol.SimpleFillSymbol['STYLE_SOLID']);
				break;
			}

			//04.10.16
			//var graphic = new esri.Graphic(esri.geometry.webMercatorToGeographic(evt.geometry),symbol);

			geom = map.spatialReference.isWebMercator() ? esri.geometry.webMercatorToGeographic(evt.geometry) : evt.geometry;
			var graphic = new esri.Graphic(geom,symbol);

			var layer = LayersManager.getLayer(SELECTEDLAYER.id);

			fEdit.drawTool.deactivate();

			fEdit.drawLayer.add(graphic);
			fEdit.Html.find('[rel="add"] [step="1"] .step-help').hide();

			graphicsValidation({
				graphics:[graphic],
				callback:function(){
					fEdit.setStepDone('add',1);
					fEdit.drawResult = graphic;
				}
			});
		}

		fEdit.setGraphicEdition = function(feature){
			fEdit.editTool.activate(
				esri.toolbars.Edit.ROTATE | 
				esri.toolbars.Edit.EDIT_VERTICES | 
				esri.toolbars.Edit.MOVE | 
				esri.toolbars.Edit.SCALE, 
				feature
			);
			Mapp.isEditing = true;
		}

		fEdit.starEdition = function(){
			fEdit.unsetStepDone('edit',2);
			fEdit.unsetActiveStep('edit',1);
			fEdit.setActiveStep('edit',2);
			if(fEdit.feature){
				fEdit.setStepInfo({
					option:'edit',
					step:1,
					tagid:'featureid',
					type:'text',
					value:fEdit.feature.attributes['OBJECTID']
				});
				fEdit.setGraphicEdition(fEdit.feature);
				
				
			}
		}
		fEdit.stopEdition = function(){
			fEdit.editTool.deactivate();
			fEdit.unsetFeature();
			LayersManager.deselectAll();
		}
		fEdit.clearOptions = function(){
			fEdit.options.forEach(function(o){
				fEdit.Html.find('.widget-option[rel="'+o+'"]').removeClass('active');
				fEdit.Html.find('.widget-option[rel="'+o+'"] .widget-step').removeClass('active done');
			});
			fEdit.removeShapes();
			fEdit._option = "";
			fEdit.drawResult = null;
			fEdit.deleteFeatures = null;
			fEdit.drawTool.deactivate();
			fEdit.canChange = true;
			fEdit.stopEdition();			
		}
		fEdit.startOption = function(option){
			if(SELECTEDLAYER.id){
				fEdit.Html.find('.widget-option[rel="'+option+'"]').addClass('active');
				jQ('.widget-option-group li[rel="'+option+'"]').addClass('active');
				fEdit.setActiveStep(option,1);
				fEdit._option = option;
				if(option == 'add'){ //draw graphic
					var gType = SELECTEDLAYER.type == 'POINT' ? 'MULTI_POINT' : SELECTEDLAYER.type;
					//fEdit.drawTool.activate(esri.toolbars.Draw[gType]);
					fEdit.drawTool.activate(esri.toolbars.Draw[SELECTEDLAYER.type]);
					Mapp.isDrawing = true;

				}else if(option == 'shapefile'){ //shapefile
					fEdit.Html.find('.widget-option-group li[rel="shapefile"]').removeClass('active');
					jQ('#f-e-file').val('');
					jQ('#f-e-file').click();
				}else{
					fEdit.drawResult = null;
					Mapp.isDrawing = false;
					fEdit.drawTool.deactivate()
				}
			}
		}
		fEdit.getLayers = function(){
			jQ.each(fEdit.Html.find('> layers > layer'),function(i,_l){
				var layer = new Object();
				var topoRules = $(_l).find('topologyrules');

				layer.id = jQ(_l).attr('id');

				if(topoRules[0]){
					layer.topologyRules = {
						userCanChange   : topoRules.attr('usercanchange'),
						validateOnSubmit: topoRules.attr('validateonsubmit'),
						layers:[]
						//operations      : []
					}
					$.each(topoRules.find('layer'),function(i,lay){
						var __layer = {
							id         : $(lay).attr('id'),
							name       : $(lay).attr('name'),
							operations : []
						}
						$.each($(lay).find('operation'),function(i,op){
							var operation = {
								name :$(op).attr('name'),
								value:$(op).attr('value')
							}
							__layer.operations.push(operation)
						});
						layer.topologyRules.layers.push(__layer);
					});
				}

				fEdit.Layers.push(layer);
			});
			$.each(fEdit.Html.find('.mapp-layer-chooser-select option'),function(){
				var id = $(this).attr('value');
				if(id != '')
					$(this).text($('mapdata layers layer#'+id+' .layer-data h3.layer-name').text());
			});
			var menuEdit = {
				id:fEdit.id+'-widget-edit',
				icon:'edit.png',
				label:'Editar',
				text:'Editar',
				//icon:'edit.png',
				onClick:function(e){
					SELECTEDLAYER.set(LayersManager.currentFeature.getLayer().id);
					WidgetManager.activateWidget(fEdit.id);
					fEdit.startOption('edit');
					fEdit.setFeature(LayersManager.currentFeature);
					fEdit.starEdition();
				}
			}
			var menuDelete = {
				id:fEdit.id+'-widget-delete',
				label:'Eliminar',
				icon:'delete.png',
				text:'Eliminar',
				//icon:'delete.png',
				onClick:function(e){
					SELECTEDLAYER.set(LayersManager.currentFeature.getLayer().id);
					WidgetManager.activateWidget(fEdit.id);
					fEdit.startOption('delete');
					fEdit.deleteFeaturesLayer = LayersManager.currentFeature.getLayer().id;
					fEdit.setStepDone('delete',1);
				}
			}
			var menus = [menuEdit,menuDelete];
			fEdit.Layers.forEach(function(_l){
				LayersManager.onLayerAddResult({
					layerid:_l.id,
					callback:function(layer){	
						LayersManager.setLayerMenu({
							layerId:layer.id,
							menu:menus
						});
					}
				});

			});
		}

		fEdit.removeShapes = function(){
			fEdit.shapeLayers.forEach(function(_l){
				map.removeLayer(_l);
			});
		}

		/*ADD COORDINATES POINTS*/
		fEdit.addGraphicFromPoint = function(){
			var geometry = esri.geometry.Polygon();
			geometry.addRing(fEdit.pointsTool.rings);	

			var graphic = new esri.Graphic(geometry,Mapp.symbols.polygon);

			fEdit.drawLayer.clear();
			fEdit.drawLayer.add(graphic);

			if(fEdit.pointsTool.rings[0])
				fEdit.setStepDone('coords',1)
			else
				fEdit.unsetStepDone('coords',1)
		}

		fEdit.setPoint = function(p){
			var point = [p.x,p.y];
			if(isNaN(p.index)){				
				fEdit.pointsTool.rings.push(point);
			}else{
				fEdit.pointsTool.rings[p.index] = point;
			}
			console.log(fEdit.pointsTool.rings.length);
			fEdit.addGraphicFromPoint();
		}

		fEdit.unsetPoint = function(p){
			if(!isNaN(p.index)){	
				fEdit.pointsTool.rings.splice(p.index,1);
				jQ(fEdit.pointsTool.table.find('li')[p.index]).remove();
				fEdit.addGraphicFromPoint();
				fEdit.pointsTool.xInput.focus();
			}
		}

		fEdit.clearPointsForm = function(){
			fEdit.pointsTool.xInput.val('');
			fEdit.pointsTool.yInput.val('');
			fEdit.pointsTool.table.attr('edition-index','');
			fEdit.pointsTool.table.find('li').removeClass('onEdition');
		}

		fEdit.clearPointsTable  = function(){
			fEdit.pointsTool.table.html('');
			fEdit.pointsTool.rings = [];
		}

		fEdit.editPoint = function(p){
			fEdit.pointsTool.xInput.val(p.x);
			fEdit.pointsTool.yInput.val(p.y);
			fEdit.pointsTool.table.attr('edition-index',p.index);
		}

		fEdit.addPointToTable = function(p){
			var tb = fEdit.pointsTool.table;
			var index = fEdit.pointsTool.table.attr('edition-index');
			
			if(index){
				var tr = jQ(tb.find('li')[index]);
				tr.find('.x-input').text(p.x);
				tr.find('.y-input').text(p.y);
			}else{
				var holder = jQ(document.createElement('li'));
				var xTd    = jQ(document.createElement('span')).text(p.x).addClass('x-input');			
				var yTd    = jQ(document.createElement('span')).text(p.y).addClass('y-input');;
				holder.append(xTd);
				holder.append(yTd);
				holder.append(fEdit.getPointEditTmpl());
				tb.append(holder);
			}
			
			fEdit.setPoint({
				x:parseFloat(p.x),
				y:parseFloat(p.y),
				index:parseInt(index)
			});

			fEdit.clearPointsForm();
		}

		fEdit.validPointsInputs = function(){
			var rtn = false;
			if(fEdit.pointsTool.xInput.val() != '' && fEdit.pointsTool.yInput.val() != ''){
				rtn = true;
			}
			return rtn;
		}

		fEdit.configPointsAdder = function(){
			fEdit.Html.on('keyup',function(e){
				e.preventDefault();
				if(e.which == 13){
					if(fEdit.pointsTool.xInput.is(':focus') && fEdit.pointsTool.xInput.val())
						fEdit.pointsTool.yInput.focus();

					if(fEdit.pointsTool.yInput.is(':focus') && fEdit.pointsTool.yInput.val() && fEdit.pointsTool.xInput.val())
						fEdit.pointsTool.adder.click();
					
				}
				return false;
			})
			fEdit.pointsTool.adder.on('click',function(){ // add point
				if(fEdit.validPointsInputs()){
					var x = fEdit.pointsTool.xInput.val();
					var y = fEdit.pointsTool.yInput.val();
					
					fEdit.addPointToTable({
						x:x,
						y:y
					});

					fEdit.pointsTool.xInput.focus();
				}
			});

			fEdit.pointsTool.table.on('click','span.edit',function(){//edit point
				var holder = jQ(this).parents('li');
				fEdit.pointsTool.table.find('li').removeClass('onEdition');
				holder.addClass('onEdition');
				var index = holder.index();
				var x = parseFloat(holder.find('.x-input').text());
				var y = parseFloat(holder.find('.y-input').text());
				
				fEdit.editPoint({
					x:x,
					y:y,
					index:index
				});

				fEdit.pointsTool.xInput.focus();
			});

			fEdit.pointsTool.table.on('click','span.delete',function(){
				var holder = jQ(this).parents('li');
				var index = holder.index();
				
				fEdit.unsetPoint({
					index:parseInt(index)
				});
			});
			//
			
			fEdit.Html.find('#save-coords').on('click',function(){
				try{
					clearTopoValid();
					//var layer = LayersManager.getLayer(fEdit.Layers[0]);
					var layer = LayersManager.getLayer(SELECTEDLAYER.id);
					
					if(layer){
						layer.applyEdits([fEdit.drawLayer.graphics[0]],null,null,function(add,update,_delete){
							if(add[0].success){
								Mapp.ErrorHandler({ text:'Criado com sucesso :)' });
								layer.refresh();
								fEdit.clearPointsTable();
								fEdit.drawLayer.clear();
								fEdit.unsetStepDone('coords',1);
								fEdit.clearPointsForm();
								
							}
						});
					}
							
				}catch(e){console.log(e)}
				return false;
			});

			fEdit.Html.find('#cancel-coords').on('click',function(){
				fEdit.clearPointsTable();
				fEdit.drawLayer.clear();
				fEdit.unsetStepDone('coords',1);
				clearTopoValid();
				return false;
			});
		}
		fEdit.getPointEditTmpl  = function(){
			var holder  = jQ(document.createElement('span')).addClass('edition-holder');
			var edit    = jQ(document.createElement('span'));
			var _delete = jQ(document.createElement('span'));

			edit.addClass('edit');
			_delete.addClass('delete');

			holder.append(edit);
			holder.append(_delete);

			return holder;
		}
		/*SHAPE FILE*/

		fEdit.configShapeLoad = function(){
			require([
				"esri/request",
				"esri/InfoTemplate",
				"esri/renderers/SimpleRenderer",
				"esri/symbols/SimpleLineSymbol",
				"dojo/dom",
				"dojo/json",
				"dojo/on",
				"dojo/parser",
				"dojo/sniff",
				"dojo/_base/array",
				"dojo/_base/lang",
				"dojo/domReady!"
			  ],
				function (
				request,InfoTemplate,
				SimpleRenderer, SimpleLineSymbol,
				dom, JSON, on, parser, sniff, arrayUtils, lang
			  ) {
				 
				  parser.parse();
				  var _this = this;
				  var portalUrl = "https://www.arcgis.com";
				  var fileName;
				  

				  jQ('#f-e-file').on('change',function(event){
				  	console.log('FILE CHANGED')
				  	try{	
						
						fileName = event.target.value.toLowerCase();
						
						if (sniff("ie")) { //filename is full path in IE so extract the file name
						  var arr = fileName.split("\\");
						  fileName = arr[arr.length - 1];
						}
						
						if (fileName.indexOf(".zip") !== -1 ) {//is file a zip - if not notify user
						  generateFeatureCollection(fileName);
						}else {
						  
						}
					}catch(erro){ 
						console.log(erro) 
					}

				  });
			

				var generateFeatureCollection = function(fileName) {
					var name = fileName.split(".");
					name = name[0].replace("c:\\fakepath\\", "");

					var params = {
					  'name': name,
					  'targetSR': map.spatialReference,
					  'maxRecordCount': 1000,
					  'enforceInputFileSizeLimit': true,
					  'enforceOutputJsonSizeLimit': true
					};

					var extent = esri.geometry.getExtentForScale(map, 40000);
					var resolution = extent.getWidth() / map.width;
					var formId = jQ('.default_form').attr('id');


					params.generalize = false;
					//params.maxAllowableOffset = resolution;
					params.reducePrecision = false;
					params.numberOfDigitsAfterDecimal = 1;
		
					var myContent = {
					  'filetype'         : 'shapefile',
					  'publishParameters': JSON.stringify(params),
					  'f'                : 'json',
					  'callback.html'    : 'textarea'
					};

					var found     = false;

					fEdit.setActiveStep('shapefile',2);

					var xhr       = new XMLHttpRequest(),
						vFormData = new FormData();
						

					vFormData.append('file', jQuery( '#f-e-file' )[0].files[0], name+".zip");

					for(var i in myContent){
						vFormData.append(i, myContent[i] );
					}

					xhr.open( 'POST', portalUrl + '/sharing/rest/content/features/generate', true );

				    xhr.onreadystatechange = function ( ev ) {
						if(!found){
							var jsonF;
							
					    	try{
					    		if(ev.target.response.indexOf('<html><body><textarea>') == 0){

					    			var str = ev.target.response.replace('<html><body><textarea>','');
						    			str = str.replace('</textarea></body></html>','');

						    		jsonF = jQuery.parseJSON(str);
					    		}
					    		else{
					    			jsonF = ev.target.response;
					    		}

					    		if(jsonF && jsonF.featureCollection){

					    			var layerName = jsonF.featureCollection.layers[0].layerDefinition.name;
								
									addShapefileToMap(jsonF.featureCollection);

									console.log('ADD TO MAP')
					    			console.log(ev);

									found = true;
					    		}

					    		

					    	}catch(err){
					    		console.log(err);
					    	}
						}				    	
				    	
				    };
				    
				    xhr.send( vFormData );

					/*request({
					  url: portalUrl + '/sharing/rest/content/features/generate',
					  content: myContent,
					  form: dom.byId(formId),
					  useProxy:true,
					  handleAs: 'json',
					  callbackParamName: "callback",
					  load: lang.hitch(this, function (response) {
					  	console.log(response)
						
						if (response.error) {
							
						  errorHandler(response.error);
						  return;
						}

						var layerName = response.featureCollection.layers[0].layerDefinition.name;
						
						addShapefileToMap(response.featureCollection);
					  }),

					  error: function(e){
					  	console.log(this)
					  	lang.hitch(this, errorHandler)
					  }
					});*/
				}

				  var errorHandler = function(error) {
				  	console.log(error)
				  	Mapp.ErrorHandler({
				  		text:error.message
				  	});
				  };

				  var addShapefileToMap = function(featureCollection) {
				  
					var fullExtent;

					fEdit.shapeLayers  = [];

					arrayUtils.forEach(featureCollection.layers, function (layer) {
						
						var infoTemplate = new InfoTemplate("Details", "${*}");
						
						console.log(layer)

						featureLayer = new esri.layers.FeatureLayer(layer, {
			                //infoTemplate: infoTemplate
			            });

						featureLayer.on('click', function (event) {
	               			console.log(event)
	                	});

						changeRenderer(featureLayer);

						fullExtent = fullExtent ? fullExtent.union(featureLayer.fullExtent) :
									 featureLayer.fullExtent;
					
						fEdit.shapeLayers.push(featureLayer);

						map.addLayer(featureLayer);

					});		

					map.setExtent(fullExtent.expand(1.25), true);

					graphicsValidation({
						graphics:fEdit.shapeLayers[0].graphics,
						callback:function(){
						
							fEdit.setStepDone('shapefile',2);								
							dom.byId('f-e-status').innerHTML = "";
						}
					});
					
				  }

				  var changeRenderer = function (layer) {
					var symbol = null;
					switch (layer.geometryType) {
					  case 'esriGeometryPoint':
						symbol = new esri.symbol.PictureMarkerSymbol({
						  'angle': 0,
						  'xoffset': 0,
						  'yoffset': 0,
						  'type': 'esriPMS',
						  'url': 'http://static.arcgis.com/images/Symbols/Shapes/BluePin1LargeB.png',
						  'contentType': 'image/png',
						  'width': 20,
						  'height': 20
						});
						break;
					  case 'esriGeometryPolygon':
						symbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
						  new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
							new dojo.Color([112, 112, 112]), 1), new dojo.Color([136, 136, 136, 0.25]));
						break;
					}
					if (symbol) {
					  layer.setRenderer(new SimpleRenderer(symbol));
					}
				  }
				});
		}

		fEdit.setSelectedLayer = function(id){
			if(id){
				selectedLayer = id;
				setGeometryType(id);
				switch(fEdit._option){
					case 'add':
						//fEdit.
						fEdit.setStepDone('add',1);
						fEdit.setActiveStep('add',2);
						fEdit.drawTool.activate(esri.toolbars.Draw[layerGeomType]);
					break;
				}
			} 
			else{
				fEdit.unsetSelectedLayer();
			}   
		}
		fEdit.unsetSelectedLayer = function(){
			selectedLayer = null;
		}

		var configEvents = function(){
			fEdit.Html.find('#fedit-chooser select').on('change',function(){
				var id = jQ(this).val();
				SELECTEDLAYER.set(id);
			});
		}

		var setGeometryType = function(id){
			var layer = LayersManager.getLayer(id);
			if(layer){
				switch(layer.geometryType){
					case 'esriGeometryPoint':
						layerGeomType = 'POINT';
					break;
					case 'esriGeometryLine':
						layerGeomType = 'LINE';
					break;
					case 'esriGeometryPolygon':
						layerGeomType = 'POLYGON';
					break;
				}
			}
		}
		//getGeometryType
		fEdit.configDropCVS = function(){
			require([
			  "esri/config",
			  "esri/domUtils",
			  "esri/graphic",
			  "esri/InfoTemplate",
			  "esri/map",
			  "esri/request",
			  "esri/urlUtils",
			  "esri/dijit/InfoWindowLite",
			  "esri/geometry/Multipoint",
			  "esri/geometry/Point",
			  "esri/geometry/webMercatorUtils",
			  "esri/layers/ArcGISDynamicMapServiceLayer",
			  "esri/layers/ArcGISImageServiceLayer",
			  "esri/layers/FeatureLayer",
			  "esri/symbols/PictureMarkerSymbol",
			  "dojo/dom",
			  "dojo/dom-construct",
			  "dojo/json",
			  "dojo/on",
			  //"dojo/parser",
			  "dojo/_base/array",
			  "dojo/_base/lang",
			  "dojox/data/CsvStore",
			  "dojox/encoding/base64",
			  "dijit/Dialog",
			  "dijit/layout/BorderContainer",
			  "dijit/layout/ContentPane",
			  "dojo/domReady!"
			],
			  function (
			    esriConfig, domUtils, Graphic, InfoTemplate, Map, request, urlUtils,
			    InfoWindowLite, Multipoint, Point, webMercatorUtils, ArcGISDynamicMapServiceLayer,
			    ArcGISImageServiceLayer, FeatureLayer, PictureMarkerSymbol, dom, domConstruct,
			    JSON, on, /*parser,*/ arrayUtils, lang, CsvStore, base64
			) {

			  	//list of lat and lon field strings
			    var latFieldStrings = ["lat", "latitude", "y", "ycenter"];
			    var longFieldStrings = ["lon", "long", "longitude", "x", "xcenter"];

			  	setupDropZone();

			  	function setupDropZone () {
			      if (!window.File || !window.FileReader) {
			       // domUtils.show(dom.byId('uploadForm'));
			        console.log('You are using a browser that doesnt support drag/drop use the file upload box below to add your csv:')
			       // domUtils.show(dom.byId('msg'));
			        return;
			      }
			      var mapCanvas = jQ(Mapp.id)[0];
			      on(mapCanvas, "dragenter", function (event) {
			        event.preventDefault();
			      });
			      on(mapCanvas, "dragover", function (event) {
			        event.preventDefault();
			      });
			      on(mapCanvas, "drop", handleDrop);
			    }

			    function handleDrop (event) {
			      event.preventDefault();

			      var dataTransfer = event.dataTransfer,
			          files 	   = dataTransfer.files,
			          types 	   = dataTransfer.types;

			      if (files && files.length === 1) {
			        var file = files[0]; // that's right I'm only reading one file
			        console.log(file);
			        if (file.type.indexOf("image/") !== -1) {
			          //handleImage(file, event.layerX, event.layerY);
			        }
			        else if (file.name.indexOf(".csv") !== -1) {
			          handleCSV(file);
			        }
			      }
			      else if (types) {
			        console.log("[ TYPES ]");
			        console.log("  Length = ", types.length);
			        arrayUtils.forEach(types, function (type) {
			          if (type) {
			            console.log("  Type: ", type);
			            console.log("  Data: ", dataTransfer.getData(type));
			          }
			        });

			        // We're looking for URLs only.
			        var url;
			        arrayUtils.some(types, function (type) {
			          if (type.indexOf("text/uri-list") !== -1) {
			            url = dataTransfer.getData("text/uri-list");
			            return true;
			          }
			          else if (type.indexOf("text/x-moz-url") !== -1) {
			            url = dataTransfer.getData("text/plain");
			            return true;
			          }
			          else if (type.indexOf("text/plain") !== -1) {
			            url = dataTransfer.getData("text/plain");
			            url = url.replace(/^\s+|\s+$/g, "");
			            if (url.indexOf("http") === 0) {
			              return true;
			            }
			          }
			          
			          return false;
			        });

			        if (url) {
			          url = url.replace(/^\s+|\s+$/g, "");
			          // Check if this URL is a google search result.
			          // If so, parse it and extract the actual URL
			          // to the search result
			          if (url.indexOf("www.google.com/url") !== -1) {
			            var obj = urlUtils.urlToObject(url);
			            if (obj && obj.query && obj.query.url) {
			              url = obj.query.url;
			            }
			          }

			          if (url.match(/MapServer\/?$/i)) {
			            // ArcGIS Server Map Service?
			            
			            //handleMapServer(url);
			          }
			          else if (url.match(/(Map|Feature)Server\/\d+\/?$/i)) {
			            // ArcGIS Server Map/Feature Service Layer?
			            //handleFeatureLayer(url);
			          }
			          else if (url.match(/ImageServer\/?$/i)) {
			            // ArcGIS Server Image Service?
			            //handleImageService(url);
			          }
			        }
			      }
			    }

			    function handleImage (file, x, y) {
			      console.log("Processing IMAGE: ", file, ", ", file.name, ", ", file.type, ", ", file.size);
			      var reader = new FileReader();
			      reader.onload = function () {
			        console.log("Finished reading the image");
			        // Create an image element just to find out the image
			        // dimension before adding it as a graphic
			        var img = domConstruct.create("img");
			        img.onload = function () {
			          var width = img.width,
			              height = img.height;
			          console.log("Image dimensions: ", width, ", ", height);

			          // Add a graphic with this image as its symbol
			          var symbol = new PictureMarkerSymbol(reader.result,
			            width > 64 ? 64 : width,
			            height > 64 ? 64 : height);
			          var point = map.toMap(new Point(x, y));
			          var graphic = new Graphic(point, symbol);
			          map.graphics.add(graphic);
			        };

			        img.src = reader.result;
			      };
			      reader.readAsDataURL(file);
			    }

			    function handleCSV (file) {
			      console.log("Processing CSV: ", file, ", ", file.name, ", ", file.type, ", ", file.size);
			      if (file.data) {
			        var decoded = bytesToString(base64.decode(file.data));
			        processCSVData(decoded);
			      }
			      else {
			        var reader = new FileReader();
			        reader.onload = function () {
			        //  console.log("Finished reading CSV data");
			          processCSVData(reader.result);
			        };
			        reader.readAsText(file);
			      }
			    }

			    function processCSVData (data) {
			      var newLineIndex = data.indexOf("\n");
			      var firstLine = lang.trim(data.substr(0, newLineIndex)); //remove extra whitespace, not sure if I need to do this since I threw out space delimiters
			      var separator = getSeparator(firstLine);
			      
			      var csvStore = new CsvStore({
			        data: data,
			        separator: separator
			      });

			      csvStore.fetch({
			        onComplete: function (items) {

			          WidgetManager.activateWidget(fEdit.id);	

			          var objectId = 0;
			          var featureCollection = generateFeatureCollectionTemplateCSV(csvStore, items);
			          var popupInfo = generateDefaultPopupInfo(featureCollection);
			          var infoTemplate = new InfoTemplate(buildInfoTemplate(popupInfo));
			          
			          var latField, longField;
			          var fieldNames = csvStore.getAttributes(items[0]);
			         // console.log(fieldNames);
			          var mainField = fieldNames[0];//field for polygon identification
			          console.log('MAIN FIELD: '+mainField);
			          var polygonIDs = [];//array of ids
					  var polygons = [];




			          arrayUtils.forEach(fieldNames, function (fieldName) {//get lat and long field name
			            var matchId;			            
			            matchId = arrayUtils.indexOf(latFieldStrings,
			              fieldName.toLowerCase());
			            if (matchId !== -1) {
			              latField = fieldName;
			            }

			            matchId = arrayUtils.indexOf(longFieldStrings,
			              fieldName.toLowerCase());
			            if (matchId !== -1) {
			              longField = fieldName;
			            }
			          });	

			          console.log('LAT FIELD: '+latField)
			          console.log('LONG FIELD: '+longField)		         

			          arrayUtils.forEach(items, function (item,i) {/*get the unique values*/
			          	var v = Number(csvStore.getValue(item, mainField));
			          	var value = isNaN(v) ? csvStore.getValue(item, mainField) : v;
			          	var p = [];
			          	if(polygonIDs.indexOf(value) == -1){
			          		polygonIDs.push(value);
			          	}
			          }); 

			          arrayUtils.forEach(polygonIDs, function (id) {//fill the polygons with his points
			          	var p = new esri.geometry.Polygon();
			          	var rings = [];
			            
			          	arrayUtils.forEach(items, function (item) {
			          		var v = Number(csvStore.getValue(item, mainField));
			          		var pId = isNaN(v) ? csvStore.getValue(item, mainField) : v;

			          		if(id == pId){
			          			var lat = csvStore.getValue(item, latField);
			          			var lon = csvStore.getValue(item, longField);
			          			
			          			if(lat.indexOf(',') != -1){
			          				lat = lat.replace(',','.');
			          			}
			          			if(lon.indexOf(',') != -1){
			          				lon = lon.replace(',','.');
			          			}

			          			//var point = esri.geometry.Point();
			          			//point.setLatitude(Number(lat));
			          			//point.setLongitude(Number(lon));
			          			var point = [Number(lon),Number(lat)];
			          			rings.push(point);
			          		}
			          	});
			          	p.addRing(rings);

			          	var _symbol = new esri.symbol.SimpleFillSymbol().setStyle(esri.symbol.SimpleFillSymbol['STYLE_SOLID']);
			          	var graphic = new esri.Graphic(p,_symbol);
			          	
			          	console.log(graphic.geometry);
			          	polygons.push(graphic);
			          	fEdit.drawLayer.add(graphic);

			          });
					  fEdit.droppedFiles = polygons;
				      Mapp.getGraphicsExtent(polygons,1.5);
					  fEdit.startOption('drop');
					  fEdit.setActiveStep('drop',1);
			      
			          /*arrayUtils.forEach(items, function (item) {
			          	

			            var attrs = csvStore.getAttributes(item),
			              attributes = {};
			            // Read all the attributes for  this record/item
			            arrayUtils.forEach(attrs, function (attr) {
			              var value = Number(csvStore.getValue(item, attr));
			              attributes[attr] = isNaN(value) ? csvStore.getValue(item, attr) : value;
			            });

			            attributes["__OBJECTID"] = objectId;
			            objectId++;

			            var latitude = parseFloat(attributes[latField]);
			            var longitude = parseFloat(attributes[longField]);

			            if (isNaN(latitude) || isNaN(longitude)) {
			              return;
			            }

			            var geometry = webMercatorUtils
			              .geographicToWebMercator(new Point(longitude, latitude));
			            var feature = {
			              "geometry": geometry.toJson(),
			              "attributes": attributes
			            };
			           // var _symbol = new esri.symbol.SimpleFillSymbol().setStyle(esri.symbol.SimpleFillSymbol['STYLE_SOLID']);
			            var _symbol = new esri.symbol.SimpleMarkerSymbol();
			            var _graphic = new esri.Graphic(geometry,_symbol);
			            console.log(_graphic)
			           try{
			           	//map.graphics.add(_graphic)
			           }catch(e){
			           	console.log(e)
			           }
			           	

			            featureCollection.featureSet.features.push(feature);
			          });

			          var featureLayer = new FeatureLayer(featureCollection, {
			            infoTemplate: infoTemplate,
			            id: 'csvLayer'
			          });
			          featureLayer.__popupInfo = popupInfo;

			          console.log(featureLayer);

			          map.addLayer(featureLayer);
			          zoomToData(featureLayer);*/
			        },
			        onError: function (error) {
			          console.error("Error fetching items from CSV store: ", error);
			        }
			      });
			    }
			    /*UTIL*/

			    function zoomToData (featureLayer) {
			      // Zoom to the collective extent of the data
			      var multipoint = new Multipoint(map.spatialReference);
			      arrayUtils.forEach(featureLayer.graphics, function (graphic) {
			        var geometry = graphic.geometry;
			        if (geometry) {
			          multipoint.addPoint({
			            x: geometry.x,
			            y: geometry.y
			          });
			        }
			      });

			      if (multipoint.points.length > 0) {
			        map.setExtent(multipoint.getExtent().expand(1.25), true);
			      }
			    }

			    function generateFeatureCollectionTemplateCSV (store, items) {
			     console.log(store);
			     console.log(items);
			    
			      var featureCollection = {
			        "layerDefinition": null,
			        "featureSet": {
			          "features": [],
			          "geometryType": "esriGeometryPoint"
			        }
			      };
			      featureCollection.layerDefinition = {
			        "geometryType": "esriGeometryPoint",
			        "objectIdField": "__OBJECTID",
			        "type": "Feature Layer",
			        "typeIdField": "",
			        "drawingInfo": {
			          "renderer": {
			            "type": "simple",
			            "symbol": {
			              "type": "esriPMS",
			              "url": "http://static.arcgis.com/images/Symbols/Basic/RedSphere.png",
			              //"imageData": "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",
			              "contentType": "image/png",
			              "width": 15,
			              "height": 15
			            }
			          }
			        },
			        "fields": [
			          {
			            "name": "__OBJECTID",
			            "alias": "__OBJECTID",
			            "type": "esriFieldTypeOID",
			            "editable": false,
			            "domain": null
			          }
			        ],
			        "types": [],
			        "capabilities": "Query"
			      };

			      var fields = store.getAttributes(items[0]);
			      arrayUtils.forEach(fields, function (field) {
			        var value = store.getValue(items[0], field);
			        var parsedValue = Number(value);
			        if (isNaN(parsedValue)) { //check first value and see if it is a number
			          featureCollection.layerDefinition.fields.push({
			            "name": field,
			            "alias": field,
			            "type": "esriFieldTypeString",
			            "editable": true,
			            "domain": null
			          });
			        }
			        else {
			          featureCollection.layerDefinition.fields.push({
			            "name": field,
			            "alias": field,
			            "type": "esriFieldTypeDouble",
			            "editable": true,
			            "domain": null
			          });
			        }
			      });
			      return featureCollection;
			    }

			    function generateDefaultPopupInfo (featureCollection) {
			      var fields = featureCollection.layerDefinition.fields;
			      var decimal = {
			        'esriFieldTypeDouble': 1,
			        'esriFieldTypeSingle': 1
			      };
			      var integer = {
			        'esriFieldTypeInteger': 1,
			        'esriFieldTypeSmallInteger': 1
			      };
			      var dt = {
			        'esriFieldTypeDate': 1
			      };
			      var displayField = null;
			      var fieldInfos = arrayUtils.map(fields,
			        lang.hitch(this, function (item) {
			          if (item.name.toUpperCase() === "NAME") {
			            displayField = item.name;
			          }
			          var visible = (item.type !== "esriFieldTypeOID" &&
			                         item.type !== "esriFieldTypeGlobalID" &&
			                         item.type !== "esriFieldTypeGeometry");
			          var format = null;
			          if (visible) {
			            var f = item.name.toLowerCase();
			            var hideFieldsStr = ",stretched value,fnode_,tnode_,lpoly_,rpoly_,poly_,subclass,subclass_,rings_ok,rings_nok,";
			            if (hideFieldsStr.indexOf("," + f + ",") > -1 ||
			                f.indexOf("area") > -1 || f.indexOf("length") > -1 ||
			                f.indexOf("shape") > -1 || f.indexOf("perimeter") > -1 ||
			                f.indexOf("objectid") > -1 || f.indexOf("_") == f.length - 1 ||
			                f.indexOf("_i") == f.length - 2) {
			              visible = false;
			            }
			            if (item.type in integer) {
			              format = {
			                places: 0,
			                digitSeparator: true
			              };
			            }
			            else if (item.type in decimal) {
			              format = {
			                places: 2,
			                digitSeparator: true
			              };
			            }
			            else if (item.type in dt) {
			              format = {
			                dateFormat: 'shortDateShortTime'
			              };
			            }
			          }

			          return lang.mixin({}, {
			            fieldName: item.name,
			            label: item.alias,
			            isEditable: false,
			            tooltip: "",
			            visible: visible,
			            format: format,
			            stringFieldOption: 'textbox'
			          });
			        }));

			      var popupInfo = {
			        title: displayField ? '{' + displayField + '}' : '',
			        fieldInfos: fieldInfos,
			        description: null,
			        showAttachments: false,
			        mediaInfos: []
			      };
			      return popupInfo;
			    }

			    function buildInfoTemplate (popupInfo) {
			      var json = {
			        content: "<table>"
			      };

			      arrayUtils.forEach(popupInfo.fieldInfos, function (field) {
			        if (field.visible) {
			          json.content += "<tr><td valign='top'>" + field.label +
			                          ": <\/td><td valign='top'>${" + field.fieldName + "}<\/td><\/tr>";
			        }
			      });
			      json.content += "<\/table>";
			      return json;
			    }

			    function getSeparator (string) {
			      var separators = [",", "      ", ";", "|"];
			      var maxSeparatorLength = 0;
			      var maxSeparatorValue = "";
			      arrayUtils.forEach(separators, function (separator) {
			        var length = string.split(separator).length;
			        if (length > maxSeparatorLength) {
			          maxSeparatorLength = length;
			          maxSeparatorValue = separator;
			        }
			      });
			      return maxSeparatorValue;
			    }

			    var bytesToString = function (b) {
			      console.log("bytes to string");
			      var s = [];
			      arrayUtils.forEach(b, function (c) {
			        s.push(String.fromCharCode(c));
			      });
			      return s.join("");
			    };

			  });

		}

		var DEACTIVATEALL = function(){
			fEdit.clearOptions();
			fEdit.clearPointsTable();
			fEdit.Html.find('.widget-option-group li').removeClass('active');
			//fEdit.snapManager.destroy();
			fEdit.drawLayer.clear();
			fEdit.droppedFiles = null;
			Mapp.isDrawing = false;
			Mapp.isEditing = false;

			SELECTEDLAYER.unset();
		}

		var SELECTEDLAYER = {
			id :null,
			type:null,
			set:function(id,callback){
				if(LayersManager.getLayer(id)){
					this.id   = id ;
					this.type = LayersManager.getLayer(id).geometryType ? 
								convertType(LayersManager.getLayer(id).geometryType) : 
								'POLYGON';
					fEdit.Html.find('.widget-option-group').show();
					fEdit.Html.find('#f-edit-choosed-layer').text($('mapdata layers layer#'+id+' .layer-data h3.layer-name').text());
					fEdit.Html.find('#fedit-chooser').addClass('selected');
				}else{
					Mapp.ErrorHandler({
						text:'Layer Não Encontrado no Mapa.'
					});
				}
			},
			unset:function(){
				fEdit.Html.find('.widget-option-group').hide();
				fEdit.Html.find('#f-edit-choosed-layer').text("");
				fEdit.Html.find('#fedit-chooser').removeClass('selected');
				fEdit.Html.find('#fedit-chooser select option').removeAttr('selected');
			}
			
		}

		var startTopoValid = function(){
			fEdit.Html.find('#validation-msg').show();
		}

		var endTopoValid = function(){
			fEdit.Html.find('#validation-msg').hide();
		}

		var clearTopoValid = function(){
			fEdit.Html.find('#topo-window-tst').html('');
		}

		var getTopoValidation = function(layerId){
			var rtn = false;
			for(var ii = 0; ii < fEdit.Layers.length; ii++){
				var ll = fEdit.Layers[ii];
				if(ll.id == layerId && ll.topologyRules){
					rtn = ll.topologyRules;
				}
			}
			return rtn;
		}

		var graphicsValidation = function(p){
			var hasTopoV = false;
			for(var ii = 0; ii < fEdit.Layers.length; ii++){
				var ll = fEdit.Layers[ii];
				
				if(!hasTopoV){
					if(ll.id == SELECTEDLAYER.id && ll.topologyRules){
						hasTopoV = true;

						fEdit.isValidating = true;

						startTopoValid();
						
						var except = fEdit._option == 'edit' ? SELECTEDLAYER.id : null; 
						
						LayersManager.topologyValidation({
							layerId  	  : SELECTEDLAYER.id,
							graphics 	  : p.graphics,
							rules    	  : ll.topologyRules,
							holdSelection : except,
							window   	  : $(fEdit.Html.find('#topo-window-tst')[0]),
							callback 	  : function(result){
								fEdit.isValidating = false;
								endTopoValid();
								if(p.callback) p.callback(result);
							}
						});
						break;
					}
				}	
			}

			if(!hasTopoV && p.callback) p.callback();

		}

		var convertType = function(esriType){
			return esriType.split('esriGeometry')[1].toUpperCase();
		}

	}
}( jQuery ));
