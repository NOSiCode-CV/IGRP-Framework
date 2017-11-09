$(function(){
	'use strict';

	var GEN    = VARS.getGen(),

		genOptions = GEN.params && GEN.params.server ? GEN.params.server : {},

		server = GEN.server = {};

	server.set = function(p){

		var options 	= genOptions[p.mode];

		if(options){
			
			DrawMenu(p.mode,options);

			ActivateMenu( $('.gen-editor-toolsbar .server-transform').first(), p.callback );

		}

	};

	server.transform = function(o){

		var xmlStr    = GEN.getXML(),

			xml  	  = $.parseXML(xmlStr),

			isIE      = window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i) ? true : false,

			xslParams = isIE ? { jsEnter:enterParam } : false;

		GEN.waiting();
		
		$('<div/>').XMLTransform({
			xml         : xml,
			xsl         : o.basePath+'/'+o.xsl,
			xslParams   : xslParams,
			xslBasePath : o.basePath,
			
			complete    : function(d,e){

				GEN.done();

				if(o.callback)

					o.callback(d);

				$('#gen-page-setts-ctrl').show();
				
			},

			error:function(e){
				console.log(e);
			}
		});

	};

	server.compile = function(o){
		
		var mode = genOptions[o.mode];

		GenPartsLoop({

			mode : mode,

			callback : function(res){

				if(o.then)

					o.then(res);

			}

		});

	};

	var GenPartsLoop = function(o){

		var idx = o.index || 0;
	
		if(idx < o.mode.codes.length){
			
			var code = o.mode.codes[idx];

			server.transform({

				basePath : o.mode.basePath,

				xsl 	 : code.xsl,

				callback:function(d){

					GenPartsLoop.arr.push({

						name : code.name,

						code : d.html()

					});

					o.index = idx+1;

					GenPartsLoop(o);
				}

			});

		}else{

			if(o.callback)

				o.callback(GenPartsLoop.arr);
			
			GenPartsLoop.arr = [];

		}

	};

	GenPartsLoop.arr = [];

	var DeactivateMenus = function(){

		$('.server-transform').removeClass('active');

	};

	var ActivateMenu = function(menu,callback){

		var options = GetMenuOptions( menu );

		options.callback = function(d){

			var content = d.text();

			var editor  = GEN[options.mode+'Editor'] || GEN.plsqlEditor;

			editor.setValue(content);

			if(callback)

				callback();

			DeactivateMenus();

			menu.addClass('active');

		};

		server.transform( options );

	};

	var DrawMenu = function(mode,options){

		var packName = capitalizeFirstLetter(GEN.SETTINGS.html),

			wrapper  = $('#gen-'+mode+' .gen-editor-toolsbar'),

			list 	 = $('<div class="list-group"/>')

		options.codes.forEach(function(c){

			list.append(

				'<div base-path="'+options.basePath+'" mode="'+mode+'" part="'+c.name.toLowerCase()+'" class="list-group-item server-transform" xslt-path="'+c.xsl+'">'+packName+capitalizeFirstLetter(c.name.toLowerCase())+'</div>'
			
			);

		});

		wrapper.html(list);

	};

	var GetMenuOptions = function(menu){
		
		var mode = menu.attr('mode'),

			part = menu.attr('part'),

			base = menu.attr('base-path'),
			
			xsl  = menu.attr('xslt-path');

		return {
			mode 	 : mode,
			xsl  	 : xsl,
			part 	 : part,
			basePath : base,
			menu 	 : menu
		}

	};

	var Events = function(){

		$('.gen-editor-toolsbar').on('click','.server-transform',function(){
			
			ActivateMenu( $(this) );

		});

	}();

})

