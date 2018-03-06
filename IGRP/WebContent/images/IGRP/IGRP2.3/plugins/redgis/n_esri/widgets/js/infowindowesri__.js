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
			_iw.includeCss('infowindowesri.style');
			_iw.infoWindow = _iw.Html.find('#iwe-window');
			_iw.menuHolder = _iw.infoWindow.find('ul#iwe-menu');
			_iw.infosHolder= _iw.infoWindow.find('#iwe-f-infos');
			_iw.tools();
			_iw.setLayers();
		};
		_iw.onMapClick = function(e){
			_iw.clearInfos();
			_iw.MappPoint = e.mapPoint;
			var idx = 0;
			_iw.queryFeature(idx);
		}

		_iw.queryFeature = function(idx){

			if(idx < _iw.Layers.length){
				var _layerid = _iw.Layers[idx].id;
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
					}
				});
			}else{
				_iw.infoWindow.addClass('active');
			}
		}
		_iw.setFeatureInfo = function(layerid,features,idx){
			//_iw.menuHolder.attr('items',idx+1);
			_iw.menuHolder.append(_iw.getMenuItem(layerid));
			_iw.infosHolder.append(_iw.getFeaturesInfo(layerid,features));

			_iw.menuHolder.find('li:eq(0)').addClass('active');
			_iw.infosHolder.find('.iwe-i-holder:eq(0)').addClass('active');
			_iw.infosHolder.find('.iwe-i-holder .iew-f-info:eq(0)').addClass('active');
		}

		_iw.getMenuItem = function(layerid){
			var item = jQ(document.createElement('li'));
			item.addClass('iwe-menu-layer');
			item.attr('rel',layerid);
			item.text(LayersManager.getLayerName(layerid));
			return item;
		}
		_iw.getFeaturesInfo = function(layerid,features){
			//select the first feature
			LayersManager.selectFeatureById({
				objectId:features[0].attributes[LayersManager.getLayerObjectIdField(layerid)],
				layerid:layerid,
				callback:function(e){
					console.log(e);
				}
			});
			/* html */
			var infoHolder = jQ(document.createElement('div')),
				paginator  = jQ(document.createElement('ul'));
				
			paginator.addClass('iwe-l-paginator');
			
			infoHolder.attr({
				'class':'iwe-i-holder',
				'rel':layerid,
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
				pagin_item.text(idx);
				/* list item */
				paginator.append(pagin_item);
				/*insert infoholder*/
				infoHolder.append(fInfo);
			});
			infoHolder.append(paginator);
			return infoHolder;
		}
		_iw.clearInfos = function(){
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
		_iw.tools = function(){
			_iw.menuHolder.on('click','.iwe-menu-layer',function(){
				var rel = jQ(this).attr('rel');
				var content = _iw.infosHolder.find('.iwe-i-holder[rel="'+rel+'"]');
				jQ('.iwe-menu-layer').removeClass('active');
				jQ(this).addClass('active');
				jQ('.iwe-i-holder').removeClass('active');
				content.addClass('active');
				content.find('.iew-f-info:eq(0)').addClass('active');
			});

			_iw.infosHolder.on('click','.iwe-l-paginator li',function(){
				var objid = jQ(this).attr('objectid');
				var holder = jQ(this).parents('.iwe-i-holder');

				var content = holder.find('.iew-f-info[objectid="'+objid+'"]');
				holder.find('.iew-f-info').removeClass('active');
				content.addClass('active');
			})
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
		
		_iw.onDeactivate = function(){
			_iw.MappPoint = null;
		}
	}
}( jQuery ));
