var GENSTRUCTURES = function(GEN){
	var STRUC = this;

	//var GEN.UTILS.link_preview = 'http://igrp.teste.gov.cv/images/IGRP';
	//var GEN = VARS.getGen();

	//console.log(GEN)

	STRUC.GET = function(p){
		var xml;

		if(p.object && p.object.genType){
			switch(p.object.genType){
				case 'field':
					xml = genFieldStruc(p);
				break;
				case 'container':
					xml = genContainerStruc(p);
				break;
			}
		}

		return xml;
	}

	var genContainerStruc = function(p){
		var rtn = "";
		var container = p.object;
		
		var tag        = $.trim(container.GET.tag()),
			type       = container.GET.type(),
			title      = container.GET.title ? container.GET.title() : '',
			xmlType    = container.xml.structure ? container.xml.structure : type,
			gType 	   = container.xml.genType ? container.xml.genType : 'container',
			gGroup     = container.xml.genGroup ? 'true' : '',
			//clean 	   = container.xml.clean    ? 'clean="true"' : '',
			//fields     = container.GET.fields(),
			typeAttr   = type,
			
			attributes = ' type="'+type+'" xml-type="'+xmlType+'"';

			if(container.copyOptions){	
				//console.log(container.copyOptions)
				var cpackageDB   = container.copyOptions.plsql ? container.copyOptions.plsql.package : '',
					cpackageHTML = container.copyOptions.plsql ? container.copyOptions.plsql.html : '';
				
				attributes+= ' copy="true" copy-tag="'+container.copyOptions.container+'" copy-package-db="'+cpackageDB+'" copy-package-html="'+cpackageHTML+'"'
			}
			
		if(tag){

			if(container.GET.hasTitle && container.GET.hasTitle() && container.GET.title)
				attributes+=' title="'+container.GET.title()+'"';

			if(container.GET.dynamic && container.GET.dynamic())
				attributes+=' dynamic-menu="'+container.GET.dynamic()+'"';

			if(container.xml.genRemote)
				attributes+=' gen-remote="'+container.xml.genRemote+'"';

			if(container.xml.clean)
				attributes+=' gen-clean="true" ';

			for(var p in container.proprieties){
				if(container.proprieties[p].xmlAttr)
					attributes+=' '+p+'="'+container.GET[p]()+'"';
			}

			rtn+='<'+tag+attributes+' gen-type="'+gType+'" gen-group="'+gGroup+'">';

			if(container.xml.getStructure){

				rtn += container.xml.getStructure({
					tag      : tag,
					genType  : gType,
					genGroup : gGroup
				})

			}else{

				if(container.xml.gen){
					rtn+=container.xml.gen();
				}else{

					if(container.xml.type == 'fields'){
						rtn+=genFields(container);

						if(container.xml.table){
							rtn+=genTable(container);
						}
						
						else if (container.contextMenu)
							rtn+=GEN.genContextMenu(container);
					}

					if(container.xml.type == 'calendar')
						rtn+=genCalendar(container);

					if(container.xml.type == 'group')
						rtn+=genGroup(container);
					
					if(container.xml.type == 'items')
						rtn+=genItems(container.GET.fields());

					if(container.xml.type == 'tabs')
						rtn+=genTabs(container.contents);
					
					if(container.xml.type == 'graphic')
						rtn+=genGraphic(container);

					if(container.xml.type == 'fingerprint')
						rtn+=genFingerPrint(container);

					if(container.GET.type() == 'treemenu'){
						rtn+=genTreeMenu(container);
					}

					if(container.xml.type == 'text' || container.xml.type == 'texteditor'){
						
						var value   = container.GET.text ? container.GET.text() : '',
								
							mxLength = container.GET.maxlength ? container.GET.maxlength() : '';
							
						rtn+='<fields><'+tag+'_text type="text" name="p_'+tag+'_text" persist="true" maxlength="'+mxLength+'"><value><![CDATA['+escapeDoubleQuotes(value)+']]></value></'+tag+'_text></fields>';
					}

					if(container.xml.type == 'map')
						rtn+=genMap(container);
				}
				
			}

			rtn+='</'+tag+'>';

		}


		return rtn;
	}

	var fieldXMLStructute = function(){

	}

	var genFieldStruc = function(p){
		var rtn           = "";
		var field 		  = p.field;
		var tag  		  = field.xml.tag ? field.xml.tag : field.GET.tag(),
			type 		  = field.GET.type(),
			//label         = field.GET.label ? field.GET.label() : '',
			attributesStr = getAttrsArr(field);

		//ALL HIDDEN FIELDS HAVE HIDDEN TAG !!
		/*if(type == 'hidden')
			tag = 'hidden';*/
		//------------------------------------

		if(tag){

			rtn+='<'+tag+attributesStr+'>';
				if(p.label && field.xml.label) 
					rtn+='<label>'+field.GET.label()+'</label>';

				if(field.xml.options)
					rtn+=getXMLOptions(field);
				else{

					var value = field.xml.dataValue || DATA.get({type:type,field:p.field});

					if(p.value && field.xml.value) rtn+='<value>'+value+'</value>';
				}
				
				if(field.xml.lookup || field.GET.type() == 'lookup'){
					//rtn+='<lookup>http://igrp.teste.gov.cv/images/IGRP.bootstrap/app/BOOTSTRAP/xml/lookup.test.xml</lookup>';
					rtn+=genLookUpField(field);
				}

				if(field.GET.service && field.GET.service().code)
					rtn+=GEN.getFieldServiceMap(field.GET.service());

			rtn += checkRules(field,rtn);

			rtn+='</'+tag+'>';
		}

		return rtn;
	}

	var genCalendar = function(container){
		var tag = $.trim(container.GET.tag()),
			rtn = '<fields>'+
				'<'+tag+'_lang name="p_'+tag+'_lang"  type="text" maxlength="30">'+
					'<label>Linguagem</label>'+
					'<value>pt</value>'+
				'</'+tag+'_lang>'+
				'<'+tag+'_add name="p_'+tag+'_add"  type="link" maxlength="4000">'+
					'<label>add Eventos</label>'+
					'<value></value>'+
				'</'+tag+'_add>'+
				'<'+tag+'_view name="p_'+tag+'_view"  type="text" maxlength="30">'+
					'<label>Default View</label>'+
					'<value></value>'+
				'</'+tag+'_view>'+
				'<'+tag+'_date name="p_'+tag+'_date"  type="date" maxlength="30">'+
					'<label>Default View</label>'+
					'<value></value>'+
				'</'+tag+'_date>'+
			'</fields>';

			if(container.contextMenu && container.contextMenu.items[0])
				rtn+=GEN.genContextMenu(container);
			
		return rtn;
	}

	var genGroup = function(container){
		var rtn = "";
		container.groups.items.forEach(function(g){
			var groupFields = [];
			rtn+='<group title="'+g.name+'" code="" id="'+g.id+'">';
				container.GET.fields().forEach(function(f){
					if(f.GET.group && f.GET.group() == g.id){
						groupFields.push(f);
					}
				});
				rtn+=genItems(groupFields);
			rtn+='</group>';
		});
		
		return rtn;
	}

	var genFields = function(container){
		var rtn      = '<fields>';
		var fields   = container.GET.fields();
		var containerTag = container.GET.tag()

		fields.forEach(function(f){
			rtn+=genFieldStruc({
				field:f,
				label:container.xml.fieldsLabel,
				value:container.xml.fieldsValue
			});

		});

		if(container.xml.table){
			//rtn+='<'+container.GET.tag()+'_id type="hidden" name="p_'+container.GET.tag()+'_id"></'+container.GET.tag()+'_id>'
		}
		
		if(container.GET.filter && container.GET.filter()){
			var filter = $.trim(container.GET.filter());
			if(filter){
				rtn+='<'+containerTag+'_filter name="p_'+containerTag+'_filter" type="text" maxlength="100">'+
						'<value></value>'+
					 '</'+containerTag+'_filter>';

				if(filter == 'filter_num')
					rtn+='<'+containerTag+'_filter_pg name="p_'+containerTag+'_filter_pg" type="text" maxlength="100">'+
						'<value>0|1|2|3|4|5|6|7|8</value>'+
					 '</'+containerTag+'_filter_pg>';
			}
		}

		if(container.onFieldsXMLGenerate && container.onFieldsXMLGenerate(rtn) )
			rtn += container.onFieldsXMLGenerate(rtn);

		for(var p in container.propertiesOptions){
			var pr = container.propertiesOptions[p];
			
			if(pr.isField){
				var tag  = containerTag+'_'+pr.name;
				var persist = pr.valuePersist ? 'persist="true"' : '';
				var valueObj = pr.value;
				var isAction = typeof valueObj == 'object' && valueObj.type == 'action' ? true : false;
				var value = isAction ? valueObj :  container.GET[pr.name]();
				//var value = container.GET[pr.name]();
				var valueAttr = '';
				var label = pr.label || '';
				
				if(isAction){
					
					var actionParams = {
						app : value.app || container.action.app,
						page : value.page || container.action.page,
						action : value.action || container.action.action
					};
					
					valueAttr = ' type="action"';
					
					value = '<app>'+actionParams.app+'</app><page>'+actionParams.page+'</page><action>'+actionParams.action+'</action>'
					
				}
				
				rtn+='<'+tag+' name="p_'+tag+'" type="text" maxlength="4000" '+persist+'>'+
						'<label>'+label+'</label>'+
						'<value'+valueAttr+'>'+value+'</value>'+
					 '</'+tag+'>';
			}
		}

		rtn+='</fields>';
		
		return rtn;
	}

	var genTable = function(container){
		var fields = container.GET.fields();
		var atts = "";

		var genTableFields = function(o){
			
			var rtn = '';
			var total = o ? o.total : false;

			fields.forEach(function(f){
				
				var tag     = f.xml.tag ? f.xml.tag : f.GET.tag();
				var type    = f.GET.type();
				/*var value   = f.xml.dataValue || DATA.get({type:type, field:f});
				var descVal = value;*/

				var value = '', 
					descVal = '';

				if(total){

					if(f.GET.type() == 'number')
						value = f.xml.dataValue || DATA.get({type:type, field:f});

				}else{

					value   = f.xml.dataValue || DATA.get({type:type, field:f});
					descVal = value;

				}


				switch(type){
					case 'link':
						descVal = f.GET.label()
					break;
				}

				var attributesStr = getAttrsArr(f,['name']);
				
				var visible       = f.GET.visible && !f.GET.visible() ? ' visible="false"' : '';
				
				attributesStr+=visible;

				rtn+='<'+tag+' '+attributesStr+'>'+value+'</'+tag+'>';
				if(f.xml.desc)
					rtn+='<'+tag+'_desc name="'+f.GET.name()+'_desc">'+descVal+'</'+tag+'_desc>';
				
			});

			return rtn;
		}
		
		var rtn ='<table>';
				rtn+='<value>';
				
				if(container.GET.fields()[0]){
					for(var i=0; i<5;i++){
						
						var aux = i+1;

						rtn+='<row>';
						
						if(container.hasFieldType(container.contextMenu.type))
							rtn+='<context-menu>'+
						            '<param>p1=linha1</param>'+
						            '<param>p2=linha1</param>'+
						          '</context-menu>';
					         
					        rtn+=genTableFields();
							
						rtn+='</row>';
					}

					if(container.GET.tableFooter && container.GET.tableFooter()){
						rtn+='<row total="yes">';
							rtn+=genTableFields({total:true});
						rtn+='</row>'
					}



				}
				rtn+='</value>';

			if(container.xml.tableLegend){
			
				var lg = container.xml.getLegendColors && container.xml.getLegendColors()? container.xml.getLegendColors() : '';
				
				rtn+=lg;
			}
				
			if(container.contextMenu)
				rtn+=GEN.genContextMenu(container);


		rtn+='</table>';
		
		return rtn;
	}

	var genMap = function(container){
		return path+'/xml/gis/map.xml';
	}

	GEN.genContextMenu = function(container){
		var rtn = '';
		
		if(container.contextMenu.items[0]){
			var ctx      = container.contextMenu.items;
			var tag      = container.contextMenu.xmlTag ? container.contextMenu.xmlTag : 'context-menu';
			var itemType = container.GET.type() == 'form' ? 'form' : 'specific';
			var rtn      = '<'+tag+'>';
			
			ctx.forEach(function(item){

				var app    = item.action && item.action.app    ? item.action.app    : '',
					page   = item.action && item.action.page   ? item.action.page   : '',
					link   = item.action && item.action.action ? item.action.action : '',
					tran   = item.GET.transaction &&  item.GET.transaction() ? 'flg_transaction="true"'  : '',
					map    = item.GET.service && item.GET.service().code ? GEN.getFieldServiceMap(item.GET.service()) : '',
					_class = item.GET.class && item.GET.class() ? item.GET.class() : 'default',
					customReturn = item.GET.custom_return ? item.GET.custom_return() : false,
					customReturnAttr = customReturn ? 'custom_return="true"' : '';
					target = item.GET.target();

				if(item.GET.target_fields && item.GET.target_fields())
					target += '|'+item.GET.target_fields();

				else if(item.GET.closerefresh && item.GET.closerefresh()){
					
					target += '|refresh';
					
					if( item.GET.refresh_submit &&  item.GET.refresh_submit())
						
						target += '_submit';
					
				}
					
				
				console.log(item)

				rtn+='<item type="'+itemType+'" code="" '+tran+' class="'+_class+'" rel="'+item.GET.tag()+'" '+customReturnAttr+'>'+
	                    '<title>'+item.GET.label()+'</title>'+
	                    '<app>'+app+'</app>'+
	                    '<page>'+page+'</page>'+
	                    '<link>'+link+'</link>'+
	                    '<parameter>'+item.action.link+'?</parameter>'+
	                    '<target>'+target+'</target>'+
	                    '<img>'+_class+'|'+item.GET.img()+'</img>'+
	                    '<preview>'+item.action.link+'</preview>'+
	                     map+
	                 '</item>';
			});

			rtn+='</'+tag+'>';
		}

		return rtn;
	}

	var genItems = function(fields,rel){
		var rtn    = "";
		
		fields.forEach(function(f){
			var tag    = f.GET.tag(),
				title  = f.GET.label(),
				target = f.GET.target ? f.GET.target() : "",
				img    = f.GET.img    ? f.GET.img()    : "",
				imgTag = img ? '<img>'+img+'</img>' : '',
				app    = f.action && f.action.app    ? f.action.app    : '',
				page   = f.action && f.action.page   ? f.action.page   : '',
				link   = f.action && f.action.action ? f.action.action : '',
				tran   = f.GET.transaction &&  f.GET.transaction() ? 'flg_transaction="true"'  : '',
				map    = f.GET.service && f.GET.service().code ? GEN.getFieldServiceMap(f.GET.service()) : '',
				_class = f.GET.class && f.GET.class() ? f.GET.class()+'|' : '',
				parent = f.GET.parent && f.GET.parent() ? 'parent="'+f.GET.parent()+'"':'',
				params = '',
				actionLINK = f.action ? f.action.link : '',
				customReturn = f.GET.custom_return ? f.GET.custom_return() : false,
				customReturnAttr = customReturn ? 'custom_return="true"' : '';

			if(f.GET.target_fields && f.GET.target_fields())
				target += '|'+f.GET.target_fields();

			else if(f.GET.closerefresh && f.GET.closerefresh())
				target += '|refresh';

				//console.log(params);
			rtn+='<item type="specific" code="" rel="'+tag+'" '+tran+' '+parent+' '+customReturnAttr+'>'+
		            '<title>'+title+'</title>'+
		            '<app>'+app+'</app>'+
		            '<page>'+page+'</page>'+
		            '<link>'+link+'</link>'+
		            '<target>'+target+'</target>'+
		            '<img>'+_class+img+'</img>'+
		            '<preview>'+actionLINK+'</preview>'+
		            map+
		        '</item>';
		});

		return rtn;
	}

	var genTabs = function(contents){
		
		var rtn = '<fields>';
		
		contents.forEach(function(c){

			rtn+='<'+c.GET.tag()+' '+getAttrsArr(c)+' maxlength="50" >'+
				 	'<label>'+c.GET.label()+'</label>'+
				 	'<value/>'+
				 '</'+c.GET.tag()+'>';
			
		});

		rtn+='</fields>';
		return rtn;
	}
	function genNum(limit){
	    return Math.floor(Math.random() * limit);
	}
	var genGraphic = function(container){
		var colors = '<colors>'+
						'<col>'+DATA.get({ type:'color',format:'hex' })+'</col>'+
						'<col>'+DATA.get({ type:'color',format:'hex' })+'</col>'+
						'<col>'+DATA.get({ type:'color',format:'hex' })+'</col>'+
						'<col>'+DATA.get({ type:'color',format:'hex' })+'</col>'+
					'</colors>';
		var chartType = container.GET.chart_type ? container.GET.chart_type() : 'line';

		return '<caption></caption> <chart_type>'+chartType+'</chart_type> <xaxys>Eixo de X</xaxys><yaxys>Eixo de Y</yaxys><url>#</url><label><col>Ano</col><col>X1</col><col>X2</col><col>X3</col><col>X4</col></label><value><row><col>2010</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col></row><row><col>2009</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col></row><row><col>2015</col><col>1010</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col><col>'+genNum(999)+'</col></row></value>'+colors;
	};

	var genFingerPrint = function(container){
		var rtn = '<fields>',
			tag = container.GET.tag();

		rtn += '<'+tag+'_link name="p_'+tag+'_link" type="link" maxlength="4000"><label>link</label><value></value></'+tag+'_link>';
		rtn += '<'+tag+'_photo name="p_'+tag+'_photo" type="link" maxlength="4000"><label>Photo</label><value></value></'+tag+'_photo>';
		rtn += '<'+tag+'_fingerright name="p_'+tag+'_fingerright" type="link" maxlength="4000"><label>Finger Right</label><value></value></'+tag+'_fingerright>';
		rtn += '<'+tag+'_fingerleft name="p_'+tag+'_fingerleft"  type="link" maxlength="4000"><label>Finger Left</label><value></value></'+tag+'_fingerleft>';
		rtn += '<'+tag+'_signature name="p_'+tag+'_signature"  type="link" maxlength="4000"><label>Signature</label><value></value></'+tag+'_signature>';
		rtn += '<'+tag+'_self name="p_'+tag+'_self"  type="link" maxlength="4000"><label>Self Service</label><value></value></'+tag+'_self>';
		rtn += '<'+tag+'_start name="p_'+tag+'_start"  type="link" maxlength="4000"><label>Process Start</label><value></value></'+tag+'_start>';
		rtn += '<'+tag+'_process type="number" maxlength="30" name="p_number_process"><label>Number Process</label><value></value></'+tag+'_process>';
		rtn += '</fields>';

		return rtn;
	};

	var genTreeMenu = function(container){
		var rtn = '',
			row = '',
			tag = container.GET.tag();
		
		rtn += '<fields><'+tag+'_link type="link" maxlength="4000" target="_self" desc="true"><label>Link</label></'+tag+'_link>';
		rtn += '<'+tag+'_tmid type="text"><label>ID</label></'+tag+'_tmid>';
		rtn += '<'+tag+'_parent type="number" java-type="Integer"><label>Parent ID</label></'+tag+'_parent>';
		rtn += '<'+tag+'_icon type="text"><label>Icon</label></'+tag+'_icon>';
		rtn += '<'+tag+'_child type="text"><label>Has child value(0/X)</label></'+tag+'_child>';
		rtn += '<'+tag+'_active type="text"><label>Is Active value(true/false)</label></'+tag+'_active>';
		rtn += '</fields><table><value>';

		for (var i = 0; i < 8; i++) {
			var aux = i+1,
			parent  = aux % 2 == 0 ? aux - 1 : aux % 3 == 0 ? aux - 2 : '';  
			row += '<row>';
			row += '<'+tag+'_link>#</'+tag+'_link>';
			row += '<'+tag+'_link_desc> Menu '+aux+'</'+tag+'_link_desc>';
			row += '<'+tag+'_tmid>'+aux+'</'+tag+'_tmid>';
			row += '<'+tag+'_parent>'+parent+'</'+tag+'_parent>';
			row += '<'+tag+'_icon></'+tag+'_icon>';
			row += '<'+tag+'_child></'+tag+'_child>';
			row += '<'+tag+'_active></'+tag+'_active>';
			row += '</row>';
		}

		rtn +=row+'</value></table>';

		return rtn;
	};

	var getFieldsService = function(service,point){
		var rtn 	= '';
		service.forEach(function(c){
			var type = c.type ? 'type="'+c.type+'"' : '';
			if(c[0]){
				var node 		= c[0],
					connected 	= node.from ? point+'="'+node.from+'"' : '';

				type = node.type ? 'type="'+node.type+'"' : '';

				rtn+='<item '+type+' '+connected+' structure="list" rel="'+node.to+'">';
					c.forEach(function(e,i){
						type = e.type ? 'type="'+e.type+'"' : '';
						if (i > 0) {
							if(e.from)
								rtn+='<row '+type+' '+point+'="'+e.from+'">'+e.to+'</row>';
							else
								rtn+='<row '+type+'>'+e.to+'</row>';
						}
					});
				rtn+='</item>';
			}else{
				if(c.from)
					rtn+='<item '+type+' '+point+'="'+c.from+'">'+c.to+'</item>';
				else
					rtn+='<item '+type+'>'+c.to+'</item>';
			}
		});
		return rtn;
	};

	GEN.getFieldServiceMap = function(service){
		var GEN 	= VARS.getGen(),
			_package = service.package ? 'package="'+service.package+'"':'';
		var rtn = '<service code="'+service.code+'" proc="'+service.proc+'">';
			rtn+='<request>';
			var serviceReq = service.fieldsReq[0] ? service.fieldsReq : service.fieldsRes;
				rtn+=getFieldsService(service.fieldsReq,'from');
			rtn+='</request>';

			rtn+='<response '+_package+'>';
			var serviceRes = service.fieldsRes[0] ? service.fieldsRes : service.fieldsReq;
				rtn+=getFieldsService(service.fieldsRes,'to');
			rtn+='</response>';

		rtn+='</service>';

		return rtn;
	}
	
	var escapeDoubleQuotes = function(str) {
		return str.replaceAll('"',"'");
		//return str.replace(/\\([\s\S])|(")/g,"\\$1$2"); // thanks @slevithan!
	};

	var returnAttr = function(field,name){
		var arr = '';
		if(field.GET[name]){
			
			var value = field.GET[name]();
			
			if(field.xml.attrs[name])
				
				arr+=' '+field.xml.attrs[name]()
				
			else{
				
				if( field.propertiesOptions && field.propertiesOptions[name] && field.propertiesOptions[name].inputType == 'texteditor'){
					
					var t = (encodeURI(value) );
					
					arr+=' '+name+'="'+t+'"'
					
				}else{
					
					arr+=' '+name+'="'+value+'"'
					
				}

			}
				
				

		}

		return arr;
	}
	var validAttrArr = function(name){
		
		var rtn = false;
		
		if( name != 'label' && name !='tag' && name !='size' && name !='domain_value' && name != 'lookupParams' )
			rtn = true;
		
		return rtn;
	}
	
	var getAttrStr = function(field,name){
		
		var arr = '';
		
		if(validAttrArr(name)){
			
			if(field.propertiesOptions[name] && field.propertiesOptions[name].valuePersist)
				arr+='persist="true"';

			if(name == 'visible'){

				if(!field.GET.visible())
					
					arr+=' visible="false"';
			}else
				
				arr+=returnAttr(field,name);
		}
		
		return arr;
		
	}
	
	var getAttrsArr = function(field,which){
		
		var arr = "";
		
		if(which && which[0])
			which.forEach(function(name){
				
				arr += getAttrStr(field,name);
				
			});
		else
			for(var name in field.proprieties){
				
				arr += getAttrStr(field,name);

			}

		if(field.type=='hidden')
			arr+=' tag="'+field.GET.tag()+'"';

		if(field.xml.check)
			arr+=' check="true"';

		if(field.xml.desc)
			arr+=' desc="true"';
		
		if(field.xml.lookup)
			arr+=' lookup="true"';

		return arr;
	}
	
	var genLookUpField = function(f){
		
		var rtn = '<lookup>http://igrp.teste.gov.cv/images/IGRP.bootstrap/app/BOOTSTRAP/xml/lookup.test.xml</lookup>',
		
			isTable = f.parent.GET.type() == 'formlist' ? 'is-table="true"' : '';
		
		if(f.GET.lookupParams){
			
			rtn+='<lookupParams '+isTable+'>';
			
			f.GET.lookupParams().forEach(function(lp){
				
				var target = lp.name || lp.target_field,
					value = lp.value || lp.value_field;
				
					if( target || value )
					
						rtn+='<param field-target="'+target+'">'+value+'</param>';
				
			});
			
			rtn+='</lookupParams>';
			
		}

		return rtn;
	
	}
	
	var getXMLOptions = function(f){

		var rtn = '<list>';
		
		if(f.type == 'select')
			rtn+='<option></option>';

		if(f.GET.domain && f.GET.domain() && f.proprieties.domain_value && f.proprieties.domain_value[0]){
			
			f.proprieties.domain_value.forEach(function(d){
				var value = $.IGRP.utils.htmlEncode(d.value),
					text  = $.IGRP.utils.htmlEncode(d.text);
				rtn+='<option><text>'+text+'</text><value>'+value+'</value></option>';
			});
			
		}else{

			for(var i = 1; i <= 4 ; i++){
				var text = 'Option '+i;
					rtn +='<option><text>'+text+'</text><value>'+i+'</value></option>';
			}
		}

		rtn+= '</list>';

		return rtn;
	}

	var checkRules = function(f,sxml){
		
		var rtn   = '',

			rules = f.rules;

		if(rules && rules[0]){
			
			rtn +=	'<rules>';
			
			rules.forEach(function(r){
				
				var actions = r.actions ? JSON.parse(r.actions.replace(/'/g,'"')) : [];
				
				actions.forEach(function(a){

					var action = a.gen_rule_action;

					switch(action){
						
						case 'remote_combobox':
						case 'remote':
						
							var proc          = a.gen_rule_procedure,

								requestFields = a.gen_rule_request_fields,

								reqFields = function(){
									
									var r = '';
									
									if(requestFields){
										var farr = requestFields.split(',');

//										farr.forEach(function(f,i){
//											r+='p_'+f+' VARCHAR2 DEFAULT NULL';
//											if(i < farr.length-1)
//												r+=',';
//										});
										farr.forEach(function(f,i){
											r+='<item>p_'+f+'</item>';
										});

									}

									return r;
								}();

							rtn+='<rule type="'+action+'">';

								rtn+= '<proc>'+proc+'</proc>';

								rtn+='<requestFields>'+reqFields+'</requestFields>'

							rtn+='</rule>';
								 	
						break;
					}

				});

			});

			rtn+= '</rules>';

		}

		return rtn;
	}	

}