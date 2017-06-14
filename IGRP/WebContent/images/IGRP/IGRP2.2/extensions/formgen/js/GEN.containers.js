var CONTAINER = function(name,params){
	var container  = this;
	
	var FIELDS     = [];
	
	var GEN        = VARS.getGen();
	
	var XSL        = '';

	var XML        = '';

	var FIELDSINCR = {};
	
	var type = name;

	var tagChangeEvs = [], readyEvents = [], fieldSetEvents = [];
	
	var notEditableAttrs = {};

	container.autoTag = true;

	container.includes = [];

	container.canRecieveFields = true; //SET FALSE IF CONTAINER DOES NOT RECIEVE FIELDS

	container.receiving       = false;

	container.tranforming     = false;

	container.fieldValidation = true;


	container.fields          = true;

	container.groups          = false; 

	container.structure       = "";

	container.xml = {
		type        :'fields',
		fieldsLabel : true,
		fieldsValue : true,
		table       : false
	}

	container.options = {
		draw:{
			hidden:false
		}
	}

	container.proprieties = {
		title       : name,
		//autoTag     : true,
		tag         : '',
		hasTitle    : false,
		collapsible : true,
		type        : name,
	}

	container.fieldEditParams = {
		display:'inline',
		position: 'center right',
		element: '.'+VARS.class.fieldsHolder
	}

	container.fieldsOptions = {
		html :{ class:'gen-item' },
		clear:false,
	}
	/*objects to subscribe*/
	container.sortableOptions = {
		scroll: false,
		delay: 100,
		forcePlaceholderSize:true,
		containment: "parent",
		tolerance: "pointer",
		placeholder:VARS.class.sortablePlaceholder,
		helper:"clone",
	}

	container.removeField = function(id){
		
			var isCtxMenu = container.contextMenu && container.contextMenu.getField(id) ? true : false;
			var field     = isCtxMenu ? container.contextMenu.getField(id) : container.GET.field(id);

			container.beforeFieldRemove(id);

			if(field){
				if(confirm('Delete Field?')){
					var array = !isCtxMenu ? FIELDS : container.contextMenu.items;
					var idx = array.indexOf(field);

					if(idx > -1){
						container.onFieldRemove(field);
						if(container['on'+capitalizeFirstLetter(field.type)+'FieldRemove'])
							container['on'+capitalizeFirstLetter(field.type)+'FieldRemove'](field);
						
						array.splice(idx,1);
					}
					container.Transform();
				}
			}
			
			if(GEN.edit.object && field && field.id == GEN.edit.object.id)
				GEN.edit.hide();

	}

	container.setInclude = function(name){
		if(container.includes[0]){
			var found = false;
			for(var i = 0; i < container.includes.length; i++){
				if(container.includes[i] == name){
					found = true;
					break;
				}	
			}
			if(!found) container.includes.push(name);

		}else{
			container.includes.push(name);
		}
	}

	var setFilesIncludes = function(){

		var __setFile = function(type){
			container.includes[type].forEach(function(file){
				var rel  = file.relative == false ? false : true;
				var path = rel ?  container.folder+'/includes/'+file.path : file.path;
				
				GEN.includeToHead({
					type     : type,
					relative : file.relative,
					path     : path
				});
			});
		}
		
		if(container.includes && container.includes.css && container.includes.css[0])
			__setFile('css');
		if(container.includes && container.includes.js && container.includes.js[0])
			__setFile('js');
		
	}

	container.setIncludes = function(includes){
		includes.forEach(function(i){
			container.setInclude(i);
		});
	}

	container.getXSLIncludes = function(relative){
		
		var xslIncludes = container.includes.xsl ? container.includes.xsl : container.includes;
		//if(!container.includes.xsl);

		var rtn = "";
		var iPath = relative ? '../..' : path;

		var includes = [];
		var includesStr = "";
		
		var _setinclude = function(name){
			var href = "";
			
			href = name.path ? '/includes/xsl/'+name.path : 'IGRP-'+name+'.tmpl.xsl'; 

			var found = false;
			
			for(var z = 0; z < includes.length; z++){
				if(includes[z] == href){
					found = true;
					break;
				}
			}
			if(!found){
				includes.push(href);
				includesStr+='<xsl:include href="'+href+'?v='+_getDate()+'"/>';
			}


		}

		var checkTmpl = function(tmpl){
			if(includes[0]){
				var found = false;
				for(var i = 0; i < includes.length; i++){
					if(includes[i] == tmpl){
						found = true;
						break;
					}
				}
				if(!found) _setinclude(tmpl);
			}else{
				_setinclude(tmpl);
			}
		}
		//container Includes
		xslIncludes.forEach(function(tmpl){
			checkTmpl(tmpl);
		});
		//fields Includes
		container.GET.fields().forEach(function(f){
			if(f.includes){
				var fieldXSLInc = f.includes.xsl ? f.includes.xsl : f.includes;
				fieldXSLInc.forEach(function(fieldIncl){
					checkTmpl(fieldIncl);
				});
			}
		});
		//ctxMenu Includes
		if(container.contextMenu){
			container.contextMenu.items.forEach(function(ctx){
				if(ctx.includes){
					var ctxXSLInc = ctx.includes.xsl ? ctx.includes.xsl : ctx.includes;
					ctxXSLInc.forEach(function(fieldIncl){
						checkTmpl(fieldIncl);
					});
				}
			});
		}

		return {
			string : includesStr+GEN.getDefaultIncludesStr(),
			array  : includes
		};
	}
	/*container.getXSLIncludes = function(relative){
		
		var xslIncludes = container.includes.xsl ? container.includes.xsl : container.includes;
		//if(!container.includes.xsl);

		var rtn = "";
		var iPath = relative ? '../..' : path;

		var includes = [];
		var includesStr = "";
		
		var _setinclude = function(name){
			includes.push(name);
			includesStr+='<xsl:include href="'+iPath+'/xsl/tmpl/IGRP-'+name+'.tmpl.xsl?v='+_getDate()+'"/>';
		}
		//container Includes
		xslIncludes.forEach(function(tmpl){
			if(includes[0]){
				var found = false;
				for(var i = 0; i < includes.length; i++){
					if(includes[i] == tmpl){
						found = true;
						break;
					}
				}
				if(!found) _setinclude(tmpl);
			}else{
				_setinclude(tmpl);
			}
		});
		//fields Includes
		container.GET.fields().forEach(function(f){
			if(f.includes){
				var fieldXSLInc = f.includes.xsl ? f.includes.xsl : f.includes;

				fieldXSLInc.forEach(function(fieldIncl){
					if(includes[0]){
						var found = false;
						for(var i = 0; i < includes.length; i++){
							if(includes[i] == fieldIncl){
								found = true;
								break;
							}
						}
						if(!found) _setinclude(fieldIncl);
					}else{
						_setinclude(fieldIncl);
					}

				});
			}
		});
		//ctxMenu Includes
		if(container.contextMenu){
			container.contextMenu.items.forEach(function(ctx){
				if(ctx.includes){
					var ctxXSLInc = ctx.includes.xsl ? ctx.includes.xsl : ctx.includes;
					
					ctxXSLInc.forEach(function(fieldIncl){
						if(includes[0]){
							var found = false;
							for(var i = 0; i < includes.length; i++){
								if(includes[i] == fieldIncl){
									found = true;
									break;
								}
							}
							if(!found) _setinclude(fieldIncl);
						}else{
							_setinclude(fieldIncl);
						}

					});
				}
			});
		}
		
		return {
			string : includesStr+GEN.getDefaultIncludesStr(),
			array  : includes
		};
	}*/

	container.XSLT = function(template){
		var stylesheet;

		if(template){
			var includesStr = container.getXSLIncludes().string;
			var includes    = includesStr ? includesStr : "";

			stylesheet = $.parseXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
		  						'<xsl:output method="html" encoding="utf-8"/>'+
		  						'<xsl:template match="/">'+
		  							new XMLSerializer().serializeToString(template)+
		  						'</xsl:template>'+includes+'</xsl:stylesheet>');
		}
		return stylesheet;
	}

	var configFieldsHolder = function(contents){

	}

	var afterTransform = function(contents){

		container.holder.show();

		if      (container.dropZone[0])       setUpDropZone(contents);	
		else if (container.fieldsSelector[0]) setUpFieldsHolder(contents);
		//container has groups
		if(container.groups) setUpGroupFields();
		//form hidden config elements
		if(container.contextMenu) setUpContextMenuFields();
		//form hidden config elements
		
		if(container.fields) configSortable();

		configHiddenFields();

		//configFieldsHolder(contents);

		fieldsDrawEnd();
		
		container.onDrawEnd();

		//GEN.edit.hide();
		//console.log(container.GET.fields())
		
	}
	var fieldsDrawEnd = function(){
		container.GET.fields().forEach(function(f){
			f.onDrawEnd();
		});
	}

	var setUpGroupFields = function(){
		container.groups.configGroupItems();
		container.groups.configAdder();
		container.groups.setActive();

		FIELDS = container.groups.getFieldsByGroupOrder();

		$.each(container.groups.getGroupsContents(),function(i,groupContent){
			$(groupContent).attr('gen-id','group-contents');

			if(!$('.'+VARS.class.fieldsHolder,$(groupContent))[0])
				$(groupContent).addClass('no-fields');
			else
				$(groupContent).removeClass('no-fields');
		});
	}

	var setUpContextMenuFields = function(){
		var ctxHolder = $(container.contextMenu.holder,container.holder);
	
		ctxHolder.addClass(VARS.class.ctxMenu+' active');
		
		var startPos;
		
		ctxHolder.sortable({
			placeholder:'ctx-place-holder',
			containment:'parent',
			tolerance  :'pointer',
			scroll:false,
			items:container.contextMenu.menu.selector,
			start:function(e,ui){
				startPos = ui.item.index();
			},
			stop:function(e,ui){
				var endPos = ui.item.index();
				container.contextMenu.items.move(startPos,endPos);
				startPos = null;
			}
		})

		container.contextMenu.items.forEach(function(item,i){
			
			var itemHolder = $(ctxHolder.find(container.contextMenu.menu.selector)[i]);
			
			itemHolder.attr('parent-id',container.GET.id());
			itemHolder.attr('gen-field-id',item.GET.id());
			itemHolder.addClass(VARS.class.ctxMenuHolder);
			itemHolder.find(container.contextMenu.menu.label).attr('gen-lbl-setter','');
			
			item.holder = itemHolder;
			item.holder.append(container.getFieldEditOptions(item));

		});	
	}

	var setUpDropZone = function(contents){
		//template has drop zone declared inline
		var dz = container.dropZone[0];	

		var dropZone = $(contents.find('[gen-id="drop-zone"]')[container.dropZone.fieldsHolderIndex]);
		
		if(container.GET.fields()[0])
			dropZone.removeClass('no-fields')
		else
			dropZone.addClass('no-fields');

		var selector = dz.fieldSelector.selector;
		var label    = dz.fieldSelector.label;

		container.GET.fields().forEach(function(field,i){
			
			var fHolder = dropZone.find(selector);

			if(fHolder[0]){
				field.holder = $(fHolder[i]);
				
				field.holder.attr('parent-id',container.GET.id());
				field.holder.attr('gen-field-id',field.GET.id());

				if(label){
					var labelSetter = field.holder.find(label);
					labelSetter.attr(VARS.class.labelSetter,'');
					field.labelSetter = labelSetter;
				}

				field.holder.append(container.getFieldEditOptions(field));
			}
		});
	}

	var setUpFieldsHolder = function(contents){
		//template has [gen-field] declared (apply-templates case!)		
		if(!container.groups){
			
			if(container.GET.fields()[0])
				$(container.holder.find('[gen-fields]')[0]).removeClass('no-fields');
			else
				$(container.holder.find('[gen-fields]')[0]).addClass('no-fields');

		}
		
		//in apply templates Case: inform fields and label selector
		container.fieldsSelector.forEach(function(f,count){
			var fieldsHolder = contents.find(f.selector);
			
			if(fieldsHolder[0]){
				
				if(!fieldsHolder.hasClass(VARS.class.fieldsHolder))	
					fieldsHolder.addClass(VARS.class.fieldsHolder);

				fieldsHolder.attr('parent-id',container.GET.id());

				container.GET.fields().forEach(function(field,i){
					
					var fieldHolder = $(fieldsHolder[i]);
					
					fieldHolder.attr('gen-field-id',field.GET.id());
				
					if(field.GET.group) fieldHolder.attr('gen-group-id',field.GET.group());

					field.holder = fieldHolder;


					
					if(f.label){
						var labelSetter = fieldHolder.find(f.label);
						labelSetter.attr(VARS.class.labelSetter,'');
						field.labelSetter = labelSetter;
					}

					field.holder.append(container.getFieldEditOptions(field));
				
				});
			}
		});
	}

	var configHiddenFields = function(){
		var count = 0;
		var hiddenHolders = $('<div class="gen-hidden-holder"/>');
		//var appender = $('.box-content',container.holder)[0] ? $($('.box-content',container.holder)[0]) : $('.container-contents',container.holder);
		var appender = $('[gen-id="form-hidden"]',container.holder)[0] ? $('[gen-id="form-hidden"]',container.holder) : $('.box-content',container.holder)[0] ? $('.box-content',container.holder) : $('.container-contents',container.holder);

		container.GET.fields().forEach(function(f,i){
			if(f.hidden){
				var fHolder = $('<span tag="'+f.GET.tag()+'" class="'+VARS.class.fieldsHolder+'" gen-field-id="'+f.GET.id()+'" ></span>')
				fHolder.attr('parent-id',container.GET.id());

				f.holder = fHolder;
				f.holder.append(container.getFieldEditOptions(f));
				
				hiddenHolders.append(f.holder);
				count++;
			}
		});
		

		//console.log(appender)
		if(count) 
			if($('.box-collapser',container.holder)[0])
				hiddenHolders.insertBefore($('.box-collapser',container.holder));
			else
				appender.prepend(hiddenHolders);
	}

	var setUpHiddenFields = function(hiddenHolders){
		var fidx = 0;
		container.GET.fields().forEach(function(f){
			if(f.hidden){
				f.holder = $(hiddenHolders[fidx]);
				f.holder.attr('parent-id',container.GET.id());
				f.holder.attr('gen-field-id',f.GET.id());
				f.holder.addClass(VARS.class.fieldsHolder);
				f.holder.append(container.getFieldEditOptions(f));
				fidx=fidx+1
			}
		});
	}
	/*sortable*/
	var configSortable = function(){
		if(container.dropZone[0]){
			//HAS DROP ZONE
			var dropZone = $(container.holder.find('[gen-id="drop-zone"]')[container.dropZone.fieldsHolderIndex]);
			var items    = container.fieldsSelector[0].selector;
			
			setSortable(dropZone,items);

		}else if(container.fieldsSelector[0]){
			//HAS NO DROP ZONE
			container.fieldsSelector.forEach(function(fs,i){
				var holder = $(container.holder.find('[gen-fields]')[i]);
				
				var found = holder.find(fs.selector)[0] ? true : false;

				if(found){
					var dropZone = found ? holder.find(fs.selector).parent() :
								   holder;

					holder.find(fs.selector).addClass('gen-sortable-items');

					var items = !found ? fs.selector : '.gen-sortable-items';

					setSortable(dropZone,items);
				}
			});
		}
	}

	var setSortable = function(dropZone,items){
		var canDrop = false;
		
		dropZone.addClass('gen-sortable');

		$.each(dropZone,function(i,drpz){
			var dz = $(drpz);
			
			dz.sortable({
				scroll				 : false,
				delay 				 : 100,
				forcePlaceholderSize : true,
				//connectWith: '[gen-id="drop-zone"]',
				//containment 		 : "parent",
				//tolerance 			 : "pointer",//pointer
				tolerance 			 : container.sortableOptions.tolerance,
				items 				 : items,
				placeholder  		 : container.sortableOptions.placeholder,
				//axis: "x",
				helper : function(e,ui){
					return $('<div style="visibility:hidden!important;max-height:25px!important;max-width:20%" class="container-setted"/>')
				},
				over:function(e,ui){
					var name     	  = ui.item.attr('name'),
						isValid       = validField(name),
						isHidden      = name == 'hidden',
						_isContextMenu = isContextMenu(name);//container.contextMenu ? name == container.contextMenu.type : false;

					if(name && (!isValid || isHidden || _isContextMenu))
						ui.placeholder.hide();
					else
						container.holder.addClass('sorting');
				
				},
				receive:function(e,ui){
					var name     = ui.item.attr('name');
					var type     = ui.item.attr('type');
					var hasField = container.holder.find('.gen-fields-holder')[0];
					var position = !hasField ? 0 : ui.helper.index();

					//set position excluding non Fields
					var nonGenFields = $(e.target).find('>:not(.gen-fields-holder)');
					for(var nIdx = 0; nIdx < nonGenFields.length; nIdx++){
						var nf = $(nonGenFields[nIdx]);
						if(!nf.is(ui.helper))
							position--;
						else
							break;
					}

					if(container.groups){//set new position { count before groups items }
						if(hasField){
							var itemsParent = $(container.groups.contentsSelector,container.holder);
							var totalP = itemsParent.length;
							for(var i = 0; i < totalP; i++){
								if(!$(itemsParent[i]).is($(e.target)))
									position = position + $(itemsParent[i]).find('.'+VARS.class.fieldsHolder).length;
								else break;
							}	
						}
					}

					if(canDrop){
						var f = GEN.getDeclaredField(type);
						var field = new f.field(type,null);
						field.position = position;
						container.SET.fields([field]);
					}

					ui.helper.remove();
				},
				start:function(e,ui){
					
					var name  = ui.helper.attr('name');
					var type  = ui.helper.attr('type');
					canDrop   = name ? validField(name) : true;
				},
				out:function(){
					container.holder.removeClass('sorting');
				},
				stop: function(e,ui){
					//console.log('stop')
					if(!container.receiving && canDrop){
						var cArr = [];
						
						var fieldsHolder = container.holder.find('.gen-fields-holder');
						var fieldsHolderLength = fieldsHolder.length;

						if(fieldsHolderLength == FIELDS.length){
							if(container.groups){
								//reorder byGroups
								var count = 0;
								container.groups.items.forEach(function(g){
									var groupId = g.id;
									$.each(container.holder.find('.gen-fields-holder'),function(pos,fieldHolder){
										if($(fieldHolder).attr('gen-group-id') == groupId){
											var field_id = $(fieldHolder).attr('gen-field-id');
											var field    = container.GET.field(field_id);
											field.position = count;
											cArr[count]      = field;
											count++;
										}
									});
								});
							}else{
								var ctrl     = 0;
								var notHiddenFieldsArr = [];
								var hiddenFieldsArr    = [];

								$.each(container.holder.find('.gen-fields-holder'),function(pos,fieldHolder){
									var field_id = $(fieldHolder).attr('gen-field-id');
									var field    = container.GET.field(field_id);
									if(!field.hidden){
										field.position = ctrl;
										notHiddenFieldsArr[ctrl]      = field;
										ctrl++;
									}else{
										hiddenFieldsArr.push(field);
									}
								});
								cArr = notHiddenFieldsArr.concat(hiddenFieldsArr)
							}

							if(FIELDS.length == cArr.length){
								FIELDS = cArr;
								container.holder.find('.gen-fields-holder');
								
							}else{
								console.log(FIELDS);
								console.log('!=');
								console.log(cArr);
							}
						}
						//console.log(FIELDS)
						container.Transform();
					}
					container.holder.removeClass('sorting');
				}
			});
		})		
	}


	var setDropable = function(holder){//configure droppable element
		container.holder.droppable({ 
			accept: VARS.html.fields,
			drop: function(e,ui){
				
				var name = ui.draggable.attr('name');
				var type = ui.draggable.attr('type');
				var pos = 0;

				if(container.groups){
					var current = container.groups.getGroupContentActive();

					for(var i = 0; i < container.groups.getGroupsContents().length; i++){
						var gContent = $(container.groups.getGroupsContents()[i]);
						
						pos+=gContent.find('.'+VARS.class.fieldsHolder).length;
						
						if(gContent.is(current)) break;
					}
				}

				if(validField(name)){
					var f = GEN.getDeclaredField(name);
					var field = new f.field(type,null);
					
					if(pos >= 0) field.position = pos;

					if(f) container.SET.fields([field]);
				}

				container.holder.removeClass('sorting');
			}
		});
	}

	container.Transform = function(p){

		if(!container.receiving && !container.tranforming){

			var tXSL, tXML;
			
			try{
				tXSL    = container.XSLT(container.getXSL());
				tXML    = $.parseXML(GEN.getXML({
					containersIDs:[container.GET.id()]
				}));
			}catch(err){
				console.log(err);
			}
			
			
			console.log( $.parseXML(GEN.getXML()) );
			
			console.log(tXSL);

			if(tXML && tXSL){
				container.tranforming = true;

				container.holder.find('.container-contents').XMLTransform({
					xml     	 : tXML,
					xsl     	 : tXSL,
					loading      : false,
					loader  	 : container.holder.find('.c-holder-loading'),
					loadingClass : 'container-loading',
					complete	 : function(content){
						container.tranforming = false;						
						afterTransform(content);
						if(p && p.callback) p.callback();

					},
					error:function(e){
						container.tranforming = false;
						console.log('failed transformation');
						console.log(e);
					}
				});
			}
		}
	}
	//get indices of expression
	
	var GenVarsReplaceFromObjAttr = function(p){
		/*
			object
			begin
			end
			template
		*/
		var replaces = [];
		var initInd = getIndicesOf(p.begin, p.template, false);
		var endInd  = getIndicesOf(p.end, p.template, false);

		initInd.forEach(function(val, pos){
			var beginIdx = initInd[pos];
			var endIdx   = endInd[pos]+2;

			var expression        = p.template.substring(beginIdx,endIdx);
			var expressionContent = expression.substring(2,expression.length-2).split('.');

			var operation		  = expressionContent[1] ? expressionContent[1] : null;
			var attrName          = expressionContent[0];
			var xslVal 		  = '';

			if(p.object.GET[attrName]){
				if(operation){
					switch(operation){
						case 'attr':
							xslVal = '{'+valuePath+'/@'+attrName+'}'
						break;
						case 'val':
							xslVal = '<xsl:value-of select="'+p.object.GET[attrName]()+'"/>';

						break;
					}
				}else{
					var prpValue = p.object.GET[attrName]();

					if( p.object.xslValues && p.object.xslValues[attrName] )
						prpValue = prpValue ? p.object.xslValues[attrName] : '';
						
					xslVal = prpValue; 
				}

				replaces.push({
					expression:expression,
					value     :p.object.GET[attrName](),
					xslValue  :xslVal 
				});
			}
		});
	
		return replaces;
	}

	var GenVarsReplaceFromCusomStr = function(p){
		/*
			object
			begin
			end
			template
		*/
		var replaces = [];
		var initInd = getIndicesOf(p.begin, p.template, false);
		var endInd  = getIndicesOf(p.end, p.template, false);

		initInd.forEach(function(val, pos){
			var beginIdx = initInd[pos];
			var endIdx   = endInd[pos]+2;

			var expression        = p.template.substring(beginIdx,endIdx);
			var expressionContent = expression.substring(2,expression.length-2).split('.');
			

			var operation = expressionContent[1] ? expressionContent[1] : null;
			var attrName  = expressionContent[0];
			var xslVal 	  = '';

			if(operation){
				switch(operation){
					case 'attr':
						xslVal = '{'+attrName+'}'
					break;
					case 'val':
						xslVal = '<xsl:value-of select="'+attrName+'"/>';
					break;
				}
			}
			
			replaces.push({
				expression:expression,
				value     :DATA.get({type:p.object.GET.type()}),
				xslValue  :xslVal 
			});
		});

		return replaces;
	}

	container.replaceFieldsGenVars = function(field,context){
		
		var template    = $.trim(context ? field.templates[context] : field.template);//container.fieldDefaultTemplate;
	
		var tag    		= field.GET.tag();
		var type    	= field.GET.type() ? field.GET.type()  : '';
		var label  		= field.GET.label()? field.GET.label() : '';
		var name 		= field.GET.name() ? field.GET.name()  : '';
		
		var fieldPath   = container.GET.path()+'/fields/'+tag;
		var labelPath   = container.GET.path()+'/fields/'+tag+'/label';
		var valuePath   = container.GET.path()+'/fields/'+tag+'/value';
		var listPath    = fieldPath+'/list';

		template = template.replaceAll('#tag#',tag);
		
		template = template.replaceAll('#type#',type);

		template = template.replaceAll('#order#',field.order+1);

		template = template.replaceAll('#parent.tag#',container.GET.tag());
		template = template.replaceAll('#parent.path#',container.GET.path());

		/*PATH*/
		template = template.replaceAll('#label.path#', labelPath);
		template = template.replaceAll('#value.path#', valuePath);
		/*XSL:VALUE-OF*/
		template = template.replaceAll('#tag.val#', '<xsl:value-of select="'+tag+'"/>');
		template = template.replaceAll('#label.val#', '<span '+VARS.class.labelSetter+'=""><xsl:value-of select="'+labelPath+'"/></span>');
		template = template.replaceAll('#value.val#','<xsl:value-of select="'+valuePath+'"/>');
		/*{ ATTRIBUTE }*/
		template = template.replaceAll('#label.attr#','{'+labelPath+'}');
		template = template.replaceAll('#value.attr#','{'+valuePath+'}');
		template = template.replaceAll('#name.attr#', '{'+fieldPath+'/@name'+'}');

		template = template.replaceAll('#field.path#',fieldPath);
		template = template.replaceAll('#path#',fieldPath);
		template = template.replaceAll('#list.path#',listPath);

		var replaces_1 = GenVarsReplaceFromObjAttr({
			object   :field,
			begin    :'#[',
			end      :']#',
			template :template
		});


		var replaces_2 = GenVarsReplaceFromCusomStr({
			object   :field,
			begin    :"#'",
			end      :"'#",
			template :template
		});


		replaces_1.forEach(function(r){
			var htmlVal = container.appendOnThead ? DATA.get({type:field.GET.type()}) : r.value;
			template = template.replaceAll(r.expression, r.xslValue);
		});

		replaces_2.forEach(function(r){
			template = template.replaceAll(r.expression, r.xslValue);
		});

		return template;
	}

	container.replaceContainersGenVars = function(template){
		template = template.replaceAll('#value.rows#', container.GET.path()+"/value/row[not(@total='yes')]");
		template = template.replaceAll('#table.rows#', container.GET.path()+"/table/value/row[not(@total='yes')]");
		template = template.replaceAll('#path#',container.GET.path());
		template = template.replaceAll('#tag#', container.GET.tag());
		template = template.replaceAll('#title#',container.GET.title ? container.GET.title() : "");
		template = template.replaceAll('#collapsible#',container.GET.collapsible ? container.GET.collapsible() : "false");

		var replaces_from_attr = GenVarsReplaceFromObjAttr({
			object   :container,
			begin    :'#[',
			end      :']#',
			template :template
		});

		replaces_from_attr.forEach(function(r){
			template = template.replaceAll(r.expression, r.xslValue);
		});


		return template;
	}

	var addHolderClass = function(element,dz){
		if(element.tagName.indexOf('xsl') == 0){
			addHolderClass($(element).find('>:first-child')[0],dz);
		}else{
			var tclass = element.getAttribute('class') ? 
					 	 element.getAttribute('class') : '';
			//if is table set fieldsHolder class in TH
			//console.log(dz)
			if(!dz.isTable){
				//console.log(element)
				element.setAttribute('class',tclass+' '+VARS.class.fieldsHolder);
			}else{
				console.log('is table')
			}
		}
	}

	container.getXSL = function(option){
		//console.log(container.template);
		var xTemp = $($.parseXML(setXmlnsAttr(container.replaceContainersGenVars(container.template))));
		var fields = container.GET.fields();

		if(container.dropZone[0]){		//set field for each dropZone
			
			container.dropZone.forEach(function(dz,didx){
				
				var dropZone = xTemp.find('[gen-id="drop-zone"]')[didx];

				fields.forEach(function(f,idx){
					
					if(isDrawable(f.type)){
						var ftemplateContext = dz.template ? dz.template : 'field';
						var iftester 		 = !dz.isTable ? container.GET.path()+'/fields/'+f.GET.tag() : f.GET.tag();
						
						var method = dz.position == 'bottom' ? 'append' : 'prepend';

						if(f.templates[ftemplateContext]){

							var fieldTemplateStr = setXmlnsAttr(container.replaceFieldsGenVars(f,ftemplateContext));
							var fieldTemplateXML;

							try{
								fieldTemplateXML = $.parseXML(fieldTemplateStr);
								
								if(didx == container.dropZone.fieldsHolderIndex)
									addHolderClass(fieldTemplateXML.documentElement,dz);

								var fieldHolder = $.parseXML('<xsl:if test="'+iftester+'" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:if>');

								fieldHolder.documentElement.appendChild(fieldTemplateXML.documentElement);

								$(dropZone)[method](fieldHolder.documentElement)
								
							}catch(e){
								console.log(e);
								console.log(fieldTemplateStr);
								fieldTemplateXML = null;
							}

						}

						
					}

				});
			});
		}
		
		//PRESERVE POSITIONS
		$.each(xTemp.find('[gen-preserve="last"]'),function(i,element){
			var preservePosition = $(element).attr('gen-preserve');
			var initalPos        = $(element).index();
			var childs           = $(element).parent().children();
			var total            = childs.length;

			swapElements(childs,initalPos,total-1);
		});

		xTemp.find('[gen-preserve="last"]').removeAttr('gen-preserve');

		//SET CONTAINER CLASS GEN-CONTAINER-ITEM
		var mainNode = $(xTemp[0].documentElement);
		var classes  = mainNode.attr('class');
		var classSet = classes ? classes+' gen-container-item' : 'gen-container-item'
		mainNode.attr('class',classSet);

		return xTemp[0].documentElement;
	}

	container.XSLToString = function(){
		var cContent;
		
		try{	
			cContent = (new XMLSerializer()).serializeToString(container.getXSL());
		}catch(e){
			console.log(e);
		}
		
		var rtn = cContent ? cContent : '';

		return rtn;
	}

	container.getXML = function(){
		var xml;
		try{
			xml = $.parseXML(GEN.STRUCTURE.GET({
				object:container
			}));
		}catch(err){
			console.log(err);
		}
		return xml;
	}

	container.export = function(includeId){
		var returnId = !includeId ? false : true;
		//var cFields = (container.groups && container.groups.getFieldsByGroupOrder().length == FIELDS.length) ? container.groups.getFieldsByGroupOrder() : FIELDS;
		var cFields  = container.GET.fields();
		var c = {
			proprieties:{},
			fields:[]
		};

		for(var p in container.proprieties)
			c.proprieties[p] = container.GET[p]();

		cFields.forEach(function(f){
			c.fields.push(f.export());
		});

		if(container.contextMenu && container.contextMenu.items[0]){
			c.contextMenu = [];
			container.contextMenu.items.forEach(function(ctx){
				c.contextMenu.push(ctx.export())
			});
		}


		if(returnId) c.id = container.GET.id();

		c = container.beforeExport(c);
		//console.log(c);
		
		return c;
	}

	container.beforeExport = function(c){
		return c;
	}

	/*getters*/
	container.GET = {
		id  :function(){
			return container.id
		},
		name:function(){
			return container.proprieties.name;
		},
		tag:function(){
			return container.proprieties.tag;
		},
		title:function(){
			return container.proprieties.title;
		},
		autoTag:function(){
			return container.proprieties.autoTag;
		},
		hasTitle:function(){
			return container.proprieties.hasTitle;
		},
		collapsible:function(){
			return container.proprieties.collapsible;
		},
		field:function(id){
			var rtn = null;
			for(var x=0;x<FIELDS.length;x++){
				if(FIELDS[x]){
					if(id == FIELDS[x].GET.id()){
						rtn = FIELDS[x];
						break;
					}
				}
			}
			return rtn;
		},
		fields:function(){
			return container.groups ? container.groups.getFieldsByGroupOrder() : FIELDS;
		},
		contextMenuFields:function(){
			return container.contextMenu ? container.contextMenu.getGenFields() : false;
		},
		path:function(){
			return 'rows/content/'+container.GET.tag();
		},
		type:function(){
			return type;
		},
		XML:function(){
			//var rtn = 
		}
	}
	/*setters*/
	container.SET = {
		title:function(title,p){
			container.proprieties.title = title;
			container.holder.find('.titlecollapser .title-txt').text(title);
			container.onTitleSet(title);
		},
		autoTag:function(val,p){
			container.proprieties.autoTag = val;
		},
		hasTitle:function(val,p){
			container.proprieties.hasTitle = val;

			var transform = p && (p.transform != false) ? true : false;
			var idx = container.template.indexOf('>');
		
			try{
				if(val)
					container.template = container.template.insert(idx+1,VARS.templates.tittleCollapserStr);
				else
					container.template = container.template.replace(VARS.templates.tittleCollapserStr,'');

				if(transform) container.Transform();
			
			}catch(e){
				console.log(e);
			}
		},
		collapsible:function(val,p){
			container.proprieties.collapsible = val;
		},
		name:function(name,p){
			container.proprieties.name = name;
			container.onNameSet(name);
		},
		tag:function(tag,p){
			container.proprieties.tag = tag;
			
			executeEvents(tagChangeEvs,tag);

			container.holder.find('> .container-settings > .container-settings-title').text(container.GET.tag());

			container.onTagSet(container.GET.tag());
		},
		field:function(field,callback){
			
			if(container.canRecieveFields){

				container.receiving = true; 

				field.parent = container;
				
				field.order  = FIELDS.length;

				if(container.groups) container.groups.setFieldGroup(field);
				
				field.init();

				if(container.contextMenu && field.GET.type() == container.contextMenu.type){
					
					setContextMenuField(field,{
						callback:callback
					});

				}else{
					//hidden fields or 
					if(field.hidden || !isDrawable(field.GET.type())){
						
						//console.log(field)
						FIELDS.push(field);

						container.receiving = false; 

						if(callback) callback();

					}else{
						getDropZonesFieldsTemplate({
							field:field,
							callback:function(){
								container.onFieldSet(field);
								
								if(container['on'+capitalizeFirstLetter(field.GET.type())+'FieldSet'])
									container['on'+capitalizeFirstLetter(field.GET.type())+'FieldSet'](field);

								var spliceIdx = field.position >= 0 ? field.position : field.order;

								FIELDS.splice(spliceIdx, 0, field);

								executeEvents(fieldSetEvents,field);
								
								container.receiving = false; 
								
								//console.log(FIELDS)

								if(callback) callback();
							}
						});
					}
				}
			}
			

			
			
		},
		fields:function(fields,index,_callback){
			if(container.canRecieveFields){
				var idx = index ? index : 0;
				
				var callback = _callback ? _callback : false;

				container.holder.find('.c-holder-loading').show();

				if(fields && fields[0]){
					if(idx < fields.length){
						container.SET.field(fields[idx],function(){
							container.SET.fields(fields,idx+1,callback);
						});
					}else{
						container.Transform();
						if(callback) callback();
					}
				}
			}
		},
		place:function(place){
			container.place = place;
		}
	}

	container.includeCss = function(_name,p){
		var name    = _name ? _name : container.GET.type();
		var params  = p ? p : {};
		var cssPath = GEN.path+'/types/containers/'+container.GET.type()+'/css/'+name+'.css';

		if(!GEN.viewFileIncluded(cssPath,'css'))
			$('html head').append('<link type="text/css" href="'+cssPath+'" rel="stylesheet">');
	}

	var validateTag = function(tag,type,incr){
		var validTag = tag;
		var objects = type == 'field' ? FIELDS : GEN.getContainers();
		
		var idx = incr ? incr+1 : 1;

		for(var i = 0; i < objects.length; i++ ){
			var o = objects[i];
			
			if(o.GET.tag() == tag){
				validTag = validateTag(tag+'_'+idx,type,idx);
			}
		}
		return validTag;
	}

	var setContextMenuField = function(field,p){
		container.contextMenu.items.push(field);

		if(container.onContextMenuSet) container.onContextMenuSet(field);

		container.receiving = false;

		if(p.callback) p.callback();
	}

	var getDropZonesFieldsTemplate = function(p){
		//GET THE FIELD TEMPLATE FOR EACH DROP ZONE ON THE CONTAINER XSL
		var index = p.index ? p.index : 0;

		if(index < container.dropZone.length){

			var dz = container.dropZone[index];
			var context = dz.template ? dz.template : 'field';

			TEMPLATES.GET.field({
				field   : p.field.GET.type(),
				context : context,
				container:container.GET.type(),
				callback:function(result){
					p.field.templates[context] = result;
					//call again and increments dropZone
					getDropZonesFieldsTemplate({
						field    :p.field,
						index    :index+1,//check for another drop zone if exists
						callback :p.callback
					});
				}
			});
		}else{
			if(p.callback) {
				try{
					p.callback();
				}catch(er){
					console.log(er)
				}
			}
		}
	}

	container.unsetProprieties = function(proprieties){
		for(var p in container.proprieties){
			proprieties.forEach(function(prop){
				if(prop !='tag' && prop != 'type'){
					if(prop == p){
						delete container.proprieties[p];
						if(container.GET[prop]) delete container.GET[prop];
						if(container.SET[prop]) delete container.SET[prop];

						if(prop == 'title')    container.unsetProprieties(['hasTitle']);
						if(prop == 'hasTitle') container.unsetProprieties(['collapsible']);
					} 
				}
			});
		}
	}

	container.isEditable = function(attr){
		return notEditableAttrs[attr] ? false : true;
	}
	container.setPropriety = function(p){
		//console.log(p);
		if(p.name != 'type' && p.name != 'tag'){

			container.proprieties[p.name] = p.value;
			/* setter */
			var isInt = typeof p.value == 'number';
			
			if(p.editable == false){
				 notEditableAttrs[p.name] = true;
			}else{
				var hasChangeEvent = p.value.changeEvent ? true : false;
				if(hasChangeEvent){
					
					container.proprieties[p.name]['on'+capitalizeFirstLetter(p.value.changeEvent)] = function(val){
						container.SET[p.name](val);
						if(p.onChange) p.onChange(val);
					}

				}
				container.SET[p.name] = function(value,_params){
					var transform = (_params && _params.transform==false) ? false : true;

					var _value = isInt ? parseInt(value) : value;

					if(typeof p.value == 'object')
						container.proprieties[p.name].value = _value;
					else
						container.proprieties[p.name] = _value;

					if(!hasChangeEvent && p.onChange)
						p.onChange(_value);

					if(p.transform && transform) 
						container.Transform();
				}
			}
			/* getter */
			container.GET[p.name] = function(){
				var rtn;
				if(typeof p.value == 'object'){
					var hasValueAttr = 'value' in container.proprieties[p.name];
					var val = hasValueAttr ? container.proprieties[p.name].value : container.proprieties[p.name];
					rtn = val;
				}else{
					rtn = container.proprieties[p.name];
				}

				return rtn;
			}	
		}
	}
	/*init*/
	container.init = function(callback){
		try{

			setVars();
			
			if(container.fields) setDropable();

			executeEvents(readyEvents);

			if(container.groups) SETUPGROUPS();
			if(container.contextMenu) SETUPCONTEXTMENU();

			setFilesIncludes();
			

			container.ready();
			
			var templateCallback = function(contents){
				if(contents.template){
					var contextMenuFields = container.contextMenu ? container.contextMenu.getGenFields() : [];
					var fields            = (params && params.fields && params.fields[0]) ? params.fields : [];
					var settedFields      = fields.concat(contextMenuFields);
					
					container.template = contents.template;
	
					container.fieldDefaultTemplate = contents.fieldTemplate;
					
					setUpTemplate();

					setProprietiesValues();

					if(settedFields[0]) {
						container.SET.fields(settedFields,null,function(){
							callback();
							container.complete();
						});
					}else{
						container.Transform({callback:function(){
							callback();
							container.complete();
						}});
					}	
				}
			};

			var templateError = function(e){
				GEN.removeContainer(container.id);
				console.log('template not found: '+container.type);
			}

			TEMPLATES.GET.container({
				name:container.type,
				callback:templateCallback,
				error:templateError
			});

		}catch(e){ 
			console.log(e); 
		}

		//console.log(container)
	}

	container.on = function(ev,callback){
		switch(ev){
			case 'tag-change':
				tagChangeEvs.push(callback);
			break;
			case 'ready':
				readyEvents.push(callback);
			break;
			case 'field-set':
				fieldSetEvents.push(callback);
			break;
		}
	}

	var executeEvents = function(events,val){
		for(var i=0; i < events.length; i++){
			var ev = events[i];
			try{
				ev(val);
			}catch(e){
				console.log(e);
			}
		}
	}

	var setUpTemplate = function(){
		if(container.template){
			//container.structure
			var xTemp = $($.parseXML(setXmlnsAttr(container.template)));
			//set up template structure = xml format .gen.structure.js
			container.structure = xTemp.find('['+VARS.attrs.structure+']').attr(VARS.attrs.structure) ? 
								  xTemp.find('['+VARS.attrs.structure+']').attr(VARS.attrs.structure) :
								  'label,value';
			
			var fieldsSelector = [];

			//set up dropzones
			var dropZone = [];
			
			//var hasGenFieldsHolder = xTemp.find('[gen-fields-holder]')[0] ? true : false;

			dropZone.fieldsHolderIndex =  0;

			$.each(xTemp.find('[gen-id="drop-zone"]'),function(i,dz){
				//set drop zone
				var isTable = false;

				$.each($(dz).parents(),function(ix,parent){
					if(parent.tagName == 'xsl:for-each')
						isTable = true;
				});

				var fieldSelector = {
				 	label    : '['+VARS.class.labelSetter+']' ,
				 	selector : '.'+VARS.class.fieldsHolder
				 	//selector : isTable ? '.th-field-holder' : '.'+VARS.class.fieldsHolder 
				}

				fieldsSelector.push(fieldSelector);

				var dzone = {
					template      : $(dz).attr('gen-field-template') ? $(dz).attr('gen-field-template') : 'field',//field template of the dz
					isTable       : isTable,//if dz is a table,
					position      : $(dz).attr('gen-drop-position') ? $(dz).attr('gen-drop-position') : 'bottom',
					fieldSelector : fieldSelector
				};

				if($(dz).attr('gen-fields-holder') == 'true')
					dropZone.fieldsHolderIndex = i;
				
				dropZone.push(dzone);
				
			});

			container.dropZone = dropZone;
			
			//set up fields selector...if they are in container template
			if(xTemp.find('[gen-fields]') && xTemp.find('[gen-fields]')[0]){
				fieldsSelector = [];// gen-fields subscribes dropZone fieldsSelector
				$.each(xTemp.find('[gen-fields]'),function(i,element){
					var fselector = $(element).attr('gen-fields');
					var flabel	  = $(element).attr('gen-field-label');
					var rtn = new Object();
					if(fselector) rtn.selector = fselector;
					if(flabel)    rtn.label    = flabel;

					fieldsSelector.push(rtn);
				});
			}
			container.fieldsSelector = fieldsSelector;
		}
	}

	var validField = function(name){
		var valid = true;

		if(container.reject[0]){
			for(var x = 0; x < container.reject.length; x++){
				if(container.reject[x] == name){
					valid = false;
					break;
				}
			}
		}
		if(container.accept[0]){
			for(var x = 0; x < container.accept.length; x++){
				if(container.accept[x] != name){
					valid = false;
					break;
				}
			}
		}
		return valid;
	}

	var setVars = function(){//set container global vars

		container.type   = name;

		container.id     = container.type+(new Date()).getTime();
		
		container.folder = '/extensions/formgen/types/containers/'+name;
		
		container.reject = $(VARS.html.containers+'[name="'+name+'"]')
						   .attr('reject').split(',');
						   
		container.accept = $(VARS.html.containers+'[name="'+name+'"]')
						   .attr('accept').split(',');

		container.holder = getContainerHolder(container);

		container.SET.tag(container.incrementTag('container',name));

		//set drawable options
		GEN.getDeclaredFields().forEach(function(f){
			var _isValid = (!validField(f.type) || f.type == 'hidden') ? false : true;
			container.options.draw[f.type] = _isValid;
		});


		container.genType = 'container';
	}
	var setProprietiesValues = function(){
		if(params && params.proprieties){
			for(var p in params.proprieties){
				if(container.SET[p])
					container.SET[p](params.proprieties[p],{transform:false});
			}
		}
	}
	var SETUPGROUPS = function(){
		try{
			var activeTab;

			var tabOnEdition = null;

			var gId = params && params.proprieties && params.proprieties.groups ? params.proprieties.groups.length : 0;

			var selector         = container.groups.selector ? container.groups.selector : '.tabMenuGroups';
			var itemsSelector    = container.groups.itemsSelector ? container.groups.itemsSelector : 'li';
			var contentsSelector = container.groups.contentsSelector ? container.groups.contentsSelector : '.groupItemTab';
			var activeClass      = container.groups.activeClass ? container.groups.activeClass : 'active';

			container.xml.type = 'group';

			container.groups = {
				selector         : selector,
				itemsSelector    : itemsSelector,
				contentsSelector : contentsSelector,
				activeClass      : activeClass,
				items            : params && params.proprieties && params.proprieties.groups ? params.proprieties.groups : []
			}

			container.setPropriety({
				name  : 'groups',
				value : container.groups.items,
				editable:false,
			});

			container.groups.setFieldGroup = function(field){
				var groupVal = field.proprieties && field.proprieties.group ? field.proprieties.group:
							   container.groups.getActiveId();
				
				field.setPropriety({
					name     : 'group',
					value    : groupVal,
					editable : false
				});
			}

			container.groups.getGroupObject = function(id){
				var rtn = false;
				for(var i = 0; i < container.groups.items.length; i++){
					var item =  container.groups.items[i];
					if(item.id == id){
						rtn = item;
						break;
					}
				}
				return rtn;
			}
			container.groups.getFieldsByGroupOrder = function(){
				var rtn = [];
				container.GET.groups().forEach(function(g){
					FIELDS.forEach(function(f){
						if(f.GET.group() == g.id)
							rtn.push(f);
					});
				});
				return rtn;
			}
			
			//get the groups items holder
			container.groups.getGroup =function(){
				return $(container.groups.selector,container.holder);
			}
			//get $( groups tab items )
			container.groups.gtGroupItems = function(rel){
				var allItemsSelector = container.groups.selector+' '+container.groups.itemsSelector;

				return rel ? $(allItemsSelector+'[group-id="'+rel+'"]',container.holder) : $(allItemsSelector,container.holder);
			}
			//get all $(tab items holders) 
			container.groups.getGroupsContents = function(){
				return $(container.groups.contentsSelector,container.holder);
			}
			//get the group tab opened at the moment (tab items)
			container.groups.getGroupContentActive = function(){
				return $(container.groups.contentsSelector+'.'+activeClass,container.holder);
			}
			//get active id
			container.groups.getActiveId = function(){
				return activeTab ? activeTab : container.groups.getActive().attr('group-id');
			}
			//get active $(li) dom
			container.groups.getActive = function(){
				var activeTagHolder = $(container.groups.selector+' '+container.groups.itemsSelector+'.'+activeClass);
				return activeTagHolder;
			}//set groups
			container.groups.set = function(items){
				var g = this;
				items.forEach(function(name,i){
					var item = { 
						name : name,
						id   : 'group-'+gId
					}
					g.items.push(item);
					gId++;
				});
			}
			container.groups.setActive = function(){
				var activeTab = container.groups.getActiveId();
				container.groups.getGroup().attr('gen-id','container-group');
				$(container.groups.selector+' '+container.groups.itemsSelector+'[group-id="'+activeTab+'"]',container.holder).click();
			}
			//config group items sortable and remover
			container.groups.configGroupItems = function(){
				var group      = container.groups.getGroup();
				var groupItems = container.groups.gtGroupItems();
				//sortable
				group.sortable({
					items:itemsSelector,
					containment:'parent',
					delay:200,
					stop:function(e,ui){
						var arr = [];
						$.each(container.groups.gtGroupItems(),function(i,_item){
							var id =$(_item).attr('group-id');
							var item = container.groups.getGroupObject(id)
							if(item) arr.push(item);
						});
						container.groups.items = arr.length == container.groups.items.length ? arr : container.groups.items;
						
						container.proprieties.groups = container.groups.items;
						
						container.Transform();
					}
				});
				//edition 
				if(container.groups.items.length == groupItems.length){
					$.each(groupItems,function(i,item){
						$(item).addClass('gen-group-holder');
						$(item).attr('group-id',container.groups.items[i].id);

						var options = getGroupsOptions();
						$(item).append(options);
					});
				}
			}
			//config adder btn
			container.groups.configAdder = function(){
				var containerGroup = container.groups.getGroup();
				var adder = $('<div class="'+VARS.groups.adderClass+'"></div>');

				
				calculateAdderPosition(adder);

				adder.on('click',function(){
					container.groups.set(['Group '+(container.groups.items.length+1)]);
					container.Transform();
				});

				containerGroup.css('position','relative');
				containerGroup.append(adder);
			}

			var calculateAdderPosition = function(adder){
				var containerGroup = container.groups.getGroup();
				var adderPosition;
				//calculate the width of all group items
				var width = 0;
				var groupItems = container.groups.gtGroupItems()
				var groupItemsWidth = groupItems.width();

				$.each(groupItems,function(gIdx,gItem){
					width+=$(gItem).width();
				});

				width+=15;

				adderPosition = width > containerGroup.width() ? containerGroup.width()- (groupItemsWidth/2) : width;
				
				adder.css('left',adderPosition);
				
			}

			var getGroupsOptions = function(){
				var ul     = $('<span class="'+VARS.groups.itemMenuClass+'"/>');
				var edit   = $('<span class="'+VARS.groups.itemEditClass+'"></span>');
				var remove = $('<span class="'+VARS.groups.itemRemoveClass+'"></span>');
				
				remove.on('click',function(e){
					e.preventDefault();
					if(container.groups.items.length > 1){
						var itemHolder = $(this).parents(selector+' '+itemsSelector);
						var id         = itemHolder.attr('group-id');
						var obj        = container.groups.getGroupObject(id);
						if(obj){
							var idx   = container.groups.items.indexOf(obj);
							container.groups.items.splice(idx,1);
							
							itemHolder.remove();
							
							container.Transform({
								callback:function(){
									activeTab = container.groups.getActive().attr('group-id');
								}
							});
						}
					}
				});

				ul.append(remove);
				return ul;
			}
			//events
			container.holder.on('click',container.groups.selector+' '+container.groups.itemsSelector,function(e){
				activeTab = $(this).attr('group-id');
				
			});
			container.holder.on('dblclick',container.groups.selector+' '+container.groups.itemsSelector,function(){
				var span = $(this).find('a span');
				var element = $(this);
				var adder = $('.gen-group-adder',container.holder);
			
				element.addClass('gen-group-editing')
				tabOnEdition = span;
			
				span.switchToInput({
					class:'gen-group-namer',
					onBlur:function(val,e){
						var idx = element.index();
						container.groups.items[idx].name = val;
						element.removeClass('gen-group-editing');
						calculateAdderPosition(adder);
					}
				});

				calculateAdderPosition(adder)

			});

			$('body').on('click',function(e){
				if(!$(e.target).hasClass('gen-group-namer'))
					$('input.gen-group-namer').blur();
			});
			
			if(container.groups.items.length == 0)
				container.groups.set(['Group 1', 'Group 2']);

		}catch(e){	
			console.log(e);
		}
	}

	var SETUPCONTEXTMENU = function(){
		container.contextMenu.items = [];
		
		container.contextMenu.getGenFields = function(){
			var rtn = [];
			if(params && params.contextMenu){
				params.contextMenu.forEach(function(ctx){
					var declaredCtx = GEN.getDeclaredField(ctx.type);
					if(declaredCtx)
						rtn.push(new declaredCtx.field(ctx.type,ctx));
				});

			}
			return rtn;
		}

		container.contextMenu.getField = function(id){
			var rtn = null;
			for(var i = 0 ; i < container.contextMenu.items.length; i++){
				var ctx = container.contextMenu.items[i];
				if(ctx.GET.id() == id){
					rtn = ctx;
					break;
				}
			}
			return rtn;
		}

		container.setUndrawableFields = function(p){
			p.fields.forEach(function(f){
				container.options.draw[f] = false;
			});
		}

		//container.contextMenu.items = params && params.contextMenu ? params.contextMenu : [];
		//console.log(container.contextMenu)
		//FIELDS.contextMenu = [];

		/*params.proprieties.contextMenu.forEach(function(ctx){
			console.log(ctx);
		})*/

		//container.contextMenu.items = [];//params.proprieties && params.proprieties.contextMenu ? params.proprieties.contextMenu : [];

		/*container.setPropriety({
			name  : 'contextMenu',
			value : [],
			editable:false,
		});*/
	}

	var isContextMenu = function(name){
		return container.contextMenu ? name == container.contextMenu.type : false;
	}

	var isDrawable = function(name){
		var rtn = container.options.draw[name];
		return rtn;
	}

	var getContainerHolder = function(container){
		var containerTitle = HTML({
			class :'container-settings-title',
			text:container.type
		});

		var containerLoader = HTML({
			tag:'span',
			class:'c-holder-loading',
			style:'display:none'
		});

		var containerMover = HTML({
			tag   : 'li',
			class : 'container-mover',
			attrs : [{name:'alt',value:'Mover'},{name:'title',value:'Mover'}]
		});
		var containerEditor = HTML({
			tag     : 'li',
			class   : 'container-edit gen-edition-btn',
			rel     : 'gen-edition',
			attrs : [{name:'alt',value:'Editar'},{name:'title',value:'Editar'}],
			onClick : function(e){
				$('li.container-edit[rel="gen-edition"]').removeClass('active');
				$(this).addClass('active');
				GEN.edit(container,e);
			}
		});
		var containerRemover = HTML({
			tag   : 'li',
			class : 'container-remove',
			attrs : [{name:'alt',value:'Remover'},{name:'title',value:'Remover'}],
			onClick : function(){
				if(confirm('Remover Container?'))
					GEN.removeContainer(container.GET.id());
			}
		});
		var containerOptsHolder = HTML({
			tag  : 'ul',
			class:'container-options',
			html :[containerEditor,containerRemover/*,containerMover,*/]
		});
		
		var containerSettings = HTML({
			class:'container-settings',
			html :[containerTitle,containerLoader,containerOptsHolder],
		});

		var containerContents = HTML({
			class:VARS.class.containersContent
		});

		var holder = HTML({
			id    : container.id,
			class : VARS.class.containersHolder,
			attr  : ['type',container.GET.type()],
			html  : [containerSettings,containerContents]
		});

		//holder.on('')

		return holder;
	}

	container.getFieldEditOptions = function(field,p){
		var __params = new Object();

		__params.onEdit = p && p.onEdit ? p.onEdit : function(e){
			if($(e.target).parents('.'+VARS.class.ctxMenu)[0])
				$(e.target).parents('.'+VARS.class.ctxMenu).addClass(VARS.class.ctxMenuOn);
			else
				$('.'+VARS.class.ctxMenu,container.holder).removeClass(VARS.class.ctxMenuOn);

			GEN.edit(field,e);
		};

		__params.onRemove = p && p.onRemove ? p.onRemove : function(e){
			var fieldHolder = $(e.target).parents('.'+VARS.class.fieldsHolder)[0] ? 
							  $(e.target).parents('.'+VARS.class.fieldsHolder)    :
							  $(e.target).parents('.'+VARS.class.ctxMenuHolder);
			var fieldId     = fieldHolder.attr('gen-field-id');
			container.removeField(fieldId);
		};

		var div = HTML({
			tag:'div',
			class:'field-edt-options',
			attrs:[
				{ name:'display'  ,value: container.fieldEditParams.display },
				{ name: 'position',value: container.fieldEditParams.position}
			],
			html:function(){
				var edit = HTML({
					class: 'field-edit gen-edition-btn',
					rel  : 'gen-edition',
					onClick:__params.onEdit
				});
				var remove = HTML({
					class:'field-remove',
					onClick:__params.onRemove
				});

				return [edit,remove]
			}
		});
		
		//console.log(div);

		return div;
	}

	container.incrementTag = function(type,name,idx){
		var index = idx ? idx : 1;
		var objects = type == 'container' ? GEN.getContainers() : FIELDS;
		
		var rtn = name+'_'+index;;

		for(var i = 0; i < objects.length; i++){
			var c = objects[i];

			if(c.GET.tag() == rtn){
				var arr = rtn.split('_');
				var _i  = parseInt(arr[1])+1; 
				rtn = container.incrementTag(type,name,_i);
			}
		}
		return rtn;
	}

	

	var setEvents = function(){
		$(window).resize(function(){
			container.onWindowResize();
		});

		GEN.VIEW.on('dblclick','.gen-fields-holder',function(e){
			var id     = $(this).attr('gen-field-id');
			var field  = id ? container.GET.field(id) : false;
			
			if(field){
				GEN.edit(field,e);
			} 

		})
		/*contents.find('.gen-fields-holder').on('dblclick',function(){
			console.log('dbl')
		});*/
	}

	//EVENTS LISTNERS
	/*functions to subscribe*/
	container.ready          	 = function(){};
	container.complete       	 = function(){};
	//container.onDrop         = function(){};
	//container.onDraw         = function(){};
	container.onRemove  	 	 = function(){}; 
	container.onDrawEnd      	 = function(){};
	container.onTitleSet     	 = function(){};
	container.onNameSet      	 = function(){};
	container.onTagSet       	 = function(){};
	container.onFieldSet     	 = function(){};
	container.beforeFieldRemove  = function(){};
	container.onFieldRemove  	 = function(){};
	container.onFieldDraw    	 = function(){};
	container.onWindowResize 	 = function(){};
	container.onFieldsXMLGenerate = function(){return "";};
	/*sort events*/
	container.onFieldSort        = function(e,ui){};
	container.onFieldSortStart   = function(e,ui){};
	container.onFieldSortStop    = function(e,ui){};
	container.onFieldSortChange  = function(e,ui){};

	setEvents();

}