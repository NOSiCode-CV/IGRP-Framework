$.fn.to2DOT2 = function(params) {
	var xml = this;

	var pageTitle    = xml.find('rows content > title'),
		viewXML      = xml.find('rows content > view'),
		tabmenuXML   = xml.find('rows content > menu[type="tabmenu"]'),
		menuXML      = xml.find('rows content > menu:not([type="tabmenu"])'),
		formXML      = xml.find('rows content > form'),
		filterXML    = xml.find('rows content > filter'),
		tableXML     = xml.find('rows content > table'),
		jsValidation = xml.find('js_validation');

	var hasLeft        = xml.find('rows content > *[align="left"], rows content group[align="left"]');
	
	var hasRight       = xml.find('rows content > *[align="right"], rows content group[align="right"]');  
	
	var columnsCount   = hasLeft[0] && hasRight[0] ? 3 : (hasLeft[0] || hasRight[0]) ? 2 : 1;
	
	var mainColumnSize = columnsCount == 1 ?  'col-md-12' : columnsCount == 2 ? 'col-md-8' : 'col-md-6';
	
	var sideSize 	   = columnsCount == 2 ?  'col-md-4' : 'col-md-3';
	
	var columnsJson = [];

	//console.log(pageTitle)

	if(hasLeft[0]) columnsJson.push({size: sideSize,containers : []});
	
	columnsJson.push({
		size       : mainColumnSize,
		containers : [] 
	});

	if(hasRight[0]) columnsJson.push({size: sideSize,containers : []});


	var rtnJson  = {
		rows :[ 
			{ 
				columns:[ 
					{
						size       : 'col-md-12',
						containers : [] 
					} 
				] 
			}, 
			{ 
				columns: columnsJson 
			}
		],
		plsql:{
			table   : '',
			package : xml.find('rows plsql package_db').text(), 
			html    : xml.find('rows plsql package_html').text(),
			replace : xml.find('rows plsql with_replace').text() == 'true' ? true : false,
			label   : xml.find('rows plsql with_label').text()   == 'true' ? true : false,
			biztalk : xml.find('rows plsql with_biztalk').text() == 'true' ? true : false
		}
	}

	var leftColumnObj  = hasLeft[0] ? rtnJson.rows[1].columns[0] : false;
	
	var mainColumnsObj = columnsCount == 1 || columnsCount == 2 && hasRight[0] ? rtnJson.rows[1].columns[0] : rtnJson.rows[1].columns[1] ;
	
	var rightColumnObj = hasRight[0] ? rtnJson.rows[1].columns[rtnJson.rows[1].columns.length-1] : false;

	//view
	var set = function(){
		//VIEW
		console.log('SET HERE')
		if(pageTitle[0]){

			rtnJson.rows[0].columns[0].containers.push( Container({
				tag     : 'page_title',
				type    : 'sectionheader',
				text    : pageTitle.text()
			}) );
			
			/*setContainer();*/
		}

		if(viewXML[0]){
			setContainer(Container({
				tag    : 'view_1',
				type   : 'view',
				fields :{
					xml         : viewXML.find('label > *'),
					excludeAttrs: ['required','maxlength']
				}
			}))
		}

		//TABMENU
		if(tabmenuXML[0]){
			var tabmenuContent = Container({
				tag    : 'tbm',
				type   : 'panels',
				fields :{},
				proprieties:{
					template : 'igrp-accordion-group'
				}
			});

			var position = tabmenuXML.find('group').attr('align');

			tabmenuContent.contents = [];

			$.each($('group',tabmenuXML),function(i,g){
				var tag     = 'tbm'+i,
					
				tbTag 	    = tag+'-tb',

				tabToolsbar = Container({
					tag    : tbTag,
					type   : 'verticalmenu',
					fields : {
						json : contextMenu($('item',g),{
							parentTag : tbTag
						})
					}
				}),

				group = {
					options: {
	                    autoTag: false
	                },
					properties: {
						label: $(g).attr('title'),
						tag: tag,
	                    type: "button",
	                    img : 'fa-chevron-down'
	                    //use_fa:false
	                },
	                rows: [
                		{
                    		columns: [
                        		{
                        			size:'col-md-12',
                        			containers:[tabToolsbar]
                        		}
                    		]
                    	}
                    ]
				};

				tabmenuContent.contents.push(group);
			});
			
			setContainer(tabmenuContent,position)

		}

		//MENU (SIMPLE / TAB)
		if(menuXML[0]){
		
			var menuTag = 'mn';
			setContainer(Container({
				tag    :menuTag,
				type   :'toolsbar',
				proprieties : {
					style : 'boxed'
				},
				fields :{
					json : contextMenu($('menu > *',xml),{
						parentTag:menuTag
					})
				}
			}));
			
		}
		//FORM ELEMENTS && OTHER FORM CONTAINERS (container="true")
		if(formXML[0]){
			//form toolsbar
			if(formXML.find('> tools-bar item')[0]){
				var ftbartag   = 'fmn';

				setContainer(Container({
					tag    :ftbartag,
					type   :'toolsbar',
					fields :{
						json : contextMenu(formXML.find('> tools-bar item'),{
							parentTag:ftbartag
						})
					}
				}));
			}
			var formTag    = 'form_1';
			var formFields = formXML.find('> label *:not([container="true"]):not([rel])');
			//console.log(formFields)
			if(formFields[0]){
				setContainer(Container({
					tag    :formTag,
					type   :'form',
					fields :{
						xml:formFields
					}
				}));
			}
			//other containers
			var oContainers = formXML.find('> label *[container="true"], > label *[type="list"], > label *[type="formlist"], > label *[type="separatorlist"], > label *[type="separatordialog"]');
			
			if(oContainers[0]){
				$.each(oContainers,function(i,c){
					var tag  = c.tagName;
					var type = validateType($(c).attr('type'));
					var title = $(c).text();

					var formListModifies = type == 'formlist' ? {
						texteditor : 'text'
					} : null;

					//console.log(formXML.find('> label *[rel="'+tag+'"]')[0]);

					setContainer(Container({
						tag    : tag,
						type   : type,
						title  : title,
						fields : {
							xml          : formXML.find('> label *[rel="'+tag+'"]'),
							modifyTypes  : formListModifies,
							excludeAttrs : ['rel']
						}
					}));

				})
			}
		}
		//FILTER
		if(filterXML[0]){
			var filterTag = 'filter_1';
			
			var filterCtx = contextMenu($('tools-bar > *',filterXML),{
				parentTag:'filter'
			});

			setContainer(Container({
				tag:filterTag,
				type:'form',
				fields:{
					xml:$('label > *',filterXML)
				},
				contextMenu : filterCtx
			}));
		}
		//TABLE
		if(tableXML[0]){
			//table tools bar
			if($('tools-bar',tableXML)[0]){
				var tBarTag = 'tb_toolsbar';
				setContainer(Container({
					tag    :tBarTag,
					type   :'toolsbar',
					proprieties:{
						style : 'boxed'
					},
					fields :{
						json : contextMenu($('tools-bar > *',tableXML),{
							parentTag:tBarTag
						})
					}
				}));
			}
			//table container
			var tableTag = 'tablelist';
			var otherAttrs = {};
			//table contextMenu
			var tableContextMenu = [];
			//filter
			var filter = xml.find('rows content > filter > label > filter_az');

			if(filter[0]){
				otherAttrs.filter = filter.attr('type');
			}

			if($('context-menu',tableXML)[0]){
				tableContextMenu = contextMenu($('context-menu > *',tableXML),{
					parentTag: tableTag
				});
			}

			setContainer(Container({
				tag    : tableTag,
				type   : 'table',
				fields : {
					xml:$('label > *:not([type="field_copy"])',tableXML)
				},
				otherAttrs:otherAttrs,
				contextMenu:tableContextMenu
			}));

			$.each(xml.find('[type="chart"][align="center"]'),function(i,ccharts){
				//console.log(ccharts)
				setContainer(Container({
					tag        : ccharts.tagName,
					type       : 'chart',
					otherAttrs : {
						chart_type:$(ccharts).find('chart_type').text()
					}
				}));
			});

			//LEFT
			if(hasLeft[0]){
				$.each(hasLeft,function(i,c){
					var type = $(c).attr('type');
					if(type == 'chart'){
						var tag = c.tagName;
						setContainer(Container({
							title      : $(c).find('caption').text(),
							tag        : tag,
							type       : type,
							otherAttrs : {
								chart_type:$(c).find('chart_type').text()
							}
						}),'left');

					}
				});
			}
			if(hasRight[0]){
				$.each(hasRight,function(i,c){
					var type = $(c).attr('type');
					if(type == 'chart'){
						var tag = c.tagName;
						setContainer(Container({
							title      : $(c).find('caption').text(),
							tag        : tag,
							type       : type,
							otherAttrs : {
								chart_type:$(c).find('chart_type').text()
							}
						}),'right');
					}
				});
			}
		}
	}

	var contextMenu = function(fields,p){
		var rtn = [];
		var tag = p && p.parentTag ? p.parentTag+'-' : 'btn-ctx-';
		
		$.each(fields,function(i,f){
			
			var ctx = {
				label  : $(f).find('title').text(),
				tag    : tag+i,
				target : $(f).find('target').text(),
				type   : 'button',
				action : {
					app  : $(f).find('app').text(),
					page : $(f).find('page').text(),
					action : $(f).find('link').text(),
				}
			}

			//console.log(ctx);

			if($(f).find('img')[0]){

				ctx.img = TransformIcon($(f).find('img').text());
				//console.log(ctx.img)
			}

			if(p.group)
				ctx.group = 'group-'+$(f).parent().index();

			rtn.push({
				properties:ctx,
				options : {
					autoTag:false
				}
			});
		});
		return rtn;
	}

	var Fields = function(fields,p){
		var rtn = [];
		
		var options = p ? p : {
			excludeAttrs: [],
			modifyTypes : null
		};

		$.each(fields.not('[type="hidden"]'),function(i,f){

			if(f.tagName.indexOf('_check') == -1 && f.tagName.indexOf('_desc') == -1){
				var fieldObj    = { label : $(f).text(),tag:f.tagName };
				
				var fieldsRules = checkFieldRule(f.tagName);

				$.each(f.attributes,function(i,attr){
					
					var name = normalizeAttrName(attr.name);
					
					if(checkAttr(name,options.excludeAttrs))
						validateAttr(attr,options.modifyTypes,fieldObj);
						//fieldObj[name] = validateAttr(attr,options.modifyTypes);
					
					//validateAttr(attr,options.modifyTypes,fieldObj);

					/*if(checkAttr(name,options.excludeAttrs)){
						fieldObj[name] = validateAttr(attr,options.modifyTypes);
					}*/

				});

				rtn.push({
					properties:fieldObj,
					options:{
						rules:fieldsRules,
						autoTag:false
					}
				});
			}

		});
		//hidden fields
		$.each(fields.not('[type!="hidden"]'),function(i,f){
			if($(f).attr('type') != 'field_copy'){
				
				var fieldObj = { 
					tag:f.tagName,
					name:$(f).attr('name'),
					type:'hidden'
				};

				rtn.push({
					properties:fieldObj,
					options: {
						autoTag:false
					}
				});
			}
		});

		//console.log(rtn)

		return rtn;
	}
	var normalizeAttrName = function(name){
		var rtn = name;
		if(name == 'maxLength') rtn = 'maxlength';
		return rtn;
	}
	var checkAttr = function(attrName,excludes){
		var rtn = true;
		
		if(excludes){
			for(var i = 0; i < excludes.length; i++){
				var exclude = excludes[i];
				if(attrName == exclude ){
					rtn = false;
					break;
				}
			}
		}

		if(attrName.toUpperCase() == 'CODE')
			rtn = false;

		return rtn;
	}

	var validateType = function(type){
		var v = type;
		if(type == 'list') v = 'table';

		if(type == 'separatordialog') v = 'separatorlist';

		return v;
	}

	var validateAttr = function(attr,modifyTypes,object){
		
		var name  = normalizeAttrName(attr.name);

		var value = attr.value;
		
		if(attr.name == 'readonly')
			value = attr.value == 'readonly' ? true : false;

		if(attr.value == 'true')               
			value = true;

		if(attr.value == 'false')     
			value = false;

		if(attr.name  == 'type' && attr.value == 'color_td')  
			value = 'color';

		if(attr.name  == 'maxlength') 
			value = parseInt(attr.value);

		if(attr.name  == 'type' && attr.value.toLowerCase().indexOf('lookup') != -1) 
			value = 'lookup';

		if(attr.name  == 'type' && attr.value == 'group')  
			value = 'separator';

		if(attr.name  == 'type' && attr.value == 'selectchange')  {
			value = 'select';
			object['change'] = true;
		}
		
		if(attr.name  == 'type' && attr.value=='js_passa_valor'){
			value = 'text';
			object['lookup_parser'] = true;
		}
		
		if(modifyTypes && attr.name == 'type'){
			for(var toModify in modifyTypes){
				if (value == toModify)
					value = modifyTypes[toModify];
			}
		}

		object[name] = value;
		//validateAttr(attr,options.modifyTypes,fieldObj);

		//return value;
	}

	var mapRuleAttr = function(name){
		var rtn = false;
		if(name != 'field'){
			switch(name){
				case 'operation':
					rtn = 'condition';
				break;
				case 'target':
					rtn = 'targets';
				break;
				default:
					rtn = name;
			}
		}
		
		return rtn;
	}
	var checkFieldRule = function(name){
		var rtn = [];
		$.each($('row field:contains('+name+')',jsValidation),function(i,field){
			var row   = $(field).parent();
			var frule = {};

			$.each( $('*',row),function(x,r){
				var attrName = mapRuleAttr(r.tagName);
				if(attrName){
					var attrText  = $(r).text();
					var attrValue = '';
					
					if(attrName == 'targets'){
						var split = attrText.split(',');
						split.forEach(function(t,z){
							var op = z != split.length-1 ? ',' : '';
							attrValue+=(t.substring(2)+op);
						});
					}else{
						attrValue = attrText;
					}
					
					//console.log(attrValue)

					frule[attrName] = attrValue;
				}
			} );

			frule.name = capitalizeFirstLetter(name)+' Rule '+(i+1);
			frule.opposite = "";

			rtn.push(frule);
		});
		return rtn;
	}

	var Container = function(p) {
		var fieldsOpts = {};
		
		if(p.fields && p.fields.excludeAttrs) fieldsOpts.excludeAttrs = p.fields.excludeAttrs;
		if(p.fields && p.fields.modifyTypes)  fieldsOpts.modifyTypes  = p.fields.modifyTypes;

		var cFields = p.fields &&  p.fields.xml ? Fields(p.fields.xml,fieldsOpts) : 
					  p.fields && p.fields.json ? p.fields.json : [];
		
		var cProps  = {
			tag  : p.tag,
			type : p.type,
		}

		if(p.proprieties)
			for(var att in p.proprieties)
				cProps[att] = p.proprieties[att]
		
		if(p.title){
			cProps.title = p.title;
			cProps.hasTitle = true;
		}	

		if(p.text)
			cProps.text = p.text;
		

		var container = {
			proprieties : cProps,
			fields      : cFields
		}

		if(p.groups && p.groups[0])
			container.proprieties.groups = p.groups;
		
		if(p.otherAttrs){
			for(var a in p.otherAttrs)
				container.proprieties[a] = p.otherAttrs[a];
		}

		if(p.contextMenu && p.contextMenu[0])
			container.contextMenu = p.contextMenu;

		return container;
	}

	var setContainer = function(container,position){
		//var index = idx ? idx : 
		var col = position && position == 'left'  ? leftColumnObj :
				  position && position == 'right' ? rightColumnObj : mainColumnsObj;

		col.containers.push(container);
	}

	var TransformIcon = function(i){
		
		var icon = 'fa-caret-right';

		switch(i){
			case 'add.png':
				icon = 'fa-plus';
			break;
			case 'search.png':
				icon = 'fa-search';
			break;
		}

		return icon;

	}

	set();

	console.log(rtnJson)
	return rtnJson;
}