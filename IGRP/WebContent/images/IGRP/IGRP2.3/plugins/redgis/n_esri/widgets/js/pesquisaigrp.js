(function ( jQ ) { 
    jQ.fn.PesquisaIGRP = function() {
    	var id = this.attr('id');
		var pIGRP = new Widget(id);
			pIGRP.plink = this.attr('plink'); 
			pIGRP.iframe = null;
			pIGRP.active = true;
			pIGRP.currentLayer = null;
			pIGRP.currentFeature = null;
			
			pIGRP.onInit = function(){
				pIGRP.iframe = pIGRP.Html.find('#ifpIgrp');
				pIGRP.Html.find('.closerpes').on("click",function(){
					WidgetManager.deactivateWidget(pIGRP.id);
				});
			}
			
			pIGRP.onDeactivate = function(){
				pIGRP.currentLayer = null;
				pIGRP.currentFeature = null;
			}
			
			pIGRP.onActivate = function(){
				if(pIGRP.active){
					var nFrame = pIGRP.iframe.clone();
					nFrame.bind('load',function(){
						pIGRP.Html.removeClass("loading");
					});
					nFrame.attr('src',pIGRP.plink);
					pIGRP.iframe.replaceWith(nFrame);
					pIGRP.active = false;
				}
			}
			
			pIGRP.getExtent = function(p){
				pIGRP.currentFeature = p.featureid;
				pIGRP.currentLayer = p.layerid;
				if(pIGRP.currentFeature != null && pIGRP.currentLayer != null){
					LayersManager.getFeatureExtent({
						featureId:parseInt(p.featureid),
						layerId:p.layerid,
						callback:function(_extent){
							Mapp.setMapExtent(_extent,2.5);
						}
					});	
				}
			}
			
			pIGRP.onMapExtentChange = function(){
				if(pIGRP.currentFeature != null && pIGRP.currentLayer != null){
					LayersManager.selectFeatureById({
						objectId:parseInt(pIGRP.currentFeature),
						layerid:pIGRP.currentLayer,
						callback:function(e){
							//WidgetManager.deactivateWidget("pesquisaigrp");
						}
					});	
				}
			}
	}
}( jQuery ));
