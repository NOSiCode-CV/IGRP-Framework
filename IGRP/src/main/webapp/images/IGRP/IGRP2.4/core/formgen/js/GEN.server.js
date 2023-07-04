$(function() {

	'use strict';

	var GEN = VARS.getGen(),

		genOptions = GEN.params && GEN.params.server ? GEN.params.server : {},

		server = GEN.server = {},

		codeChecked = false,

		clicked = {},

		reservedAreas = {
			java : {
				controller : {
					'packages_import' : {
						code : ''
					},

					'index' : {
						code : ''
					},

					'custom_actions' : {
						code : ''
					}
				}
			}
		},

		reservedExceptions = {

		};

	server.activeMenu = {};

	server.preserved = {};

	server.editors = {};

	server.events = new $.EVENTS([ 'init' ]);

	server.set = function(p) {

		var options = genOptions[p.mode];

		if (options) {

			DrawMenu(p.mode, options);

			ActivateMenu($('.gen-editor-toolsbar .server-transform').first(), {
				transform : true,
				callback : function(){
					
					if(p  && p.callback){
						
						p.callback();
					}
					

					
				}
			});

		}

	};

	server.transform = function(o) {

		var xmlStr = GEN.getXML(),

			xml = $.parseXML(xmlStr),

			isIE = window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i) ? true : false,

			enterParam = '$$enter$$',

			xslParams = isIE ? {
				
				jsEnter : enterParam
				
			} : false,

			m = clicked,

			type = o.type || 'gen';

		GEN.waiting();

		$('<div/>').XMLTransform({
			xml : xml,
			xsl : o.basePath + '/' + o.xsl,
			xslParams : xslParams,
			xslBasePath : o.basePath,

			complete : function(d, e) {

				var content = d.html(),

					onFinish = function(ncontent) {

						server.events.execute(o.mode + '.' + o.part + '.gen', {
							
							content : content,
							
							options : o
							
						});

						if (o.callback)

							o.callback(ncontent);

						$('.gen-viewers-toolbar .gen-page-setts-ctrl').show();
						//$('#gen-page-setts-ctrl').show();

						setTimeout(function() {

							GEN.resizeCodeMirrorArea();
								
							GEN.done();

						}, 100);

					};

				content = content.replaceAll('&lt;', '<');

				content = content.replaceAll('&gt;', '>');

				content = content.replaceAll('&amp;', '&');

				content = content.replaceAll(enterParam, '\n');
				
				if(o.part == 'controller'){

					//GetBlocklyActionsCode(function(blocklyCodes){
						
						LoadReservedCodes(content, type, onFinish)
						
					
					//})
					
					
					/*LoadReservedCodes(content, type, function(ncontent){
						
						onFinish(ncontent);
						
						
					});*/
					
				}else
					
					onFinish( content );
					
				//if(.o.xsl.)
				//onFinish( content );
				
				//LoadReservedCodes(content, type, onFinish);

			},

			error : function(e) {
				console.log(e);
			}
		});

	};

	server.compile = function(o) {

		var mode = genOptions[o.mode];
		
		GenPartsLoop({
			
			mode : mode,

			callback : function(res) {

				console.log(res)

				if (o.then)

					o.then(res);

			}
		});

	};

	var DeactivateMenus = function() {

		$('.server-transform').removeClass('active');

	};

	var ActivateMenu = function(menu, transformOptions) {

		var options = GetMenuOptions(menu);

		var editor = server.editors[options.mode][options.part.toUpperCase()];

		var toptions = transformOptions || {};

		var tcallback = toptions.callback ? toptions.callback : function() {};

		clicked = {
			mode : options.mode,
			part : options.part
		};

		options.callback = function(content) {

			editor.setValue(content);

			if (tcallback)

				tcallback();

			DeactivateMenus();

			menu.addClass('active');

			server.activeMenu = {
					
				mode : options.mode,

				part : options.part,

				editor : editor
			};

			$('.server-editor').removeClass('active');

			$('.server-editor.' + options.mode + '-editor.' + options.part.toUpperCase()).addClass('active');

			editor.refresh();

			editor.focus();

		};

		if (toptions.transform)
			server.transform(options);
		else if (toptions.content)
			options.callback(toptions.content);


	};

	var SetEditor = function(mode, name) {

		var editorsWrapper = $('#gen-' + mode + ' .gen-editors-wrapper'),

			partEditor = $('<div class="gen-code-mirror server-editor ' + mode + '-editor ' + name + ' col-sm-10 custom-size " editor-part="' + name.toLowerCase() + '"></div>');

		editorsWrapper.append(partEditor);

		switch (mode) {

		case 'java':

			server.editors[mode][name] = CodeMirror(partEditor[0], {
				lineNumbers : true,
				matchBrackets : true,
				autoCloseBrackets : true,
				mode : "text/x-java",
				extraKeys : {
					"Ctrl-Space" : "autocomplete"
				},
				
				autohint : true,
				lineWrapping : true,
				lint:true,
				keyMap: "sublime",
				 extraKeys: {
					 "F11": function(cm) {
				          cm.setOption("fullScreen", !cm.getOption("fullScreen"));
				        },
				        "Esc": function(cm) {
				          if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
				        },
					 "Ctrl-Q": function(cm){ cm.foldCode(cm.getCursor()); }},
				 foldGutter: true,
				 gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter","CodeMirror-lint-markers"]				
				
			});
			
			 setTimeout(function() {
				 server.editors[mode][name].foldCode(CodeMirror.Pos(0, 0));
			 },50);
			break;

		case 'plsql':
			server.editors[mode][name] = CodeMirror(partEditor[0], {
				mode : 'text/x-plsql',
				readOnly : true,
				lineNumbers : false,
				matchBrackets : true,
				hintOptions : {
					tables : {
						users : {
							name : null,
							score : null,
							birthDate : null
						},
						countries : {
							name : null,
							population : null,
							size : null
						}
					}
				}
			});
			break;

		}

		SetEditorEvents(server.editors[mode][name], mode);

		server.editors[mode][name].refresh();

		server.editors[mode][name].focus();

	};

	var GetEditor = function(mode, name) {

		return server.editors[mode][name];

	};

	var storeExceptions = function(content, o) {

		var commentStart = '/*----',

			startExp = commentStart + '#START-PRESERVED-AREA(',

			declaration = 'public Response action' + capitalizeFirstLetter(o.name) + '() throws ',

			split = content.split(declaration),

			exceptionsRow = split[1] || false;

	/*if(exceptionsRow){
		
		var exContent = exceptionsRow.split(startExp)[0].replace('{','');

		if(o.field && o.field.server){

			if(o.field.server.preserved[o.mode][o.part])

				o.field.server.preserved[o.mode][o.part].exceptions = exContent;
			
		}else{

			if(reservedAreas[o.mode] && reservedAreas[o.mode][o.part] && reservedAreas[o.mode][o.part][o.name.toUpperCase()])

				reservedAreas[o.mode][o.part][o.name.toUpperCase()].exceptions = exContent;

		}

	}*/
	}

	var SetEditorEvents = function(editor, mode) {

		var writing = false,

			ctrl = editor.on('blur', function(cm, change) {

				var m = server.activeMenu,

					content = editor.getValue(),

					commentStart = '/*----',

					commentEnd = '----*/',

					startExp = commentStart + '#start-code(',

					endExp = commentStart + '#end-code' + commentEnd,

					startIDX = getIndicesOf(startExp, content),

					endIDX = getIndicesOf(endExp, content),

					reserved = reservedAreas[m.mode] && reservedAreas[m.mode][m.part] ? reservedAreas[m.mode][m.part] : {};

				if (startIDX.length == endIDX.length) {

					startIDX.forEach(function(sidx, i) {

						var eidx = endIDX[i],

							partContent = content.substring(sidx, eidx + endExp.length),

							nameStartIdx = partContent.indexOf(startExp),

							nameEndIdx = partContent.indexOf(')' + commentEnd),

							name = partContent.substring(nameStartIdx + startExp.length, nameEndIdx),

							_name = name.toLowerCase(),

							field = GEN.getFieldByTag(_name),

							codeHead = startExp + name + ')' + commentEnd,

							codeContent = partContent.replaceAll(codeHead, '').replaceAll(endExp, '');

						if (field) {

							/*storeExceptions(content,{
								field   : field,
								name    : _name,
								mode    : m.mode,
								part 	: m.part
							});*/

							if (field.server.preserved[m.mode] && field.server.preserved[m.mode][m.part])

								field.server.preserved[m.mode][m.part].code = codeContent;




						} else {

							/*storeExceptions(content,{
								name    : _name,
								mode    : m.mode,
								part 	: m.part
							});*/

							if (reserved[name])

								reserved[name].code = codeContent;

						}

					});

				}
				;

			});

		editor.on('beforeChange', function(cm, change) {

			if (writing) {

				var start = '/*----#start-code(',

					end = '/*----#end-code----*/',

					lines = getPreservedLines(),

					isPreservedInit = editor.getLine(change.from.line).indexOf(start) != -1;

				if (!isPreservedInit) {

					if (lines) {

						var isReservedArea = false;

						for (var x = 0; x < lines.start.length; x++) {

							for (var i = lines.start[x]; i <= lines.end[x]; i++) {

								if (change.from.line == i - 1)

									isReservedArea = true;
							}

						}

						if (!isReservedArea)

							change.cancel();

					}

				} else {

					change.cancel();

				}


			} else {

				if (cm.getValue() && change.origin != 'setValue')

					change.cancel();

			}

			var lineNum = change.from.line + 1,

				line = $(editor.display.wrapper).find('.CodeMirror-linenumber:contains(' + lineNum + ')');

			if (line.parent().hasClass('has-error')) {

				line.parent().removeClass('has-error');

				$('.gen-editor-errors table tr[line="' + lineNum + '"]').remove();

				setTimeout(function() {

					if (!$('.gen-editor-errors table tr')[0] || !$('.CodeMirror-gutter-wrapper.has-error')[0])

						GEN.removeEditorsErrors(true);


				}, 50)

			}


		});

		editor.on('keydown', function(cm, e) {

			writing = true;

		});

		editor.on('keyup', function(cm, e) {

			writing = false;

			//autocomplete on dot. press

			if (e.keyCode == 190 && (!cm.state.completionActive && e.keyCode != 13)) {
				try {
					CodeMirror.commands.autocomplete(cm, null, {
						completeSingle : false
					});
				} catch (err) {}
			}



		});

	};

	var DrawMenu = function(mode, options) {

		var packName = capitalizeFirstLetter(GEN.SETTINGS.html),

			menusWrapper = $('#gen-' + mode + ' .gen-editor-toolsbar'),

			list = $('<div class="list-group"/>');

		if (!server.editors[mode])

			server.editors[mode] = {};

		options.codes.forEach(function(c) {

			var fileName = packName + capitalizeFirstLetter(c.name.toLowerCase());

			list.append(

				'<div file-name="' + fileName + '.java" base-path="' + options.basePath + '" mode="' + mode + '" part="' + c.name.toLowerCase() + '" class="list-group-item server-transform" xslt-path="' + c.xsl + '">' + fileName + '</div>'

			);

			if (!server.editors[mode][c.name]) {

				SetEditor(mode, c.name);
			}

		});

		menusWrapper.html(list);

	};

	var GetMenuOptions = function(menu) {

		var mode = menu.attr('mode'),

			part = menu.attr('part'),

			base = menu.attr('base-path'),

			xsl = menu.attr('xslt-path');

		return {
			mode : mode,
			xsl : xsl,
			part : part,
			basePath : base,
			menu : menu
		}

	};

	var GenPartsLoop = function(o) {

		var idx = o.index || 0;

		if (idx < o.mode.codes.length) {

			var code = o.mode.codes[idx];
			
			
			server.transform({
				
				basePath : o.mode.basePath,

				xsl : code.xsl,
				
				part : code.name.toLowerCase(),

				type : 'compile',

				callback : function(content) {

					GenPartsLoop.arr.push({
						
						name : code.name,

						code : content
						
					});

					o.index = idx + 1;

					GenPartsLoop(o);


				}
			});

		} else {

			if (o.callback)

				o.callback(GenPartsLoop.arr);

			GenPartsLoop.arr = [];

		}
		;

	};

	var replaceReservedContents = function(o) {
		
		var options = $.extend({
			
				content : '',

				begin : {
					startExpression : '/*----#start-code(',

					endExpression : ')----*/',
				},

				end : {
					expression : '/*----#end-code----*/'
				},

				serverJSON : {},

				returner : {},

				mode : 'java',

				part : 'controller',

				index : 0
			}, o),

			idx = options.index || 0,

			content = options.content,

			begins = getIndicesOf(options.begin.startExpression, content),

			ends = getIndicesOf(options.end.expression, content);


		if (idx < begins.length) {

			var localR = reservedAreas[options.mode] && reservedAreas[options.mode][options.part] ? reservedAreas[options.mode][options.part] : false;

			//console.log( localR )

			if (begins.length == ends.length) {

				var beginIdx = begins[idx],

					endIdx = ends[idx] + options.end.expression.length,

					expression = content.substring(beginIdx, endIdx),

					areaName = expression.match(/\(([^)]+)\)/)[1],

					startCodeXp = options.begin.startExpression + areaName + options.begin.endExpression,

					field = GEN.getFieldByTag(areaName.toLowerCase()),
					
					serverCode = options.serverJSON != null ? (options.serverJSON[areaName] ? options.serverJSON[areaName].content : ""):"",				
			
					localCode = localR[areaName] ? localR[areaName].code : "",

					reservedCode = localCode || serverCode,

					tab = areaName != 'packages_import' ? '\t\t' : '';

				if (field) {

					if (field.server.preserved[options.mode] && field.server.preserved[options.mode][options.part] && field.server.preserved[options.mode][options.part].code != '') {

						reservedCode = field.server.preserved[options.mode][options.part].code

					} else {

						field.server.preserved[options.mode] = field.server.preserved[options.mode] || {};

						field.server.preserved[options.mode][options.part] = field.server.preserved[options.mode][options.part] || {
							code : reservedCode
						}

					}
				}
				

				var xslBlock = content.substring(beginIdx, endIdx),

					xslContent = xslBlock.substring(xslBlock.indexOf(startCodeXp) + startCodeXp.length, xslBlock.indexOf(options.end.expression)),
					
					blocklyContents = options.blockly || {},
					
					areaBlockly     = blocklyContents[areaName] || '';
				
				reservedCode = reservedCode || xslContent || '\n\t\t\n\t\t\n' + tab;

				var originalContent = content.substring(beginIdx, endIdx),

					actualContent = startCodeXp + reservedCode + options.end.expression;

				options.returner[areaName] = {
						
					original : originalContent,

					content : actualContent
				};

			}
		
			//$('#igrp-form-gen').trigger('')
			
			options.index = idx + 1;

			replaceReservedContents(options);

		} else {

			for (var a in options.returner) {

				var contents = options.returner[a];

				content = content.replaceAll(contents.original, contents.content);

			};

			if (options.callback)

				options.callback(content);
			
			//console.log(content)

		};

	};

	var LoadReservedCodes = function(content, type, callback) {
		

		var reservedURL = GEN.UTILS.preserve_url,

			data = {
				app : GEN.DETAILS.app,

				page : GEN.DETAILS.page
			},

			mode = clicked.mode,

			part = clicked.part,

			beginStartExpression = '/*----#start-code(',

			beginEndExpression = ')----*/',

			endExpression = '/*----#end-code----*/',

			localReserved = reservedAreas[mode] && reservedAreas[mode][part] ? reservedAreas[mode][part] : false,

			replaceOptions = {
					
				content : content,

				serverJSON : null,

				mode : mode,

				part : part,
				
				//blockly : blocklyCodes,

				callback : function(content) {

					if (callback)

						callback(content);

					codeChecked = true;

				}
			};

			
		if (part != 'controller' && part != undefined) {

//			replaceReservedContents(replaceOptions);
			replaceOptions.callback(content);

			$.IGRP.components.globalModal.hide();

			GEN.waiting(false);

			return;

		}else if(localReserved && localReserved['index'] && localReserved['index']['code']!=""){
			
			
			replaceReservedContents(replaceOptions);
			
			$.IGRP.components.globalModal.hide();

			GEN.waiting(false);

			return;
		}
		
		$.get(reservedURL, data).then(function(json) {

			var isGlobalPreservation = false;

			if ($.isArray(json) && json[0]) {

				var object = {};

				isGlobalPreservation = json[0].isGlobal;

				json.forEach(function(item) {

					object[item.action.toLowerCase()] = {
						content : item.content,
						end : item.end,
						start : item.start,
						global : item.isGlobal
					}
				});

				json = object;
				
				replaceOptions.serverJSON = json;
				

			}
//			else{
//				console.log("$('.form-gen-save .fa-cog').HIDDEN");
//					$('.form-gen-save .fa-cog').addClass("hidden");   
//						return;			
//				
//			};

			if (isGlobalPreservation && !codeChecked) {

				$.IGRP.components.globalModal.set({
					rel : 'confirm-java-code',
					content : 'Please check your Controller Code!',
					buttons : [
						{
							class : 'default',
							//icon  :'times',
							text : 'Cancel',
							attr : {
								"data-dismiss" : "modal"
							},
							onClick : function() {
								GEN.waiting(false);
							}
						},
						{
							class : 'primary',
							//icon    :'check',              
							text : 'Check Code',
							onClick : function(e) {

								if (type == 'compile') {

									var options = genOptions['java'];

									if (options) {

										DrawMenu('java', options);

										replaceOptions.callback = function(content) {

											var ctrl = $('#gen-views-ctrl ul li[rel="gen-java"]'),
												rel = ctrl.attr('rel'),
												viewr = $('#' + rel);

											ActivateMenu($('.gen-editor-toolsbar .server-transform').first(), {
												transform : false,
												content : content,
												callback : function() {

													$(VARS.html.viewers).removeClass('active');

													$(VARS.html.viewsController).removeClass('active');

													ctrl.addClass('active');

													viewr.addClass('active');

													if (rel != 'gen-design')
														$.IGRP.components.sideBar.hide();
													else
														$.IGRP.components.sideBar.show();

													$('body').attr('view', rel);

													codeChecked = true;
												}
											});
										}
									}
								}

								replaceReservedContents(replaceOptions);

								$.IGRP.components.globalModal.hide();

								GEN.waiting(false);

								return false;
							}
						}

					]
				});


			} else {
				
				
				replaceReservedContents(replaceOptions);

			}

		});

	};

	var LoadPreservedCodes = function(content, callback) {

		var beginExp = '/*----#START-PRESERVED-AREA(';

		var endExp = '/*----#END-PRESERVED-AREA----*/';

		var begin = getIndicesOf(beginExp, content);

		var end = getIndicesOf(endExp, content);

		if (begin[0] && end[0]) {

			var canPreserve = begin.length == end.length;

			if (canPreserve && begin[0] && end[0]) {

				preserveArea(begin, {
					
					beginExp : beginExp,

					endExp : endExp,

					content : content,

					end : end,

					callback : function(r) {

						console.log(r);

						var m = clicked;

						r.forEach(function(o) {

							var text = o.text;

							if (reservedAreas[m.mode] && reservedAreas[m.mode][m.part] && reservedAreas[m.mode][m.part][o.areaName]) {

								var reserved = reservedAreas[m.mode][m.part][o.areaName].code;

								if (reserved != '')

									content = content.replaceAll(o.originalContent, reserved);else {

									if (text != '') {

										content = content.replaceAll(o.originalContent, text);

										reservedAreas[m.mode][m.part][o.areaName].code = text;

									}

								}

							} else {

								var tag = o.areaName.toLowerCase(),

									field = GEN.getFieldByTag(tag);

								if (field) {

									if (field.server.preserved[m.mode] && field.server.preserved[m.mode][m.part] && field.server.preserved[m.mode][m.part].code != '') {

										var val = field.server.preserved[m.mode][m.part].code;

										content = content.replaceAll(o.originalContent, val);

									} else {

										if (text != '')

											content = content.replaceAll(o.originalContent, text);

										field.server.preserved[m.mode] = field.server.preserved[m.mode] || {};

										field.server.preserved[m.mode][m.part] = field.server.preserved[m.mode][m.part] || {
											code : text
										}

									}
								}

							}

							content = content.replaceAll(o.urlExpression, '');

						});

						callback(content);

					}
				});

			}

		} else {

			callback(content);

		}

	};

	var LoadExceptions = function(content, callback) {

		var expStart = '/*----#EXECEP(',

			expEnd = ')EXECEP#----*/',

			sidx = getIndicesOf(expStart, content),

			eidx = getIndicesOf(expEnd, content);

		if (sidx.length == eidx.length) {

			preserveExceptions(content, {
				starts : {
					expression : expStart,

					group : sidx
				},

				ends : {
					expression : expEnd,

					group : eidx
				},

				callback : callback
			});

		}

	};

	var getPreservedLines = function(change) {

		var start = '/*----#start-code(',

			end = '/*----#end-code----*/',

			res = [],

			arrSt = [],

			arrEd = [],

			active = clicked,

			editor = server.editors[active.mode][active.part.toUpperCase()];

		if (editor.lineCount() > 1) {

			editor.eachLine(function(e, i) {

				if (e.text.indexOf(start) >= 0) {

					arrSt.push(e.lineNo() + 1);

				}


				if (e.text.indexOf(end) >= 0)

					arrEd.push(e.lineNo());


			});


			return {
				start : arrSt,
				end : arrEd
			}

		}

	};

	var preserveExceptions = function(content, o) {

		var idx = o.index || 0,

			defaultExcp = 'throws IOException, IllegalArgumentException, IllegalAccessException',

			mainExpressionStart = '/*----#EXECEP(',

			afterName = ')EXECEP#----*/',

			mainExpressionEnd = ',' + defaultExcp + ',';

		if (idx < o.starts.group.length) {

			var startIdx = o.starts.group[idx],

				endIdx = o.ends.group[idx],

				innerContent = content.substring(startIdx, endIdx + o.ends.expression.length),

				urlSubStart = innerContent.indexOf(mainExpressionStart),

				urlSubEnd = innerContent.indexOf(mainExpressionEnd),

				url = innerContent.substring(urlSubStart + mainExpressionStart.length, urlSubEnd),

				urlIndx = innerContent.indexOf(url),

				beforeName = mainExpressionStart + url + ',' + defaultExcp + ',',

				startExceptionIdx = innerContent.indexOf(beforeName),

				endExceptionIdx = innerContent.indexOf(afterName),

				itemName = innerContent.substring(startExceptionIdx + beforeName.length, endExceptionIdx),

				expression = mainExpressionStart + url + mainExpressionEnd;


			o.index = idx + 1;
			


			$.ajax({
				url : url
			})
				.done(function(d) {

					var xml = $(d),

						text = xml.find('your_code').text() || defaultExcp;

					preserveExceptions.returner.push({
						name : itemName.toLowerCase(),
						expression : innerContent,
						text : text
					});

				})
				.fail(function() {

					alert('error: ' + expression);

					preserveExceptions.returner.push({
						expression : expression,
						text : defaultExcp
					});

				})
				.always(function() {

					o.index = idx + 1;

					preserveExceptions(content, o);

				});


		} else {

			if (o.callback)

				o.callback(preserveExceptions.returner);

			preserveExceptions.returner = [];

		}
	}

	preserveExceptions.returner = [];

	var preserveArea = function(array, p) {

		var idx = p.idx ? p.idx : 0;
		//var isIE = window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i) ? true : false;
		var beginExp = p.beginExp;

		var endExp = p.endExp;

		var startUrlExp = '/*----#gen(';

		var endUrlExp = ')/#----*/';

		var _endComment = '----*/';

		if (idx < array.length) {

			var item = array[idx];

			var endItem = p.end[idx] + endExp.length;

			var expression = p.content.substring(item, endItem);

			var areaName = expression.match(/\(([^)]+)\)/)[1];

			var areaReplaceble = areaName + ')' + _endComment;

			beginExp = beginExp.replace(areaName + ')' + _endComment, _endComment);

			var originalContent = expression.substring(beginExp.length, expression.length - endExp.length);

			var startUrl = getIndicesOf(startUrlExp, expression)[0];

			var endUrl = getIndicesOf(endUrlExp, expression)[0];

			var urlExpression = expression.substring(startUrl, endUrl + endUrlExp.length);

			var urlContent = expression.substring(startUrl, endUrl).split(',');

			var url = urlContent[1];

			originalContent = originalContent.replace(areaReplaceble, '');

			console.log(url);
			
			$.ajax({
				url : url
			})
				.done(function(d) {

					var xml = $(d);

					var text = xml.find('your_code').text();

					preserveArea.returnObject.push({
						areaName : areaName,
						originalContent : originalContent,
						expression : expression,
						urlExpression : urlExpression,
						text : text
					});
				})
				.fail(function() {
					alert('error: ' + urlContent[1]);
					preserveArea.returnObject.push({
						areaName : areaName,
						originalContent : originalContent,
						expression : expression,
						urlExpression : urlExpression,
						text : ''
					});
				})
				.always(function() {
					p.idx = idx + 1;
					preserveArea(array, p)
				});

		} else {

			if (p.callback)
				p.callback(preserveArea.returnObject);

			preserveArea.returnObject = [];

		}

	};

	preserveArea.returnObject = [];

	GenPartsLoop.arr = [];

	var Events = function() {

		$('.gen-editor-toolsbar').on('click', '.server-transform', function() {

			ActivateMenu($(this), {
				transform : true
			});

		});

		if (genOptions) {

			for (var o in genOptions) {

				var option = genOptions[o];

				if (option.codes) {

					option.codes.forEach(function(c) {

						server.events.declare([ o + '.' + c.name.toLowerCase() + '.gen' ]);

					})

				}

			}
		}

	}();

})