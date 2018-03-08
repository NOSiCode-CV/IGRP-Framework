(function ( jQ ) { 
    jQ.fn.QueryExpression = function() {
    	var id = this.attr('id');
		var QuerryExpr = new Widget(id);
		QuerryExpr.queryexpression = null;
		QuerryExpr.layerid = null; 
		QuerryExpr.objectids = null;

		var done = false; 


		QuerryExpr.onSelectComplete = function(){}

		QuerryExpr.onInit = function(){
			this.activate();		
			try{
				QuerryExpr.setParameters();			
			}catch(err){
				return false;
			}
			
		}
		QuerryExpr.onLayersAddResult = function(results){
			if(!done){


			results.forEach(function(result){
				if(!result.error){
					var layer = result.layer;
					var _layerid = layer.id;
					
					if(_layerid == QuerryExpr.layerid){
						
						LayersManager.setLayerVisibility(QuerryExpr.layerid,true);
						if(QuerryExpr.valid()){
							try{
								var layer = LayersManager.getLayer(QuerryExpr.layerid)
								if(layer){
									console.log(layer)


									LayersManager.getFeature({
										layerId:layer.id,
										objectIds:QuerryExpr.objectids,
										callback:function(d){
											
											d.features.forEach(function(f){
												map.centerAndZoom(f.geometry,16)
												console.log(f);
											})
											//map.setExtent(extent.expand(1.5));
										
										}
									});

									
									LayersManager.getExtent({
										layerid:layer.id,
										objectids:QuerryExpr.objectids,
										callback:function(extent){

											//map.setExtent(extent.expand(1.5));
										
										}
									});

								}
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
		}

		QuerryExpr.onMapExtentChange = function(e){
			if(!done){

				if(QuerryExpr.valid()){
					LayersManager.select({
						objectids:QuerryExpr.objectids,
						layerid:QuerryExpr.layerid,
						callback:function(p){
				
							QuerryExpr.onSelectComplete({
								layerId:QuerryExpr.layerid,
								features:p
							});

							done = true;
						}
					});
				}else{
					QuerryExpr.isActive = false;
					QuerryExpr.queryexpression = null;
					QuerryExpr.layerid = null; 
					//QuerryExpr.objectid = null;
					QuerryExpr.objectids = null;
				}

			}
		}

		QuerryExpr.setParameters = function(){
			//p_query_expression=layerid:582|objectid:29954
			QuerryExpr.queryexpression  = QuerryExpr.getParameterByName('p_query_expression');

			var res = QuerryExpr.queryexpression.split("|");
			var layerParam = res[0];
			var attributes = res[1];

			var layerId = (layerParam.split(':'))[1];
			
			QuerryExpr.layerid = layerId;

			LayersManager.setLayerVisibility(layerId,true);

			if(attributes){
				var strObjectIds = ((attributes.split(':'))[1]).split(',');
				var objectIds = [];
			
				strObjectIds.forEach(function(o,i){
					objectIds[i] = parseInt(o);
				});

				QuerryExpr.objectids = objectIds;
			}

			/*if(res.length>1){
				var l1 = res[0].split(":");
				var l2 = res[1].split(":");				
				if(l1[0] == 'layerid'){
					QuerryExpr.layerid= l1[1];

				}
				if(l2[0] == 'objectid'){
					QuerryExpr.objectid= l2[1]					
				}
			}*/

		}		
		QuerryExpr.getParameterByName = function (name) {
    		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        	results = regex.exec(location.search);
    		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		QuerryExpr.valid = function(){
			var rtn=false;
			if(QuerryExpr.layerid && QuerryExpr.objectids){
				rtn = true;
			}
			return rtn;
		}
	}
}( jQuery ));
