(function ( jQ ) { 
    jQ.fn.PolygonEdition = function() {
    	var id = this.attr('id');
		var pEdit = new Widget(id);
		pEdit.editTool = null;
		pEdit.layer = this.attr('layer');
		pEdit.MenuItem = null;
		
		pEdit.position = this.attr('position');

		pEdit.init = function(){
			pEdit.initEditTool();
			pEdit.ToolsConfig();			
		};
		
		pEdit.ToolsConfig = function(){
			
			if(pEdit.position = 'layer-menu'){
				pEdit.activate();	
			}
			
			if(jQ('.widget-controller[widgetid="'+pEdit.id+'"]').length > 0){
				pEdit.MenuItem = jQ('.widget-controller[widgetid="'+pEdit.id+'"]');
				pEdit.MenuItem.on('click',function(){
					pEdit.startEdition();
				});				
			}
		};
		
		pEdit.onMapRightClick = function(e){
			pEdit.editTool.deactivate();
			if(LayersManager.currentLayer){
				var layer = LayersManager.currentLayer;
				if(parseInt(jQ('layer#'+layer.id).attr('editable')) == 1 && layer._editable){
					jQ('.widget-controller[widgetid="'+pEdit.id+'"]').addClass('active');
					//console.log(jQ('.widget-controller[widgetid="'+pEdit.id+'"]').height())
				}
			}else{
				pEdit.editTool.deactivate();	
			}
		};
		
		pEdit.onPanStart = function(e){
			
		}
		pEdit.onPanEnd = function(e){
			
		}
		pEdit.onZoomStart = function(e){
			
		}
		pEdit.onZoomEnd = function(e){
			
		}
		
		
		pEdit.initEditTool = function(){
			pEdit.editTool = esri.toolbars.Edit(map);	
			pEdit.editTool.on('deactivate',function(e){
				console.log(e.info.isModified);
				if(e.info.isModified){
					if(confirm('Gravar Alterações?')){
						
						/* DO YOUR THING - GRAVAR ALTERAÇOES*/
						
					}else{
						return ;
					}	
				}	
			});
		};
		
		pEdit.startEdition = function(){
			LayersManager.hideLayerMenu();
			if(LayersManager.currentFeature){
				 pEdit.editTool.activate(
					esri.toolbars.Edit.ROTATE | 
					esri.toolbars.Edit.EDIT_VERTICES | 
					esri.toolbars.Edit.MOVE | 
					esri.toolbars.Edit.SCALE, 
					LayersManager.currentFeature
				);	
			}
		};
	}
}( jQuery ));
