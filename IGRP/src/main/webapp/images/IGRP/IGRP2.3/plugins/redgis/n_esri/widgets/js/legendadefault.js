(function ( jQ ) { 
    jQ.fn.LegendaDefault = function() {
    	var id = this.attr('id');
		var _Ldef = new Widget(id);	
		_Ldef.position = this.attr('position');
		_Ldef.LayersInfo = [];
		_Ldef.legend =null;
		_Ldef.hasStarted = false;
		_Ldef.legendHolder = 'legendadefault_holder';
		
		_Ldef.onInit = function(){
			_Ldef.includeCss('legendadefault.style');
			
			_Ldef.legend =  new esri.dijit.Legend({ 
				map:map,
				layerInfos:[] 
			},_Ldef.legendHolder);

			
			LayersManager.onLayersAddResult({
				callback:function(results){
					results.forEach(function(result){
						var _layer = result.layer;
						var layerInfo = {layer:_layer, title:_layer.name};
						_Ldef.legend.layerInfos.push(layerInfo)
					})
				}	
			});
		}
		
		_Ldef.onActivate = function(){
			if(!_Ldef.hasStarted){
				_Ldef.legend.startup();
				_Ldef.hasStarted = true;
			}
		}
	}
}( jQuery ));
