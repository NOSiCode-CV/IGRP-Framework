(function ( jQ ) { 
    jQ.fn.LayerMenu = function() {
    	var id = this.attr('id');
		var layM = new Widget(id);
		layM.LayersMenu = [];
		
		layM.onInit = function(){
			this.activate();
			this.getLayers();
			
			this.LayersMenu.forEach(function(_this){
				LayersManager.onLayerAddResult({
					layerid:_this.id,
					callback:function(layer){	
						LayersManager.setLayerMenu({
							layerId:layer.id,
							menu:_this.menu		
						});
					}	
				});
			});
		};

		layM.getLayers = function(){
			var rtn = [];
			jQ.each(layM.Html.find('layers layer'),function(i,l){
				var layer = new Object();
				layer.id = jQ(this).attr('id');
				layer.menu = [];
				jQ.each(jQ(this).find('menu'),function(x,m){
					var menu = {
						id:layM.id+'-'+layer.id+'-'+x,
						target		: jQ(this).attr('target'),
						url			: jQ(this).attr('url'),
						label		: jQ(this).attr('label'),
						text		: jQ(this).attr('label'),
						icon 		: jQ(this).attr('icon')	,
						paramNames  : jQ(this).attr('param-name'),
						paramValues : jQ(this).attr('param-value'),
						attrName    : jQ(this).attr('attr-name')
					}
					
					layer.menu.push(menu);
				});
				rtn.push(layer);
			});
			layM.LayersMenu = rtn;
		}
	}

}( jQuery ));
