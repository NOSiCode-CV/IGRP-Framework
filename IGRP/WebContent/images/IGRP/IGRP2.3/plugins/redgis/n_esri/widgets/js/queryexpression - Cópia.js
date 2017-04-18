(function ( jQ ) { 
    jQ.fn.QueryExpression = function() {
    	var id = this.attr('id');
		var QuerryExpr = new Widget(id);
		QuerryExpr.queryexpression = null;
		QuerryExpr.layerid = null; 
		QuerryExpr.objectid = null; 

		QuerryExpr.onInit = function(){
			this.activate();			
			QuerryExpr.setParameters();			
		}
		QuerryExpr.onLayersAddResult = function(results){
			//var results = e);
			results.forEach(function(result){
				if(!result.error){
					var layer = result.layer;
					var _layerid = layer.id;

					if(_layerid == QuerryExpr.layerid){
						if(QuerryExpr.valid()){
							try{
								LayersManager.getFeatureExtent({
									featureId:QuerryExpr.objectid,
									layerId:_layerid,
									callback:function(_extent){
										if(_extent){
											
											LayersManager.setLayerVisibility(QuerryExpr.layerid,true)
											Mapp.setMapExtent(_extent);
										}else{
											Mapp.ErrorHandler({
												text:'no extent found'
											});
											QuerryExpr.deactivate();
										}
									}
								});
							}catch(e){ 
								Mapp.ErrorHandler({
									object:e
								});
							}
						}

					}
				}
			});
		}
		QuerryExpr.setParameters = function(){
			//p_query_expression=layerid:582|objectid:29954
			QuerryExpr.queryexpression  = QuerryExpr.getParameterByName('p_query_expression');

			var res = QuerryExpr.queryexpression.split("|");
			if(res.length>1){
				var l1 = res[0].split(":");
				var l2 = res[1].split(":");				
				if(l1[0] == 'layerid'){
					QuerryExpr.layerid= l1[1];

				}
				if(l2[0] == 'objectid'){
					QuerryExpr.objectid= l2[1]					
				}
			}
		}		
		QuerryExpr.getParameterByName = function (name) {
    		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        	results = regex.exec(location.search);
    		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		QuerryExpr.onMapExtentChange = function(e){
			if(QuerryExpr.valid()){
				LayersManager.selectFeatureById({
					objectId:parseInt(QuerryExpr.objectid),
					layerid:QuerryExpr.layerid,
					callback:function(e){
						QuerryExpr.deactivate();
					}
				});
			}else{
				QuerryExpr.isActive = false;
				QuerryExpr.queryexpression = null;
				QuerryExpr.layerid = null; 
				QuerryExpr.objectid = null; 
			}
		}
		QuerryExpr.valid = function(){
			var rtn=false;
			if(QuerryExpr.layerid && QuerryExpr.objectid){
				rtn = true;
			}
			return rtn;
		}
	}
}( jQuery ));
