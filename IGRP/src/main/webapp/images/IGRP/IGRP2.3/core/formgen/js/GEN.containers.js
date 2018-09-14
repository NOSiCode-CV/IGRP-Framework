var CONTAINER = function(name,params){
	var container  = this;
	
	var FIELDS     = [];
	
	var GEN        = VARS.getGen();
	
	var XSL        = '';

	var XML        = '';

	var FIELDSINCR = {};
	
	var type = name;
	
	var notEditableAttrs = {};

	container.copyOptions = params.copy ? params.copy : false;

	container.autoTag = params.options && params.options.hasOwnProperty('autoTag') ? params.options.autoTag : false;

	container.includes = [];

	container.genXML           = true;

	container.xslValidation    = true;

	container.canRecieveFields= true; //SET FALSE IF CONTAINER DOES NOT RECIEVE FIELDS

	container.receiving       = false;

	container.tranforming     = false;

	container.fieldValidation = true;

	container.propertiesLabels= {};

	container.propertiesOptions= {};

	container.customStyle = {
		id    :params.style && params.style.id     ? params.style.id : '',
		class :params.style && params.style.class  ? params.style.class : '',
		inline:params.style && params.style.inline ? params.style.inline : ''
	}; 

	container.fields          = true;

	container.groups          = false; 

	container.structure       = "";

	container.contextMenu 	  = false;

	container.xslOptions      = {
		useDefault : params && params.xsl ? params.xsl.useDefault : true,
		template   : params && params.xsl ? params.xsl.template   : false
	};



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
		title       : capitalizeFirstLetter(name),
		//autoTag     : true,
		tag         : '',
		hasTitle    : false,
		collapsible : false,
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
		//placeholder:VARS.class.sortablePlaceholder,
		helper:"clone",
		sortableItemHtml:false,
	}

	container.xslValues = {};

	container.includesController = {};



	//var tagChangeEvs = [], readyEvents = [], fieldSetEvents = [];

	var _EVENTS = {
		list:{
			"draw-end"  :[],
			"tag-change":[],
			"ready"     :[],
			"field-set" :[]

		},
		get:function(e){
			var rtn = null;
			for(var ev in _EVENTS.list){
				if(e == ev){
					rtn=_EVENTS.list[ev];
					break;
				}
			}
			return rtn;
		},
		execute:function(ev,params){
			var eventList = _EVENTS.get(ev);
			if(eventList && eventList[0]){
				eventList.forEach(function(f){
					try{f(params)}catch(err){console.log(err)}
				});
			}
		},
		isDeclared:function(ev,func){
			var eArray     = _EVENTS.get(ev);
			var isDeclared = false;
			for(var i = 0; i< eArray.length;i++){
				var dEvent = eArray[i];
				if($.trim(String(dEvent)) == $.trim(String(func))){
					isDeclared = true;
					break;
				}
			}
			return isDeclared;
		}
	};

	container.removeField = function(id,_alert,_transform,callback){
			var isCtxMenu = container.contextMenu && container.contextMenu.getField(id) ? true : false;
			var field     = isCtxMenu ? container.contextMenu.getField(id) : container.GET.field(id);
			var alert     = _alert == false ? false : true;
			var transform = _transform == false ? false : true;
			
			container.beforeFieldRemove(id);

			if(field){

				var array = !isCtxMenu ? FIELDS : container.contextMenu.items;
				var idx = array.indexOf(field);

				var remove = function(){
					if(idx > -1){

						array.splice(idx,1);

						container.onFieldRemove(field);

						if(GEN.server.preserved && GEN.server.preserved.java && GEN.server.preserved.java.controller){
							
							var key = field.GET.tag().toUpperCase();
							var preserved = GEN.server.preserved.java.controller[key];
							
							if(preserved){
							
								delete GEN.server.preserved.java.controller[key];

							}

						};
						
						try{
							if(field.type == container.contextMenu.type){
								if(container.onContextMenuRemove) container.onContextMenuRemove(field);
							}
							if(container['on'+capitalizeFirstLetter(field.type)+'FieldRemove'])
								container['on'+capitalizeFirstLetter(field.type)+'FieldRemove'](field);
						}catch(err){
							console.log(err);
						}

						if(transform){

							
							container.Transform({
								callback:function(){
									if(callback)
										callback();
								}
							});
						}
						
							
					}
				}

				if(alert){
					if(confirm('Delete Field?'))
						remove();
				}else{
					remove();
				}	

				
			}
			
			if(GEN.edit.object && field && field.id == GEN.edit.object.id)
				GEN.edit.hide();

	}

	container.replaceField = function(){

	}


	/*container.setIncludes = function(p){
		var found     = false;
		var validIncs = [];
		//set if dont exists
		if(!container.includes[p.type])
			container.includes[p.type] = [];

		//check if its already there
		for(var i = 0; i < container.includes[p.type].length; i++){
			var inc = container.includes[p.type][i];
			for(var x = 0; x < p.files.length; x++){
				var setFile = p.files[x];
				if(setFile.path == inc.path){
					console.log('already')
					found = true;
					break;
				}else{
					console.log('setFile')
					validIncs.push(setFile.path)
				}
			}
		}
		//console.log(validIncs)
		//if(!found) 
		//container.includes[p.type].for
	}*/

	var setFilesIncludes = function(){

		var __setFile = function(type){
			
			container.includes[type].forEach(function(file){
				var _path;
				if(file.path){
					
					var isExternal = /^https?:\/\//i.test(file.path);
					var rel  = file.relative == false || isExternal ? false : true;
						_path = rel ?  path+file.path : file.path;

					if(_path)
						GEN.includeToHead({
							type     : type,
							relative : rel,
							path     : _path,
							media    : file.media,
							charset  : file.charset
						});

				}else if(file.import){
					for(var c in file.import){
						console.log(c)
						if(file.import[c] == 'import.all'){
							console.log('import all')
						}else{
							if(file.import[c][0]){
								file.import[c].forEach(function(f){
		
									_path= VARS.genPath+'/types/containers/'+c+'/includes/'+f;
									
									if(_path)
										GEN.includeToHead({
											type     : type,
											relative : file.relative,
											path     : _path,
											media    : file.media,
											charset  : file.charset
										});

								});
							}
						}
					}
				}
				
			});
		}
		
		//if(container)
		if(container.includes && container.includes.css && container.includes.css[0])
			__setFile('css');
		if(container.includes && container.includes.js && container.includes.js[0])
			__setFile('js');

		container.GET.fields().forEach(function(f){
			f.setFilesIncludes();
		})
		
	}


	container.hasFieldType = function(type){
		var fields = container.GET.fields().concat(container.GET.contextMenuFields());
		var foundc = false;
		for(var i = 0; i < fields.length; i++){
			var f = fields[i];
			if(f && f.GET.type() == type){
				foundc = true;
				break;
			}
		}
		
		return foundc;
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
		if(xslIncludes && xslIncludes[0])
			xslIncludes.forEach(function(tmpl){checkTmpl(tmpl)});

		//fields Includes
		container.GET.fields().forEach(function(f){
			if(f.includes){
				var fieldXSLInc = f.includes.xsl ? f.includes.xsl : f.includes;
				if(fieldXSLInc && fieldXSLInc[0])
					fieldXSLInc.forEach(function(fieldIncl){checkTmpl(fieldIncl)});
			}
		});

		//ctxMenu Includes
		if(container.contextMenu && container.contextMenu.items && container.contextMenu.items[0]){
			container.contextMenu.items.forEach(function(ctx){
				if(ctx.includes){
					var ctxXSLInc = ctx.includes.xsl ? ctx.includes.xsl : ctx.includes;
					if(ctxXSLInc && ctxXSLInc[0])
						ctxXSLInc.forEach(function(fieldIncl){checkTmpl(fieldIncl)});
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

			var tempStr = new XMLSerializer().serializeToString(template);
			tempStr = tempStr.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','');
			//tempStr = tempStr.replaceAll('item-name','')
			stylesheet = $.parseXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
		  						'<xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"/>'+
		  						'<xsl:template match="/">'+tempStr+
		  						'</xsl:template>'+includes+'</xsl:stylesheet>');
		}
		return stylesheet;
	}

	var afterTransform = function(contents){

		container.holder.show();

		$('>.gen-settings-holder>.c-type',container.holder).text( container.GET.tag() );

		if(container.xslOptions.useDefault){

			container.holder.removeClass('custom-xsl-set');

			if      (container.dropZone[0])       setUpDropZone(contents);	
			else if (container.fieldsSelector[0]) setUpFieldsHolder(contents);
			//container has groups
			if(container.groups) setUpGroupFields();
			//form hidden config elements
			if(container.contextMenu) setUpContextMenuFields();
			//form hidden config elements
			
			configHiddenFields();

			if(container.fields){
				setDropable();
				configSortable();
			} 

			

			if(contents.find('.gen-rows-holder')){
				__GEN.layout.setViewSortable(contents.find('.gen-rows-holder'));
				__GEN.layout.addRow({parent:contents.find('.gen-rows-holder')});
			}


			fieldsDrawEnd();
			
			container.onDrawEnd();

			setCopyClass();

			var column = $(container.holder.parents('.gen-column')[0]);

			GEN.checkColumnComponents( column );
		}else{

			container.holder.addClass('custom-xsl-set');

			container.onDrawEnd();

		}
		

		_EVENTS.execute('draw-end');
		
	}
	var fieldsDrawEnd = function(){
		container.GET.fields().forEach(function(f){
			try{
				f.onDrawEnd();
			}catch(err){
				console.log(err);
			}	
			
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
				ArrayMove(container.contextMenu.items,startPos,endPos);
				//container.contextMenu.items.move(startPos,endPos);
				startPos = null;
				container.Transform();
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

	var setUpNoField = function(area,o){
		if(o){
			area.addClass('no-fields');
//			area.append('<div class="gen-no-field-info">DROP FIELDS OR <a href="#" class="gen-copy-from"><strong>COPY</strong></a></div>');			
			area.append('<div class="gen-no-field-info">DROP <a href="javascript:void()" class="gen-activate-fields-tab"><i class="fa fa-dot-circle-o"></i><strong>FIELDS</strong></a> OR <a href="#" class="gen-copy-from"><i class="fa fa-copy"><strong> COPY</strong></a></div>')
		}else{
			area.removeClass('no-fields');
			$('.gen-no-field-info',area).remove();
			
		}
	}

	var setUpDropZone = function(contents){
		//template has drop zone declared inline
		var dz = container.dropZone[0];	
		//var dropZone = $( contents.find('[gen-id="drop-zone"]')[container.dropZone.fieldsHolderIndex]);
		var dropZone = contents.find('[gen-id="drop-zone"]');


		if(dz.isTable) {
			var tbFields = dropZone.first().find('.gen-table-field-holder');
			tbFields.addClass(VARS.class.fieldsHolder);
		}

		if(container.GET.fields()[0])
			setUpNoField(dropZone.first(),false);
		else
			setUpNoField(dropZone.first(),true);


		var selector = dz.fieldSelector.selector;
		var label    = dz.fieldSelector.label;
		//console.log(dropZone);
		var fields = dropZone.find(selector);
		
		$.each(fields,function(i,f){
			
			var id   = $(f).attr('gen-item-id');
			var field = container.GET.field(id);


			if(field){
				
				field.holder = $(f);

				field.holder.attr('parent-id',container.GET.id());
				field.holder.attr('gen-field-id',field.GET.id());
				field.holder.attr('gen-field-type',field.GET.type());

				if(label){
					var labelSetter = field.holder.find(label);
					labelSetter.attr(VARS.class.labelSetter,'');
					field.labelSetter = labelSetter;
				}

				field.holder.append(container.getFieldEditOptions(field));

			}else
				$(f).remove();
			
		});

		/*container.GET.fields().forEach(function(field,i){

			
			var fHolder = dropZone.find(selector);

			console.log(fHolder)

			if(fHolder[0]){
				field.holder = $(fHolder[i]);
				
				field.holder.attr('parent-id',container.GET.id());
				field.holder.attr('gen-field-id',field.GET.id());
				field.holder.attr('gen-field-type',field.GET.type());

				if(label){
					var labelSetter = field.holder.find(label);
					labelSetter.attr(VARS.class.labelSetter,'');
					field.labelSetter = labelSetter;
				}

				field.holder.append(container.getFieldEditOptions(field));
			}
		})*/;
	}

	var setUpFieldsHolder = function(contents){
		//template has [gen-field] declared (apply-templates case!)		
		if(!container.groups){
			var area = $(container.holder.find('[gen-fields]')[0]);
			
			if(container.GET.fields()[0])
				setUpNoField(area,false);
			else
				setUpNoField(area,true);
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

					fieldHolder.attr('gen-field-type',field.GET.type())
					
					fieldHolder.attr('gen-field-id',field.GET.id());
				
					if(field.GET.group) 
						fieldHolder.attr('gen-group-id',field.GET.group());

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
		var appender      = $('.box-body',container.holder)[0] ? $('.box-body',container.holder).first() : $('[gen-id="drop-zone"]',container.holder).first();
		var hiddensHolder = $('<div class="gen-hidden-holder"/>');
		var count         = 0;

		appender.removeClass('gen-hiddens-parent');

		container.GET.fields().forEach(function(f,i){
			if(f.hidden){
				var fHolder = $('<span tag="" class="'+VARS.class.fieldsHolder+'" gen-field-id="'+f.GET.id()+'" >'+f.GET.tag()+'</span>')
				fHolder.attr('parent-id',container.GET.id());

				f.holder = fHolder;
				f.holder.append(container.getFieldEditOptions(f));
				
				hiddensHolder.append(f.holder);
				count++;
			}
		});
		
		if(count){
			appender.addClass('gen-hiddens-parent');
			appender.append(hiddensHolder)
		}


		/*var count = 0;
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
		
		if(count) 
			if($('.box-collapser',container.holder)[0])
				hiddenHolders.insertBefore($('.box-collapser',container.holder));
			else
				appender.prepend(hiddenHolders);*/
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
		if(!container.holder.hasClass('gen-container-copy')){
			if(container.dropZone[0]){
				//HAS DROP ZONE
				var dropZone = $(container.holder.find('[gen-id="drop-zone"]')[container.dropZone.fieldsHolderIndex]);
				var items    = container.fieldsSelector[0].selector;
				var hiddensHolder = container.holder.find('.gen-hidden-holder');

				if(hiddensHolder[0])
					dropZone = dropZone.add(hiddensHolder[0]);
				
				
				setSortable(dropZone,items);

			}else if(container.fieldsSelector[0]){
				//HAS NO DROP ZONE

				container.fieldsSelector.forEach(function(fs,i){

					var holder   = $(('[gen-fields]',container.holder)[i]),
 
						selector = $(fs.selector,holder),

						items    = container.sortableOptions.items ? selector.filter(container.sortableOptions.items) : selector;

					if(items[0]){

						var dropZ = items.parent();

						setSortable(dropZ,items);

						/*holder.find(fs.selector).not('.field-edit,.field-remove').addClass('gen-sortable-items');

						var items = !found ? fs.selector : '.gen-sortable-items';

						setSortable(dropZone,items);*/
					}
					
				});

				/*container.fieldsSelector.forEach(function(fs,i){

					var holder = $(container.holder.find('[gen-fields]')[i]);
					
					var found = holder.find(fs.selector)[0] ? true : false;

					if(found){

						var dropZone = found ? holder.find(fs.selector).parent() :
									   holder;

						holder.find(fs.selector).not('.field-edit,.field-remove').addClass('gen-sortable-items');

						var items = !found ? fs.selector : '.gen-sortable-items';

						setSortable(dropZone,items);
					}
				});*/
			}
		}
		
	}

	var setSortable = function(dropZone,items){
		var canDrop = false;
		//console.log(dropZone);
		//console.log(items);
		dropZone.addClass('gen-sortable');

		$.each(dropZone,function(i,drpz){
			var dz = $(drpz);
			//console.log(drpz)
			//console.log	(items)
			dz.sortable({
				scroll				 : false,
				delay 				 : 100,
				forcePlaceholderSize : true,
				connectWith			 : '.gen-sortable'/*'[gen-id="drop-zone"]'*/,
				//containment 		 : "parent",
				//tolerance 			 : "pointer",//pointer
				tolerance 			 : container.sortableOptions.tolerance,
				items 				 : items,
				//placeholder 		 : container.sortableOptions.placeholder,
				/*placeholder  		 : function(){
					return $('<div style="background:red;heigth:25px;width:50px;"/>')
				},*///container.sortableOptions.placeholder,
				//axis: "x",
				helper:'original',
				/*helper : function(e,ui){
					//return $('<div class="gen-field-helper"/>')
					//return $('<div style="visibility:hidden!important;max-height:25px!important;max-width:20%" class="container-setted"/>')
				},*/
				over:function(e,ui){
					//console.log(ui)
					var name     	  = ui.item.attr('name') ? ui.item.attr('name') : ui.item.attr('gen-field-type'),
						isValid       = container.validField(name),
						isHidden      = name == 'hidden',
						_isContextMenu = isContextMenu(name);//container.contextMenu ? name == container.contextMenu.type : false;

					if(name && (!isValid || isHidden || _isContextMenu)){
					
						ui.placeholder.hide();
					}
					else
						container.holder.addClass('sorting');

					
					//container.holder.addClass('fields-sorting');

					if(container.sortableOptions.onOver)
						container.sortableOptions.onOver(e,ui);
				
				},

				sort:function(e,ui){
					if(container.sortableOptions.onSort)
						container.sortableOptions.onSort(e,ui);
				},

				receive:function(e,ui){
					//from another container;
					if(ui.sender && ui.sender.hasClass('gen-sortable')){
						//console.log('FROM ANOTHER')
						var item      = ui.item;
						var name      = item.attr('gen-field-type');

						if(container.validField(name)){
							var iid       = ui.item.attr('gen-field-id');
							var iparentid = item.attr('parent-id');
							var _from     = GEN.getContainer(iparentid);
							var position  = ui.item.index()
							

							if(_from){
								var newfield = _from.GET.field(iid);
								//unset not default properties
								for(var prop in newfield.propertiesOptions){
									newfield.unsetProprieties([prop]);
								}

								_from.removeField(iid,false);
								
								newfield.position = position;

								container.SET.fields([newfield]);

							}
						}

						ui.item.remove();

					}else{
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
							var field = new f.field(type,{
								properties: null
							});

							field.position = position;
							container.SET.fields([field]);
						}

						ui.helper.remove();
					}

					
				},
				start:function(e,ui){
					var name  = ui.helper.attr('name') ? ui.helper.attr('name') : ui.helper.attr('gen-field-type');
					var type  = ui.helper.attr('type');
					//container.holder.addClass('fields-sorting');
					canDrop   = name ? container.validField(name) : true;
				},
				out:function(e,ui){
					container.holder.removeClass('sorting');
				
					if(container.sortableOptions.onOut)
						container.sortableOptions.onOut(e,ui);
				},
				stop: function(e,ui){

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
								var ctrl     		   = 0;
								var notHiddenFieldsArr = [];
								var hiddenFieldsArr    = [];

								$.each(container.holder.find('.gen-fields-holder'),function(pos,fieldHolder){
									var field_id = $(fieldHolder).attr('gen-field-id');
									var field    = container.GET.field(field_id);
									if(field && !field.hidden){
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
						}else{
							//console.log('fields Holder: '+fieldsHolderLength);
							//console.log('container Fields: '+FIELDS.length );
						}
						//console.log(FIELDS)
						container.Transform();
					}
					
					container.holder.removeClass('sorting');

					//container.holder.removeClass('fields-sorting');
					
				}
			});
		})		
	}


	var setDropable = function(holder){//configure droppable element
		//console.log(container.holder[0])
		//if(container.holder.hasClass)
		if(container.holder.data('ui-droppable'))
			container.holder.droppable('destroy');
		
		if(!container.holder.hasClass('gen-container-copy'))
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

					if(container.validField(name)){
						var f = GEN.getDeclaredField(name);
						var field = new f.field(type,{
							properties:null
						});
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
			//try{
			tXSL    = container.XSLT(container.getXSL());
			
			tXML    = $.parseXML(GEN.getXML({
				containersIDs:[container.GET.id()]
			}));

			/*}catch(err){
				console.log(err);
			}*/

			if(tXML && tXSL){
				container.tranforming = true;
				//include css and js before container transform
				setFilesIncludes();

				/*var hasTransformer = container.holder.find('[gen-transformer="true"]')[0];
				var transformer = hasTransformer ? container.holder.find('[gen-transformer="true"]') : container.holder.find('.container-contents');
				var contentSelector = hasTransformer ? '[gen-transformer="true"]':false;
*/				

				

				container.holder.find('.container-contents').XMLTransform({
					xml     	 : tXML,
					xsl     	 : tXSL,
					loading      : false,
					loader  	 : container.holder.find('.c-holder-loading'),
					loadingClass : 'container-loading',
					//preserve     : '[gen-preserve-content="true"]',
					//contentSelector : contentSelector,
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

	container.replaceFieldsGenVars = function(field,context,tmpl){
		
		var stemp 		= tmpl ? tmpl : context ? field.templates[context] : field.template;

		var template    = $.trim( stemp );//container.fieldDefaultTemplate;

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


		/*var replaces_2 = GenVarsReplaceFromCusomStr({
			object   :field,
			begin    :"#'",
			end      :"'#",
			template :template
		});*/


		replaces_1.forEach(function(r){
			var htmlVal = container.appendOnThead ? DATA.get({field:field, type:field.GET.type()}) : r.value;
			template = template.replaceAll(r.expression, r.xslValue);
		});

		/*replaces_2.forEach(function(r){
			template = template.replaceAll(r.expression, r.xslValue);
		});*/

		return template;
	}

	container.replaceContainersGenVars = function(template){
		template = template.replaceAll('#value.rows#', container.GET.path()+"/value/row[not(@total='yes')]");
		template = template.replaceAll('#table.rows#', container.GET.path()+"/table/value/row[not(@total='yes')]");
		template = template.replaceAll('#path#',container.GET.path());
		template = template.replaceAll('#tag#', container.GET.tag());
		template = template.replaceAll('#title#',container.GET.title ? container.GET.title() : "");
		template = template.replaceAll('#collapsible#',container.GET.collapsible ? container.GET.collapsible() : "false");

		template = template.replaceAll('#fields.count#',FIELDS.length);

		var notHiddenFields = $.grep(FIELDS, function( n, i ) {
			return n.type != 'hidden';
		});

		template = template.replaceAll('#fields.count:not(hidden)#', notHiddenFields.length );		

		var replaces_from_attr = GenVarsReplaceFromObjAttr({
			object   :container,
			begin    :'#[',
			end      :']#',
			template :template
		});

		////console.log(replaces_from_attr)

		replaces_from_attr.forEach(function(r){
			template = template.replaceAll(r.expression, r.xslValue);
		});


		return template;
	}

	var addHolderAttr = function(element,attr,val){
		if(element.tagName.indexOf('xsl') == 0){
			addHolderAttr($(element).find('>:first-child')[0],attr,val);
		}else{
			var tattr = element.getAttribute(attr) ? element.getAttribute(attr) : '';
			element.setAttribute(attr,val);			
		}
	}

	var addHolderClass = function(element,dz){
		//$(element).addClass(VARS.class.fieldsHolder);
		if(element.tagName.indexOf('xsl') == 0){
			addHolderClass($(element).find('>:first-child')[0],dz);
		}else{
			var tclass = element.getAttribute('class') ? 
					 	 element.getAttribute('class') : '';
			//if is table set fieldsHolder class in TH
			if(!dz.isTable){
				element.setAttribute('class',tclass+' '+VARS.class.fieldsHolder);
			}
			else{
				element.setAttribute('class',tclass+' gen-table-field-holder');
				console.log('is table')
			}
			
		}
	}

	container.getXSL = function(option){

		if(container.xslOptions.useDefault){

			var xTemp = $($.parseXML(setXmlnsAttr(container.replaceContainersGenVars(container.template))));

			var fields = container.GET.fields();

			if(container.dropZone[0]){		//set field for each dropZone
				
				container.dropZone.forEach(function(dz,didx){
					
					var dropZone = xTemp.find('[gen-id="drop-zone"]')[didx];

					var exclude = dropZone.getAttribute('gen-exclude-type') ? dropZone.getAttribute('gen-exclude-type') : false;

					var only    = dropZone.getAttribute('gen-only-type') ? dropZone.getAttribute('gen-only-type') : false;
					
					var fieldHolderIdx = only ? didx : container.dropZone.fieldsHolderIndex;

					fields.forEach(function(f,idx){
						
						//var isExcluded = exclude && f.type != exclude ? true : false;
						
						//var isOnly     = only    && f.type == only    ? true : false;

						var isExcluded = !exclude ? true : f.type != exclude?true : false;

						var isOnly     = !only    ? true : f.type == only   ?true : false;

						if(isExcluded && isOnly){
							
							if(isDrawable(f.type)){
								var ftemplateContext = dz.template ? dz.template : 'field';
								var iftester 		 = !dz.isTable ? container.GET.path()+'/fields/'+f.GET.tag() : f.GET.tag();
								
								if(container.xml.type =='items')
									iftester = container.GET.path()+"/item[@rel='"+f.GET.tag()+"']";
									//iftester = container.GET.path()+'/item[rel="'+f.GET.tag()+'"]';

								var method = dz.position == 'bottom' ? 'append' : 'prepend';

								if(f.xslOptions.useDefault){

									if(f.templates[ftemplateContext]){

										var fieldTemplateStr = setXmlnsAttr(container.replaceFieldsGenVars(f,ftemplateContext));
										
										var fieldTemplateXML;

										try{
											fieldTemplateXML = $.parseXML(fieldTemplateStr);

											var fHTMLHolder = getFirstHtmlChild(fieldTemplateXML.documentElement);
								
											//if(didx == container.dropZone.fieldsHolderIndex)
											if(didx == fieldHolderIdx)
												addHolderClass(fieldTemplateXML.documentElement,dz);

											if(!fieldTemplateXML.documentElement.getAttribute('gen-item-id'))
												addHolderAttr(fieldTemplateXML.documentElement,'gen-item-id',f.GET.id());
											else
												console.log(fieldTemplateXML.documentElement.getAttribute('gen-item-id'))
												//addHolderClass(fHTMLHolder,dz);
											/*addHolderClass(fieldTemplateXML.documentElement,dz);*/
											//addHolderClass(fHTMLHolder,dz);

											var fieldHolder = $.parseXML('<xsl:if test="'+iftester+'" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:if>');

											//console.log($(fHTMLHolder).html())

											if(fHTMLHolder){
												//field inline style
												if(f.customStyle.inline){
													var style     = fHTMLHolder.getAttribute('style');
													var styleAttr = style ? style+' '+f.customStyle.inline : f.customStyle.inline;
													fHTMLHolder.setAttribute('style',styleAttr)
												}
												//field class
												if(f.customStyle.class){
													var _class     = fHTMLHolder.getAttribute('class');
													var classAttr  = _class ? _class+' '+f.customStyle.class : f.customStyle.class;
													fHTMLHolder.setAttribute('class',classAttr);
												}
												//field ID
												if(f.customStyle.id)
													fHTMLHolder.setAttribute('id',f.customStyle.id);
											}
											
											fieldHolder.documentElement.appendChild(fieldTemplateXML.documentElement);

											$(dropZone)[method](fieldHolder.documentElement)
											
										}catch(e){
											console.log(e);
											console.log(fieldTemplateStr);
											fieldTemplateXML = null;
										}
									}

								}else{
									var fieldTemplateStr = setXmlnsAttr(container.replaceFieldsGenVars(f,null,f.xslOptions.template));
									
									var fieldTemplateXML;

									try{
										
										var fieldHolder = $.parseXML('<xsl:if test="'+iftester+'" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:if>');
										
										fieldTemplateXML = $.parseXML(fieldTemplateStr);

										
										if(didx == fieldHolderIdx)
											
											addHolderClass(fieldTemplateXML.documentElement,dz);

										if(!fieldTemplateXML.documentElement.getAttribute('gen-item-id'))

											addHolderAttr(fieldTemplateXML.documentElement,'gen-item-id',f.GET.id());
									
										else
											console.log(fieldTemplateXML.documentElement.getAttribute('gen-item-id'))

										
										fieldHolder.documentElement.appendChild(fieldTemplateXML.documentElement);
										

										$(dropZone)[method](fieldHolder.documentElement)

									}catch(err){

										console.log(err)
									
									}
									
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
			//container ID
			if(container.customStyle.id)
				mainNode.attr('id',container.customStyle.id);

			//container class
			var classes  = mainNode.attr('class');
			var classSet = classes ? classes+' gen-container-item' : 'gen-container-item'
			
			mainNode.attr('gen-class',container.customStyle.class);

			mainNode.attr('class',classSet+' '+container.customStyle.class);

			mainNode.attr('item-name',container.GET.tag());

			mainNode.attr('gen-item-id',container.GET.id());

			//container inline style
			if(container.customStyle.inline){
				var style    = mainNode.attr('style');
				var styleSet = style ? style+' '+container.customStyle.inline : container.customStyle.inline;
				
				mainNode.attr('style',styleSet);
			}

			if( xTemp.find('gen-template')[0] )
				GENTemplateRenderer.render({
					templates:xTemp.find('gen-template'),
					container:container
				});
			
			var holder ;
			

			if(container.xslValidation){
				
				holder = $.parseXML('<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="'+container.GET.path()+'"/>');
				
				$(holder.documentElement).append(xTemp[0].documentElement);

			}else{

				holder = xTemp[0].documentElement;
			
			}

			return holder;
		
		}else{
				
			var rXsl = null;

			try{

				rXsl = $( $.parseXML(setXmlnsAttr(container.replaceContainersGenVars(container.xslOptions.template))) )[0].documentElement;
			
			}catch(e){

				rXsl = $('<div class="gen-custom-template-error">Error Loading custom template!</div>')[0];
				
			}

			return rXsl;
		
		}
		
	}

	container.XSLToString = function(){
		
		var cContent = '';

		var isXML = container.genXML;

		try{	

			//if(isXML) cContent += '<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="'+container.GET.path()+'">';
			
			
			cContent += 	(new XMLSerializer()).serializeToString(container.getXSL());
			
			//console.log(cContent)
			//if(isXML) cContent += '</xsl:if>';
			


		}catch(e){
			console.log(e);
		}

		return cContent ? cContent : '';
	}

	container.getXML = function(callback){
		var xml;
		//try{
			xml = $.parseXML(GEN.STRUCTURE.GET({
				object:container,
				callback:callback
			}));

		/*}catch(err){
			console.log(err);
		}*/
		return xml;
	}

	container.export = function(includeId){
		var returnId = !includeId ? false : true;
		//var cFields = (container.groups && container.groups.getFieldsByGroupOrder().length == FIELDS.length) ? container.groups.getFieldsByGroupOrder() : FIELDS;
		var cFields  = container.GET.fields();
		var c = {
			genType:'container',
			proprieties:{},
			fields:[],
			style:{
				id    :container.customStyle.id,
				class :container.customStyle.class,
				inline:container.customStyle.inline
			},
			options:{
				autoTag : container.autoTag
			}
		};

		for(var p in container.proprieties)
			c.proprieties[p] = container.GET[p]();

		if(container.copyOptions){
			//console.log(container.copyOptions)
			c.copy = {
				id          :container.copyOptions.id,
				container   :container.copyOptions.container,
				description :container.copyOptions.description
			}

		}else{

			cFields.forEach(function(f){
				c.fields.push(f.export());
			});

			if(container.contextMenu && container.contextMenu.items[0]){
				c.contextMenu = [];
				container.contextMenu.items.forEach(function(ctx){
					c.contextMenu.push(ctx.export())
				});
			}

		}
		
		if(container.xslOptions){
			
			var useDefault = container.xslOptions.useDefault;
			
			c.xsl = {
				useDefault : useDefault
			}

			if(!useDefault)
				c.xsl.template = container.xslOptions.template;
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
		fieldsByType:function(type){
			var fields = container.GET.fields();
			var rtn = [];
			fields.forEach(function(f){
				if(f.type==type){
					rtn.push(f);
				}
			});
			return rtn;

		},
		contextMenuFields:function(){
			return container.contextMenu ? container.contextMenu.getFields() : false;
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
				if(container.template){
					if(val){
						if(container.template.indexOf(VARS.templates.tittleCollapserStr) == -1)
							container.template = container.template.insert(idx+1,VARS.templates.tittleCollapserStr);
					}else{
						container.template = container.template.replace(VARS.templates.tittleCollapserStr,'');
					}
				}else{

				}

				if(container.onHasTitleSet)
					container.onHasTitleSet(val);
				//if(transform) container.Transform();
			
			}catch(e){
				console.log(e);
			}
		},
		collapsible:function(val,p){

			container.proprieties.collapsible = val;

			if(container.onCollapsibleSet)
				container.onCollapsibleSet(val);

		},
		name:function(name,p){

			container.proprieties.name = name;

			container.onNameSet(name);

		},
		tag:function(tag,p){

			container.proprieties.tag = replaceSpecialChars(tag);
			
			_EVENTS.execute('tag-change',container.proprieties.tag);

			container.holder.find('> .container-settings > .container-settings-title').text(container.GET.tag());

			container.onTagSet(container.GET.tag());
		
		},
		field:function(field,callback){

			if(container.canRecieveFields){

				container.receiving = true; 

				field.parent = container;

				field.order  = field.order>=0 ? field.order : FIELDS.length;

				if(container.groups) 

					container.groups.setFieldGroup(field);
				
				field.init();

				if(container.contextMenu && field.GET.type() == container.contextMenu.type){
					
					setContextMenuField(field,{
						callback:callback

					});

				}else{
					//hidden fields or 
					if(field.hidden || !isDrawable(field.GET.type())){
						
						container.onFieldSet(field);

						if(container['on'+capitalizeFirstLetter(field.GET.type())+'FieldSet'])
							
							container['on'+capitalizeFirstLetter(field.GET.type())+'FieldSet'](field);

						FIELDS.push(field);

						_EVENTS.execute('field-set',field);

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

								_EVENTS.execute('field-set',field);
								
								container.receiving = false; 

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
				//console.log(fields)
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

	container.copy = function(o){	
		
		container.copyOptions = o;
		//container.holder.removeClass('gen-container-copy');
		if(container.copyOptions && container.copyOptions.settings){
			var s = container.copyOptions.settings;
			//set properties!
			setProprietiesValues( container.copyOptions.settings.proprieties );
			//setFields && ctx fields
			var settedFields = [];
			var ctxFields = container.contextMenu && s.contextMenu ? container.contextMenu.getGenFields(s.contextMenu) : [];
			
			FIELDS = [];
			
			if(container.contextMenu)
				container.contextMenu.items = [];

			if(s.fields[0]){
				var fields = (s && s.fields && s.fields[0]) ? s.fields : [];
				
				fields.forEach(function(_field){
					var f = GEN.getDeclaredField(_field.properties.type);
					if(f) settedFields.push(new f.field(_field.properties.type,_field));
				});
			}
			
			settedFields = settedFields.concat(ctxFields);

			container.SET.fields(settedFields);

			if(s.contents && container.setContents){
				container.setContents(s.contents);
			}

			setCopyClass();
		}
	}

	container.includeCss = function(_name,p){
		var name    = _name ? _name : container.GET.type();
		var params  = p ? p : {};
		var cssPath = GEN.path+'/types/containers/'+container.GET.type()+'/css/'+name+'.css';

		if(!GEN.viewFileIncluded(cssPath,'css'))
			$('html head').append('<link type="text/css" href="'+cssPath+'" rel="stylesheet">');
	}

	var setCopyClass = function(){
		if(container.copyOptions){
			container.holder.addClass('gen-container-copy');
			container.holder.find('.gen-adder-btn').hide();
			if(container.contents)
				container.holder.find('.'+VARS.class.containersHolder).addClass('gen-container-copy');
		}else{
			container.holder.removeClass('gen-container-copy');
			container.holder.find('.gen-adder-btn').show();
			if(container.contents)
				container.holder.find('.'+VARS.class.containersHolder).removeClass('gen-container-copy');
		}
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

	//	console.log(field);

		container.contextMenu.items.push(field);

		if(container.onContextMenuSet) container.onContextMenuSet(field);

		container.receiving = false;

		if(p.callback) p.callback();
	}

	var getDropZonesFieldsTemplate = function(p){
		//GET THE FIELD TEMPLATE FOR EACH DROP ZONE ON THE CONTAINER XSL
		var index = p.index ? p.index : 0;

		if(index < container.dropZone.length){

			var dz      = container.dropZone[index];
			var context = dz.template ? dz.template : 'field';

			TEMPLATES.GET.field({
				field   : p.field.GET.type(),
				context : context,
				container:container.GET.type(),
				genType  : container.genType,
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
				//try{
					p.callback();
				/*}catch(er){
					console.log(er)
				}*/
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

	var setPropertyOptions = function(p){
		container.propertiesOptions[p.name] = {};
		for(var k in p){
			container.propertiesOptions[p.name][k] = p[k];
		}
		container.propertiesOptions[p.name].isDefault = false;

	}

	container.isPropretyDefault = function(name){
		//var rtn = true;
		return container.propertiesOptions[name] ? false : true;
	}

	container.getPropertyOptions = function(name){
		return container.propertiesOptions[name];
	}

	container.setPropriety = function(p){
		//console.log(p);
		if(p.name != 'type' && p.name != 'tag'){

			container.proprieties[p.name] = p.value;

			setPropertyOptions(p);
			
			if(p.label) container.propertiesLabels[p.name] = p.label;

			/* setter */
			var isInt = typeof p.value == 'number';
			
			if(p.editable == false) //{
				 notEditableAttrs[p.name] = true;
			//}else{
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

				//console.log(p.value)

				if(typeof p.value == 'object')
					container.proprieties[p.name].value = _value;
				else
					container.proprieties[p.name] = _value;

				if(!hasChangeEvent && p.onChange)
					p.onChange(_value);

				//if(p.transform && transform) 
					//container.Transform();
			}

			if(typeof p.value == 'boolean' && p.xslValue)
				container.xslValues[p.name] =  p.xslValue;

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

	container.setProperty = container.setPropriety;
	/*init*/
	container.init = function(callback){
		try{
			
			setVars();

			setEvents();
			//if(container.fields) setDropable();
			if(params.copy)
				setCopyClass();

			if(container.groups) SETUPGROUPS();

			if(container.contextMenu) SETUPCONTEXTMENU();

			if(container.xml.type == 'text'){

				container.setPropriety({
					name:'text',
					order:0,
					size:'12',
					inputType:'texteditor',
					value:container.xml.dataExample ? container.xml.dataExample : capitalizeFirstLetter(container.type)
				});

				container.setPropriety({
					name:'maxlength',
					value:4000
				});

			}



			var templateCallback = function(contents){
				//console.log(contents)
				if(contents.template){
					
					var contextMenuFields = container.contextMenu ? container.contextMenu.getGenFields() : [];
					var fields            = (params && params.fields && params.fields[0]) ? params.fields : [];
					var settedFields      = fields.concat(contextMenuFields);

					container.fieldDefaultTemplate = contents.fields.field;

					container.template = contents.template;
					
					container.ready();

					_EVENTS.execute('ready',container);

					if(container.proprieties.hasOwnProperty('collapsible')){
						container.setPropriety({
							name  : 'collapsed',
							value : false

						});
					}
					
					setUpTemplate();

					setProprietiesValues();

					if(container.accept.length == 1 && container.accept[0] != ''){
						
						addButtonConfig(container.accept[0]);
						
						var autoSet = container.autoSetField == false ? false : true;
						
						var foundCopy = container.copyOptions && container.copyOptions.found == false ? false : true;

						if(!settedFields[0] && autoSet && foundCopy)
							addUniqueField(container.accept[0],callback);
						

					}

					if(settedFields[0]) 
						container.SET.fields(settedFields,null,function(){
							callback();
							container.complete();
						});
					else
						container.Transform({
							callback:function(){
								callback();
								container.complete();
							}
						});


				}else
					console.log('template not found: '+container.type)
			};

			var templateError = function(e){
				GEN.removeContainer(container.id);
				console.log('template not found: '+container.type);
			}

		
			TEMPLATES.GET.container({
				name:container.type,
				genType:container.genType,
				getField:container.fields,
				callback:templateCallback,
				error:templateError
			});


		}catch(e){ 
			console.log(e); 
		}

		//console.log(container)
	}


	container.on = function(evs,callback,once){
		var events    = evs.split(',');
		
		events.forEach(function(ev){
			var eventList = _EVENTS.get($.trim(ev));
			if(eventList && callback && typeof callback == 'function'){
				if(once){
					if(!_EVENTS.isDeclared(ev,callback))
						eventList.push(callback)
				}
				else eventList.push(callback)
			}
		});
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

			//console.log(xTemp.find('[gen-transformer="true"]'))

			$.each(xTemp.find('[gen-id="drop-zone"]'),function(i,dz){
				//set drop zone
				var isTable = false;

				$.each($(dz).parents(),function(ix,parent){
					if(parent.tagName == 'xsl:for-each'){
						isTable = true;
						container.hasTableRows = true;
					}
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

			//console.log(fieldsSelector)
		}
		
	}

	container.validField = function(name){
		
		var valid = true;

		if(container.reject[0]){
			for(var x = 0; x < container.reject.length; x++){
				if(container.reject[x] == name){
					valid = false;
					break;
				}
			}
		}
		if(container.accept[0])

			valid = $.inArray(name,container.accept) >= 0;

		return valid;
	}

	var addUniqueField = function(name,cb){
	
		var name = name || container.accept[0];
		var f    = GEN.getDeclaredField(name);
		
		if(f){

			var field = new f.field(name,{
				properties:null
			});
		
		 	container.SET.fields([field],null,cb);
		}
		

		return false;
	};

	var addButtonConfig = function(name){
		var adder = $('<button class="btn btn-box-tool gen-adder-btn"><i style="color:green" class="fa fa-plus"></i></button>');
		
		
		adder.on('click',function(){

			addUniqueField();

			return false;
		});


		container.holder.find('.gen-container-setts').prepend(adder)
	}
	var setVars = function(){//set container global vars

		container.type   = name;

		container.id     = container.type+(new Date()).getTime();
		
		container.folder = VARS.genPath+'/types/containers/'+name;

		container.reject = $(VARS.html.containers+'[name="'+name+'"]').attr('reject') ? $(VARS.html.containers+'[name="'+name+'"]').attr('reject').split(',') : [];
						   
		container.accept = $(VARS.html.containers+'[name="'+name+'"]').attr('accept') ? $(VARS.html.containers+'[name="'+name+'"]').attr('accept').split(',') : [];
		
		container.fields =  $(VARS.html.containers+'[name="'+name+'"]').attr('hasField') == 'false' ? false : true;

		container.holder = getContainerHolder(container);

		container.SET.tag(container.incrementTag('container',name));

		//set drawable options
		GEN.getDeclaredFields().forEach(function(f){
			var _isValid = (!container.validField(f.type) || f.type == 'hidden') ? false : true;
			container.options.draw[f.type] = _isValid;
		});


		container.genType = 'container';
	}
	var setProprietiesValues = function(o){
		
		var properties = o ? o : params && params.proprieties ? params.proprieties : {} ;
		
		if(properties){
			for(var p in properties){
				if(container.SET[p])
					container.SET[p](properties[p],{transform:false});
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
		
		container.contextMenu.getGenFields = function(o){
			var rtn      = [];
			var ctxSetts = o ? o : params && params.contextMenu ? params.contextMenu : [];
			
			if(ctxSetts[0]){
				ctxSetts.forEach(function(ctx){
					
					var vCtx = ctx.properties ? ctx : {
						properties : ctx
					}

					var declaredCtx = GEN.getDeclaredField(vCtx.properties.type);
					if(declaredCtx)
						rtn.push(new declaredCtx.field(vCtx.properties.type,vCtx));
				});

			}
				
			return rtn;
		}

		container.contextMenu.getFields = function(){
			return container.contextMenu.items;
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
		var holder = $(VARS.getContainerSettsHtml(container));
		//edit click
		holder.find('.container-edit').on('click',function(e){
			
			e.preventDefault();

			GEN.edit(container,e);

			console.log('edit')
			
			e.stopPropagation();

			return false;
		});	

		holder.find('.container-clone').on('click',container.clone);

		holder.on('click','.field-clone',function(e){
			
			e.preventDefault();

			var btn       = $(this),

				isCtx     = btn.parents('.gen-ctx-menu-holder')[0] ? true : false;

				fieldHtml = isCtx ? btn.parents('.gen-ctx-menu-holder') : btn.parents('.gen-fields-holder'),

				fieldID   = fieldHtml.attr('gen-field-id');

			if(fieldID){

				var fieldSrc  = isCtx ? container.contextMenu.getField(fieldID) : container.GET.field(fieldID);
				
				if(fieldSrc){

				 	var fType  = fieldSrc.type,

				 		dfield = GEN.getDeclaredField(fType),

				 		params = fieldSrc.export();

				 	params.properties.tag = container.incrementTag('fields',params.properties.type);

				 	var field = new dfield.field(fType,params);

				 	field.position = fieldSrc.holder.index()+1;

				 	container.SET.fields([field]);

				}

			}
				
			return false;
		});	

		//remove click
		holder.find('.container-remove').on('click',function(){
			if(confirm('Remover Container?'))
				GEN.removeContainer(container.GET.id());
			//return false;

		});

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
			return false;
		};

		__params.onRemove = p && p.onRemove ? p.onRemove : function(e){
			var fieldHolder = $(e.target).parents('.'+VARS.class.fieldsHolder)[0] ? 
							  $(e.target).parents('.'+VARS.class.fieldsHolder)    :
							  $(e.target).parents('.'+VARS.class.ctxMenuHolder);
			var fieldId     = fieldHolder.attr('gen-field-id');
			container.removeField(fieldId);
			return false;
		};

		var holder = $(VARS.getFieldsSettsHtml(field));
		
		holder.find('.field-edit').on('click',function(e){
			//console.log(e);
			e.preventDefault();
			__params.onEdit(e);
			e.stopPropagation();
			return false;
		});

		holder.find('.field-remove').on('click',function(e){
			e.preventDefault();
			__params.onRemove(e);
			return false;
		});
		
		return holder;
	}

	container.incrementTag = function(type,name,idx){
		
		var index = idx ? idx : 1;

		var objects = type == 'container'   ? GEN.getContainers() : 
					  type == 'contents'    ? container.contents  :
					  container.contextMenu ? FIELDS.concat(container.contextMenu.getFields()) : FIELDS;
		
		var rtn = name+'_'+index;;

		for(var i = 0; i < objects.length; i++){
			var c = objects[i];

			if(c.GET.tag && c.GET.tag() == rtn){
				var arr = rtn.split('_');
				var _i  = parseInt(arr[arr.length-1])+1; 
				rtn = container.incrementTag(type,name,_i);
			}
		}
		
		return rtn;
	}

	container.getColumn = function(){
		return $(container.holder.parents('.gen-column')[0]);
	};


	container.getRow = function(){
		var col = container.getColumn();
		return col.parent();
	};

	container.validTagName = function(f){

		var tag = container.incrementTag('fields',f.properties.tag);
		
		//console.log(tag);

		if(GEN.tags.valid(tag,f)){

			f.properties.tag = tag;

		}else{

			container.validTagName(f);

		}
	};

	container.clone = function(){

		var row = container.getRow(),

			col = container.getColumn(),

			params = container.export();

		params.fields.forEach(function(f){
			
			container.validTagName(f);

		});

		params.proprieties.tag = container.incrementTag('container',container.type);

		var clone = {
			name   : container.type,
			row    : row,
			column : col,
			index  : container.holder.parent().index()+1, 
			clone  : true, 
			params : params
		};

		GEN.dropContainers_ROW( [clone] , {});

		return false;

	};

	

	var setEvents = function(){

		$(document).on('click','.gen-activate-fields-tab',function(){
			$('#igrp-sidebar .nav-tabs li a[href="#gen-list-fields"]').click();
		});
		
		$(window).resize(function(){
			container.onWindowResize();
		});
		
		container.holder.on('click','>.container-contents .gen-copy-from',function(e){
			e.preventDefault();
			GEN.edit(container,{
				tab:'copy'
			});
			e.stopPropagation();
			return false;
		});

		container.holder.on('dblclick','.gen-fields-holder',function(e){
			e.preventDefault();
			var id     = $(this).attr('gen-field-id');
			var field  = id ? container.GET.field(id) : false;
			
			if(field)
				GEN.edit(field,e);
			
			e.stopPropagation();

			return false;
		});

	}

	

	//_EVENTS LISTNERS
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

	

}