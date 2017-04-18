(function ( jQ ) { 
    jQ.fn.ReportEspacial = function(masterLayerId) {
    	var id = this.attr('id');
		var sReport = new Widget(id);
		sReport.masterLayer = null;
		sReport.oLayers = [];
		sReport.isSearchin = false;
		sReport.mapPoint = null;
		sReport.currentFeature = null;

		sReport.onInit = function(){
			sReport.includeCss('reportespacial.style');
			sReport.setLayers();
			sReport.configTools();
		}

		sReport.onMapClick = function(e){
			//console.log(e);
			if(!sReport.isSearchin){
				
				sReport.clearVars();

				sReport.isSearchin = true;
				sReport.mapPoint = e.mapPoint;
				var idx = 0;
				sReport.queryFeatures(idx);
			}
		}

		sReport.setMasterLayerInfo = function(){
			LayersManager.query({
				layerid : sReport.masterLayer.layer,
				geometry: sReport.mapPoint,
				callback:function(results){
					var features = results.features;
					
					if(features[0]){
						var idx = 0;
						sReport.setOtherLayersInfo(idx);
						sReport.currentFeature = features[0];
						sReport.Html.find('#master-info-holder .layer-contents').html('');
						features.forEach(function(feature){
							var featureHolder = jQ(document.createElement('div'));
							featureHolder.addClass('feature-holder');

							sReport.masterLayer.fields.forEach(function(field){					
								var label  = sReport.getLabelHolderTmpl(field.label);
								var value  = sReport.getValueHolderTmpl(feature.attributes[field.value]);
								var holder = sReport.getInfoHolderTmpl(label,value);
								featureHolder.append(holder);
							});
							sReport.Html.find('#master-info-holder .layer-contents').append(featureHolder);
							console.log(feature)
						});
						/*select the feature*/
						var objIdF = LayersManager.getLayerObjectIdField(sReport.masterLayer.layer);
						LayersManager.select({
							layerid:sReport.masterLayer.layer,
							objectid:sReport.currentFeature.attributes[objIdF]
						});

						sReport.Html.find('#master-info-holder').show();
					}else{
						sReport.clearVars();
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}

		sReport.setOtherLayersInfo = function(idx){
			if(idx < sReport.oLayers.length){
				var layerId = sReport.oLayers[idx].layer;
				//if(LayersManager.getLayerVisibility(layerId)){ layer is visible
					LayersManager.query({
						layerid : layerId,
						geometry: sReport.mapPoint,
						callback:function(results){
							var features = results.features;
							sReport.Html.find('.other-layer-holder#'+layerId).hide();
							if(features.length > 0){
								var featureHolder;
								var _layerContent = sReport.Html.find('.other-layer-holder#'+layerId+' .layer-contents');
								_layerContent.html('');
								features.forEach(function(feature){
									featureHolder = jQ(document.createElement('div'));
									featureHolder.addClass('feature-holder');
									sReport.oLayers[idx].fields.forEach(function(field){
										var label  = sReport.getLabelHolderTmpl(field.label);
										var value  = sReport.getValueHolderTmpl(feature.attributes[field.value]);
										var holder = sReport.getInfoHolderTmpl(label,value);
										featureHolder.append(holder);										
									});
									_layerContent.append(featureHolder);
								});
								sReport.Html.find('.other-layer-holder#'+layerId).addClass('visible');
								sReport.Html.find('.other-layer-holder#'+layerId).show();
							}
							sReport.setOtherLayersInfo(idx+1);
						}
					});
				//}
			}else{
				sReport.getWindowPosition();
				sReport.clearVars();
			}
		}
		sReport.queryFeatures = function(idx){
			/*set master layer Info*/
			sReport.clearValues();
			sReport.setMasterLayerInfo();
			
		}

		sReport.configTools = function(){
			sReport.Html.find('i[rel="close"]').on('click',function(){
				sReport.clearVars();
				sReport.clearValues();
				LayersManager.deselect(sReport.masterLayer.layer);
			});
			sReport.Html.draggable({
				handle:'#report-title'
			});
		}

		sReport.getWindowPosition = function(){
			if(sReport.Html.find('.feature-holder')[0]){
				if(sReport.mapPoint){
					var point = esri.geometry.toScreenPoint(map.extent,
							  jQ('#'+Mapp.id).width(),
							  jQ('#'+Mapp.id).height(),
							  sReport.mapPoint),

						wHeight = sReport.Html.height(),
						wWidth  = sReport.Html.width(),
						oLeft 	= point.x,
						oTop 	= point.y - wHeight/2;


					if(oTop < 0)
						oTop = point.y;
					if((oTop + wHeight) > jQ('#'+Mapp.id).height())
						oTop = jQ('#'+Mapp.id).height() -  wHeight - 10;
					if( (wWidth+point.x) > jQ('#'+Mapp.id).width())
						oLeft = oLeft - wWidth;

					if(wHeight > Mapp.getHeight()){
						oTop 	= 0;
					};
					sReport.Html.css({
						top : oTop,
						left: oLeft
					});

					jQ.each(sReport.Html.find('.other-layer-holder.visible'),function(i){
						if(i%2 == 0){
							jQ(this).addClass('dif');
						}
					})

					sReport.Html.show();
				}else{
					console.log('no map point')
				}
			}
		}
		sReport.setLayers = function(){
			LayersManager.onLayersAddResult({
				callback:function(){
					sReport.setMasterLayer();
					sReport.setOtherLayers();
				}
			});
		}
		sReport.getInfoHolderTmpl = function(label,value){
			var holder = jQ(document.createElement('div'));
			holder.attr('class','info-holder');
			holder.append(label);
			holder.append(value);
			return holder;
		}
		sReport.getLabelHolderTmpl = function(label){
			var holder = jQ(document.createElement('span'));
			holder.attr({
				'class':'info-label',
				//'text':'template'
			});
			holder.text(label);
			return holder;
		}

		sReport.getValueHolderTmpl = function(value){
			var holder = jQ(document.createElement('span'));
			holder.attr('class','info-value');
			holder.text(value);
			return holder;
			
		}

		sReport.setMasterLayer = function(){
			//var _layer =  LayersManager.getLayer(masterLayerId);
			var _fields = [];
			jQ.each(sReport.Html.find('masterlayer fields field'),function(i,f){
				var field = {
					label:jQ(f).attr('label'),
					value:jQ(f).attr('value')
				}
				_fields.push(field);
			});

			sReport.masterLayer = {
				layer:masterLayerId,
				fields:_fields
			}
		}
		sReport.setOtherLayers = function(){
			jQ.each(sReport.Html.find('layers layer'),function(i,_layer){
				var layer =jQ(_layer).attr('id');
				var fields = [];

				jQ.each(jQ(_layer).find('fields field'),function(i,f){
					var field = {
						label:jQ(f).attr('label'),
						value:jQ(f).attr('value')
					}
					fields.push(field);
				});
				sReport.oLayers.push({
					layer:layer,
					fields:fields
				});
			});
		}
		sReport.clearValues = function(){
			sReport.Html.hide();
			sReport.Html.find('#master-info-holder').hide();
			sReport.Html.find('.other-layer-holder').hide();
			sReport.Html.find('.other-layer-holder').removeClass('dif');
			sReport.Html.find('.other-layer-holder').removeClass('visible');
			sReport.Html.find('#master-info-holder .layer-contents').html('');
			sReport.Html.find('.other-layer-holder .layer-contents').html('');

		}
		sReport.clearVars = function(){
			sReport.isSearchin 	   = false;
			sReport.mapPoint 	   = null;
			sReport.currentFeature = null;
		}
		sReport.onDeactivate = function(){
			sReport.clearVars();
			sReport.clearValues();
		}
	};
}( jQuery ));
