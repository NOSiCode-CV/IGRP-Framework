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
		type   : 'button',
		holder : '.table-ctx-holder',
		menu   : {
			selector: '.operationTable',
			label   : 'span',
		}
	};

	container.includes = {
		xsl :[ 'table-utils'],
		css :[ 
			{path:'/core/igrp/table/datatable/dataTables.bootstrap.css', id:'DataTable'},
			{path:'/core/igrp/table/igrp.tables.css'},
			/*{path:'/core/igrp/table/dataTables.bootstrap.css'} */
		],
		js  :[ 
			{path : '/core/igrp/table/datatable/jquery.dataTables.min.js',id:'DataTable'},
			{path:'/core/igrp/table/datatable/dataTables.bootstrap.min.js',id:'DataTable'},
			{path:'/core/igrp/table/igrp.table.js'}
		]
	};

	var tableExportIncludes = [
		{ path:'/core/igrp/table/igrp.table.export2.js'},
		{ path:'/core/jspdf/js/jspdf.plugin.table.js'},
		{ path:'/core/filesaver/filesaver.js'},
		{ path:'/core/jspdf/js/bluebird.min.js'},
		{ path:'/core/jspdf/js/jspdf.debug.js'},
		{ path:'/core/jspdf/js/html2pdf.js'}
	];

	/*var tableExportIncludes = [
		{ path:'/core/igrp/table/igrp.table.export.js'},
		{ path:'/core/igrp/table/export/buttons.print.min.js'},
		{ path:'/core/igrp/table/export/buttons.html5.min.js'},
		{ path:'/core/igrp/table/export/vfs_fonts.js'},
		{ path:'/core/igrp/table/export/pdfmake.min.js'},
		{ path:'/core/igrp/table/export/jszip.min.js'},
		{ path:'/core/igrp/table/export/buttons.flash.min.js'},
		{ path:'/core/igrp/table/export/dataTables.buttons.min.js'},
		{ path:'/core/igrp/table/export/jquery.dataTables.min.js'}
	];*/

	var tableExportInc = false;

	container.ready = function(){

		container.setPropriety({
			name:'ctxMenuClass',
			value:false,
			editable:false,
			xslValue:'IGRP_contextmenu'
		});

		container.setPropriety({
			name:'hasContextMenu',
			value:false,
			editable:false,
			xslValue:'<xsl:apply-templates mode="context-param" select="context-menu" />'
		});

		container.setPropriety({
			name:'dataTable',
			label : 'Data Table',
			value:false,
			xslValue:'igrp-data-table'
		});

		container.setPropriety({
			name:'ctxMenuTemplate',
			value:false,
			editable:false,
			xslValue:function(){
				var rtn = !container.GET.ctxInlineTmpl() ? '<xsl:apply-templates select="'+container.GET.path()+'/table/context-menu'+'" mode="table-context-menu"/>' : '';
				
				return rtn;
			}
		});

		container.setPropriety({
			name:'hasColorTmpl',
			value:false,
			editable:false,
			xslValue:function(){

				return '<xsl:apply-templates mode="table-legend" select="'+container.GET.path()+'/table/legend_color"/>'
			}
		});

		container.setPropriety({
			name:'filterTemplate',
			value:false,
			editable:false,
			xslValue: function(){
				var filterTag = container.GET.tag()+"_filter",
					name	  = "'p_"+filterTag+"'",
					filter    = "'"+container.GET.filter()+"'",
					fltPg     = container.GET.filter()=='filter_num' ? '<xsl:with-param name="filter_pagination" select="'+container.GET.path()+'/fields/'+filterTag+'_pg/value"/>' : '';

				return '<xsl:call-template name="table-filter">'+
	                    '<xsl:with-param name="name" select="'+name+'"/>'+
	                    '<xsl:with-param name="value" select="'+container.GET.path()+'/fields/'+filterTag+'/value"/>'+
	                    fltPg+
	                    '<xsl:with-param name="type" select="'+filter+'"/>'+
	                  '</xsl:call-template>';
			}
		});

		container.setPropriety({
			name:'filter',
			value:{
				value: '',
				options:[
					{value : ''            ,label : ''},
					{value : 'filter_az'   ,label : 'A-Z'},
					{value : 'filter_num'  ,label : '0-9'},
					{value : 'filter_aznum',label : 'A-Z-0-9'}
				]
			},
			onChange:function(v){
				var val = v && v != ''? true : false;
				container.SET.filterTemplate(val);
			}
		});

		container.setPropriety({
			name:'ctxType',
			label:'Context Menu',
			value:{
				value:'ctx',
				options:[
					{value:'ctx',label:'RIght Click'},
					{value:'inl',label:'Inline'}
				]
			},
			onChange:function(v){
				var ismenu = v == 'ctx' ? true : false;
				container.SET.ctxInlineTmpl(!ismenu);
			},
			onEditionStart : function(v){
				$('select',v.input).on('change',function(){
					var action  = $(this).val() == 'inl' ? 'show' : 'hide'; 
					$('.gen-properties-setts-holder div[rel="ctxStyle"]')[action]();
				});
			}
		});

		container.setPropriety({
			name:'ctxStyle',
			label:'Context Menu Inline Style',
			value:{
				value:'',
				options:[
					{value:'',label:'Default'},
					{value:'align',label:'Align'}
				]
			},onEditionStart : function(o){
				if(container.GET.ctxType && container.GET.ctxType() == 'inl')
					o.input.show();
				else
					o.input.hide();
			}
		});

		container.setPropriety({
			name:'export',
			value:{
				value:'',
				options:[
					{value:'pdf',label:'PDF'},
					{value:'excel',label:'Excel'}
				],
				multiple:true
			},
			onChange:function(v){
				var set = v && v[0] ? true : false;
				container.SET.exportTmpl(set);
			}
		});

		container.setPropriety({
			name:'exportTmpl',
			value:false,
			editable:false,
			xslValue:function(){
				var rtn = '<xsl:call-template name="table-export-options">';

				container.GET.export().forEach(function(e){
					rtn+='<xsl:with-param name="'+e+'" select="true()"/>'
				});
				rtn+='</xsl:call-template>';

				return rtn;
			},
			onChange:function(v){
				if(v){

					if(!tableExportInc){
						tableExportIncludes.forEach(function(e){
							container.includes.js.unshift(e);
						});
						tableExportInc = true;
					}					
				}else{
					tableExportIncludes.forEach(function(e){
						for( var i = 0; i < container.includes.js.length; i++){
							var inc = container.includes.js[i];
							if(inc.path == e.path){
								var index = container.includes.js.indexOf(inc);
								if (index > -1) 
								    container.includes.js.splice(index, 1);
								break;
							}
						}
					});
					tableExportInc = false;
				}
				console.log(container)
			}			
		});

		container.setPropriety({
			name:'ctxInlineTmpl',
			label:'CtxMenu Inline',
			value:false,
			editable:false,
			onChange:function(e){
				container.SET.ctxInlineHeadTmpl(e);
			},

			xslValue:function(){
				return '<td class="igrp-table-ctx-td" gen-preserve="last">'+
							'<xsl:apply-templates select="../../context-menu'+'" mode="table-context-inline">'+
								'<xsl:with-param name="row-params" select="context-menu"/>'+
							'</xsl:apply-templates>'+
						'</td>';
			}
		});

		container.setPropriety({
			name:'ctxInlineHeadTmpl',
			editable:false,
			value:false,
			xslValue:function(){
				return '<th class="igrp-table-ctx-th" gen-preserve="last"></th>';
			}
		});

		container.setPropriety({
			name:'tableFooter',
			value:false,
			editable:false,
			xslValue:getTableFooter
		});

	}
	/* WHEN A FIELD IS DROPPED - SET EXAMPLE DATA TO THE TABLE*/
	container.onFieldSet = function(field){
		//field.xml.desc = true;
		field.setPropriety({
			name:'maxlength',
			value : 30
		});

		if(!field.hidden){
			
			field.setPropriety({
				name:'align',
				propriety:{
					value:'left',
					options:[
						{value:'left',label:'Left'},
						{value:'center',label:'Center'},
						{value:'right',label:'Right'}
					]
				}
			});

			field.setPropriety({
				name    : 'lookup_parser',
				label   : 'Value Parser',
				value   : false,
				xslValue: 'lookup-parser'
			});

			switch (field.GET.type()){
				case 'checkbox':
				case 'link':
				case 'radio':
					field.xml.desc = true;
				break;
			}
		}

		field.setPropriety({
			name    : 'iskey',
			label   : 'Is Key',
			value   : false
		});

		if(field.GET.type() == 'number'){
			field.setPropriety({
				name:'total_footer',
				label:'Total Row',
				value: false,
				onChange:function(v){
					container.SET.tableFooter(v)
				}
			});
		}
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

		console.log(f.GET.btnSize())
	}
	
	container.onContextMenuSet = function(field){

		//field.unsetProprieties(['class'])

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

	container.onColorFieldSet = function(field){
		//set legend xml
		container.xml.tableLegend = true;
		//set prop hasColor True
		container.SET.hasColorTmpl(true);
		//include  css
		container.includes.css.push(
			{ path:'/core/igrp/table/table-colors.css' }
		);
	}	

	container.onColorFieldRemove = function(field){
		//has no Color 
		if(!container.hasFieldType('color')) 
			container.SET.hasColorTmpl(false);
	}

	container.onDrawEnd = function(){

		if(tableExportInc &&  container.GET.fields()[0])
			$.IGRP.components.tableExport2.init( 
				container.holder.find( $('.box-table-contents') ) 
			);

		if(container.GET.ctxMenuClass() && $.IGRP.components.contextMenu)
			$.IGRP.components.contextMenu.set($('.box-table-contents',container.holder));

		if(container.GET.dataTable())
			$.IGRP.components.tableCtrl.dataTable({
				selector : 'table#'+container.GET.tag()+'.igrp-data-table'
			});
	}

	var getTableFooter = function(){
		var rtn = '<tfoot><tr>';

		container.GET.fields().forEach(function(f){
			var fValue = container.GET.path()+"/table/value/row[@total='yes']/"+f.GET.tag();
			var align  =  f.GET.align ? f.GET.align() : '';
			rtn+='<td align="'+align+'">';
				rtn+='<xsl:value-of select="'+fValue+'"/>'
			rtn+='</td>';
		});

		if(container.GET.ctxInlineTmpl())
			rtn+='<td/>'

		rtn+='</tr></tfoot>'

		return rtn;
	}
				
}

this[VARS.name].declareContainer({
	name:'table',
	container:GENTABLE
});