(function(){
	
	var config = GIS.module('Config');

	GIS.module('Widget', function(app, options){
		
		var widget    = this,
			
			Templates = GIS.module('Templates'),
			
			Utils 	  = GIS.module('Utils'),
			
			events	  = new $.EVENTS(['activate','deactivate','load-html', 'ready']),
			
			_activated = false,
			
			_htmlRequest = false;
		
		widget.html = "";
				
		widget.on = events.on;
		
		widget.map = app;
		
		widget.templates = {};
		
		widget.actions = {};
		
		widget.steps = {};
		
		widget.events = {
				
			declare : function(arr){
				
				events.declare(arr);
				
			},
			
			trigger : events.execute
				
		};
		
		widget.templateParams = {};
		
		var initialConfig = config.getOptions(options.type)
		
		options = $.extend(initialConfig, options);	
		
		widget.action = function(name, fnc){
			
			if(!widget.actions[name])
				
				widget.actions[name] = function(){
				
					fnc(arguments[0], arguments[1], arguments[3]);
					
					events.execute('action-'+name );
					
					EvaluateStepsRules();
				
				};
			
		};
		
		widget.activateStep = function(id){
						
			if(widget.steps[id])
				
				widget.steps[id].activate();
			
		}
		
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
		
		widget.loading = function (v){
			
			if(v)
				
				widget.html.addClass('loading');
			
			else
				
				widget.html.removeClass('loading');
			
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
							
							ConfigWidgetPanel()
							
							ConfigActions();
							
							ConfigSteps();
							
							events.execute('load-html', widget.html);

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
		
		widget.deactivate = function(){
			
			CloseWidgetPanel();
			
		};
		
		
		widget.setTemplateParams = function(object){
			
			for( var key in object ){
				
				var value = object[key];
				
				widget.templateParams[key] = value;
				
			}
						
			$('[widget-template]',widget.html).each(function(i,e){
				
				var tempName = $(this).attr('widget-template'),
				
					template = widget.templates[tempName],
				
					result 	 = Utils.templates.render( template, widget.templateParams );
				
				$(e).replaceWith( result );
				
			});
			
		
		}
		
		widget.setTemplateParam = function(tempName, v){
			
			var template = widget.templates[tempName];
			
				result 	 = Utils.templates.render( template, v );
				
			$('[widget-template='+tempName+']').replaceWith( result );
			
		}
		
		widget.setMenu = function(arr){
			
			var menuTmpl = Templates.Widgets.menu( arr, widget )
			
			widget.button.addClass('widget-with-menu');
		
			widget.button.append( menuTmpl  );
			
			widget.on('activate', function(){
				
				menuTmpl.addClass('active')
				
			});
			
			widget.on('deactivate', function(){
				
				menuTmpl.removeClass('active')
				
			});
			
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
			
			if(!$('.gis-panel.widget', app.dom).find(widget.html)[0])
			
				$('.gis-panel.widget', app.dom).append(widget.html);
			
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
		
		function ConfigWidgetPanel(){
			
			var panel = widget.html.find('.gis-widget-panel');
			
			if(panel[0]){
				
				panel.append(Templates.Widgets.panelTools());
				
				panel.on('click','.widget-deactivate', widget.deactivate);
				
			}
		};
		
		function GetWidgetHTML( o ){
			
			var _options = $.extend({
				
				success : function(){}
			
			},o);
			
			if(!_htmlRequest){
				
				_htmlRequest = true;
				
				$.IGRP.request( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.html',{
					
					success : _options.success
					
				});
				
			}

		};
		
		function GetWidgetCSS(){
			
			if(widget.options.css)
				
				$.get( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.css').then(function(d){
					
					var styleID = 'gis-'+widget.type()+'-widget-style';

					if( !$('head #'+styleID)[0] )
						
						$('head').append('<style id="'+styleID+'">'+d+'</style>')

				});

		};
		
		function GetWidgetJS(){
			
			if(widget.options.js)
			
				$.getScript( GIS.path+'/widgets/'+widget.type()+'/'+widget.type()+'.widget.js').then(function(d){
					
					var widgetExtension = GIS.widgets.get( widget.type() ),
					
						initWidget      = function(){
							
							widgetExtension.init(widget, app);
						
						};
						
					if(widgetExtension.dependencies)
						
						LoadDependencies( widgetExtension.dependencies,  initWidget);
					
					else
						
						Ready( initWidget );
					
				});
			
		};
		
		function LoadDependencies(dependencies, callback){
			
			if(dependencies.css && dependencies.css[0])
				
				dependencies.css.forEach(function(css){
					
					if( !$('head').find('link[href="'+css+'"]')[0] )
						
						$('head').append('<link type="text/css" rel="stylesheet" href="'+css+'"/>')

				});
			
			if(dependencies.js && dependencies.js[0]){
				
				var jsDependenciesReq = [];
								
				dependencies.js.forEach(function(js){
												
					jsDependenciesReq.push($.getScript( js ));					
						
				});
				
				$.when.apply($, jsDependenciesReq).then( function(){
										
					Ready( callback );
					
				} );
				
			}
				
		}
		
		function GetWidgetButton(){
			
			var control = $.extend({
				
				button : true
				
			}, widget.options.control);

			var btnTemplate = $( Templates.Widgets.widget(widget.id, options) );
				
			widget.button = btnTemplate;
				
			app.addWidgetButton( btnTemplate );
			
		};
		
		function ConfigActions(){
			
			var $actions = widget.html.find('[widget-action]');
			
			$actions.each(function(i,action){
				
				var event 	 = $(action).attr('action-event') || 'click',
				
					callback = $(action).attr('widget-action');
				
				if(widget.actions[callback] && typeof widget.actions[callback] === 'function')
					
					$(action).on( event, function(){
						
						 widget.actions[callback]( );
						
					} );
				
				
				events.declare(['action-'+callback]);
				
			});
			
		};
		
		function EvaluateStepsRules(){
			
			for(var name in widget.steps){
				
				var step = widget.steps[name];
				
				if(step.eval)
					
					step.eval();
					
			}
			
		};
		
		function Step(stepHTML){
			
			var step = this,
			
				html   	   = $(stepHTML),
				
				stepEvents = new $.EVENTS(['activate']),
				
				$steps 	   = widget.html.find('.widget-step'),
				
				trigger    = html.attr('step-trigger'),
				
				rule	   = html.attr('step-when')
				
				index      = html.attr('step') ? html.attr('step') *1 : html.index();
			
			step.html = html;
			
			step.id   = html.attr('step-id') || 'step-'+index;
			
			step.rule = true;
			
			step.on = stepEvents.on;
			
			step.trigger = stepEvents.execute;
			
			step.activate = function(){
				
				EvaluateStepsRules();
					
				if(!rule){
					
					$steps.not('[step-when]').not(html).each(function(){
						
						var id = $(this).attr('step-id');
						
						$(this).removeClass('active');
						
						widget.steps[id].trigger('deactivate');
						
					});
					
					html.addClass('active');
					
					stepEvents.execute('activate', step);
				}

			};	
			
			
			if(trigger){
				
				var triggers = trigger.split(' ');
				
				triggers.forEach(function(triggerEvent){
					
					widget.on(triggerEvent, step.activate);
					
				});
				
			}else if(rule){
				
				step.eval = function(){
					
					try{
						
						var r = eval(rule);
						
						if(r){
							
							html.addClass('active');
							
							step.trigger('activate', step);
							
						}else{
							
							html.removeClass('active');
		
							step.trigger('deactivate', step);
							
						}

					}catch(err){
						
						console.log(err);
						
					}
					
				}
				
				step.eval();
				
			};

			return step;
			
		};
		
		function ConfigSteps(){
			
			var $steps = widget.html.find('.widget-step');
			
			if( $steps[0] )
				
				$steps.each(function(i,step){
					
					var step = new Step(step);
					
					widget.steps[step.id] = step;
					
				});

		}
		
		function CheckWidgetActive(){
			
			if(widget.options.active)
				
				widget.on('ready',widget.activate)

			
		};
		
		function Ready(callback){
			
			if(callback)
				
				callback();
			
			events.execute('ready');
			
		};
		
		function Init(){
			
			widget.id = app.id+'-widget-'+$.IGRP.utils.unique();
				
			widget.options = options;
			
			GetWidgetJS();
			
			GetWidgetCSS();
			
			GetWidgetButton();
			
			CheckWidgetActive();
			
		}
		
		Init();
		
		return widget;

	});

})();