$(function(){
	'use strict';

	var GEN    	   = VARS.getGen(),

		genOptions = GEN.params && GEN.params.server ? GEN.params.server : {},

		server 	   = GEN.server = {};

	server.activeMenu = {};

	server.preserved  = {};

	server.editors    = {};

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

				var content  = d.html(),
 
					onFinish = function(ncontent){

						if(o.callback)

							o.callback(ncontent);

						$('#gen-page-setts-ctrl').show();

						GEN.done();

					};

				content = content.replaceAll('&lt;','<');

				content = content.replaceAll('&gt;','>');

				content = content.replaceAll('&amp;','&');
				
				LoadPreservedCodes( content, onFinish);
				
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

	var LoadPreservedCodes = function(content, callback){

		//var beginExp = '/*----#START-PRESERVED-AREA----*/';

		//var endExp   = '/*----#END-PRESERVED-AREA----*/';

		var beginExp = '/*----#START-PRESERVED-AREA(';

		var endExp   = '/*----#END-PRESERVED-AREA----*/';

		var begin = getIndicesOf(beginExp, content);

		var end  = getIndicesOf(endExp, content);

		if(begin[0] && end[0]){

			var canPreserve = begin.length == end.length;

			if(canPreserve && begin[0] && end[0]){

				preserveArea(begin,{
					
					beginExp : beginExp,
					
					endExp   : endExp,

					content :content,

					end     :end,

					callback:function(r){

						r.forEach(function(o){
							
							if(server.preserved && server.preserved.java && server.preserved.java.controller && server.preserved.java.controller[o.areaName]){
								
								var val = server.preserved.java.controller[o.areaName];

								content = content.replaceAll(o.originalContent,val);

							}else{	
							
								var text = $.trim(o.text);

								if(text != '')

									content = content.replaceAll(o.originalContent,'\n\n'+$.trim(o.text));

								content = content.replaceAll(o.urlExpression,'');

								setTimeout(function(){

									var m = server.activeMenu;

									if(!server.preserved[m.mode])

										server.preserved[m.mode] = {};

									if(!server.preserved[m.mode][m.part])
										
										server.preserved[m.mode][m.part] = {};

									server.preserved[m.mode][m.part][o.areaName] = o.text;

								},50)
							}
							
							//if(server.preserved)
							
							/*var text = $.trim(o.text);

							if(text != '')

								content = content.replaceAll(o.originalContent,'\n\n'+$.trim(o.text));

							content = content.replaceAll(o.urlExpression,'');

							setTimeout(function(){

								var m = server.activeMenu;

								if(!server.preserved[m.mode])

									server.preserved[m.mode] = {};

								if(!server.preserved[m.mode][m.part])
									
									server.preserved[m.mode][m.part] = {};

								server.preserved[m.mode][m.part][o.areaName] = o.text;

							},50)*/

						});

						callback(content);
						
					}

				});

			}

		}else{
			
			callback(content);

		}

	};

	var DeactivateMenus = function(){

		$('.server-transform').removeClass('active');

	};

	var ActivateMenu = function(menu,callback){

		var options = GetMenuOptions( menu );

		var editor  = server.editors[options.mode][options.part.toUpperCase()];
		
		options.callback = function(content){

			editor.setValue(content);

			if(callback)

				callback();

			DeactivateMenus();

			menu.addClass('active');

			server.activeMenu = {

				mode : options.mode,

				part : options.part

			};

			$('.server-editor').removeClass('active');

			$('.server-editor.'+options.mode+'-editor.'+options.part.toUpperCase()).addClass('active');
			
			editor.refresh();

			editor.focus();

		};

		server.transform( options );

	};

	var SetEditor = function(mode,name){

		var editorsWrapper  = $('#gen-'+mode+' .gen-editors-wrapper'),

			partEditor 		= $('<div class="gen-code-mirror server-editor '+mode+'-editor '+name+' col-sm-10 custom-size "></div>');

		editorsWrapper.append( partEditor );

		switch(mode){

			case 'java':

				server.editors[mode][name] = CodeMirror(partEditor[0], {
			    	lineNumbers: true,
			   		matchBrackets: true,
			   		autoCloseBrackets: true,
			   		mode: "text/x-java",
			   		extraKeys: {
			   		 	"Ctrl-Space": "autocomplete"
			   		},
			   		autohint: true,
					lineWrapping: true
		        });

			break;

			case 'plsql':
				server.editors[mode][name] = CodeMirror(partEditor[0], {
		        	mode: 'text/x-plsql',
		        	readOnly:true,
				    lineNumbers: false,
				    matchBrackets : true,
				    hintOptions: {tables: {
				      users: {name: null, score: null, birthDate: null},
				      countries: {name: null, population: null, size: null}
				    }}
		        });
			break;

		}		

       	SetEditorEvents( server.editors[mode][name], mode );

        server.editors[mode][name].refresh();

   		server.editors[mode][name].focus();
	
	};
	
	var GetEditor = function(mode,name){

		return server.editors[mode][name];
	
	};

	var SetEditorEvents = function(editor,mode){
		
		editor.on('blur',function(){

			var m = server.activeMenu,

        		p = server.preserved;

        	if(p[m.mode] && p[m.mode][m.part]){

        		var keys 	 = Object.keys(p[m.mode][m.part]),

        			content  = editor.getValue(),

        			endIDX 	 = getIndicesOf('/*----#END-PRESERVED-AREA----*/',content);

        		keys.forEach(function(k,i){

        			var tag = k.toLowerCase();

        			var startExp = '/*----#START-PRESERVED-AREA('+k+')----*/';

        			var startIDX = getIndicesOf(startExp,content);

    				startIDX.forEach(function(si,x){

    					var ei = endIDX[i];

    					p[m.mode][m.part][k] = content.substring(si+startExp.length,ei);

    				});

        		});

        	};

		});

	};

	var DrawMenu = function(mode,options){

		var packName = capitalizeFirstLetter(GEN.SETTINGS.html),

			menusWrapper  	= $('#gen-'+mode+' .gen-editor-toolsbar'),

			list 	 		= $('<div class="list-group"/>');

		if(!server.editors[mode] )

			server.editors[mode] = {};

		options.codes.forEach(function(c){

			list.append(

				'<div base-path="'+options.basePath+'" mode="'+mode+'" part="'+c.name.toLowerCase()+'" class="list-group-item server-transform" xslt-path="'+c.xsl+'">'+packName+capitalizeFirstLetter(c.name.toLowerCase())+'</div>'
			
			);

			if(!server.editors[mode][c.name] ){

				SetEditor(mode,c.name);
			}

		});

		menusWrapper.html(list);

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

	var GenPartsLoop = function(o){

		var idx = o.index || 0;
	
		if(idx < o.mode.codes.length){
			
			var code = o.mode.codes[idx];

			server.transform({

				basePath : o.mode.basePath,

				xsl 	 : code.xsl,

				callback:function(content){

					GenPartsLoop.arr.push({

						name : code.name,

						code : content

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

	var Events = function(){

		$('.gen-editor-toolsbar').on('click','.server-transform',function(){
			
			ActivateMenu( $(this) );

		});

	}();

})

