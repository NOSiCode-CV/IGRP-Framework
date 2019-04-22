(function(){

	GIS.module('Widgets', function(app, widgets){

		var Widgets = this,
		
			Widget = GIS.module('Widget'),

			Templates = GIS.module('Templates');

		Widgets.items = [];
		
		function SetEvents(){
			
			$(app.dom).on('click','.gis-widget-controller', function(){
				
				var id = $(this).attr('widget-id');
				
				Widgets.toggle( id );
				
				/*var id = $(this).attr('widget-id');
				
				if(!$(this).hasClass('active'))
					
					Widgets.activate(id);
					
				else
					
					Widgets.deactivate(id);*/

			});
			
		};
		
		function CheckURLWidgets(){
			
			var params = $.IGRP.utils.url.getParams();
			
			if(params.gis_map_settings){
				
				try{
					
					var mapSettingsStr = decodeURIComponent(params.gis_map_settings),
					
						mapSettings    = JSON.parse(mapSettingsStr);
				
					console.log(mapSettings )
					
				}catch(err){
					
					console.log(err);
					
				}
	
			}
			
			/*if(params.gislocator == "1" && params.gislocatormap && params.gislocatormap == app.id){
				
				try{
					
					Widgets.add( {
						
						type : 'getcoordinates',
						
						title : 'Get Coordinates',
						
						active : 'true',
						
						control : {
							
							button : false
							
						},
						
						js : true,
						
						position : 'top'
						
					} );
					
				}catch(err){
					
					console.log(err)
				}
				
				
				
			}/*
			
			//if(params.)
			
			/*
			 * 
			    
			    active: true
				control: {button: false}
				css: true
				data: {layers: Array(2)}
				html: true
				icon: "fa-search"
				js: true
				name: "pesquisar"
				position: "top"
				title: "Pesquisar"
				type: "search"
	
			 
			 * */
			
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
			
			if(widgets && widgets[0])

				Widgets.add( widgets );
			
			SetEvents();

		})();

		return Widgets;

	});

})();