/*SIDE CTRL*/


$.IGRP = {

	_init:false,

	events: new $.EVENTS(['windowResize','init']),
	
	components: {},

	store:{

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
	
	component:function(name,o,autoinit){
		
		var options = $.extend(true,{
			init:function(){}
		}, o);

		if(!$.IGRP.components[name]){
			
			$.IGRP.components[name] = options;

			if(autoinit){
				if($.IGRP._init)
					$.IGRP.components[name].init()
				else
					$.IGRP.on('init', function(){ $.IGRP.components[name].init() });
			}

			return $.IGRP.components[name];
		}
		else
			console.log('component already set');
	},

	notify:function(p){
		$.notify({
            message: p.message
        },{
            type: p.type
        });
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

	config:function(){
		$(window).resize(function(){
			$.IGRP.events.execute('windowResize');
		});
	},
	
	init:function(){
		$.IGRP._init = true;
		$.IGRP.config();
		$.IGRP.events.execute('init', $.IGRP);
	}

};

$.IGRP.on = $.IGRP.events.on;