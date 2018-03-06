(function ( jQ ) { 
    jQ.fn.BaseMap = function() {
    	var id = this.attr('id');
		var baseM = new Widget(id);	
		baseM.wWidth = this.width();	
		baseM.position = this.attr('position');
		baseM.items = this.find('.basemap-item')
		baseM.totalItems = baseM.items.length;
		
		baseM.onInit = function(){
			jQ('.basemap-item').on('click',function(){
				
				var bm = {
					id: jQ(this).attr('id'),
					name: jQ(this).attr('name'),
					url:jQ(this).attr('link'),
					type:jQ(this).attr('type')
				}
				console.log(JSON.stringify(bm));
				Mapp.settings.basemap.set(bm);
				/*var bm_name = jQ(this).attr('name'),
					bm_type = jQ(this).attr('type'),
					bm_url  = jQ(this).attr('link');	
				baseM.changeBaseMap({
					name:bm_name,
					type:bm_type,
					url:bm_url
				});*/
			});
			
			var tW = 0;
			var ctr = 0;
			var _max = 6;
			//jQ('.basemaps-holder').width(0);
			
			jQ.each(baseM.items,function(i,_item){
				var t = jQ('.basemaps-holder').width()
				if(ctr%2 == 0){
					//jQ('.basemaps-holder').width(jQ('.basemaps-holder').width()+ 130)
				}
				ctr++;
			});
			baseM.setMenuActive(Mapp.getBaseMap());
		};
		baseM.changeBaseMap = function(p){
			/*
				p.name = name of the basemap,
				p.type = type of bm
				p.link
			*/
			var basemap = null;
			if(p.type && p.name){
				switch (p.type){
					case 'ESRI': /*ESRI BASEMAPS (OSM/SATELLITE/TOPO)*/
						basemap = p.name;
					break;
					default:
				}
			}
			if(basemap && basemap != ''){
				map.setBasemap(basemap);
			}
		};
		baseM.onBaseMapChange = function(e){
			baseM.setMenuActive(e.current.basemapName);
		}
		baseM.setMenuActive = function(name){
			jQ('.basemap-item').removeClass('active');
			jQ('.basemap-item[name="'+name+'"]').addClass('active');	
			//baseM.Html.context.scrollX(320)
		};

		

	}
}( jQuery ));
