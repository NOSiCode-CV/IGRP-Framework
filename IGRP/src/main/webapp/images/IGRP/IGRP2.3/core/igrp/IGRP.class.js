/*SIDE CTRL*/
(function(){
	
	$.IGRP = {

		_init:false,

		info : {

			page : null,

			app  : null,

			params : null

		},
		
		path : path,

		events: new $.EVENTS(['windowResize','init']),
		
		components: {},

		store:{

			list : function(){
				return localStorage;
			},

			set:function(o){
				if( localStorage )
					localStorage.setItem(o.name, o.value);
			},

			unset:function(name){
				if( localStorage )
					localStorage.removeItem(name);
			},

			get:function(name){
				var rtn = null;
				
				if( localStorage )
					rtn = localStorage.getItem(name);

				return rtn;
			}

		},

		timeout : {

			list : {},

			clear:function(name){
				
				var to = $.IGRP.timeout.list[name];
				
				if(to) 
					clearTimeout(to);

			},

			get:function(name){
				return $.IGRP.timeout.list[name] || false;
			},

			set:function(name,func,t){

				var time = t || 5000;
				
				var to = setTimeout(func,t);

				$.IGRP.timeout.list[name] = to;

				return to;

			}

		},

		screen : {

			check : function(){
				
				try{
					
					$('body').removeAttr('screen-size');

					if( ResponsiveBootstrapToolkit.is('sm') )

						$('body').attr('screen-size', 'sm');

					if( ResponsiveBootstrapToolkit.is('xs') )

						$('body').attr('screen-size', 'xs');

				}catch(e){

					null;
					
				}
				
				
			}

		},

		startComponent :function(com){
			
			if(com && com.init && typeof com.init === 'function'){
				
				$(function(){

					com.init();

					com.events.execute('init');
					
				});
				

			}

		},
		
		component:function(name,o,autoinit){
			//console.log(name)
			var options = $.extend(true,{
				init:function(){}
			}, o);

			if(!$.IGRP.components[name]){

				$.IGRP.components[name] = options;
				
				var com = $.IGRP.components[name];

				com._name = name;
				
				com.init = com.init || function(){};
				
				com.events = com.events || new $.EVENTS(['init']);

				if(autoinit){

					if($.IGRP._init)
						$.IGRP.startComponent( com );
					else
						$.IGRP.on('init', function(){ 
							$.IGRP.startComponent( com );
						});

				}

				return com;
			}
			else{
				console.log('component already set');
				return $.IGRP.components[name];
			}
		},

		notify:function(p){
			
			var component = p.component ? $('.gen-container-item[item-name="'+p.component+'"]') : [];

			$.IGRP.timeout.clear('clear_'+p.component);

			if(component[0]){

				var wrp = p.appendTo ? $(p.appendTo,component) : $('>.box-body',component);

				var _alert = '<div class="clear clearfix alert alert-'+p.type+' alert-dismissable fade in">'+
					'<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>'+
					p.message+
				'</div>';

				
				if(p.replace){
					
					var eAlert = $('.alert',component);
					
					if( eAlert[0] )
						eAlert.replaceWith(_alert);
					else
						wrp.writeAlert(_alert);

				}else{
					wrp.writeAlert(_alert);
				}


				if(p.timeout){
				
					$.IGRP.timeout.set('clear_'+p.component,function(){

						$('.alert',component).remove();

					},p.timeout);

				}

			}else{

				$.notify({
		            message: p.message
		        },{
		            type: p.type
		        });

			}
			
		},

		hideNotify : function(){

			if($('div[data-notify="container"]')[0]) $('div[data-notify="container"]').remove();
		
		},
		
		request:function(url,o){
			
			var options = $.extend(true, {
				params   : {},
				headers	 : {},
				dataType : null,
				success  : function(){},
				fail     : function(){},
				complete : function(){}
			}, o),
				req 	= null;
			
			if(url)
				req = $.ajax({
					url      : url,
					data     : options.params,
					headers	 : options.headers,
					method	 : options.method,
					dataType : options.dataType
				})
				.done(options.success)
				.fail(options.fail)
				.always(options.complete);

			return req;
			
		},

		checkBrowser:function(){

			var IE = function(){

				var ua 	 = window.navigator.userAgent,

			    	msie = ua.indexOf("MSIE ");

			    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))

			    	$('html').addClass('ie');

			}();
			
			var MOZ = function(){
				console.log($.browser)
				if($.browser.mozilla )
					$('html').addClass('mozilla');
				
			}();
			
		},


		getPageInfo : function(){

			return $.IGRP.info.page+'.'+$.IGRP.info.app;

		},

		scrollTo:function(name){
			
			console.log(name);
			
		},

		config:function(){

			var app  = $('body').attr('app'),

				page = $('body').attr('page');

			$.IGRP.info.app = app || null;

			$.IGRP.info.page = page ? page.replaceAll(' ','_') : null;

			$.IGRP.info.params = $.IGRP.utils.url.getParams();

			$(window).resize(function(){

				$.IGRP.events.execute('windowResize');

				$.IGRP.screen.check();

			});

			$.IGRP.checkBrowser();

			$.IGRP.screen.check();
			
		},
		
		init:function( ){

			$.IGRP._init = true;
			
			$.IGRP.config();
			
			$.IGRP.events.execute('init', $.IGRP);

			setTimeout(function(){

				$('html').addClass('ready');

				$('body').removeClass('loading');

			},25)

			

		}

	};
	
	$.IGRP.on = $.IGRP.events.on;
	

})();