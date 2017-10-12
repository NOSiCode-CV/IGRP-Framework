/*SIDE CTRL*/
(function(){

	$.IGRP = {

		_init:false,

		info : {

			page : null,

			app  : null

		},

		events: new $.EVENTS(['windowResize','init']),
		
		components: {},

		store:{

			list : function(){
				return localStorage;
			},

			set:function(o){
				if( Storage )
					localStorage.setItem(o.name, o.value);
			},

			unset:function(name){
				localStorage.removeItem(name);
			},

			get:function(name){
				var rtn = null;
				
				if( Storage )
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
				
				if(!com.init)
					com.init = function(){};

				if(!com.events)
					com.events = new $.EVENTS(['init']);


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
				return $.IGRP.components[name];
				console.log('component already set');
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
					dataType : options.dataType
				})
				.done(options.success)
				.fail(options.fail)
				.always(options.complete);

			return req;
			
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

<<<<<<< HEAD
=======
			$.IGRP.info.params = $.IGRP.utils.url.getParams();

			if( $.IGRP.info.params.ichange )

				$.IGRP.scrollTo( $.IGRP.info.params.ichange );

>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
			$(window).resize(function(){
				
				$.IGRP.events.execute('windowResize');

			});

			$('html').addClass('ready');

			$('body').removeClass('loading');
			
		},
		
		init:function(){

			$.IGRP._init = true;
			
			$.IGRP.config();
			
			$.IGRP.events.execute('init', $.IGRP);

		}

	};

	$.IGRP.on = $.IGRP.events.on;

})();