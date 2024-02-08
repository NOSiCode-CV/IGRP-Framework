var GENTABLE = function(name,params){

	CONTAINER.call(this,name,params);

	
	var GEN = VARS.getGen();
	
	var container = this;

	container.xml.table       = true;

	container.xml.fieldsValue = false;

	container.xml.genGroup = true;
	/*CONFIG FIELD SORT*/
	container.sortableOptions.axis = "x";

	var ctxIncludes = false;
	

	var hideBody = function(){
		$('tbody,tfoot',container.holder).hide();
	}

	var showBody = function(){
		$('tbody,tfoot',container.holder).show();
	}
		
	container.sortableOptions.onOver = hideBody;

	container.sortableOptions.onOut = showBody;

	container.contextMenu = {
		type   : 'button'
	};

	container.dropZoneFieldValidation = function(dropzone,field){
	
		return field.GET.table && field.GET.table() === false ? false : true;
	}

	container.includes = {
		xsl :[ 'IGRP-table-utils.tmpl','component.table', 'component.form.fields'],
		css :[ 
			{path:'/components/table/table.css'}		
		],
		js  :[ 
			{path : '/core/igrp/form/igrp.forms.js',id:'Form'},
			{path : '/libs/datatable/jquery.dataTables.min.js'},
			{path : '/libs/datatable/dataTables.bootstrap5.min.js'},
			{path : '/libs/datatable/dataTables.responsive.min.js'},
			{path:'/components/table/table.js'}
		]
	};


	container.on('init', ()=>{
		
		container.SET.hasTitle(true);

		var tableStyleProps = GEN.getGlobalProperty('table-style');

		tableStyleProps(container, params);

		container.setPropriety({
			name:'tableFooter',
			value:false,
			editable:false,
			xslValue:getTableFooter
		});

	})

	/*container.ready = function(){

	}*/

	container.on('field:before-init', (field)=>{
		
		const tablePropsGroup = [];

		field.setPropriety({
			name:'maxlength',
			label : 'Tamanho Máximo',
			value : 30
		});

		field.setPropriety({
			name    : 'iskey',
			label   : 'Chave?',
			value   : false
		});

		if(!field.hidden){
			tablePropsGroup.push(
				{
					name:'group_in',
					label:'Agrupar em',
					value: {
						value : '',
						options : function(){
							var o = [{
								label : '',
								value : ''
							}];
							field.parent.GET.fields().forEach(function(f){
								if(f.GET.tag() != field.GET.tag() && f.GET.type() !== 'hidden'){
									if(f.GET.group_in && !f.GET.group_in())
										o.push({
											label : f.GET.label() || f.GET.tag(),
											value : f.GET.tag()
										})	
								}
							});
							return o;
						}
					}
				},
				{
					name:'align',
					label:'Alinhamento',
					propriety:{
						value:'left',
						options:[
							{value:'left',label:'Esquerda'},
							{value:'center',label:'Centro'},
							{value:'right',label:'Direita'}
						]
					}
				},
				{
					name:'table',
					label : 'Mostrar na Lista',
					value: true
				},
				{
					name:'filter',
					label : 'Mostrar no Filtro',
					value: true
				},
				{
					name    : 'lookup_parser',
					label   : 'Passa valor',
					value   : false,
					xslValue: 'lookup-parser'
				},
				{
					name : 'showLabel',
					label : 'Mostrar Cabeçalho',
					value:true
				},
			);
		}else
			GEN.SetJavaTypeAttr( field )
		
		if(field.GET.type() == 'number'){
			tablePropsGroup.push({
				name:'total_footer',
				label:'Coluna de Total',
				value: false,
				onChange:function(v){
					container.SET.tableFooter(v)
				}
			});
		}
		
		field.setPropertyGroup({
			name: 'table-props',
			label : 'Opções de Tabela',
			order: 20,
			properties : tablePropsGroup
		});



		switch (field.proprieties.type){
			case 'checkbox':
			case 'link':
			case 'radio':
				field.xml.desc = true;
			break;
		}
		
	})
	/* WHEN A FIELD IS DROPPED - SET EXAMPLE DATA TO THE TABLE*/
	container.onFieldSet = function(field){
		//field.xml.desc = true;
		
		
	}

	container.onCheckboxFieldSet = function(f){

		
	}

	container.onLinkFieldSet = function(f){
		//console.log(f.proprieties.btnSize.value);
		/*f.setPropriety({
			name:'btnSize',
			label:'Buttons Size',
			propriety:{
				value: 'btn-xs',
				options:[
					{value:'',label:'Normal'},
					{value:'btn-lg',label:'Large'},
					{value:'btn-xs',label:'Small'}
				]
			}
		});*/

		f.setPropriety({
			name:'show_header',
			label:'Show Header',
			value : true,
			xslValue : '<span><xsl:value-of select="'+container.GET.path()+'/fields/'+f.GET.tag()+'/label"/></span>'
		});

	}
	
	container.onContextMenuSet = function(field){

		field.setProperty({
			name:  'action_type',
			order: 5,
			value : {
				value : 'specific',
				options : [
					{ label : 'Ação de Contexto', value:'specific' },
					{ label : 'Ação', value:'action' }
				]
			}
		})

		if(!ctxIncludes){
			container.SET.ctxMenuClass(true);
			container.SET.ctxMenuTemplate(true);
			container.SET.hasContextMenu(true);
		
			container.includes.js.push(
				{ path:'/core/igrp/table/bootstrap-contextmenu.js' },
				{ path:'/core/igrp/table/table.contextmenu.js' }
			);

			ctxIncludes = true;

		}
	}

	container.onContextMenuRemove = function(){
		if(!container.hasFieldType('button')){
			container.SET.ctxMenuClass(false);
			container.SET.ctxMenuTemplate(false);
			container.SET.hasContextMenu(false);
			ctxIncludes = false;
		}
	}
	
	container.onLocatorFieldSet = function(field){
		
		field.setProperty({
			
			name : 'properties',
			
			value : {
				
				value : '',
				
				multiple : true,
				
				options : function(){
					
					var options = [
						
					];
					
					container.GET.fields().forEach(function(f){
						
						if(f.type != 'locator'){
							
							options.push({
								
								label : f.GET.label ? f.GET.label() : f.GET.tag(),
								
								value : f.GET.tag()
								
							})
							
						}
						
					});
					
					return options;
					
				}
				
			},
			order: 4,
			
			onChange:function(v){
				
				console.log(v)
				
			}
			

		});
		
	};

	
	
	container.xml.getLegendColors = function(){
		var rtn = null;
		
		if(container.GET.legendColors && container.GET.legendColors()[0] ){
			
			var data = container.GET.legendColors();
			
			if(data[0].color != '' && data[0].value != ''){
				
				rtn = '<legend_color>';
				
				data.forEach(function(d){
					rtn+='<item><label>'+d.text+'</label><value>'+d.value+'</value><color>'+d.color+'</color></item>';
				});
				
				rtn += '</legend_color>';
			}
			
		}
		
		return rtn;
	}
	
	container.onDrawEnd = function(){
	
		$.IGRP.components.table_ext?.init( container.holder );

		/*if(tableExportInc &&  container.GET.fields()[0])
			$.IGRP.components.tableExport2.init( 
				container.holder.find( $('.box-table-contents') ) 
			);

		if(container.GET.ctxMenuClass() && $.IGRP.components.contextMenu)
			$.IGRP.components.contextMenu.set($('.box-table-contents',container.holder));

		if(container.GET.dataTable())
			$.IGRP.components.tableCtrl.dataTable({
				selector : 'table#'+container.GET.tag()+'.igrp-data-table'
			});
		if(container.GET.legendColors && container.GET.legendColors())
			$.IGRP.components.tableCtrl.setTableStyle( $('.box-table-contents',container.holder) );
		if(container.GET.ordertable())

			$.IGRP.components.tableCtrl.ordertable( 'table#'+container.GET.tag() );*/
	}

	var getTableFooter = function(){
		var rtn   = '<tfoot><tr>';

		container.GET.fields().forEach(function(f){
			
			if($.inArray(f.type,container.reject) === -1 && f.GET.tag() != container.GET.tag()+'_filter' && f.type != 'hidden'){
				
				var fValue = container.GET.path()+"/table/value/row[@total='yes']/"+f.GET.tag(),
				
					align  =  f.GET.align ? f.GET.align() : '';
			
				rtn+='<xsl:if test="//'+container.GET.path()+"/fields/"+f.GET.tag()+'">';
				
					rtn+='<td align="'+align+'" item-name="'+f.GET.tag()+'" td-name="'+f.GET.tag()+'">';
				
						rtn+='<xsl:value-of select="'+fValue+'"/>';
				
				rtn+='</td></xsl:if>';
			}
		});

		if(container.GET.ctxInlineTmpl())
			rtn+='<xsl:if test="rows/content/'+container.GET.tag()+'/table/context-menu/item"><td/></xsl:if>';

		rtn+='</tr></tfoot>';
		
		return rtn;
	}
				
}

this[VARS.name].declareContainer({
	name:'table',
	container:GENTABLE
});