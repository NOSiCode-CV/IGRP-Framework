(function ( jQ ) { 
    jQ.fn.FeatureEditDB = function() {
    	var id = this.attr('id');
		var fEdit = new Widget(id);
		fEdit.Layers = [];
		fEdit.feature = null;
		fEdit.featureLayer = null;
		fEdit.editTool = null;
		fEdit.toolEvents = ['graphic-first-move', 'rotate-first-move', 'scale-first-move', 'vertex-first-move']
		fEdit.onInit = function(){
			fEdit.getLayers();

			fEdit.editTool = esri.toolbars.Edit(map);	
			
			fEdit.editTool.on('deactivate',function(e){
				if(e.info.isModified){
					alert('is-modified')
				}	
			});
			//console.log(fEdit.Html.find('.widget-option[rel="edit"]'))
			
			fEdit.Html.find('.widget-option-group li[rel="edit"]').on('click',function(){
				fEdit.setActiveStep(1);
				if(fEdit.feature){
					fEdit.setStepDone(1);
				}
			});

			fEdit.Html.find('#confirm-edition').on('click',function(){
				/*
				redgis.gis_w_feature_edit_db.feature_edit(
					p_layer_id number,
                    p_object_id number,
                    p_edits clob
                 );
				*/
				
				try{
					var objId = fEdit.feature.attributes['OBJECTID'];

					var layerId = fEdit.featureLayer;
					var layer = LayersManager.getLayer(layerId);
					var edits = GeometryService.convertRings([fEdit.feature.geometry],'|');
					if(layer){
						/*layer.applyEdits(null,[fEdit.feature],null,function(e){
							console.log(e);
							
						});*/
					}
					var _url = path+'/extentions/n_esri/geometryservice/applyEdits.php?p_layer_id='+
							   layerId+'&p_object_id='+objId+'&p_edits='+edits;
					alert(_url)
					jQ.ajax({
						url:_url,
						type:'POST',
						success:function(data){
							alert(data)
						}
					})
					
				}catch(e){
					Mapp.ErrorHandler({
						object:e
					});
				}
				
				return false;
			})

			fEdit.toolEvents.forEach(function(e){
				fEdit.editTool.on(e,function(info){
					fEdit.setActiveStep(2);
				})
			});
			

		}
		fEdit.onActivate = function(){
			LayersManager.hideLayerMenu();//hide layers menu
			LayersManager.lock();//lock layers event

			if(LayersManager.currentFeature){
				fEdit.Layers.forEach(function(layer){
					if(layer == LayersManager.currentFeature.getLayer().id){
						//fEdit.option = "edit";

						fEdit.setFeature(LayersManager.currentFeature);
						fEdit.Html.find('.widget-option-group li[rel="edit"]').click();
						
					}else{
						//LayersManager.deselectAll();
					}
				})
			}			
		}

		fEdit.beforeDeactivate = function(){
			if(fEdit.option == 'edit'){
				fEdit.editTool.deactivate();
			}
			
		}		
		fEdit.onDeactivate = function(){
			if(fEdit.option == 'edit'){
				fEdit.unsetFeature();
			}	
		}

		fEdit.onMapClick = function(e){
			if(fEdit.option == 'edit'){
				if(!fEdit.feature){
					if(e.graphic){
						if(e.graphic.getLayer()){
							var layerId = e.graphic.getLayer().id;
							fEdit.Layers.forEach(function(l){
								if(l == layerId){
									LayersManager.selectFeatures({
										graphic:e.graphic,
										type:'id',
										callback:function(f){
											fEdit.setFeature(f[0]);
											//fEdit.setStepDone(1);
										}
									});
								}else{
									alert('Invalid Layer Id')
								}
							})
						}
					}
				}
			}

		}
		fEdit.setFeature = function(_feature){
			fEdit.feature = _feature;
			fEdit.featureLayer = _feature.getLayer().id;
			fEdit.unsetActiveStep('edit',1);

			/*this.setStepInfo({
				step:1,
				tagid:'featureid',
				type:'text',
				value:fEdit.feature.attributes['OBJECTID']
			});*/

			

			fEdit.editTool.activate(
				esri.toolbars.Edit.ROTATE | 
				esri.toolbars.Edit.EDIT_VERTICES | 
				esri.toolbars.Edit.MOVE | 
				esri.toolbars.Edit.SCALE, 
				fEdit.feature
			);	
		}
		fEdit.unsetFeature = function(){
			fEdit.unsetStepDone(1);
			fEdit.feature = null;
			fEdit.featureLayer = null;
		}
		fEdit.getLayers = function(){
			jQ.each(fEdit.Html.find('layers layer'),function(i,_l){
				fEdit.Layers.push(jQ(_l).attr('id'));
			});
			/* set menu for layers*/
			if(fEdit.Layers.length > 0){ //add menu to polygons
				fEdit.Layers.forEach(function(_l){
					LayersManager.onLayerAddResult({
						layerid:_l,
						callback:function(layer){	
							fEdit.setMenu(layer.id);
							layer.on('selection-clear',function(){
								if(fEdit.isActive){
									fEdit.editTool.deactivate();
									fEdit.unsetFeature();
								}
							})
						}
					});

				});
			};
		}
		fEdit.setMenu = function(layerid){
			var menu = {
				id:fEdit.id+'-widget',
				label:'Editar',
				text:'Editar',
				onClick:function(e){
					WidgetManager.activateWidget(fEdit.id);
					
				}
			}
			LayersManager.setLayerMenu({
				layerId:layerid,
				menu:[menu]
			});
		}
	}
}( jQuery ));
