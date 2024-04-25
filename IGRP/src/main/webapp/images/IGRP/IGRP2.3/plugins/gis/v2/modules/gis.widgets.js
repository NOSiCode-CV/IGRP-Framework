(function(){

	GIS.module('Widgets', function(app, widgets){

		var Widgets = this,
		
			Widget = GIS.module('Widget'),

			Templates = GIS.module('Templates');

		Widgets.items = [];
		
		Widgets.dependencies = [];
		
		function SetEvents(){
			
			$(app.dom).on('click','.gis-widget-controller', function(){
				
				var id = $(this).attr('widget-id');
				
				Widgets.toggle( id );

			});
			
		};
		
		function CheckURLWidgets(){
			
			var params = $.IGRP.utils.url.getParams();
			
			if(params.gis_map_settings){
				
				try{
					
					var mapSettingsStr = decodeURIComponent(params.gis_map_settings),
					
						mapSettings    = JSON.parse(mapSettingsStr);
					
				}catch(err){
					
					console.log(err);
					
				}
	
			}
			
		};
		
		Widgets.toggle = function(id){
			
			var widget = Widgets.get( id );
			
			if(widget)
				
				widget.toggle();
		}
		
		Widgets.activate = function(id){
			
			var widget = Widgets.get( id );
			
			if(widget)
				
				widget.activate();
		}
		
		Widgets.get = function(id){
			
			var rtn = $.grep( Widgets.items, function(n,i){
					
				return n.id == id;
				
			})[0];
				
			return rtn;
			
		};
		
		Widgets.add = function(w){

			if( $.isArray(w) )

				w.forEach(Widgets.add)

			else{
				
				var widget = new Widget( app, w );
			
				Widgets.items.push(widget);

			}

		};

		(function(){
						
			if(widgets && widgets[0]){
				
				try{
					
					Widgets.add( widgets );
					
				}catch(err){
					
					console.log(err)
					
				}
			}
			
			SetEvents();

		})();

		return Widgets;

	});

})();