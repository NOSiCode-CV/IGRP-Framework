(function ( jQ ) { 
    jQ.fn.InfoWindowEsri= function() {
    	var id 			= this.attr('id');
		var _iw 		= new Widget(id);	
		_iw.Layers 		= [];
		_iw.infoWindow 	= null;
		_iw.menuHolder 	= null;
		_iw.infosHolder	= null;
		_iw.MappPoint 	= null;

		_iw.onInit 		= function(){
			//LayersManager.lock();
			_iw.includeCss('infowindowesri.style');
			_iw.infoWindow = _iw.Html.find('#iwe-window');
			_iw.menuHolder = _iw.infoWindow.find('ul#iwe-menu');
			_iw.infosHolder= _iw.infoWindow.find('#iwe-f-infos');
			_iw.tools();
			_iw.setLayers();
		};
		_iw.onMapClick = function(e){
			if(!_iw.isSearchin){
				_iw.isSearchin = true;
				_iw.clearInfos();
				_iw.MappPoint = e.mapPoint;
				
				_iw.Layers = LayersManager.orderLayersIds({
					array:_iw.Layers,
					attr:'id'
				});
				
				var idx = 0;

				_iw.queryFeature(idx);

			}else{
				console.log("Searchin'")
			}
		}

		_iw.queryFeature = function(idx){
			if(idx < _iw.Layers.length){
				var _layerid = _iw.Layers[idx].id;
				if(LayersManager.getLayerVisibility(_layerid)){
					console.log('active')
					LayersManager.query({
						layerid : _layerid,
						geometry: _iw.MappPoint,
						callback:function(results){
							var features = results.features;
							if(features.length > 0){
								try{
									_iw.setFeatureInfo(_layerid,features,idx);
								}catch(err){
									Mapp.ErrorHandler({
										object:err
									});
								}
							}
							var c = idx+1;
							_iw.queryFeature(c);
						},
						error:function(){
							console.log(_iw.isSearchin)
							//_iw.isSearchin = true;
							_iw.queryFeature(idx);
						}
					});
				}else{
					_iw.queryFeature(idx+1);
				}
			}else{
				_iw.setMenuActive(_iw.menuHolder.find('li:eq(0)').attr('rel'));
				_iw.infosHolder.find('.iwe-i-holder .iew-f-info:first-child').addClass('active');
				_iw.infosHolder.find('.iwe-i-holder .iwe-l-paginator li:first-child').click();
				_iw.infoWindow.addClass('active');
				_iw.isSearchin = false;
			}
		}
		_iw.setFeatureInfo = function(layerid,features,idx){
			_iw.menuHolder.append(_iw.getMenuItem(layerid));
			_iw.infosHolder.append(_iw.getFeaturesInfo(layerid,features));
		}
		_iw.getMenuItem = function(layerid){
			var item = jQ(document.createElement('li'));

			item.addClass('iwe-menu-layer');
			item.attr('rel',layerid);
			
			item.text(LayersManager.getLayerName(layerid));
			return item;
		}
		_iw.getFeaturesInfo = function(layerid,features){
			/* html */
			var infoHolder = jQ(document.createElement('div')),
				paginator  = jQ(document.createElement('ul'));
				
			paginator.addClass('iwe-l-paginator');

			infoHolder.attr({
				'class':'iwe-i-holder',
				'rel':layerid
			});

			features.forEach(function(f,idx){
				/* Feature Attr Holder */
				var fInfo = jQ(document.createElement('div'))
				
				fInfo.attr({
					'class':'iew-f-info',
					'objectid':f.attributes[LayersManager.getLayerObjectIdField(layerid)]
				});

				for(var att in f.attributes){
					var attHolder = jQ(document.createElement('div')).addClass('iwe-att-holder');
					var lbl = jQ(document.createElement('span')).addClass('iwe-att-lbl');
					var val = jQ(document.createElement('span')).addClass('iwe-att-val');

					/* Replace _ to tab space*/
					var rpl = '_';
					var re = new RegExp(rpl, 'g'); 
					var label = att.replace(re, ' ');

					lbl.text(label);
					val.text(f.attributes[att]);

					attHolder.append(lbl);
					attHolder.append(val);

					fInfo.append(attHolder);
				}

				var pagin_item = jQ(document.createElement('li'));
				pagin_item.attr({
					'objectid':f.attributes[LayersManager.getLayerObjectIdField(layerid)]
				});
				pagin_item.text(idx+1);
				/* list item */
				paginator.append(pagin_item);
				/*insert infoholder*/
				infoHolder.append(fInfo);
			});
			infoHolder.append(paginator);
			return infoHolder;
		}
		_iw.clearInfos = function(){
			LayersManager.deselectAll();
			_iw.infoWindow.removeClass('active');
			_iw.menuHolder.html('');
			_iw.infosHolder.html('');
		}

		_iw.setLayersEvents = function(){
			LayersManager.onLayersAddResult({
				callback:function(){
					/* validação e ordenação dos layers */
					_iw.Layers = LayersManager.orderLayersIds({
						array:_iw.Layers,
						attr:'id'
					});
				}
			});
		}
		_iw.unsetMenuActive = function(){
			_iw.menuHolder.find('.iwe-menu-layer').css({
				'background-color':'transparent'
			});
			jQ('.iwe-menu-layer').removeClass('active');
			jQ('.iwe-i-holder').removeClass('active');
		}
		_iw.setMenuActive   = function(layerid){
			try{
				var selectionColor = LayersManager.getSelectionColor(layerid);
				var colorString = selectionColor.r+','+selectionColor.g+','+selectionColor.b;
				_iw.menuHolder.css({
					'border-color':'rgb('+colorString+')'
				})
				_iw.menuHolder.find('.iwe-menu-layer[rel="'+layerid+'"]').css({
					'background-color':'rgb('+colorString+')'
				});
				_iw.menuHolder.find('.iwe-menu-layer[rel="'+layerid+'"]').addClass('active');
				_iw.infosHolder.find('.iwe-i-holder[rel="'+layerid+'"]').addClass('active');

			}catch(e){
				console.log(e);
			}
		}
		_iw.tools = function(){
			_iw.menuHolder.on('click','.iwe-menu-layer',function(){
				var rel = jQ(this).attr('rel');
				var content = _iw.infosHolder.find('.iwe-i-holder[rel="'+rel+'"]');
				
				if(content.find('.iwe-l-paginator li.active').length == 0){
					//content.find('.iwe-l-paginator li:first-child').click();
				}
				_iw.unsetMenuActive();
				_iw.setMenuActive(rel);
			});

			_iw.infosHolder.on('click','.iwe-l-paginator li',function(){
				var holder 	 = jQ(this).parents('.iwe-i-holder');
				var objid 	 = jQ(this).attr('objectid');
				var _layerid = holder.attr('rel');
				var listitem = jQ(this);

				var selectionColor = LayersManager.getSelectionColor(_layerid);
				var colorString = selectionColor.r+','+selectionColor.g+','+selectionColor.b;
				
				LayersManager.select({
					layerid:_layerid,
					objectid:objid,
					callback:function(){
						var content = holder.find('.iew-f-info[objectid="'+objid+'"]');
						holder.find('.iew-f-info').removeClass('active');						
						content.addClass('active');
						holder.find('.iwe-l-paginator li').removeClass('active');
						listitem.addClass('active');

						/*colorize*/
						holder.find('.iwe-l-paginator li').css('background-color','transparent');
						listitem.css('background-color','rgb('+colorString+')');
					}
				});
			});
		}
		_iw.setLayers = function(){
            jQ.each(_iw.Html.find('layers layer'),function(i,l){
                var info = {
                    id:jQ(l).attr('id'),
                    title:jQ(l).attr('link'),
                    editable:jQ(l).attr('editable')
                }
                _iw.Layers.push(info);
            });
           // LayersManager.orderLayersIds(_iw.Layers);
            if(_iw.Layers.length > 0){
               _iw.setLayersEvents();
            }
        }
		
		_iw.onActivate = function(){
			_iw.isSearchin = false;
		}
		_iw.onDeactivate = function(){
			_iw.MappPoint = null;
			_iw.clearInfos();
		}
	}
}( jQuery ));
