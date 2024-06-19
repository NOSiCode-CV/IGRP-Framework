(function(){

	var modules = {};

	function MapController(dom){
				
		var app    = this,

			dataURL   = $(dom).data().configURL || false,

			id     = $(dom).attr('id') || 'map-'+$.IGRP.utils.unique();

		app.dom    = dom;
		
		app.id     = id;

		$(app.dom).attr('id' ,id);

		app.loading = function(v){
			
			var action = v ? 'addClass' : 'removeClass';

			$(dom)[action]('loading');

		};
		
		app.addWidgetButton = function(btn){
			
			$('.gis-widgets-controller', app.dom).append(btn);

		};
		
		if(dataURL){
			
			$.get(dataURL).then(function(d){
				
				var data = typeof d === 'string' ? JSON.parse(d) : d;
								
				var config = $.extend({

					id : id,

					dom : dom,

				}, data );
								
				if(modules.Map){
					
					app.map = new modules.Map( app, config );

					if(modules.BaseMaps)

						app.basemaps = new modules.BaseMaps( app, config.baseMaps );

					if(modules.Layers)

						app.layers = new modules.Layers( app, config.groupLayers );

					if(modules.Widgets)

						app.widgets = new modules.Widgets( app, config.widgets );

					if(modules.Panels)

						app.panels = new modules.Panels(dom);
					
				};
				
			});
	
		}

		return app;

	};

	window.GIS = $.IGRP.component('GIS',{
		
		path : $.IGRP.path+'/plugins/gis/v2',

		maps : {},

		module : function(name, options){

			if(options)

				modules[name] = options;

			return modules[name];

		},
		
		widgets : {
			
			items : {},
			
			register : function(name, options){
				
				if(!GIS.widgets.items[name])
					
					GIS.widgets.items[name] =  options;
				
			},
			
			get : function(name){
				
				return GIS.widgets.items[name];
				
			}
			
		},
		
		getMap : function(id){
			
			return this.maps[id];
			
		},

		init : function(elements){
			
			elements = elements || $('.igrp-map-os-wrapper');
			
			elements.each(function(i, e){
				
				var map = new MapController(e);
				
				GIS.maps[map.id] = map;

			});

		}

	});
	
	
	$(window).load(function(){
		
		setTimeout(function(){
			
			GIS.init();
			
		},2);
		
	});
	

})();