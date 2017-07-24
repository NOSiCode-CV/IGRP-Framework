var GENSTRUCTURES = function(){
	var STRUC = this;

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
			//fields     = container.GET.fields(),
			attributes = ' type="'+type+'"';
		
		if(tag){

			if(container.GET.hasTitle && container.GET.hasTitle() && container.GET.title)
				attributes+=' title="'+container.GET.title()+'"';


			for(var p in container.proprieties){
				if(container.proprieties[p].xmlAttr)
					attributes+=' '+p+'="'+container.GET[p]()+'"';
			}

			rtn+='<'+tag+attributes+'>';
			
				if(container.xml.type == 'fields'){
					rtn+=genFields(container);

					if(container.xml.table)
						rtn+=genTable(container);
					
					else if (container.contextMenu)
						rtn+=genContextMenu(container);
				};

				if(container.xml.type == 'group')
					rtn+=genGroup(container);
				
				if(container.xml.type == 'items')
					rtn+=genItems(container.GET.fields());

				if(container.xml.type == 'tabs')
					rtn+=genTabs(container.contents);
				
				if(container.xml.type == 'graphic')
					rtn+=genGraphic(container);

			rtn+='</'+tag+'>';

		}

		return rtn;
	}

	var genFieldStruc = function(p){
		//console.log(p);
		var rtn           = "";
		var field 		  = p.field;
		var tag  		  = field.xml.tag ? field.xml.tag : field.GET.tag(),
			type 		  = field.GET.type(),
			//label         = field.GET.label ? field.GET.label() : '',
			attributesStr = getAttrsArr(field);

		//console.log(field);

		if(tag){
			rtn+='<'+tag+attributesStr+'>';
				if(p.label && field.xml.label) 
					rtn+='<label>'+field.GET.label()+'</label>';
				
				if(field.xml.options)
					rtn+=getXMLOptions();
				else
					if(p.value && field.xml.value) rtn+='<value>'+DATA.get({type:type,field:p.field})+'</value>';
				
				if(field.xml.lookup || field.GET.type() == 'lookup')
					rtn+='<lookup>?XXX</lookup>';

				if(field.GET.service && field.GET.service().code)
					rtn+=getFieldServiceMap(field.GET.service());

			rtn+='</'+tag+'>';
		}
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

		fields.forEach(function(f){
			
			rtn+=genFieldStruc({
				field:f,
				label:container.xml.fieldsLabel,
				value:container.xml.fieldsValue
			});

		});
		
		if(container.GET.filter && container.GET.filter()){
			if($.trim(container.GET.filter()))
				rtn+='<filter name="p_'+container.GET.tag()+'_filter" type="'+container.GET.filter()+'"><value></value></filter>';
		}

		if(container.onFieldsXMLGenerate && container.onFieldsXMLGenerate(rtn) )
			rtn += container.onFieldsXMLGenerate(rtn);

		rtn+='</fields>';
		
		return rtn;
	}
	var genTable = function(container){
		var fields = container.GET.fields();
		var atts = "";
		
		var rtn ='<table>';
				rtn+='<value>';
				
				if(container.GET.fields()[0]){
					for(var i=0; i<4;i++){
						rtn+='<row>';
							fields.forEach(function(f){
								var tag   = f.GET.tag();
								var type  = f.GET.type();
								var value =  DATA.get({type:type, field:f});
								rtn+='<'+tag+'>'+value+'</'+tag+'>';
								if(f.xml.desc){
									rtn+='<'+tag+'_desc>'+value+'</'+tag+'_desc>';
								}
							});
						rtn+='</row>';
					}
				}
				rtn+='</value>';

			if(container.xml.tableLegend)
				rtn+='<legend_color><title>Legenda</title><item><label>Cor 1</label><value>1</value></item><item><label>Cor 2</label><value>2</value></item><item><label>Cor 3</label><value>3</value></item><item><label>Cor 4</label><value>4</value></item><item><label>Cor 5</label><value>5</value></item><item><label>Cor 6</label><value>6</value></item><item><label>Cor 7</label><value>7</value></item><item><label>Cor 8</label><value>8</value></item><item><label>Cor 9</label><value>9</value></item></legend_color>';
			
			if(container.contextMenu)
				rtn+=genContextMenu(container);


		rtn+='</table>';
		
		return rtn;
	}

	var genContextMenu = function(container){
		var rtn = '';
		
		if(container.contextMenu.items[0]){
			var ctx      = container.contextMenu.items;
			var tag      = container.contextMenu.xmlTag ? container.contextMenu.xmlTag : 'context-menu';
			var itemType = container.GET.type() == 'form' ? 'form' : 'specific';
			var rtn      = '<'+tag+'>';
			
			ctx.forEach(function(item){

				var app  = item.action && item.action.app    ? item.action.app    : '',
					page = item.action && item.action.page   ? item.action.page   : '',
					link = item.action && item.action.action ? item.action.action : '',
					tran = item.GET.transaction &&  item.GET.transaction() ? 'flg_transaction="true"'  : '';
				var map  = item.GET.service && item.GET.service().code ? getFieldServiceMap(item.GET.service()) : ''; 


				rtn+='<item type="'+itemType+'" code="" '+tran+'>'+
	                    '<title>'+item.GET.label()+'</title>'+
	                    '<app>'+app+'</app>'+
	                    '<page>'+page+'</page>'+
	                    '<link>'+link+'</link>'+
	                    '<target>'+item.GET.target()+'</target>'+
	                    '<img>'+item.GET.img()+'</img>'+
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
				img    = f.GET.img    ? f.GET.img()    : false,
				imgTag = img ? '<img>'+img+'</img>' : '',
				app    = f.action && f.action.app    ? f.action.app    : '',
				page   = f.action && f.action.page   ? f.action.page   : '',
				link   = f.action && f.action.action ? f.action.action : '',
				tran   = f.GET.transaction &&  f.GET.transaction() ? 'flg_transaction="true"'  : '';

			var map    = f.GET.service && f.GET.service().code ? getFieldServiceMap(f.GET.service()) : ''; 

			rtn+='<item type="specific" code="" rel="'+tag+'" '+tran+'>'+
		            '<title>'+title+'</title>'+
		            '<app>'+app+'</app>'+
		            '<page>'+page+'</page>'+
		            '<link>'+link+'</link>'+
		            '<target>'+target+'</target>'+
		            imgTag+
		            map+
		        '</item>';

		});
		return rtn;
	}

	var genTabs = function(contents){
		var rtn = '';
		contents.forEach(function(c){
			rtn+='<item name="'+c.GET.tag()+'">'+
				 	'<title>'+c.GET.label()+'</title>'+
				 	'<img>'+c.GET.img()+'</img>'+
				 '</item>';
		});

		return rtn;
	}

	var genGraphic = function(container){
		return '<caption></caption><xaxys>Eixo de X</xaxys><yaxys>Eixo de Y</yaxys><url></url><label><col>Ano</col><col>X1</col><col>X2</col><col>X3</col><col>X4</col></label><value><row><col>2010</col><col>265</col><col>658</col><col>498</col><col>698</col></row><row><col>2009</col><col>784</col><col>258</col><col>594</col><col>498</col></row><row><col>2015</col><col>1010</col><col>698</col><col>366</col><col>498</col></row></value><colors><col>#2f7ed8</col><col>#0d233a</col><col>#FF00FF</col><col>#FF0000</col></colors>';
	}

	var getFieldServiceMap = function(service){
		var rtn = '<service-map code="'+service.code+'">';
		service.connections.forEach(function(c){
			rtn+='<map><from>'+c.from+'</from>'+
				 '<to>'+c.to+'</to></map>';
		});
		rtn+='</service-map>';

		return rtn;
	}

	var getAttrsArr = function(field){
		var arr = "";
		for(var name in field.proprieties){
			if(name != 'label' && name !='tag' && name !='size'){
				if(field.GET[name]){
					var value = field.GET[name]();
					
					if(field.xml.attrs[name])
						arr+=' '+field.xml.attrs[name]()
					else
						arr+=' '+name+'="'+value+'"';

					//console.log(arr)
					
				}
			}
		}
		return arr;
	}

	var getXMLOptions = function(){
		var rtn = '<list>';
		for(var i = 1; i <= 4 ; i++){
			var text = 'Option '+i;
			rtn+='<option><text>'+text+'</text><value>'+i+'</value></option>';
		}
		rtn+= '</list>';
		return rtn;
	}
}