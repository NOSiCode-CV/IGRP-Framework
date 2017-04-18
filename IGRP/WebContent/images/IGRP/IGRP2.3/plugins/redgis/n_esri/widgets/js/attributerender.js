(function ( jQ ) { 
    jQ.fn.AttrRender = function() {
    	var id = this.attr('id');
		var attrR = new Widget(id);
		attrR.Layers = null;
		attrR.onInit = function(){
			attrR.Layers = attrR.getLayersObj();
			attrR.setRenders();
		}
		attrR.setRenders = function(){
			attrR.Layers.forEach(function(l){
				LayersManager.onLayerAddResult({
					layerid:l.layerId,
					callback:function(e){
						LayersManager.setLayerAttRenderer(l);
					}
				});
			});
		}
		attrR.getLayersObj = function(){
			var rtn = [];
			jQ.each(attrR.Html.find('layers layer'),function(){
				var _this = jQ(this);
				
				var obj = {
					layerId:_this.attr('id'),
					field:_this.attr('field'),
					render:[]
				}
				var arr = [];
			    jQ.each(_this.find('render'),function(){
					  r = {
						  color:jQ(this).attr('color'),
						  label:jQ(this).attr('label'),
						  operator:jQ(this).attr('operator'),
						  value:jQ(this).attr('value')
					  }
					  obj.render.push(r);
				 })				 
				 rtn.push(obj)
			})
			return rtn;	
		}
		
	}
}( jQuery ));
