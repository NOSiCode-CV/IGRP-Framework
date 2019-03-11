(function(){

	GIS.module('Widgets', function(app, widgets){

		var Widgets = this,

			Templates = GIS.module('Templates');

		widgets.items = {};

		Widgets.add = function(w){

			if( $.isArray(w) )

				w.forEach(Widgets.add)

			else{

				var wt = $( Templates.Widgets.widget(w) );

				$('.gis-widgets-controller', app.dom).append(wt);
			}

		};

		(function(){
		
			if(widgets && widgets[0])

				Widgets.add( widgets );

		})();

		return Widgets;

	});

})();