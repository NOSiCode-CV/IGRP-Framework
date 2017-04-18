
var ExternalWindow = function(content){
	var id = content.attr('id');
	console.log(id)
	var eWin = new Widget(id);
		eWin.layer = content.attr('layer')
		
		eWin.init = function(){
			eWin.ToolsConfig();	
		};
		
		eWin.ToolsConfig = function(){
			LayersManager.setEventListener({
				layerid:eWin.layer,
				_event:'selection-complete',
				callback:function(){
					jQ('.widget-controller[widgetid="'+eWin.id+'"][layer="'+eWin.layer+'"]').addClass('active');	
				}
			})
		};
		
}

/*(function ( jQ ) { 
    jQ.fn.ExternalWindow = function() {
    	var id = this.attr('id');
		var eWin = new Widget(id);
		eWin.layer = this.attr('layer')
		
		eWin.init = function(){
			eWin.ToolsConfig();	
		};
		
		eWin.ToolsConfig = function(){
			LayersManager.setEventListner({
				layerId:eWin.layer,
				_event:'selection-complete',
				callback:function(){
					jQ('.widget-controller[widgetid="'+eWin.id+'"][layer="'+eWin.layer+'"]').addClass('active');	
				}
			})
		};
		
		
		
	
	}
}( jQuery ));
*/