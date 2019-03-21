(function(){

	GIS.module('Widgets', function(app, widgets){

		var Widgets = this,
		
			Widget = GIS.module('Widget'),

			Templates = GIS.module('Templates');

		Widgets.items = [];
		
		function SetEvents(){
			
			$(app.dom).on('click','.gis-widget-controller', function(){
				
				var id = $(this).attr('widget-id');
				
				Widgets.activate(id);

			});
			
		};
		
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