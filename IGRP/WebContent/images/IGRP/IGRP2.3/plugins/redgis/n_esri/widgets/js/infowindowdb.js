(function ( jQ ) { 
    jQ.fn.InfoWindowDb = function() {
        var id = this.attr('wId');
        var infoW = new Widget(id);
        infoW.titleHolder = null;
        infoW.dataHolder = null;
        infoW.closer = null;
        infoW.clickPoint = null;
        infoW.featureCenter = null;
        infoW.Layers = [];
        infoW.onInit = function(){
            infoW.windowHolder  = infoW.Html.find('#info-holder');
            infoW.closer        = infoW.Html.find('#info-holder .closer');
            infoW.dataHolder    = infoW.windowHolder.find('.data-holder');
            infoW.titleHolder   = infoW.windowHolder.find('#info-title h3');
            infoW.featureCenter = infoW.windowHolder.find('.extra-options span[rel="centralize"]');
            infoW.includeCss('infowindowdb.style'); 
            infoW.activate();   
            infoW.setLayers();
            map.disableDoubleClickZoom();
            /*interface control*/
            infoW.configTools();
        }
        infoW.onPanStart = function(){
            infoW.hideWindow();
        }
        infoW.onZoomStart = function(){
            infoW.hideWindow();
        }
        infoW.onMapExtentChange = function(){
            if(infoW.clickPoint){
                infoW.setInfoPosition();
            }
        }
        infoW.onMapClick = function(){
            infoW.closeWindow();
        }
        infoW.onMapDbClick = function(e){
            if(!Mapp.isDrawing && !Mapp.isEditing){
                if(e.graphic){
                    if(e.graphic.getLayer()){
                        var layerid = e.graphic.getLayer().id;
                        if(infoW.layerValid(layerid)){
                            var objectid = e.graphic.attributes[e.graphic.getLayer().objectIdField];
                            try{
                                var mapPoint = e.mapPoint;
                                LayersManager.selectFeatureById({
                                    objectId:objectid,
                                    layerid:layerid,
                                    callback:function(){
                                         infoW.getInfo(layerid,objectid,mapPoint);
                                    }
                                });
                            }catch(err){
                                console.log(err);
                            }
                        }else{
                            infoW.closeWindow();
                        }
                    }
                }else{
                     infoW.closeWindow();
                }
            }   
        }
        infoW.getInfo = function(layerid,objectid,mapPoint){
            var link = infoW.getLayerLink(layerid)+'?p_layer_id='+layerid+'&p_object_id='+objectid;
            infoW.clickPoint  = mapPoint;
            jQ.ajax({
                url:link,
                success:function(data){
                    infoW.setInfo(layerid,data);
                    infoW.setInfoPosition();
                }
            });
        }
        infoW.setInfoPosition = function(){
            var screenPoint = esri.geometry.toScreenPoint(map.extent,
                        jQ('#'+Mapp.id).width(),
                        jQ('#'+Mapp.id).height(),
                        infoW.clickPoint);
            infoW.windowHolder.css({
                top:screenPoint.y,
                left:screenPoint.x
            });
            LayersManager.hideLayerMenu();
            infoW.showWindow(); 
        }
        infoW.showWindow = function(){
            infoW.windowHolder.addClass('active');
        }
        infoW.hideWindow = function(){
            infoW.windowHolder.removeClass('active');
        }
        infoW.closeWindow = function(){
            infoW.hideWindow();
            infoW.clickPoint = null;
        }
        infoW.setInfo = function(layerid,stringData){
            try{
                var data = JSON.parse(stringData);
                infoW.clearInfo();
                /* set title*/
                var layerTitle = LayersManager.getLayerName(layerid);
                infoW.titleHolder.text(layerTitle);
                /* set data*/
                data.forEach(function(info){
                    var row = jQ(document.createElement('div'));
                    row.addClass('info-row');
                    row.attr('field',info.field);
                    var label = jQ(document.createElement('span'));
                    label.addClass('info-label');
                    label.append(info.field);
                    var value = jQ(document.createElement('span'));
                    value.addClass('info-value');
                    value.append(info.value);
                    row.append(label);
                    row.append(value);
                    infoW.dataHolder.append(row);
                });
            }catch(e){
                console.log(e);
            }
        }
        infoW.clearInfo = function(){
            infoW.titleHolder.text('');
            infoW.dataHolder.html('');
        }
        infoW.layerValid = function(layerid){
            var rtn = false;
            for(var i = 0; i
< infoW.Layers.length; i++){
                if(infoW.Layers[i].id == layerid){
                    rtn = true;
                    break;
                }
            }
            return rtn;
        }
        infoW.getLayerLink = function(layerid){
            var rtn = false;
            for(var i = 0; i < infoW.Layers.length; i++){
                if(infoW.Layers[i].id == layerid){
                    rtn = infoW.Layers[i].link;
                    break;
                }
            }
            return rtn;
        }
        infoW.setLayersEvents = function(){
            infoW.Layers.forEach(function(l){
                LayersManager.setEventListener({
                    layerid:l.id,
                    _event:'selection-clear',
                    callback:function(e){
                        infoW.closeWindow(); // close window on layer selection clear
                    }
                })
            });
        }
        infoW.setLayers = function(){
            jQ.each(infoW.Html.find('layers layer'),function(i,l){
                var info = {
                    id:jQ(l).attr('id'),
                    link:jQ(l).attr('link')
                }
                infoW.Layers.push(info);
            });
            if(infoW.Layers.length > 0){
                infoW.setLayersEvents();
            }
        }
        infoW.configTools = function(){
            infoW.closer.on('click',function(){
                infoW.closeWindow();
            });
            infoW.featureCenter.on('click',function(){
               var extent = LayersManager.getFeatureExtent({
                    feature:LayersManager.currentFeature
               });
               map.setExtent(extent);
            });
        }
    };
}( jQuery ));
