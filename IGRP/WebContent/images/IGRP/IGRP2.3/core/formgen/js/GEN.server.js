$(function(){
	
	'use strict';

	var GEN    	   = VARS.getGen(),

		genOptions 	  = GEN.params && GEN.params.server ? GEN.params.server : {},

		server 	   	  = GEN.server = {},

		clicked 	  = {},

		reservedAreas = {

			java : {

				controller : {

					'PACKAGES_IMPORT' : {

						code : ''

					},

					'INDEX' : {

						code : ''

					},

					'CUSTOM_ACTIONS' : {

						code : ''

					}

				}

			}

		};

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

						//getPreservedLines( );

						//console.log(reservedAreas)

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

						console.log(r);
						
						var m = clicked;

						r.forEach(function(o){

							var text = $.trim(o.text);

							if( reservedAreas[m.mode] && reservedAreas[m.mode][m.part] && reservedAreas[m.mode][m.part][o.areaName] ){
								
								var reserved = reservedAreas[m.mode][m.part][o.areaName].code;

								if(reserved != '')
									
									content = content.replaceAll(o.originalContent,reserved);

								else{

									if(text!=''){
										
										content = content.replaceAll(o.originalContent,text);

									reservedAreas[m.mode][m.part][o.areaName].code = text;
									
									}
										
								}

							}else{
								
								var tag   = o.areaName.toLowerCase(),

									field = GEN.getFieldByTag(tag);

								if(field){
									
									if(field.server.preserved[m.mode] && field.server.preserved[m.mode][m.part] && field.server.preserved[m.mode][m.part].code != '' ){
										
										var val = field.server.preserved[m.mode][m.part].code;

										content = content.replaceAll(o.originalContent,val);
									
									}else{
										
										if(text != '')

											content = content.replaceAll(o.originalContent,text);
										
										field.server.preserved[m.mode] =field.server.preserved[m.mode] || {};

										field.server.preserved[m.mode][m.part] = field.server.preserved[m.mode][m.part] || {

											code : text

										}
										
									}
								}

							}

							content = content.replaceAll(o.urlExpression,'');

						});

						callback(content);
						
					}

				});

			}

		}else{
			
			callback(content);

		}

	};

	var readOnlyLines = function(o){

		console.log(i);

		var idx = o.index || 0;

		if(idx < o.start.length){

			console.log(o.start[idx])

			console.log(o.end[idx]);

			readOnlyLines

		}else{

			console.log('end')

		}

	}

	var getPreservedLines = function(change){

		var start  = '/*----#START-PRESERVED-AREA(',

			end    = '/*----#END-PRESERVED-AREA----*/',

			res    = [],

			arrSt  = [],

			arrEd  = [],

			active = clicked,

			editor = server.editors[active.mode][active.part.toUpperCase()];

		if(editor.lineCount() > 1){

			editor.eachLine(function(e,i){

				if(e.text.indexOf(start) >= 0)

					arrSt.push(e.lineNo());
				

				if(e.text.indexOf(end) >= 0)

					arrEd.push(e.lineNo());
				

			});

			/*readOnlyLines( {
				
				start : arrSt,

				end   : arrEd

			} )*/

			return {
				start : arrSt,
				end   : arrEd
			}

		}

	}	

	var DeactivateMenus = function(){

		$('.server-transform').removeClass('active');

	};

	var ActivateMenu = function(menu,callback){

		var options = GetMenuOptions( menu );

		var editor  = server.editors[options.mode][options.part.toUpperCase()];

		clicked = {
			mode : options.mode,
			part : options.part
		}
		
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
		
		var writing = false;

		editor.on('blur',function(){

			var m 		 	 = server.activeMenu,

				content      = editor.getValue(),

				commentStart = '/*----',

				commentEnd   = '----*/',

				startExp = commentStart+'#START-PRESERVED-AREA(',

				endExp   = commentStart+'#END-PRESERVED-AREA'+commentEnd,

				startIDX = getIndicesOf(startExp,content),

				endIDX 	 = getIndicesOf(endExp,content),

				reserved = reservedAreas[m.mode] && reservedAreas[m.mode][m.part] ? reservedAreas[m.mode][m.part] : {};

			if(startIDX.length == endIDX.length){

				startIDX.forEach(function(sidx,i){

					var eidx 	     = endIDX[i],

						partContent  = content.substring(sidx,eidx+endExp.length),

						nameStartIdx = partContent.indexOf(startExp),

						nameEndIdx 	 = partContent.indexOf(')'+commentEnd),

						name 		 = partContent.substring(nameStartIdx+startExp.length,nameEndIdx),

						field 		 = GEN.getFieldByTag(name.toLowerCase()),

						codeHead 	 =  startExp+name+')'+commentEnd,

						codeContent  = partContent.replaceAll(codeHead,'').replaceAll(endExp,'');

					if(field){

						if( field.server.preserved[m.mode] && field.server.preserved[m.mode][m.part] )

    						field.server.preserved[m.mode][m.part].code = codeContent;

					}else{

						var r = reserved[name];

						r.code = codeContent;

					}	

				});

			}

		});

		editor.on('blursssss',function(){

			var m 		 = server.activeMenu,

				content  = editor.getValue(),

				endIDX 	 = getIndicesOf('/*----#END-PRESERVED-AREA----*/',content),

				reserved = reservedAreas[m.mode] && reservedAreas[m.mode][m.part] ? reservedAreas[m.mode][m.part] : {};

			//set fields actions reserved
			GEN.getAllFieldsAndMenus().forEach(function(f,i){

				var tag 	 = f.GET.tag(),

					k   	 = tag.toUpperCase(),

					eIdx;

				if( !reserved[k] ){

					//console.log('Name: '+k);

					var startExp = '/*----#START-PRESERVED-AREA('+k+')----*/';

	        		var startIDX = getIndicesOf(startExp,content);

	        		startIDX.forEach(function(si,x){

	        			eIdx = i+2

    					var ei = endIDX[eIdx];
    			
    					if( f.server.preserved[m.mode] && f.server.preserved[m.mode][m.part] )

    						f.server.preserved[m.mode][m.part].code = $.trim(content.substring(si+startExp.length,ei));

    					endIDX[eIdx] = false;

    					console.log( $.trim(content.substring(si+startExp.length,ei)) )

    				});

				}else{
					console.log(k+' is a reserved name! please change your button name!');
				}

			});
			//set reseved actions		
			for(var a in reserved){

				var startExp = '/*----#START-PRESERVED-AREA('+a+')----*/';

        		var startIDX = getIndicesOf(startExp,content);

        		console.log('Name: '+a);

        		startIDX.forEach(function(si,x){

					var ei = endIDX[x];

					if(ei){

						var code = content.substring(si+startExp.length,ei);

						reserved[a].code = code;

						console.log( reserved[a].code )

					}

				});

			}

		});


		editor.on('beforeChange',function(cm,change){

			if(writing){

				var start = '/*----#START-PRESERVED-AREA(',

					end   = '/*----#END-PRESERVED-AREA----*/',

					lines = getPreservedLines();

				if(lines){
					
					var isReservedArea = false;

					for(var x = 0; x < lines.start.length; x++){
						
						for(var i = lines.start[x]; i <= lines.end[x]; i++){

							if(change.from.line == i)

								isReservedArea = true;
						}

					}

					if( !isReservedArea )

						change.cancel();

				}
			}

		});

		editor.on('keydown',function(cm,e){
			writing = true;
		});

		editor.on('keyup',function(cm,e){
			writing = false;
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

