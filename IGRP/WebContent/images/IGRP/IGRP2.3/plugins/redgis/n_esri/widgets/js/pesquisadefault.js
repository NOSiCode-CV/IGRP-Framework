(function ( jQ ) { 
    jQ.fn.PesquisaDefault = function() {
    	var id = this.attr('id');
		var pesqD = new Widget(id);
		pesqD.position = this.attr('position');
		pesqD.Layers = [];
		pesqD.input = pesqD.Html.find('input#pesquisadefault_input');
		pesqD.extentChecker = pesqD.Html.find('#extent-checker');
		pesqD.submitter = pesqD.Html.find('.submit-holder *[type="submit"]');
		pesqD.menuHolder = pesqD.Html.find('.pesquisa-results-menu');
		pesqD.resultsHolder = pesqD.Html.find('.pesquisa-results-holder');
		pesqD.tcolor = pesqD.Html.attr('template-color');
		pesqD.value = '';
		pesqD.currentExtent = null;
		pesqD.currentFeatureId = null;
		pesqD.currentLayerId = null;
		pesqD.LayersEvts = [];
		pesqD.onInit = function(){
			LayersManager.onLayersAddResult({
				callback:pesqD.getSearchLayers
			});
			pesqD.interfaceControl();			
		};

		pesqD.onMapExtentChange = function(e){
			console.log(e)
			/*LayersManager.selectFeatures({
			graphic:LayersManager.currentFeature,
			type:'id',
			callback:function(features){
				alert('ex ch')
				//LayersManager.enableLayerMenu();//
			}
			});		*/
			/*if(pesqD.currentFeatureId && pesqD.currentLayerId){
				console.log(pesqD.currentLayerId)
				console.log(pesqD.currentFeatureId)
				try{
					LayersManager.selectFeatureById({
						layerid:pesqD.currentLayerId,
						objectId:pesqD.currentFeatureId
					});
				}catch(e){
					console.log(e);
				}
			}*/
		}
		pesqD.onActivate = function(){
			pesqD.LayersEvts = [];
			
			pesqD.Layers.forEach(function(layer){
				var ev = LayersManager.setEventListener({
						layerid:layer.id,
						_event:'selection-clear',
						callback:function(){
							jQ('.search-result-item').removeClass('active');
						}	
				});
				if(ev){
					pesqD.LayersEvts.push(ev)
				}
				
			});
			
			pesqD.input.select();
			calculatePadBoxSize(pesqD.input,jQ('#pesquisadefault_submitter'));
		}
		pesqD.onDeactivate = function(){
			pesqD.LayersEvts.forEach(function(e){
				LayersManager.unsetEventListener(e);
			})
			pesqD.LayersEvts = [];
			pesqD.clearSearch();
			//pesqD.currentFeatureId = null;
			
		}
		pesqD.checkExtentProp = function(){
			var rtn = false;
			if(pesqD.extentChecker.prop('checked')){
				pesqD.setCurrentExtent();
				rtn = true;
			}else{
				pesqD.unsetCurrentExtent();
			}
			
			return rtn;
		}
		pesqD.setCurrentExtent = function(){
			pesqD.currentExtent = esri.geometry.webMercatorToGeographic(map.extent);
		}
		pesqD.unsetCurrentExtent = function(){
			pesqD.currentExtent = null;
		}
		var validateAttrName = function(layerId,attr){
			var rtn = false;
			var layer = LayersManager.getLayer(layerId);

			for(var i = 0; i<layer.fields.length; i++){
				var attrName = layer.fields[i].name;
				if(attr == attrName){
					rtn = true;
					break;
				}
			}
			return rtn;
		}

		pesqD.configSearch = function(idx){
		  if(idx < pesqD.Layers.length){
		  	console.log(pesqD.value.length)
			  
			  if(pesqD.value.length >= 2){
				  var queryStr = '';
				  for(var z=0;z < pesqD.Layers[idx].fields.length; z++){

				  	if(validateAttrName(pesqD.Layers[idx].id,pesqD.Layers[idx].fields[z])){
					   if(z == pesqD.Layers[idx].fields.length-1){
						  queryStr = queryStr + "Upper("+pesqD.Layers[idx].fields[z]+")"+" LIKE '%"+pesqD.value.toUpperCase()+"%'";
					   }else{
						  queryStr = queryStr + "Upper("+pesqD.Layers[idx].fields[z]+")"+" LIKE '%"+pesqD.value.toUpperCase()+"%' OR ";
					   }	
					}
				  }
				  if(queryStr){
					  var _callback = function(f){
						  try{
							pesqD.fillSearchResults(f.features,idx);
						  	pesqD.configSearch(idx+1);
						  }catch(e){
							console.log(e);  
						  }
					  }		
					  var QueryParams = {
						  layerId:pesqD.Layers[idx].id,
						  queryString:queryStr,
						  callback:_callback  
					  }
					  if(pesqD.checkExtentProp()){
						   QueryParams.geometry = pesqD.currentExtent;
					  }
					  //console.log(QueryParams)
					  LayersManager.queryFeatures(QueryParams);
				  }

			  }
		  }else{
			  if(pesqD.Layers.length > 0){
				pesqD.showResults(); 
			  }
		  }



		}
		pesqD.clearSearch = function(){
			pesqD.resultsHolder.html('');
			pesqD.menuHolder.find('ul').html('');
			pesqD.hideResults();
			pesqD.currentFeatureId = null;
			pesqD.currentLayerId = null;
		}
		pesqD.showResults = function(){
			jQ('ul li.layer-title:eq(0)').addClass('active');
			jQ('.search-result:eq(0)').addClass('active');	
			pesqD.resultsHolder.addClass('active');
			pesqD.menuHolder.addClass('active');
			pesqD.submitter.removeClass('searching');
		}
		pesqD.hideResults = function(){
			pesqD.resultsHolder.removeClass('active');
			pesqD.menuHolder.removeClass('active');
		}
		pesqD.fillSearchResults = function(features,idx){
			var layerid = pesqD.Layers[idx].id;
			if(features.length > 0){
				var layerTitleHolder = jQ(document.createElement('li'))
				layerTitleHolder.addClass('layer-title');
				layerTitleHolder.attr('id',layerid);
				layerTitleHolder.attr('title',LayersManager.getLayerName(layerid));
				layerTitleHolder.attr('alt',LayersManager.getLayerName(layerid));
				
				var layerTitleVal = jQ(document.createElement('span'));
				layerTitleVal.text(LayersManager.getLayerName(layerid));
				layerTitleHolder.append(layerTitleVal);
				
				jQ(pesqD.menuHolder.find('ul')).append(layerTitleHolder);//LAYER TITLE
				
				var mainHolder = jQ(document.createElement('div'));//SEARCH RESULT HOLDER
				mainHolder.addClass('search-result');
				mainHolder.attr('id',layerid);
				
				var infoHolder = jQ(document.createElement('div'));
				infoHolder.addClass('layer-search-info');
				
				var total = jQ(document.createElement('div'));
				total.addClass('total')
				total.text('Total: '+features.length)
				infoHolder.append(total);
				
				dojo.forEach(features,function(feature){
					var objIdField = LayersManager.getLayerObjectIdField(layerid);
					var objId = feature.attributes[objIdField];
					
					for(var i=0; i < pesqD.Layers[idx].fields.length; i++){
						var fieldName = pesqD.Layers[idx].fields[i];
						var fieldValue = feature.attributes[fieldName];
						if(fieldValue != null && fieldValue != ''){
							try
							{
							  if(fieldValue.toString().toLowerCase().indexOf(pesqD.value.toLowerCase()) != -1){
								  
								  var resultHolder = jQ(document.createElement('div'));
								  resultHolder.addClass('search-result-item');
								  resultHolder.attr('layer',layerid);
								  resultHolder.attr(fieldName,fieldValue);
								  var resultLabel = jQ(document.createElement('span'))
								  resultLabel.addClass('result-lbl');
								  resultLabel.text(fieldName.toString().toLowerCase());
								  resultHolder.append(resultLabel);
								  var resultValue = jQ(document.createElement('span'))
								  resultValue.addClass('result-val');
								  resultValue.text(fieldValue.toString());
								  resultHolder.append(resultValue);
								  resultHolder.attr('id',objId);
								  mainHolder.append(resultHolder)
								  
								  pesqD.resultsHolder.append(mainHolder);
							  }
							}
							catch(e)
							{
								console.log(e);	
							}
						}						
					}
				});	
				calculatePadBoxSize(pesqD.input,jQ('#pesquisadefault_submitter'));
			}else{
				console.log('no results in layer: '+LayersManager.getLayerName(pesqD.Layers[idx].id));
			}	
		}
		pesqD.getSearchLayers = function(e){
			var Rtn = [];
			jQ.each(pesqD.Html.find('layers layer'),function(){
				var layId = jQ(this).attr('layerid');
				if(LayersManager.isValid(layId)){
					var ob = {
						id:jQ(this).attr('layerid')
					}
					var _fields = [];
					jQ.each(jQ(this).find('fields field'),function(){
						_fields.push(jQ(this).attr('name'));
					});
					ob.fields = _fields;
					Rtn.push(ob);
				}
			});
			pesqD.Layers = Rtn;
		}

		pesqD.onMapExtentChange = function(e){
			if(pesqD.currentFeatureId && pesqD.currentLayerId){
				LayersManager.select({
					objectid:pesqD.currentFeatureId,
					layerid:pesqD.currentLayerId,
					callback:function(){
						pesqD.currentFeatureId = null;
						pesqD.currentLayerId = null;
					}
				});
			}
		}

		pesqD.interfaceControl = function(){

			pesqD.input.on('keyup',function(){//key up on the form input
				if(jQ(this).val().length == 0){
					pesqD.clearSearch();
				}	
			});
			pesqD.resultsHolder.on('click','.search-result-item',function(){// focus on the object
				var objId = jQ(this).attr('id');
				var _layerid = jQ(this).attr('layer');
				var _this = jQ(this);
				
				

				pesqD.currentFeatureId = parseInt(objId);
				pesqD.currentLayerId = _layerid;
				
				if(LayersManager.getLayer(_layerid) && LayersManager.getLayer(_layerid).geometryType == 'esriGeometryPoint'){
					
					LayersManager.getFeature({
						featureId:objId,
						layerId:_layerid,
						callback:function(data){
							if(data.features[0]){
								var ext = new esri.geometry.Extent(data.features[0].geometry.x,data.features[0].geometry.y,data.features[0].geometry.x,data.features[0].geometry.y, map.spatialReference);

								Mapp.focusOn({
									extent:ext,
									zoom:15
								});
								//map.centerAndZoom(data.features[0].geometry,15);
							}
						}
					});
					
				}else{
					LayersManager.getFeatureExtent({
						featureId:objId,
						layerId:_layerid,
						callback:function(_extent){
							
							LayersManager.deselect(_layerid);
							
							Mapp.focusOn({
								extent:_extent
							});

							//Mapp.setMapExtent(_extent);
							_this.parent().find('.search-result-item').removeClass('active');
							_this.addClass('active');
						}
					});
				}
				
				/*jQ('.search-result-item').removeClass('active');
				_this.addClass('active');
				var _callback = function(features){
					try{
						map.setExtent(esri.geometry.webMercatorToGeographic(features[0]._extent))
					}catch(e){
						console.log(e);	
					}
				}
				LayersManager.selectFeatureById({
					layerid:_layerid,
					objectId:objId,
					callback:_callback
				});*/
			});
			
			pesqD.submitter.on('click',function(){//on submit the form
				if(!jQ(this).hasClass('searching')){
					jQ(this).addClass('searching');
					//try{
						pesqD.value = pesqD.input.val().toLowerCase();
						pesqD.clearSearch();
						calculatePadBoxSize(pesqD.input,jQ('#pesquisadefault_submitter'));
						pesqD.configSearch(0);
						
					/*}catch(err){
						console.log(err)	
					}*/
				}
				return false;
			});
			pesqD.menuHolder.on('click','.layer-title',function(){// tab switch
				var id = jQ(this).attr('id');
				var content = jQ('.search-result[id="'+id+'"]')
				jQ('.layer-title').removeClass('active');
				jQ(this).addClass('active');
				jQ('.search-result').removeClass('active');
				content.addClass('active');
			});
		}
	}
}( jQuery ));
