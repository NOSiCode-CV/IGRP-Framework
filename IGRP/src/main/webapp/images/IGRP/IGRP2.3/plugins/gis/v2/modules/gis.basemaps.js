(function(){

	var Templates = GIS.module('Templates');

	GIS.module('BaseMaps', function(app, list){

		var basemaps 		= this,

			viewer   	    = app.viewer(),
		
		    selectedBaseMap = false,
		    
			list            = list || [];
			
		if(list.length == 0) list.push({ name : 'OpenStreetMap.BlackAndWhite', default : true })
			
		var	defaultBaseMap	= list.filter(function(b){ return b.default })[0] || null;
		
		if(!defaultBaseMap) {
			
			defaultBaseMap = list[0];
			
			defaultBaseMap.default = true;
			
		}
					
		basemaps.set = function(basemap, url, callback){
			
			var baseMapLayer = basemaps.get({url : url, name: basemap});
			
			if(baseMapLayer){

				viewer.addLayer( baseMapLayer, true )

				if(selectedBaseMap)

					selectedBaseMap.remove();

				selectedBaseMap = baseMapLayer;

				if(callback)

					callback(baseMapLayer);

				selectedBaseMap.bringToBack();

			};
				
		};
		
		basemaps.get = function(item){
						
			if(item.url){
				
				return L.tileLayer(item.url);
				
			}else{
				
				return typeof item.name === 'string' ?  L.tileLayer.provider(item.name) : '';
				
			}
			
			return '';
		};

		basemaps.getSelected = function(){

			return selectedBaseMap;

		};
		
		basemaps.iconURL = function(item){
			
			var url      = '',
				_tileX   = 3,
				_tileY   = 3,
				_tileZ   = 3,
				_r       = '',
				_variant = '';
						
			var bm = basemaps.get(item);
			
			_variant = bm.options.variant;
			
			if(!bm) return '';
			
            if (item.iconURL) {
            	
                url = item.iconURL;
                
            } else {
            	
                var coords = { x: _tileX, y: _tileY };                              
                	
                try{
	                url = L.Util.template(
	                	bm._url,
	                    L.extend(
	                        {
	                            s: bm._getSubdomain(coords),
	                            x: coords.x,
	                            y: bm.tms ? bm._globalTileRange.max.y - coords.y : coords.y,
	                            z: _tileZ,
	                            r: _r,
	                            variant: _variant
	                        },
	                        item.options
	                    )
	                );
                }catch(e){
                    console.error(e);
                }
            }
            
            return url;
		};

		basemaps.drawList = function(){

			list.forEach(function(bm){
				
				var iconURL = basemaps.iconURL(bm);
				
				bm.iconURL = iconURL;
				
				$('.gis-basemaps', app.dom).append( Templates.BaseMaps.item( bm ) );

			});

			$('.gis-basemap-item', app.dom).on('click', function(){

				var controller = $(this),
				
				name = controller.attr('basemap-name'),
				
				url = controller.attr('basemap-url');

				basemaps.set(name,url, function(){

					$('.gis-basemap-item', app.dom).removeClass('active');

					controller.addClass('active');

				});

			});

		};

		basemaps.drawList();

		if(defaultBaseMap)

			basemaps.set( defaultBaseMap.name, defaultBaseMap.url );

		return  basemaps;

	});

})();