(function(){

	GIS.module('Widget', function(app, options){
		
		var widget    = this,
			
			Templates = GIS.module('Templates'),
			
			events	  = new $.EVENTS(['activate','deactivate','load-html', 'ready']);
		
		widget.html = "";
		
		widget.on = events.on;
		
		widget.map = app;
		
		widget.templates = {};
		
		widget.type = function(){
			
			return options.type;
			
		};
		
		widget.data = function(){
			
			return options.data || null;
		
		};
		
		widget.toggle = function(){
			
			if(widget.active)
				
				CloseWidgetPanel();
				
			else
				
				widget.activate()
			
		};
		
		widget.activate = function(){
			
			if(widget.options.html){
				
				if(!widget.html)
					
					GetWidgetHTML({
						
						success : function(source){
							
							var template = Handlebars.compile(source),
								
								html     = template(options);
							
							GetTemplates(source);

							widget.html = ConfigHTML(html);
							
							OpenWidgetPanel();
							
						}
					});
					
				else
					
					OpenWidgetPanel();
				
				
			}else{
				
				widget.active = true;
				
				events.execute('activate');
				
			}

		};
		
		function GetTemplates(tmpl){
			
			widget.templates.global = tmpl;
			
			var $tmpl = $(tmpl);
			
			$('[widget-template]', $tmpl).each(function(){
				
				var name = $(this).attr('widget-template');
				
				widget.templates[name] = $(this).prop("outerHTML");
				
			});

		}
		
		function OpenWidgetPanel(){
			
			widget.active = true;
			
			if(!$('.gis-panel.widget').find(widget.html)[0])
			
				$('.gis-panel.widget').append(widget.html);
			
			else
				
				widget.html.show();
			
			events.execute('activate');

		};
		
		function CloseWidgetPanel(){
			
			widget.active = false;
			
			if(widget.html)
				
				widget.html.hide();
			
			events.execute('deactivate');

		};
		
		function ConfigHTML(html){
			
			var wrapper = $(Templates.Widgets.wrapper( widget ));
			
			wrapper.append(html);
			
			return wrapper;
			
		};
		
		function GetWidgetHTML( o ){
			
			var _options = $.extend({
				
				success : function(){}
			
			},o);
			
			$.IGRP.request( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.html',{
				
				success : _options.success
				
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
					
					if(widget.dependencies)
						
						LoadDependencies(  );
					
					else
						
						Ready();
					
					
				});
			
		};
		
		function LoadDependencies(){
			
			if(widget.dependencies.css && widget.dependencies.css[0])
				
				widget.dependencies.css.forEach(function(css){
					
					if( !$('head').find('link[href="'+css+'"]')[0] )
						
						$('head').append('<link type="text/css" rel="stylesheet" href="'+css+'"/>')

				});
			
			if(widget.dependencies.js && widget.dependencies.js[0]){
				
				var jsDependenciesReq = [];
				
				widget.dependencies.js.forEach(function(js){
					
					jsDependenciesReq.push($.getScript( js ));
					
				});
				
				$.when.apply($, jsDependenciesReq).then( Ready );
				
			}
				
		}
		
		function GetWidgetButton(){
			
			var btnTemplate = $( Templates.Widgets.widget(widget.id,options) );
			
			widget.button = btnTemplate;
			
			app.addWidgetButton( btnTemplate );
			
		};
		
		function Ready(){
			
			events.execute('ready');
			
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