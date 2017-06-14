var GENERATOR = function(genparams){
	var GEN                = this;
	
	var declaredContainers = [];
	var declaredFields     = [];
	var CONTAINERS         = [];
	var TMPL_INCLUDES      = [];
	var modules            = null;
	var counter            = 0;
	var xslEditing         = false;

	var baseXslSet         = false;

	var configDataSet 	   = false;

	/*EVENTS ARRAY*/
	var readyEvents = [];

	var xslTmplPath = path+'/xsl/tmpl/';
	
	GEN.svApplet           = null;

	GEN.XML                = $($.parseXML(VARS.xml.init));

	GEN.XSL                = null;

	GEN.importing          = false;
	
	GEN.STRUCTURE          = new GENSTRUCTURES();

	GEN.path               = path+'/extensions/formgen';

	GEN.defaultIncludes    = ['home-include','slide-menu'];

	//var hasChanged    = false;

	GEN.init = function(){
		setVars();
		getConfigData();
		getBaseXSL();
		setEvents();
	}

	GEN.getContainer = function(id){
		var rtn = null;
		for(var x = 0; x < CONTAINERS.length; x++){
			if(CONTAINERS[x].id == id){
				rtn = CONTAINERS[x];
				break;
			}
		}
		return rtn;
	}

	GEN.getContainers = function(){
		return CONTAINERS;
	}

	GEN.validateContainerTag = function(container){
		var count = 0;
		CONTAINERS.forEach(function(c,i){
			if(c.GET.type() == container.GET.type()){
				count++;
				if(c.proprieties.tag == container.proprieties.tag)
					container.proprieties.tag = container.GET.tag()+count;
			}
		});
	}

	var tagsIncr = {};

	var isTagValid = function(tag){
		var rtn = true;
		for(var i = 0; i < CONTAINERS.length; i++ ){
			var o = CONTAINERS[i];
			
			if(o.GET.tag() == tag){
				rtn = false;
				break;
			}
		}
		return rtn;
	}

	var validateTag = function(tag,incr){
		var validTag = tag;
		var objects  = GEN.getContainers();
		var idx = incr ? incr+1 : 1;
		
		if(isTagValid(validTag+'_'+idx)){
			validTag = validTag+'_'+idx;
		}else{
			validTag = validateTag(tag,idx);
		}
		//console.log(idx);
		//console.log(isTagValid(tag+'_'+idx))
		//validTag = isTagValid(tag+'_'+idx) ? tag+'_'+idx : validateTag(tag,idx);
		return validTag;
	}

	GEN.initContainer_ROW = function(p){
		try{	
			var type        = p.container.GET.type();

			var placeHolder = p.placeholder ? p.placeholder : p.column.find('>.gen-column-inner >'+VARS.html.containersPlaceHolder);

			var callback    = p.callback ? p.callback : false;
			
			var fromSortable= placeHolder.find('>'+VARS.html.declaredContainers+':eq('+p.index+')')[0];

			var holder = p.holder && p.holder[0] ? p.holder : getItemBeforeDrop(type);

			p.container.order = p.index;

			CONTAINERS.push(p.container);

			//init container: declare container holder
			p.container.init(callback);

			holder.append(p.container.holder);

			if(!fromSortable)
				p.column.find('> .gen-column-inner >'+VARS.html.containersPlaceHolder).append(holder);

			counter++;

		}catch(e){
			console.log(e);
		}
	}

	GEN.setContainer = function(container){
		var genXMLElement = GEN.XML.find('content > '+container.GET.tag());

		if(genXMLElement[0])
			genXMLElement.replaceWith(containerXML.documentElement);
		else
			GEN.XML.find('content').insertAt(containerXML.documentElement,container.order);
	}

	GEN.getXML = function(p){
		var _params = p ? p : {};
		var rtn      = '',
		    filename = GEN.DETAILS ? GEN.DETAILS.filename     : '',
		    page     = GEN.DETAILS ? GEN.DETAILS.page         : '',
		    app      = GEN.DETAILS ? GEN.DETAILS.app          : '',
		    actionD  = GEN.DETAILS ? GEN.DETAILS.action_descr : '';

		rtn+='<?xml-stylesheet href="../'+filename+'" type="text/xsl"?>';
		rtn+='<rows>';
			rtn+=VARS.xml.site;
			//page
			rtn+='<page>'+page+'</page>';
			//app
			rtn+='<app>'+app+'</app>';
			//plsql
			rtn+=VARS.xml.plsql();
			//content
			rtn+='<content>';
				rtn+='<title>'+actionD+'</title>';
				//containers
				if(_params.containersIDs){
					_params.containersIDs.forEach(function(id){
						var container = GEN.getContainer(id);
						if(container && container.getXML())
							rtn+= $(container.getXML()).getXMLStr();
					});
				}else{
					GEN.getContainers().forEach(function(c){
						if(c.getXML()) 
							rtn+= $(c.getXML()).getXMLStr();
					});
				}
			rtn+='</content>';
		rtn+='</rows>';
		return rtn;
		//return $.parseXML(rtn);
	}

	GEN.getXSL = function(){

		var _c = getXSLTop();

		var layoutRows = GEN.layout.getRows(true);

		_c+= GEN.designRows(layoutRows);

		_c+=getXSLBottom();
		
		return _c;
	}

	GEN.designRows = function(layoutRows,p){
		var dParams = p ? p : {};

		var _c = '';
		layoutRows.forEach(function(row,i){
			_c += '<div class="gen-row">';
			row.columns.forEach(function(column,cidx){
				_c+='<div class="gen-column '+column.size+'"><div class="gen-inner">';
				column.containers.forEach(function(_container){
					var container = GEN.getContainer(_container.id);
					if(container){
						_c += '<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="'+container.GET.path()+'">';
						_c += container.XSLToString();
						_c +='</xsl:if>';
					}
				});
				_c+='</div></div>';
			});
			_c += '</div>';
		});

		_c = _c.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','')
		
		return _c;
	}

	GEN.removeContainer = function(id){
		for(var x = 0; x < CONTAINERS.length; x++){
			var container = CONTAINERS[x];
			
			if(container.id == id){
				var idx = CONTAINERS.indexOf(container);

				if(idx > -1){
					container.onRemove();
					CONTAINERS.splice(idx,1);
					container.holder.parent().remove();
				}
				
				if(GEN.edit.object && container.id == GEN.edit.object.id) GEN.edit.hide();

				counter--;
				
				break;
			}
		}
	}

	var removeAllContainers = function(){
		for(var x = CONTAINERS.length-1 ; x >= 0 ; x-- ){
			GEN.removeContainer(CONTAINERS[x].id);
		}
		$(VARS.layout.rows).remove();
	}

	var setUndeclared = function(c){

		var liHolder = $('.gen-declared-containers:eq('+c.index+')',c.column);
		
		if(liHolder.attr('type') == c.name)
			liHolder.addClass('gen-undeclared');

		console.log(c.name+' not declared!')
	}

	GEN.dropContainers_ROW = function(containers,params){

		//console.log(containers);

		hasChanged = true;

		var indx = params && params.index >= 0 ? params.index : 0;
		
		if(indx < containers.length){
			
			var dropped  = containers[indx];
			//CONTAINER
			var declared = GEN.getDeclaredContainers(dropped.name);
			if(declared){
				var fields = [];				
				//setFields object to Fields()
				if(dropped.params && dropped.params.fields && dropped.params.fields[0]){
					dropped.params.fields.forEach(function(_field){
						var f = GEN.getDeclaredField(_field.type);
						
						if(f) fields.push(new f.field(_field.type,_field));
					});

					//field.holder.find('[name]')

					dropped.params.fields = fields;
				}

				var container = new declared.container(dropped.name,dropped.params);

				GEN.initContainer_ROW({
					container  : container,
					index      : dropped.index,
					holder     : dropped.holder,
					row        : dropped.row,
					column     : dropped.column,
					placeholder: params.placeholder ? params.placeholder : null,
					callback   : function(){
						GEN.dropContainers_ROW(containers,{
							index:indx+1,
							callback: params ? params.callback : null
						});
					}
				});
			}else{
				setUndeclared(dropped);
				GEN.dropContainers_ROW(containers,{
					index:indx+1,
					callback: params ? params.callback : null
				});
			}

		}else if(params.callback) params.callback();
		
	}
	
	GEN.declareContainer = function(d){
		if(!GEN.getDeclaredContainers(d.name)){
			declaredContainers.push(d);
			$(VARS.html.containers+'[name="'+d.name+'"]').addClass('active');//set container html visible
		}else{
			console.log('container exists!')
		}
	}

	GEN.getDeclaredContainers = function(name){
		var rtn = null;
		for(var x = 0; x < declaredContainers.length; x++){
			if(declaredContainers[x].name == name){
				rtn = declaredContainers[x];
				break;
			}
		}
		return rtn;
	}

	GEN.getAllDeclaredContainers = function(){
		return declaredContainers;
	}

	GEN.declareField = function(f){
		if(!GEN.getDeclaredField(f.type)){
			declaredFields.push(f);
			$(VARS.html.fields+'[type="'+f.type+'"]').addClass('active');//set container html visible
		}else{
			console.log('field exists!')
		}
	}

	GEN.getDeclaredField = function(type){
		var rtn = null;
		for(var x = 0; x < declaredFields.length; x++){
			if(declaredFields[x].type == type){
				rtn = declaredFields[x];
				break;
			}
		}
		return rtn;
	}

	GEN.getDeclaredFields = function(){
		return declaredFields;
	}

	GEN.edit = function(object,e){

		GEN.edit.hide();

		GEN.edit.object = object;
		
		var genType = object.genType;
		var type    = object.GET.type();
		var id      = object.GET.id();
		
		$(VARS.edition.dialog).attr('gen-type',genType);
		$(VARS.edition.dialog).attr('object-type',type);
		$(VARS.edition.dialog).attr('object-id',id);

		var fixedList = $('<ul id="gen-p-list-details"/>');

		var booleansH = [];
		
		$('#gen-p-type input').val(type);

		$(VARS.edition.table).html('');

		for(var p in object.proprieties){ // ciclo nas proprieades do elemento

			if(object.isEditable(p) && p != 'type' && p != 'name'){

				var tholder = $('<div class="col item proprieties-holder"/>')
				
				var tr = HTML({
					tag   :'div',
					class :VARS.edition.class.setterHolder+' igrp_item',
					rel   :p
				});

				var tdLabel = HTML({
					tag:'label',
					class:VARS.edition.class.label,
					text:p
				});

				var tdValue = HTML({ tag:'div',class:VARS.edition.class.value});

				switch(typeof object.proprieties[p]){
					case 'string': // text input

						tr.addClass('text');
						
						var attrs       = [{name:'type',value:'text'}];
						
						if( p == 'tag' ){
							var autoTagInpt = $('<input alt="Auto Tag" title="Auto Tag" class="checker" type="checkbox" rel="gen_autotag"/>');
							var autoTag = object.autoTag ? true : false;

							if(autoTag) attrs.push({ name: 'disabled', value: true });
							
							autoTagInpt.prop('checked',autoTag);
							tr.append(autoTagInpt);
						}

						input = HTML({
							tag  :'input',
							val  :object.proprieties[p],
							attrs:attrs
						});

					break;
					case 'number': // text input
						tr.addClass('number');
						
						input = HTML({
							tag  :'input',
							val  :object.proprieties[p],
							attrs:[ {name:'type',value:'number'} ]
						});
					break;
					case 'boolean': // text input
						
						var appendToTitle = p == 'hasTitle' || p == 'collapsible' ? true : false;

						tholder.removeClass('col').addClass('col-1-2');
						tr.addClass('checkbox');

						input = HTML({
							tag  :'div',
							//class:'checker',
							//attrs:[ {name:'type',value:'checkbox'} ],
							html:function(){
								var chck = HTML({
									tag  :'input',
									class:'checker',
									attrs:[ {name:'type',value:'checkbox'},{name:'rel',value:p} ],
										
								});

								var lbl = HTML({
									tag  :'span',
									class:'checker-lbl',
									text : p
								});

								chck.prop('checked',object.proprieties[p]);

								return [chck,lbl];
							}
						});

						tdLabel = null;

						if(appendToTitle){
							var titleTr     = $(VARS.edition.table).find('.'+VARS.edition.class.setterHolder+'[rel="title"]');
							var titleHolder = titleTr.find('.'+VARS.edition.class.value);
							var titleInput  = titleTr.find('.'+VARS.edition.class.propSetter+'[rel="title"]');
							
							if(p == 'hasTitle'){
								if(!object.proprieties[p])
									titleInput.attr('disabled','disabled')

								input.find('input').on('change',function(){
									var isChecked = $(this).is(':checked');									
									if(isChecked)
										titleInput.removeAttr('disabled');
									else
										titleInput.attr('disabled','disabled');
								});
							}

							input.attr('title',capitalizeFirstLetter(p));
							input.attr('alt',capitalizeFirstLetter(p));
							input.attr('rel',p);

							input.addClass(VARS.edition.class.propSetter);

							titleHolder.append(input);
							input = null;
						}



					break;
					case 'object':
						//has options declared: select (combobox)
						if(object.proprieties[p].options){
							tr.addClass('select');							
							input = HTML({
								tag  :'select',
								attr : ['chosen','select'],
								html : function(){
									var options = []
									object.proprieties[p].options.forEach(function(o){
										var attrs = o.attributes ? o.attributes : [];
								
										var option = HTML({
											tag : 'option',
											val : o.value,
											text: o.label,
											attrs:attrs
										});

										if(o.value == object.proprieties[p].value)
											option.attr('selected',true);

										options.push(option)
									});
									return options;
								}
							});
						}else if(object.proprieties[p].setter){
							input = object.proprieties[p].setter();
						}else{
							tr.addClass('text');
							input = HTML({
								tag  :'input',
								val  :object.proprieties[p].value,
								attrs:[ 
									{ name:'type',value:'text' } ,
									{ name:'change-event', value:object.proprieties[p].changeEvent ? object.proprieties[p].changeEvent : ''}
								]
							});
						}
					break;
					default:
						input = HTML({
							tag  :'input',
							val  :object.proprieties[p],
							attrs:[ {name:'type',value:'text'} ]
						});
				}

				if(input){
					input.attr('rel',p);
					
					input.addClass(VARS.edition.class.propSetter);
					
					tdValue.append(input);

					if(tdLabel) tr.append(tdLabel);
					
					tr.append(tdValue);

					tholder.append(tr);
					
					if(tr.hasClass('checkbox'))
						booleansH.push(tholder[0]);
					else			
						$(VARS.edition.table).append(tholder);
				}
			}
		}

		$(VARS.edition.table).append(booleansH)

		IGRP_selectChosen(); 

		GEN.setEditionDialogPosition(e);
		//configEditionDialog(e);
	}

	GEN.edit.XSLEditor = null;

	GEN.edit.show = function(){
		GEN.shadow(true);
		$(VARS.edition.holder).addClass('active');
	}

	GEN.edit.hide = function(){
		
		GEN.SETTINGS.hide();

		//GEN.TABS.hideSettings();
		
		GEN.edit.XSLEditor.setValue('');

		$('#content[rel="gen-contents-holder"]').removeClass('editing');

		$(VARS.edition.holder).removeClass('active');

		$(VARS.edition.dialog).attr('gen-type','');
		$(VARS.edition.dialog).attr('object-type','');
		$(VARS.edition.dialog).attr('object-id','');

		if(GEN.edit.object) {
			GEN.edit.object.holder.removeClass('on-edition');
			GEN.edit.object.holder.parents('.container-contents').find('#'+GEN.edit.object.GET.id()).removeClass('on-edition');
		}


		xslEditing = false;

		GEN.edit.object = null;

		GEN.shadow(false);

		GEN.resizeView();
	}

	GEN.templates = {
		container : {
			
		},
		field     : {

		},
		set:function(p){
			//if(!GEN.templates[p.genType][p.name]){
			var object = GEN.templates[p.genType][p.name] ? GEN.templates[p.genType][p.name] : GEN.templates[p.genType][p.name] = {};
			
			if(p.template)
				object.template = p.template;

			if(p.fieldTemplate)
				object.field = p.fieldTemplate;

			if(p.container && p.fieldContainerTemplate)
				object[p.container] = p.fieldContainerTemplate;

		},
		get:function(p){
			return GEN.templates[p.genType][p.name]
		}
	}


	GEN.getAllFields = function(){
		var rtn = [];
		
		$.each($('.gen-container-holder'),function(i,c){
			var id        = $(c).attr('id');
			var container = GEN.getContainer(id);
			if(container){
				rtn.push({
					container : container,
					fields    : container.GET.fields()
				});
			} 
		});

		return rtn;
	}


	GEN.writeCode = function(){
		var rtn;
		var content = GEN.baseXSL.top;
		
		CONTAINERS.forEach(function(container){
			content = content+container.genXSL();
		});

		content = content+GEN.baseXSL.bottom;

		rtn = content;
		
		return rtn;
	}

	GEN.on = function(ev,callback){
		switch(ev){
			case 'dialog-edition-hide':

			break;
			case 'ready':
				readyEvents.push(callback);
			break;
		}
	}

	var executeEvents = function(evs,param){
		try{
			evs.forEach(function(ev){
				ev(param);
			});
		}catch(e){
			console.log(e);
		}
	}

	var _import = function(op){
		if(op){
			$('body').addClass('importing');
			//GEN.onImportStart();
		}else{
			$('body').removeClass('importing');
			//GEN.onImportEnd();
		}
		GEN.importing = op;
	}
	
	var strToJson = function(str){
		rtn = false;
		try{
			rtn = $.parseJSON(str);
		}catch(e){
			_import(false);
			console.log('invalid json:');
			console.log(str);
			GEN.layout.addRow({ index:0 })
		}
		return rtn;
	}
	
	GEN.import = function(data,_p){
		
		//console.log(_p.callback);
		var arr = [];
		
		var json = typeof data == 'string' ? strToJson(data) : data;
	
		if(!json.rows){
			var rows = json;
			json = {
				rows:rows
			}
		}

		if(json){
			//draw page rows
			if(json.rows && json.rows[0]){
				removeAllContainers();

				var arr = GEN.addContainersPerRow(json.rows);

				GEN.dropContainers_ROW(arr,{
					callback:function(){
						if(_p && _p.callback) _p.callback();
						
						$(window).resize();
						
						done();
						_import(false);
					}
				});

			}else{
				if(json && (!json.rows || !json.rows[0])) GEN.layout.addRow({index:0});
				done();
				_import(false);
				if(_p && _p.callback) _p.callback();
			}

			if(json.plsql){
				for(var p in json.plsql){
					GEN.SETTINGS.SET(p,json.plsql[p]);
				}
			}
		}
	}

	GEN.addContainersPerRow = function(rows,parent){
		var arr = [];
		
		rows.forEach(function(_row,index){
	
			GEN.layout.addRow({
				index:index,
				columns:_row.columns,
				parent: parent ? parent : false,
				callback:function(p){
				
					p.columns.forEach(function(c){

						c.containers.forEach(function(params,containerIndex){
							var name        = params.proprieties.type;
							
							var container   = {
								name        : name,
								params      : params,  
								row         : p.row,
								column      : c.html,
								index       : containerIndex,
							}
						
							arr.push(container);
						});
					});
				}
			});
		});

		return arr;

	}

	GEN.export = function(){
		var page = {
			rows    : GEN.layout.getRows(),
			plsql   : GEN.SETTINGS.toJson()
		}
		//console.log(page);		
		console.log(JSON.stringify(page));
		return JSON.stringify(page);
	}

	GEN.getDefaultIncludesStr = function(relative){
		var rtn = "";
		var iPath = relative ? '../..' : path;
		GEN.defaultIncludes.forEach(function(name){
			rtn+= '<xsl:include href="'+iPath+'/xsl/tmpl/IGRP-'+name+'.tmpl.xsl?v='+_getDate()+'"/>';
		});
		return rtn;
	}

	GEN.includeTemplates = function(names){
		var idx  = GEN.baseXSL.bottom.indexOf('</xsl:stylesheet>');
		var iPath = path;

		names.forEach(function(name){
			var tmpl = '<xsl:include href="'+iPath+'/xsl/tmpl/IGRP-'+name+'.tmpl.xsl?v='+_getDate()+'"/>';

			if(!isIncluded(name)){
				GEN.XSL.find('stylesheet').append(tmpl);
				TMPL_INCLUDES.push(name);
			}
		});
	}

	GEN.getIncludedTemplatesStr = function(relative){
		var rtn = "";
		var iPath = path;

		var includStr = relative ? '../..' : iPath;

		TMPL_INCLUDES.forEach(function(tmpl){
			rtn = rtn + '<xsl:include href="'+includStr+'/xsl/tmpl/IGRP-'+tmpl+'.tmpl.xsl?v='+_getDate()+'"/>';
		})
		return rtn;
	}

	var isHeadIncluded = function(path){
		var rtn = false;

		if(GEN.baseXSL.top.indexOf(path) != -1) rtn = true;
		
		return rtn;
	}

	var setToBaseXslHeader = function(path){
		var idx = GEN.baseXSL.top.indexOf('</head>');
		if(!isHeadIncluded(path)){
			//GEN.baseXSL.top = GEN.baseXSL.top.insert(idx,path);
		}
	};

	var includeToHead = function(p){
		var relative   = p.relative == false ? false : true; 
		var link       = relative ? '{$path}'+p.path : p.path;
		var xslInclude = p.type == 'css' ? '<link rel="stylesheet" type="text/css" href="'+link+'"/>' :
					     p.type == 'js'  ? '<script type="text/javascript" src="'+link+'"></script>' : null;
		
		var viewLink    = relative ? path+p.path : p.path;
		var viewInclude = p.type == 'css' ? '<link rel="stylesheet" type="text/css" href="'+viewLink+'?v='+_getDate()+'"/>' :
					      p.type == 'js'  ? '<script type="text/javascript" src="'+viewLink+'?v='+_getDate()+'"></script>' : null;

		//include css to page XSL 
		if(xslInclude) setToBaseXslHeader(xslInclude);			
		//include css to the GEN VIEW
		if(!GEN.viewFileIncluded(viewLink,p.type)) $('html head').append(viewInclude);
	};

	GEN.includeToHead = function(p){
		/*
			type     : 'css/js'
			relative : true/false - path relative to IGRP structure
			path     : 'path to the file',
		*/
		if(p[0])
			p.forEach(function(include){ includeToHead(include); })
		else
			includeToHead(p);
	}

	GEN.isHeadIncluded = function(path){
		return GEN.viewFileIncluded(path,'css');
	}

	GEN.viewFileIncluded = function(path,type){
		var rtn      = false;

		var viewFiles = type=='css' ? $('link[rel="stylesheet"]') : $('script');
		var attrName  = type=='css' ? 'href' : 'src';

		for(var i = 0; i < viewFiles.length ; i++){
			var link = $(viewFiles[i]);
			var vpath =link.attr(attrName)
			if(vpath && vpath.indexOf(path) != -1){
				rtn = true;
				break;
			}
		}
		
		return rtn;
	}

	var isIncluded = function(name){
		var rtn = false;
		for(var i = 0; i < TMPL_INCLUDES.length; i++){
			if(TMPL_INCLUDES[i] == name){
				rtn = true;
				break;
			} 
		}
		return rtn;
	}
	var decodeHTML = function(s) { // e.g. using jQuery
    	return $('<div>' + s + '</div>').text();
	}

	var  getIndicesOf = function(searchStr, str, caseSensitive) {
	    var startIndex = 0, searchStrLen = searchStr.length;
	    var index, indices = [];
	    if (!caseSensitive) {
	        str = str.toLowerCase();
	        searchStr = searchStr.toLowerCase();
	    }
	    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
	        indices.push(index);
	        startIndex = index + searchStrLen;
	    }
	    return indices;
	}

	

	var setEvents = function(){
		//subversionpathERSION APPLET CONTROLLER
		$('#gen-execute-subv').on('click',function(){
			setPLSQLValue({
				callback:function(){
					svapi.executeActiveX(GEN.SETTINGS.toJson());
				}
			});
			return false;
		});
		
		//GEN VIEWS CONTROLLER
		$(VARS.html.viewsController).on('click',function(e){
			var ctrl  = $(this); 
			var rel   = ctrl.attr('rel');
			var viewr = $('#'+rel);

			$(VARS.html.viewsController).removeClass('active');
			
			ctrl.addClass('active');
			
			$(VARS.html.viewers).removeClass('active');
			
			//XSL VIEW
			switch(rel){
				case 'gen-code':
					setCodeValue();
					GEN.codeEditor.refresh();  
	    			GEN.codeEditor.autoFormatRange({line:0, ch:0}, {line:GEN.codeEditor.lineCount()});
					
					viewr.addClass('active');
				break;

				case 'gen-plsql':
					setPLSQLValue();
				break;

				default:
					viewr.addClass('active');
			}
			
			GEN.SETTINGS.hide();
			
		});
		//views controllers submenu
		$('.gen-v-types-sub-item').on('click',function(e){
			e.stopPropagation();
		});

		/*drag containers*/

		$(VARS.html.containers).draggable({
			helper:function(e){
				return getItemBeforeDrop($(e.currentTarget).attr('name'));
			},
			start:function(e,ui){
				$(e.currentTarget).addClass('draggin')
			},
			stop:function(e,ui){
				$(e.target).removeClass('draggin')
			},
			cursor: 'move',
			scroll:false,
			zIndex: 1000,
			connectToSortable:VARS.html.containersPlaceHolder
		});

		$(VARS.html.fields).draggable({
			helper:function(e){
				return getItemBeforeDrop($(e.currentTarget).attr('name'),'field').attr('style','min-height:12px;visibility:hidden')
			},
			cursor: 'move',
			zIndex: 1000,
			scroll:false,
			start:function(e,ui){
				$(e.currentTarget).addClass('draggin')
			},
			stop:function(e,ui){
				$(e.target).removeClass('draggin')
			},
			connectToSortable:'.gen-sortable'
		});

		/*EDITION CONTROLLERS*/

		$('.gen-edition-title-ctrl').on('click',function(){
			var rel = $(this).attr('rel');
			var content = $('.gen-edition-contents[rel="'+rel+'"]');
			
			$('.gen-edition-contents').not(content).slideUp(300);
			content.slideDown(300);

			$('.gen-edition-title-ctrl').removeClass('active');
			$(this).addClass('active');
			//$('.gen-edition-contents[rel="'+rel+'"]').slideToggle('slow')
		});

		//CUSTOM EVENTS
		//blur
		$(VARS.edition.dialog).on('blur',VARS.edition.proprietySetter+'[change-event="blur"]',function(){
			var rel = $(this).attr('rel');
			var val = $(this).val();
			
			if(GEN.edit.object && GEN.edit.object.SET[rel]){
				if(val != GEN.edit.object.GET[rel]())
					GEN.edit.object.proprieties[rel].onBlur(val,{ target:$(this) });
			}
		});
		// set propriety on keyup
		$(VARS.edition.dialog).on('keyup',VARS.edition.proprietySetter+':not(.checker,[change-event])',function(){
			var rel = $(this).attr('rel');
			var val = $(this).val();

			if(GEN.edit.object && GEN.edit.object.SET[rel])
				GEN.edit.object.SET[rel](val,{ target:$(this) });
		});

		$(VARS.edition.dialog).on('change','[rel="gen_autotag"]',function(){
			var val = $(this).is(':checked');
			if(GEN.edit.object){
				GEN.edit.object.autoTag = val;
				
				if(val)
					$('.propriety-setter[rel="tag"]').attr('disabled',true);
				else
					$('.propriety-setter[rel="tag"]').removeAttr('disabled');
			} 
		});
		// set propriety on check
		$(VARS.edition.dialog).on('change',VARS.edition.proprietyChecker,function(){
			var rel = $(this).attr('rel');

			if(GEN.edit.object && GEN.edit.object.SET[rel])
				GEN.edit.object.SET[rel]($(this).is(':checked'),{ target:$(this) });
		});
		// set propriety on select change
		$(VARS.edition.dialog).on('change',VARS.edition.proprietySelecter,function(){
			var rel = $(this).attr('rel');

			if(GEN.edit.object && GEN.edit.object.SET[rel])
				GEN.edit.object.SET[rel]($(this).val(),{ target:$(this) });
		});
		//cancel edition
		$(VARS.edition.dialog).on('click','[rel="gen-edt-cancel"]',function(){
			GEN.edit.hide();
		});
		//apply edition
		$(VARS.edition.dialog).on('click','[rel="gen-edt-apply"]',function(){
			if(GEN.edit.object){
				if(GEN.edit.object.genType == 'container')
					GEN.edit.object.Transform();
				else
					GEN.edit.object.parent.Transform()
			}
			//GEN.edit.hide();
			return false;
		});
		
		//PAGE SETTINGS CONTROLLERS---------------------
		$('.gen-page-setter.text').on('blur',function(){
			var rel   = $(this).attr('rel'),
				value = $(this).val();
			
			GEN.SETTINGS.SET(rel,value);
		});

		$('.gen-page-setter.checkbox').on('change',function(){
			var rel       = $(this).attr('rel'),
				isChecked = $(this).is(':checked');

			GEN.SETTINGS.SET(rel,isChecked);
		});

		$('.gen-page-setter.select').on('change',function(){
			var rel   = $(this).attr('rel');
			var value = $(this).val();
				
			GEN.SETTINGS.SET(rel,value);
		});

		$('#gen-page-setts-icon').on('click',function(){
			GEN.edit.hide();
			GEN.SETTINGS.show();
		});

		//---------------------------------------------
	
		$(VARS.html.view).off('click','.bClick');

		$(VARS.html.view).on('click','.bClick',function(){
			return false;
		});

		//HIDE PRORIETIES WHEN CLICK OUTSIDE
		$('body').on('mousedown',function(e){
			
			if(!$('.IGRP_overlay').hasClass('active')){

				var target = $(e.target);
				var isFieldEdtIcon     = target.hasClass('field-edit') ? true : false;
				var isContainerEdtIcon = target.hasClass('container-edit') ? true : false;
				var isRemover          = target.hasClass('field-remove') || target.hasClass('container-remove') ? true : false;
				var isPageEdtIcon      = target.attr('id') == 'gen-page-setts-icon' ? true : false;
				var isSectionInner     = (target.parents('#gen-proprieties-editor')[0] || target.attr('id') == 'gen-proprieties-editor') ? true : false;

				if($('#content[rel="gen-contents-holder"]').hasClass('editing')){
					
					if(! (isFieldEdtIcon || isContainerEdtIcon || isRemover || isPageEdtIcon || isSectionInner)){

						GEN.edit.hide();
						
						GEN.SETTINGS.hide();
						
						$('.'+VARS.class.ctxMenu).removeClass(VARS.class.ctxMenuOn);
								
					}	
				
				}
			}
		}); 

		/*SAVE PAGE*/
		$('.form-gen-save').on('click',function(e){
			e.preventDefault();
			var vUrl    = $(this).attr('href') ? $(this).attr('href') : $(this).attr('fw_href') ;
			var pageXML = vkbeautify.xml(GEN.getXML());
			var pageXSL = vkbeautify.xml(GEN.getXSL());

			//console.log(pageXML);

			var vParam  =  [
				{ name:'p_data'    , value: GEN.export() },//json
				{ name:'p_page_xml', value: pageXML },//xml
				{ name:'p_page_xsl', value: pageXSL }//xsl
			];
			
			var vItemId = getPageId();
			
			$('body').attr('has-message','false');
			$('#gen-noif-holder').html('');

			IGRP_submitStringAsFile({
				//pUrl        : 'test.save.xml',
				pUrl        : vUrl,
				pMessage    : false,
				pLoading    : true,
	         	pParam      : {
	          		pArrayFiles : vParam,
		           	pArrayItem  : [
		           		{name:'p_id_objeto', value:vItemId},
		           		{name:'p_table_name', value:GEN.SETTINGS.table},
		           		{name:'p_pkg_html_name', value:GEN.SETTINGS.html},
		           	]
		        },
				pComplete   :function(xml,text,status){
					//:not(')
					var msgs = $(xml).find("message[type!='confirm'][type!='debug']");

					$.each(msgs,function(i,msg){
						var type = $(msg).attr('type');
						var text = $(msg).text();
						
						var holder = '<div class="notification '+type+'">'+
							        	'<div class="icon"></div>'+
							            '<div class="messages">'+text+'</div>'+
							            '<div class="close IGRP_notClose"></div>'+
							        '</div>';

						$('#gen-noif-holder').append(holder);
					});

					$('body').attr('has-message','true');
				}
	        });

			return;
		});

		/* CHANGE APP HANDLER */
		$('#gen-app-choser select').on('change',function(){
			var select = $(this);
			if(!select.hasClass('loadin')){
				
				select.addClass('loadin');

				var vApp = select.val(), 
					vUrl = $("input[name='p_env_frm_url']").val() ? $("input[name='p_env_frm_url']").val() : 'GEN.APP.TEST.xml';
				
				if(vApp){
					$.ajax({
						url:vUrl,
						data:select.attr('name')+'='+vApp,
						success:function(content){
							var xsl = path+'/xsl/tmpl/IGRP-tree-menu.tmpl.xsl';
							var xml = $(content).find('rows > content > table').getXMLDocument();
							
							if(xml){
								$('#gen-apps-holder').XMLTransform({
									xml     	 : xml,
									xsl     	 : xsl,
									loading      : true,
									xslParams    : { 
										template : 'tree-menu',
										delete   : 'false' 
									},
									complete     : function(data){
										select.removeClass('loadin');
									},
									error        : function(error){
										select.removeClass('loadin');
									}
								});
							}else{
								select.removeClass('loadin');
								alert('error')
							}
						}
					});
				}
			}
			return false;
		});
	
		/*ADD APP MODULE*/
		$('#gen-apps-holder').on('click','.tree-menu-options .btn',function(){			
			var type = 'add';
			var id = $(this).parents('li').find('a').attr('idobj');

			setIframeContentLookup({
				pUrl        : modules.saveLink,
				holder      : modules.holder,
				iframe      : modules.holder.find('iframe'),
				pBeforeReady:function(contents){
					contents.find('body').addClass('iframe-full-sreen');
					contents.find('.box-head.showTabMobile').attr('style','display:none!important');
					contents.find('.bClick[target="_close"]').on('click',modules.hide);
				},
				pCallback   :function(){
					modules.show();
				}
			});

			return false;
		});

		$('#gen-apps-holder').on('click','li a[href]',function(){
			var page = $(this);
			if(!page.hasClass('selected') && !GEN.importing){
				try{
					loadPageContents({
						id       : page.attr('idobj'),
						source   : page.attr('href')
					});
				}catch(e){
					console.log(e)
				}
			}
			return false;
		});

		//before unload
		window.onbeforeunload = function() {
			return "Tenha aten\u00e7\u00e3o \u00e0s altera\u00e7\u00f5es!";
		};
		
		//EDITION XSL
		$('#gen-edition-menu li').on('click',function(){
			xslEditing = false;
			var rel = $(this).attr('rel');
			
			$('#gen-edition-menu li').removeClass('active');
			
			$(this).addClass('active');
			
			$('.gen-edition-contents').removeClass('active');
			
			$('.gen-edition-contents[rel="'+rel+'"]').addClass('active');
			
			if(rel == 'xsl' && GEN.edit.object){
				//xslEditing = true;
				var objTemplate = GEN.edit.object.template ? GEN.edit.object.template : GEN.edit.object.templates.field;
				
				if(objTemplate)
					GEN.edit.XSLEditor.setValue(objTemplate);
			}

			//GEN.setEditionDialogPosition();
		});

		GEN.edit.XSLEditor = CodeMirror($('#gen-edition-xsl-view')[0], {
	        //mode: "xml",
	        //lineNumbers: true,
	        readOnly:true,
	        mode: "xml",
	        matchTags: {bothTags: true},
			autofocus:true,
	        enterMode:'indent',
	        smartIndent:true,
	        extraKeys: {
	          "'<'": CM_XSLT_completeAfter,
	          "'/'": CM_XSLT_completeIfAfterLt,
	          "' '": CM_XSLT_completeIfInTag,
	          "'='": CM_XSLT_completeIfInTag,
	          "Ctrl-Space": function(cm) {
	            CodeMirror.showHint(cm, CodeMirror.hint.xml, {schemaInfo: CM_XSLT_tags});
	          }
	        }
      	});

      	GEN.edit.XSLEditor.on('mousedown',function(e){
      		xslEditing = true;
      	});

      	GEN.edit.XSLEditor.on('blur',function(e){
      		xslEditing = false;
      	});

      	//MESSAGES CONTROL
      	$('#gen-noif-holder').on('click','.close',function(){
      		var qtd = $('#gen-noif-holder .notification').length-1;
      		if(qtd == 0)
      			$('body').attr('has-message','false')
      	});

		/*sort containers*/
		//GEN.configSortable($(VARS.html.containersPlaceHolder));
	}

	var getItemBeforeDrop = function(type,genType){
		var gType = genType ? genType : 'container';

		return HTML({
			tag:'li',
			name:type,
			type:type,

			//type:gType,
			class:'gen-declared-'+gType+'s'
		});
	}

	var configDroppedItem = function(item){
		item.removeAttr('style');
	}			

	var getConfigData = function(){
		if(genparams.configURL){
			$.ajax({
				url:genparams.configURL,
				success:function(configData){
					configDataSet = true;
					
					GEN.UTILS = typeof configData == 'string' ? $.parseJSON(configData) : configData;
					console.log(GEN.UTILS)

					loadPageContents({ source: genparams.dataSrc });
				}
			})
		}

	}

	var getBaseXSL = function(){//GET PAGE BASE XSL 
  		$.ajax({
  			url:GEN.path+'/util/base.xsl',
  			success:function(base){
  				var xmlString = (new XMLSerializer()).serializeToString(base);
			    var parts = xmlString.split('<!--SPLIT-->');

			    GEN.XSL = $(base);
			
			    GEN.baseXSL = {
			    	top    : parts[0],
			    	main   : '',
			    	bottom : parts[1]
			    }

			    GEN.includeTemplates(['home-include','slide-menu']);

			    configCodeEditor();

				configPLSQLEditor();

				baseXslSet = true;

				loadPageContents({ source: genparams.dataSrc });

			    //if(json && json[0]) GEN.import();
  			}
  		})
	}

	var transformXMLtoJson = function(data,callback){
		if(data && callback)
			callback($(data).to2DOT2());
	}

	var setNewGenPage = function(p){
		setPageTitle(p.title);
		setPageId(p.id);
		$('#gen-apps-holder li a').removeClass('selected');
		$('#gen-apps-holder li a[idobj="'+p.id+'"]').addClass('selected');
	}


	var loadPageContents = function(p){

		if(baseXslSet && configDataSet){
			var id = p.id ? p.id : getPageId() ;

			if(id){
				//GET PAGE DETAILS AND LOAD CONTENTS
				$.ajax({
					url : GEN.UTILS.link_page_detail+id,
					success:function(pageDetailsStr){
						GEN.DETAILS = typeof pageDetailsStr == 'string' ? $.parseJSON(pageDetailsStr) : pageDetailsStr;
						//GET PAGE LINKS LIST
						$.ajax({
							url:GEN.UTILS.link_page_list+GEN.DETAILS.app,
							success:function(str){
								try{
									GEN.DETAILS.linkPageList = typeof str == 'string' ? $.parseJSON(str) : str;
								}catch(e){
									console.log('invalid json: '+str);
								}
							},
							complete:function(){

								//LOAD PAGE CONTENT
								if(p.source){
									loadData(p.source,function(){
										setNewGenPage({
											title : GEN.DETAILS.action_descr,
											id    : id
										});

										executeEvents(readyEvents);
									});
								}else{
									initBlank();
									executeEvents(readyEvents);
								}
							}
						});
					}
				});
			}else{
				initBlank();
			}
			
		}	
	}

	var initBlank = function(){
		GEN.layout.addRow({index:0});
		done();
	}

	var loadData = function(url,callback){
		_import(true);
		
		$.ajax({	
			url:url,
			//cache:false,
			success:function(d,s,r){

				var contentType = r.getResponseHeader('Content-Type');
				var type = contentType.split(';')[0];

				if(type.indexOf('xml') != -1)
					transformXMLtoJson(d, function(str){GEN.import(str,{callback:callback})});
				else
					GEN.import(d,{callback:callback});
			},
			error:function(){
				console.log('error loading data!');
				_import(false);
			},
			complete:function(r){
				/*var contentType = r.getResponseHeader('Content-Type');
				var type = contentType.split(';')[0];
				var data = r.responseText;
		
				if(type.indexOf('xml') != -1)
					transformXMLtoJson(data, function(str){GEN.import(str,{callback:callback})});
				else
					GEN.import(data,{callback:callback});*/
			}
		});
	}

	var setVars = function(){ //SET CONTAINER VARIABLES

		GEN.VIEW = $('#gen-view');

		GEN.CONTENT = $(VARS.html.content);

		GEN.layout = new GEN_LAYOUT(VARS.html.view);

		GEN.service = new GENSERVICE(GEN);

		GEN.layout.rowDeleteConfirm = function(rowHtml){
			if(rowHtml){
				var holders = rowHtml.find('.'+VARS.class.containersHolder);
				$.each(holders,function(i,h){
					var id = $(h).attr('id');
					GEN.removeContainer(id);
				});
			}
			console.log(CONTAINERS)
		}

		GEN.imagesURL = genparams && genparams.imagesURL ? genparams.imagesURL : '';
		
		GEN.images = {}

		modules = {
			holder  :$('#gen-apps-modules-frame'),
			iframe  :$('#gen-apps-modules-frame iframe'),
			saveLink:$('#gen-apps-modules-frame').attr('link'),
			show:function(e){
				IGRP_blackBody({pType:true});
				modules.holder.show();
			},
			hide:function(e){
				modules.holder.hide();
				IGRP_blackBody({pType:false});
			}
		}

		GEN.SETTINGS = {
			//title   : '',
			instance       : '',
			table          : '',
			package        : '',
			html           : '',
			replace        : false,
			label          : false,
			biztalk        : false,
			subversionpath : '',
			GET     : function(attr){
				return GEN.SETTINGS.hasOwnProperty(attr) ? GEN.SETTINGS[attr] : '';
			},
			SET     : function(attr,val){
				if(GEN.SETTINGS.hasOwnProperty(attr))
					GEN.SETTINGS[attr] = val;

				if(typeof val == 'boolean')
					$('.gen-page-setter[rel="'+attr+'"]').prop('checked', val)
				else
					$('.gen-page-setter[rel="'+attr+'"]').val(val);

				GEN.SETTINGS.checkBtn();

			},
			checkBtn:function(){
				if(GEN.SETTINGS.GET('package') && GEN.SETTINGS.GET('html') && GEN.SETTINGS.GET('subversionpath')){
					$('#gen-execute-subv').removeAttr('disabled');
				}else{
					$('#gen-execute-subv').attr('disabled','disabled');
				}
			},
			toJson:function(){
				var rtn = {};
				
				for(var s in GEN.SETTINGS){
					if(typeof GEN.SETTINGS[s] != 'function')
						rtn[s] = GEN.SETTINGS[s];
				}

				return rtn;
			},
			hide:function(){
				GEN.shadow(false);
				$('#content[rel="gen-contents-holder"]').removeClass('editing');
				$('#gen-page-settings').removeClass('active');
			},
			show:function(){
				GEN.shadow(true);
				//$('#gen-settings-title').text('Propriedades da P\u00e1gina');
				$('#content[rel="gen-contents-holder"]').addClass('editing');
				$('#gen-page-settings').addClass('active');
			},
			toggle:function(){
				$('#content[rel="gen-contents-holder"]').toggleClass('editing');
				$('#gen-page-settings').toggleClass('active');
			}
		}

		GEN.SETTINGS.checkBtn();
	}


	var setCodeValue = function(){
		var _c = GEN.getXSL();
		console.log($.parseXML(GEN.getXML()));
		GEN.codeEditor.setValue(_c);
	}
	var setPLSQLValue = function(params){
		var p             = params ? params : {};  
		var rel           = p.rel ? p.rel : 'gen-plsql';
		var btnController = p.controller ? p.controller : $(VARS.html.viewsController+'[rel="gen-plsql"]');
		var viewr         = $('#'+rel);

		
		btnController.removeClass('active');

		var xsltPath    = btnController.attr('xslt-path'); 
		var xsltFile    = btnController.attr('xslt-file'); 
		var txtarea     = $('#'+rel+' textarea');
		var isIE        = window.ActiveXObject ? true : false;
		var enterParam  = '$$enter$$';

		//var mainXml = GEN.getXML();

		var xslParams = isIE ? { jsEnter:enterParam } : false;
		
		var plsqlXML  = $.parseXML(GEN.getXML());
		
		waiting();

		$('<div/>').XMLTransform({
			xml         : plsqlXML,
			xsl         : xsltPath+'/'+xsltFile,
			xslParams   : xslParams,
			xslBasePath : xsltPath,
			complete    : function(d,e){
				var content = d.text();

				if(isIE) content = content.replaceAll(enterParam,'\n');

				//console.log(vkbeautify.sql(content));

				GEN.plsqlEditor.setValue(content);
				
				GEN.plsqlEditor.refresh();

				$(VARS.html.viewsController).removeClass('active');

				btnController.addClass('active');

				viewr.addClass('active');

				done();

				if(p.callback) p.callback(content);
				
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	var configCodeEditor = function(){
		/*get editor*/
        GEN.codeEditor = CodeMirror($(VARS.html.codeArea)[0], {
          //value: content,
          mode: "application/xml",
          matchTags: {bothTags: true},
          extraKeys: {"Ctrl-J": "toMatchingTag"},
          autofocus:true,
          enterMode:'indent',
          smartIndent:true,
          readOnly:true
        });

        GEN.codeEditor.refresh();
        GEN.codeEditor.focus();
     
        sectionHeight();
	}

	var configPLSQLEditor = function(){
		/*get editor*/

        GEN.plsqlEditor = CodeMirror($('#gen-plsql-view')[0], {
        	mode: 'text/x-plsql',
		    //indentWithTabs: true,
		   // smartIndent: true,
		    lineNumbers: false,
		    matchBrackets : true,
		    //autofocus: true,
		    //extraKeys: {"Ctrl-Space": "autocomplete"},
		    hintOptions: {tables: {
		      users: {name: null, score: null, birthDate: null},
		      countries: {name: null, population: null, size: null}
		    }}
         
        });

        GEN.plsqlEditor.refresh();
        GEN.plsqlEditor.focus();
     
        sectionHeight();
	}

	var preventOverflowVertically = function(top){
		var rtn                 = top;
		var wHeight             = $(window).height();
		var editionDialogHeight = $(VARS.edition.dialog).height();
		
		$(VARS.edition.dialog).removeClass('bottom-arrow');

		if(top + editionDialogHeight > wHeight){
			rtn = top-editionDialogHeight-40;
			$(VARS.edition.dialog).addClass('bottom-arrow');
		}

		return rtn;
	}

	GEN.setEditionDialogPosition = function(e){

		try{
			if(GEN.edit.object){
				var object   = GEN.edit.object;
				var firstInput = $(VARS.edition.dialog+' #gen-edition-proprieties .proprieties-holder:first-child input');
	
				GEN.edit.show();
				//$(VARS.edition.holder).addClass('active');
				
				object.holder.addClass('on-edition');
				
				object.holder.parents('table').find('#'+object.GET.id()).addClass('on-edition');

				$('#content[rel="gen-contents-holder"]').addClass('editing');

				if(firstInput.attr('type') == 'text' || firstInput.attr('type') == 'number')
					firstInput[0].select();
				
				GEN.resizeView();
			}
		}catch(err){
			GEN.edit.hide();
			console.log(err);
		}
	}

	GEN.setBtnActionAttr = function(field,p){
		//set options value
		var options = [{ value:'', label:'' }];
		var value = p.value;

		GEN.DETAILS.linkPageList.forEach(function(page){
			options.push({
				value      : page.id.toString(),
				label      : page.description,
				attributes : [{ name:'app',value:page.app },{ name:'page',value:page.page },{ name:'action',value:page.action }]
			});
		});

		var setBTNAction = function(id,object){
			for(var i=0;i<options.length;i++){
				var o = options[i];
				field.action = {};

				if(o.value && (id == o.value) ){
					o.attributes.forEach(function(att){
						field.action[att.name] = att.value
					});
					break;
				}
			}
		}

		if(typeof p.value == 'object'){
			for(var i=0;i<options.length;i++){
				var o = options[i];
				if(o.attributes && o.attributes[0].value == p.value.app && o.attributes[1].value == p.value.page && o.attributes[2].value == p.value.action){
					value = o.value;
					field.proprieties.action = value;
				}
			}
		}

		var params = {
			name: 'action',
			value:{
				value   : value ? value : '',
				options : options
			},
			onChange:function(val){
				setBTNAction(val);
			}
		}
		if(p.xmlAttr)
			params.xmlAttr = p.xmlAttr

		field.setPropriety(params);

		setBTNAction(field.GET.action());
	}

	GEN.setTargetAttr = function(field,p){
		field.setPropriety({
			name: 'target',
			propriety:{
				value:p.value ? p.value : '_blank',
				options:[{value:'confirm',label:'Confirm'},
						 {value:'alert_submit',label:'Alerta Submit'},
						 {value:'_close',label:'Fechar'},
						 {value:'_link',label:'Hyperlink'},
						 {value:'_self',label:'Mesma Pagina'},
						 {value:'_blank',label:'PopUp'},
						 {value:'submit',label:'Submit'},
						 {value:'submit_ajax',label:'Submit Ajax'},
						 {value:'submit_popup',label:'Submit Popup'},
						 {value:'_back',label:'Voltar'}]
			}
		});
	}

	GEN.setImgAttr = function(field,p){
		field.setPropriety({
			name      : 'img',
			propriety : {
				value : p.value,
				setter: function(){
					var list 	  = $('<ul/>').hide();
					var paramName = p.paramName;
					var active    = field.GET.img ? field.GET.img() : '';

					GEN.getImagesFromDir({
						dir        : GEN.imagesURL,
						paramName  : paramName,
						callback   : function(imgs){
							imgs.forEach(function(img,i){
								var name = img.split(paramName+'/')[1];
				 				var _class = (active == name) ? 'active' : '';
								
								var li = HTML({
									tag:'li',
									class:'btn-icon-setter '+_class,
									rel:name,
									html:HTML({
										tag:'img',
										src:path+'/'+img
									})
								});
								li.on('click',function(e){
				    				list.find('li').removeClass('active');
				    				$(this).addClass('active');
				    				field.SET.img($(e.currentTarget).attr('rel'));
				    			});

				    			list.append(li);

				    			if(i == imgs.length-1) list.show();
				    				
							});

						}
					});

					return list;
				}
			},
			onChange:function(img){
				if(field.holder){
					field.holder.find('img').attr('src',path_tmpl+'/img/icon/'+p.paramName+'/'+img);
					console.log(field.parent.holder);
				}
			}
		});

	}

	GEN.getImagesFromDir = function (p){
		var element;
		
		if(GEN.images[p.paramName]){
			if(p.callback) p.callback(GEN.images[p.paramName]);
			//element = GEN.images[p.paramName];
		}else{
			$.ajax({
				url:p.dir+p.paramName,
				success:function(data){
					if(p.callback) p.callback(data);

					GEN.images[p.paramName] = data;
				}
			});
		}
		
		return element;
	}

	GEN.MESSAGE = function(p){
		console.log(p.text);
		console.log(p.console);
		console.log(p.error);
	}

	GEN.resizeView = function(){
		setTimeout(function(){
			$(window).resize();
		},60);
	}

	GEN.configSortable = function(placeholder){
		//console.log(placeholder)
		placeholder.sortable({
			delay: 150,
			connectWith: '.gen-container-placeholder',
			scroll: false,
			forcePlaceholderSize: true,
			placeholder: VARS.class.placeHolderHover,
			items: "> li",
			handle: '.container-settings',
			tolerance:'pointer',
			helper:function(){ return $('<div></div>') },
			receive:function(e,ui){
				if(ui.item.hasClass('gen-tab-js')){
					//GEN.TABS.add(ui.helper);
					
					/*GEN.TABS.new({
						holder:ui.helper
					});*/

				}else{

					if(ui.helper && ui.helper.hasClass('gen-declared-containers')){
						//NEW ELEMENT DROP
						var liHolder = ui.helper;
						var column   = $(e.target).parents(VARS.layout.columns);
						var row      = column.parent();
						var index    = liHolder.index();
						var ph       = $(e.target);

						if(index >= 0){
							var name   = ui.item.attr('name');
							
							var container = {
								name   : name,
								row    : row,
								column : column,
								index  : index,
								holder : liHolder
							}

							GEN.dropContainers_ROW([container],{
								placeholder:ph
							});

						}else{
							liHolder.remove();
						}
						liHolder.removeAttr('style');
					}else{	
						//MOVED TO ANOTHER PH												 
						var holder = ui.item;
						holder.removeAttr('style');
					}
				}

				
			},
			stop:function(e,ui){	
				var holder = ui.item;
				holder.removeAttr('style');
				$('#gen-view .ui-sortable-helper').remove();
			},
		}).disableSelection();
	}

	GEN.shadow = function(o){
		if(o) GEN.CONTENT.addClass('shadow');
		else  GEN.CONTENT.removeClass('shadow');
	}

	var getPageId = function(){
		return $('#id_objeto').val();
	}

	var setPageId = function(id){
		$('#id_objeto').val(id);
	}

	var setPageTitle = function(title){
		$('#gen-page-title .title').text(title);
	}


	var setupIncludeFile = function(container,type){
		var rtn = "";

		container.includes[type].forEach(function(file){
			var relative = file.relative == false ? false : true;
			var path     = relative ? '{$path}'+container.folder+'/includes/'+file.path : file.path;
			var xslInc   = type == 'css' ? '<link rel="stylesheet" type="text/css" href="'+path+'"/>' : '<script type="text/javascript" src="'+path+'"></script>';
			
			rtn += xslInc;
		});
		return rtn;
	}

	var getContainerFiles = function(container){
		var rtn    = "";
		var cssArr = container.includes.css;
		var jsArr  = container.includes.js;

		if(container.includes.css && container.includes.css[0])
			rtn+=setupIncludeFile(container,'css');
		if(container.includes.js && container.includes.js[0])
			rtn+=setupIncludeFile(container,'js');
			
		return rtn;
	}

	var getXSLTop = function(){
		var content = GEN.baseXSL.top;
		var includes = "";
		var ctrl = {};

		CONTAINERS.forEach(function(c){
			if(!ctrl[c.GET.type()] ){
				if(c.includes.css || c.includes.js){
					var cIncludes = getContainerFiles(c);
					includes+='<!-- '+c.GET.type().toUpperCase()+' INCLUDES -->';
					includes+=cIncludes;
					ctrl[c.GET.type()] = true;		
				}
			}
		});

		var idx = content.indexOf('</head>');
		content = content.insert(idx,includes);

		return content;
	}

	var getXSLBottom = function(){
		var rtn         = "";
		var includesStr = GEN.getDefaultIncludesStr(true);
		var includes    = [];
		var split       = GEN.baseXSL.bottom.split('<!--INCLUDES-->');

		var includeTmpl = function(name){
			includes.push(name);
			includesStr+='<xsl:include href="../../xsl/tmpl/'+name+'?v='+_getDate()+'"/>';
		}
		
		GEN.getContainers().forEach(function(c){
			c.getXSLIncludes().array.forEach(function(iName){
				if(includes[0]){
					var found = false;
					for(var x = 0; x < includes.length; x++){
						if(includes[x] == iName){
							found = true;
							break;
						}
					}
					if(!found) includeTmpl(iName);
				}else{
					includeTmpl(iName);
				}
			});
		});

		rtn = split[0]+includesStr+split[1];

		return rtn;
	}

	var containersNameMask = function(name){
		var rName = name;
		
		//if(name == 'graphic') rName = 'chart';
		
		return rName;
	}

	var start = function(){
		$('body').addClass('startin');
	}
	var done = function(){
		$('body').removeClass('startin waiting');
	}

	var waiting = function(){
		$('body').addClass('waiting');
	}
	
	//subscribe
	GEN.onImportEnd   = function(){}

	GEN.onImportStart = function(){}


	$(window).load(function(){
		GEN.init();
	});
}
