(function ( $ ) { 
    $.fn.LayerSimpleMenu = function() {
    	var id = this.attr('id');
		var wEdition = new Widget(id);
		wEdition.currentFeature = null; //Feature Selected
		wEdition.currentLayer = null; // Layer Selected
		wEdition.menuPoint = null; //Map click Point
		wEdition.MenuIdx = 1; //Menu index
		wEdition.Html = this;//Widget Html
		wEdition.isActive = false;
		/*Initialize*/
		wEdition.init = function(){
			wEdition.ToolsConfig();	
			LayersManager.setEventListner({
				layerId:'layer_predios',
				_event:'click',
				callback:function(e){
					wEdition.menuPoint = e.mapPoint;
					if(!DrawingTool.isDrawing){
						wEdition.activate();
						LayersManager.selectFeatures({
							graphic:e.graphic,
							type:'id',
							callback:wEdition.enable
						});	
					}
				}
			});
			LayersManager.setEventListner({
				layerId:'layer_predios',
				_event:'selection-clear',
				callback:function(e){
					wEdition.deactivate();
					wEdition.hide();
					LayersManager.editTool.deactivate();
				}
			});
		}
		wEdition.onMapClick = function(e){
			//alert('map')
			/*wEdition.menuPoint = e.mapPoint;
			wEdition.Hide();
			if(!DrawingTool.isDrawing){
				LayersManager.selectFeatures({
					type:'id',
					callback:wEdition.enable
				});	
			}*/
		}
		wEdition.onPanStart = function(e){
			this.hide();
		}
		wEdition.onPanEnd = function(e){
			this.enable();
		}
		wEdition.onZoomStart = function(e){
			this.hide();
		}
		wEdition.onZoomEnd = function(e){
			this.enable();
		}
		//};
		/*Get Widget Position */
		wEdition.getPosition = function(){
				var feature = LayersManager.currentFeature;
				var MenuItemW = $(this.Html.find('menu')[0]).width() + 4;//4 for margin
				console.log(wEdition.menuPoint)
				var point = esri.geometry.toScreenPoint(map.extent,
							$('#'+Mapp.id).width(),
							$('#'+Mapp.id).height(),
							wEdition.menuPoint);
							
				console.log(point)
				this.Html.css({
					top: point.y - this.Html.height()/2,
					left:point.x + ((MenuItemW - MenuItemW*this.MenuIdx) - MenuItemW/2)	
				});
				//console.log(wEdition.currentLayer)
		};
		
		/*enable Widget*/
		wEdition.enable = function(e){
			//if(wEdition.isActive){// se o widget esta activo
				if(LayersManager.currentFeature){ //se existe um objecto selecionado
				
					if(wEdition.menuPoint){// ponto de click
						wEdition.getPosition();
						wEdition.show();
					}else{
						wEdition.hide();
					}
				}else{
					wEdition.hide();	
				}	
			//}
		};
		/*DisableTool */
		wEdition.disable = function(){
			if(wEdition.currentLayer != null){
				try{
				//wEdition.currentLayer.clearSelection();	
				}catch(e){ console.log(e); }
				//wEdition.currentLayer = null;
				//wEdition.currentFeature = null;
				wEdition.menuPoint = null;
			}
			
			this.hide();
		};
		/*Show Widget*/
		/*Config Tools Action / Events on Tools*/
		wEdition.ToolsConfig = function(){
			$(this.Html.find('menu')).click(function(){
				var url 	 = $(this).attr('url'),
					target   = $(this).attr('target'),
					actionid = $(this).attr('actionid'),
					idx = parseInt($(this).attr('idx'));
				wEdition.MenuIdx = idx;
				if(url){
					switch (target){
						case  '_self':
							wEdition.setIframeWindow(url);
						break;	
					}
				}
				switch (actionid.toUpperCase()){
					case 'POLYGONZOOMIN':
						Mapp.getGraphicsExtent([LayersManager.currentFeature],6)
					break;
					case 'POLYGONINFO':

					break;
					case 'POLYGONEDIT':
						LayersManager.startEdition();
						wEdition.deactivate();
					break;	
					default:
					
					break;
				}
			});
		}
		wEdition.setIframeWindow = function(url){
			var oFrame = $('.mapp-external-holder iframe');
			var nFrame = oFrame.clone();
			nFrame.attr('src',url);
			oFrame.replaceWith(nFrame);
			BackgroundFade(true);
			nFrame.bind('load',function(){
				ExternalPopup(true);
			});
			return false;	
		};
	}
}( jQuery ));
