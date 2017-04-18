/*Gemetry Servs*/
var GeometryService = new Widget('GeometryService');

GeometryService.areaAndLenght = 'redgis.GIS_SRV_ESRI.get_area_length';/*path+'/extentions/n_esri/geometryservice/area.perimetro.php';*///

GeometryService.execute = function(p){
	try{
		jQ.ajax({
			url:p.url,
			success:function(e){
				if(p.callback){
					if(typeof e == 'string'){
						var json = JSON.parse(e);
						if(typeof json === 'object'){
							p.callback(json);
						}	
					}
				}
			},
			error:function(e){
				GeometryService.trataErro(e);
			}
		})
	}catch(err){
		GeometryService.trataErro(err);
	}

}
GeometryService.getAreaAndLenght = function(p){//get geometries Area
	/* p.layerid,
	 * p.objectid
	 * p.callback
	 */
	 //var req = "";
	 try{
		 if(p.layerid != '' && p.objectid != ''){
		 	var req = GeometryService.areaAndLenght+'?p_layer_id='+p.layerid+'&p_objectid='+p.objectid;
		 	GeometryService.execute({ /*area:'x',perimetro:'y'*/
		 		url:req,
		 		callback:p.callback
		 	});
		 }
	 }catch(err){ 
	 	console.log(err); 
	 }
}

GeometryService.split = function(p){
	Mapp.geometryService.cut([p.geometry],p.splitter,p.callback,p.error);
}

GeometryService.union = function(p){
	Mapp.geometryService.union(p.geometries,p.callback,p.error);
}

GeometryService.convertRings = function(Graphics,splitter){
	/* GRAPHICS [] */
	var rtn = "";
	try{
		Graphics.forEach(function(sg,splits_idx){
		var graphic_rings = sg.rings;

		graphic_rings.forEach(function(ring){
			var _rContainer = "";
			ring.forEach(function(point,rIdx){
				var graphPoints = "";
					point.forEach(function(p,pIdx){
						if(pIdx == 0){
							graphPoints = graphPoints+p;
						}else{
							graphPoints = graphPoints+" "+p;
						}
					});
					if(rIdx == ring.length-1){
						_rContainer = _rContainer + graphPoints;
					}else{
						_rContainer = _rContainer + graphPoints + ',';
					}
			});
			if(splits_idx == Graphics.length-1){
				rtn = rtn + _rContainer;
			}else{
				rtn = rtn + _rContainer+splitter;
			}
				//rtn = rtn + _rContainer+'|';
			});
		});
	}catch(e){
		GeometryService.trataErro(e);
	}
	return rtn;
}

GeometryService.convertGeometry = function(geometry){
	var rtn = "";

	if(geometry.rings){
		geometry.rings.forEach(function(ring,rIdx){
			ring.forEach(function(points,pIdx){
				rtn = rtn+points[0]+' '+points[1];
				if(pIdx != ring.length-1)
					rtn = rtn+',';
			});
			if(rIdx != geometry.rings.length-1)
				rtn = rtn+'|';

		});
	}
	return rtn;
}

GeometryService.trataErro = function(e){
	console.log(e);
}