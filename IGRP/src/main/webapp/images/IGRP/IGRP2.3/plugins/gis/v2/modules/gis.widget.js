(function(){

	GIS.module('Widget', function(app, options){
		
		var widget    = this,
			
			Templates = GIS.module('Templates'),
			
			events	  = new $.EVENTS(['activate','load-html']);
		
		widget.html = "";
		
		widget.on = events.on;
		
		widget.map = app;
		
		widget.type = function(){
			
			return options.type;
			
		};
		
		widget.data = function(){
			
			return options.data || null;
		
		};
		
		widget.activate = function(){
			
			if(!widget.html)
		
				GetWidgetHTML({
					
					success : function(source){
						
						var template = Handlebars.compile(source),
							
							html     = template(options);

						widget.html = ConfigHTML(html);
						
						OpenWidgetPanel();
						
					}
				});
				
			else
				
				OpenWidgetPanel();

		};
		
		function OpenWidgetPanel(){
			
			$('.gis-panel.widget').html(widget.html);
			
			events.execute('activate');

		};
		
		function ConfigHTML(html){
			
			var wrapper = $(Templates.Widgets.wrapper( widget ));
			
			wrapper.append(html);
			
			return wrapper;
			
		};
		
		function GetWidgetHTML( o ){
			
			var options = $.extend({
				
				success : function(){}
			
			},o);
			
			$.IGRP.request( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.html',{
				
				success : options.success
				
			}).then(function(d){
				
				events.execute('load-html', d);
			})
			
		};
		
		function GetWidgetCSS(){
			
			if(widget.options.css)
				
				$.get( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.css').then(function(d){
					
					var styleID = 'gis-'+widget.type()+'-widget-style';

					if( !$('head #'+styleID)[0] )
						
						$('head').append('<style id="'+styleID+'">'+d+'</style>')

					
				});
			
			
		}
		
		function GetWidgetJS(){
			
			if(widget.options.js)
			
				$.getScript( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.js').then(function(d){
					
					var widgetExtension = GIS.widgets.get(widget.type());
					
					if(widgetExtension)
						
						$.extend( widget,  widgetExtension);
					
					if(widget.start)
						
						widget.start( widget, app );
					
					
				});
			
		};
		
		function GetWidgetButton(){
			
			var btnTemplate = $( Templates.Widgets.widget(widget.id,options) );
			
			widget.button = btnTemplate;
			
			app.addWidgetButton( btnTemplate );
			
		};
		
		function Init(){
			
			widget.id = app.id+'-widget-'+$.IGRP.utils.unique();
				
			widget.options = options;
			
			GetWidgetJS();
			
			GetWidgetCSS();
			
			GetWidgetButton();
			
		}
		
		Init();
		
		return widget;

	});

})();