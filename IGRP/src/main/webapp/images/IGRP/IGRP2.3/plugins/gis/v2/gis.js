(function(){

	var modules = {};

	function MapController(dom){
		
		var app    = this,

			data   = $(dom).data().config || {},

			id     = $(dom).attr('id') || 'map-'+$.IGRP.utils.unique(),

			config = $.extend({

				id : id,

				dom : dom,

				groupLayers : [],

				widgets : []

			}, data );

		app.dom    = dom;

		$(app.dom).attr('id' ,id);

		app.loading = function(v){
			
			var action = v ? 'addClass' : 'removeClass';

			$(dom)[action]('loading');

		};

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

		}

		return app;

	};

	window.GIS = $.IGRP.component('GIS',{

		maps : [],

		module : function(name, options){

			if(options)

				modules[name] = options;

			return modules[name];

		},

		init : function(elements){

			elements = elements || $('.igrp-map-os-wrapper');

			elements.each(function(i, e){
				
				GIS.maps.push( new MapController(e) );

			});

		}

	});

	$.IGRP.on('init', function(){

		GIS.init();

	} );
	

})();