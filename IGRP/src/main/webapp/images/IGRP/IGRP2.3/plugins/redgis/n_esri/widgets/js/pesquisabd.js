(function ( jQ ) { 
    jQ.fn.PesquisaBd = function() {
    	var id = this.attr('id');
		var pesqBd = new Widget(id);
		pesqBd.form = pesqBd.Html.find('.submit-holder'); //form
		pesqBd.input = pesqBd.Html.find('.submit-holder input.search-input'); // input
		pesqBd.submitter = pesqBd.Html.find('.submit-holder *[type="submit"]');// button to submit
		pesqBd.action = pesqBd.form.attr('action');// procedeure of response
		
		/*FIELDS*/
		pesqBd.extentName = pesqBd.Html.find('fields field#extent').attr('name');//current extent
		pesqBd.activeLayersName = pesqBd.Html.find('fields field#activeLayers').attr('name');//active layers
		pesqBd.searchKeyName = pesqBd.Html.find('fields field#searchKey').attr('name');//search word
		pesqBd.mapIdName = pesqBd.Html.find('fields field#mapId').attr('name');	//map ID
		
		pesqBd.xslt = pesqBd.form.attr('xslt');//xsl to transform the response
		
		pesqBd.resultsHolder = pesqBd.Html.find('#pesquisabd-results-holder');//results appender
		
		pesqBd.onInit = function(){
			pesqBd.submitter.on('click',function(){
				if(pesqBd.input.val().length >= 1){
					try{
						pesqBd.resultsHolder.removeClass('active');
						var proc_url = pesqBd.serialize();
						if(proc_url != ''){
						 	XmlXslTransform(proc_url,pesqBd.xslt,'',pesqBd.resultsHolder,pesqBd.onSearchComplete,'');
						}
					 }catch(e){  
						console.log(e) 
					 }
				}
				return false;	
			});
			pesqBd.resultsHolder.on('click','.search-result-item',function(){
				var objId = jQ(this).attr('id');
				var _layerid = jQ(this).attr('layer');
				var _this = jQ(this);
				var _callback = function(features){
					try{
						if(features.length > 0){
							jQ('.search-result-item').removeClass('active');
							_this.addClass('active');
							Mapp.getGraphicsExtent(features,1);
						}
					}catch(e){
						console.log(e);	
					}
				}
				LayersManager.selectFeatureById({
					layerid:_layerid,
					objectId:objId,
					callback:_callback
				});
			});
		}
		pesqBd.serialize = function(){
			var activeLayers = LayersManager.getActiveLayersId();
			var searchKey = pesqBd.input.val();
			var mapId = Mapp.mapId;
			var extentObj = esri.geometry.webMercatorToGeographic(map.extent);
			
			var extent = [extentObj.xmin,extentObj.xmax,extentObj.ymin,extentObj.ymax]
			var srid = extentObj.spatialReference.wkid;

			var str = "";
			var _cOpt = "?";
			if(pesqBd.action.indexOf('?') > -1){//already has a param
				_cOpt = "&";
			}
			var action = pesqBd.action+_cOpt;
			_cOpt = "&";
			str = action + 
				  pesqBd.searchKeyName 		+ "=" + searchKey 	 + _cOpt + 
				  pesqBd.activeLayersName 	+ "=" + activeLayers + _cOpt + 
				  pesqBd.mapIdName 			+ "=" + mapId 		 + _cOpt +
				  pesqBd.extentName 		+ "=" + extent 		 + _cOpt + 'wkid='+srid;
			return str;
		}
		pesqBd.onActivate = function(){
			pesqBd.input.select();
			calculatePadBoxSize(pesqBd.input,pesqBd.form)
		}
		pesqBd.onDeactivate = function(){
			pesqBd.resultsHolder.html('');
		}
		pesqBd.onSearchComplete = function(){
			pesqBd.resultsHolder.addClass('active')
		}
	}
}( jQuery ));
