(function ( jQ ) { 
    jQ.fn.AdvancedInfoWindow = function() {
    	var id = this.attr('id');
		var aInfoWindow = new Widget(id);
		var w = aInfoWindow;
		w.Html = this;
		w.drawTool = null;
		w.drawSymbol = null;
		w.graphicLayer = null;
		w.layerid = 'layer_predios';
		w.layer = null;
		//w.fieldControl = w.Html.attr('field-control');
		w.Fields =[];
		/*Initialize*/
		w.init = function(){
			w.isActive = false;
			w.layer = LayersManager.getLayer(w.layerid);
			w.setDrawingParams();
			w.ToolsConfig();
			w.Fields = w.getFields();
			LayersManager.setEventListener({
				layerid:w.layerid,
				_event:'click',
				callback:function(e){
					if(w.isActive){
						w.graphicLayer.clear();
						LayersManager.selectFeatures({
							graphic:e.graphic,
							type:'id'
							/*callback:function(features){
								if(features.length > 0){
									//console.log(features[0])	
								}
							}*/
						});	
					
					}
					return false;
				}
			});
			LayersManager.setEventListener({
				layerid:w.layerid,
				_event:'selection-clear',
				callback:function(e){
					if(w.isActive){
						w.deactivate();
					}
				}
			});
			LayersManager.setEventListener({
				layerid:w.layerid,
				_event:'selection-complete',
				callback:function(e){
					if(w.isActive){
						w.show();
						w.OnSelectionComplete(e);
					}
				}
			});
		};
		w.onMapClick = function(e){
			if(w.isActive){
				if(!e.graphic){
					w.deactivate();	
				}else{
					if(e.graphic.getLayer()){
						
						if(e.graphic.getLayer().id != w.layerid){
							w.deactivate();	
						}
					}	
				}
			}
		}
		w.ToolsConfig = function(){ //CONFIG TOOLS
			jQ('.widget-controller[widgetid="'+w.id+'"]').click(function(){
				WidgetManager.disableAll();
				LayersManager.deselectFeatures();
				w.activate();
				jQ('#mapp_container').css('cursor','crosshair');
				DrawingTool.activate({
					tool:w.drawTool,
					type:esri.toolbars.Draw.EXTENT,
					symbol:w.drawSymbol
				});
			});
		};
		w.DrawEnd = function(e){ // DRAW END CALLBACK
			var _graphic = new esri.Graphic(esri.geometry.webMercatorToGeographic(e.geometry), w.drawSymbol);
				w.graphicLayer.clear();
				w.graphicLayer.add(_graphic);
				var _layer = LayersManager.getLayer(w.layerid);
				LayersManager.selectFeatures({
					graphic:_graphic,
					type:'geometry',
					layer:_layer
					//callback: w.OnSelectionComplete
				});
			//w.deactivateDrawing();
		};
		w.OnSelectionComplete = function(e){
			console.log(e);
			var features  = e.features;
			var total = features.length;
			var totalWvalue = 0;
			//alert(w.fieldControl);
			jQ('#advancedWindowObjControl li[control="total-selected"] .value').text(total);
			
			var FieldSum = 0;
			
			w.Fields.forEach(function(field,fieldIdx){
				var calc = new Object();
				calc.name = field.name;
				calc.value = 0;
				features.forEach(function(f,i){
					if(f.attributes[field.name] && f.attributes[field.name] != "" ){
						switch (field.operation){
							case 'COUNT':
								calc.value++;
							break;	
							case 'SUM':
								calc.value = calc.value + f.attributes[field.name] ;
							break;
						}	
					} 	
				});
				var position = fieldIdx+1;
				w.Html.find('.field-name[field="'+field.name+'"][position="'+position+'"] .field-value').html(calc.value);
			});
		};
		w.setDrawingParams = function(){
			 // INIT DRAWING TOOLS
			 w.drawTool = DrawingTool.getTool({showTooltips:false},w.DrawEnd);//set drawing tool for this widget
			 
			var dLine = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
						new dojo.Color([255,255,255,0.8]), 2);
						
			var dFill = new esri.symbol.SimpleFillSymbol(
						esri.symbol.SimpleFillSymbol.STYLE_SOLID,
						dLine,
						new dojo.Color([255,255,255,0.3]));
			
			w.drawSymbol = dFill;
			w.graphicLayer = new esri.layers.GraphicsLayer();
			map.addLayer(w.graphicLayer);
		};
		w.disable = function(){
			w.graphicLayer.clear();
			DrawingTool.deactivate(w.drawTool);
			LayersManager.LayerClearSelection(w.layerid);
			jQ('#mapp_container').css('cursor','default');
		};
		w.getFields = function(){
			var fields = (w.Html.find('.field-name'));	
			var Rtn = [];
			jQ.each(fields,function(i,f){
				var field = {
					name:jQ(f).attr('field'),
					label:jQ(f).text(),
					operation:jQ(f).attr('operation')	
				}	
				Rtn.push(field)
			});
			return Rtn;
		}
	};
}( jQuery ));
