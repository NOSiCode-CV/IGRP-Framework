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
		],
		js  :[ 
			{path : '/core/igrp/form/igrp.forms.js',id:'Form'},
			{path : '/core/igrp/table/datatable/jquery.dataTables.min.js',id:'DataTable'},
			{path:'/core/igrp/table/datatable/dataTables.bootstrap.min.js',id:'DataTable'},
			{path:'/core/igrp/table/igrp.table.js'}
		]
	};

	/*var tableExportIncludes = [
		{ path:'/core/igrp/table/igrp.table.export2.js'},
		{ path:'/core/jspdf/js/jspdf.plugin.table.js'},
		{ path:'/core/filesaver/filesaver.js'},
		{ path:'/core/jspdf/js/bluebird.min.js'},
		{ path:'/core/jspdf/js/jspdf.debug.js'},
		{ path:'/core/jspdf/js/html2pdf.js'}
	];*/

	var tableOrderIncludes 		= [{path : '/core/formgen/js/jquery-ui.min.js'}],

		tablePaginationIncludes = [{path : '/core/igrp/table/pagination.js'}];

	var tableExportIncludes = [		
		{ path:'/core/igrp/table/export/buttons.print.min.js'},
		{ path:'/core/igrp/table/export/buttons.html5.min.js'},
		{ path:'/core/igrp/table/export/vfs_fonts.js'},
		{ path:'/core/igrp/table/export/pdfmake.min.js'},
		{ path:'/core/igrp/table/export/jszip.min.js'},
		{ path:'/core/igrp/table/export/buttons.flash.min.js'},
		{ path:'/core/igrp/table/export/dataTables.buttons.min.js'}		
	];

	var tableExportInc = false,
		tableOrderInc  = false,
		paginationInc  = false;

	function CheckExport(val){

		var action = val ? 'show' : 'hide';
		
		$('.gen-properties-setts-holder [item-name="edit-export"]')[action]();

		if(!val)

			$('.gen-properties-setts-holder [item-name="edit-export"] select').val('').trigger('change');

	};

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



		var includesJs = function(arr){
			arr.forEach(function(e){
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
		};

		container.setPropriety({
			name:'ordertable',
			label : 'Order Table',
			value:false,
			xslValue:'ordertable',
			onChange:function(v){
				if(v){

					if(!tableOrderInc){
						tableOrderIncludes.forEach(function(e){
							container.includes.js.unshift(e);
						});
						tableOrderInc = true;
					}					
				}else{
					includesJs(tableOrderIncludes);
					tableOrderInc = false;
				}
			}
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
			},
			onChange:function(v){
				if(v){

					if(!paginationInc){
						tablePaginationIncludes.forEach(function(e){
							container.includes.js.unshift(e);
						});
						paginationInc = true;
					}					
				}else{
					includesJs(tablePaginationIncludes);
					paginationInc = false;
				}
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
				value:'inl',
				options:[
					{value:'ctx',label:'Right Click'},
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
			},
			onEditionStart : function(o){
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
				
				if(set)

					for(var i = tableExportIncludes.length - 1; i >= 0; i--)

						container.includes.js.push(tableExportIncludes[i])

			}
		});

		/*container.setPropriety({
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
					includesJs(tableExportIncludes);
					tableExportInc = false;
				}
				console.log(container)
			}			
		});*/

		container.setPropriety({
			name:'dataTable',
			label : 'Data Table',
			value:true,
			xslValue:'igrp-data-table',
			onEditionStart:function(){
				
				CheckExport( container.GET.dataTable() );

				$('.gen-properties-setts-holder').on('change','[item-name="edit-dataTable"] input', function(){

					CheckExport( $(this).is(':checked') )

				});

			},
			//editable:false
		});

		container.setPropriety({
			name:'ctxInlineTmpl',
			label:'CtxMenu Inline',
			value:true,
			editable:false,
			onChange:function(e){
				container.SET.ctxInlineHeadTmpl(e);
			},

			xslValue:function(){
					return '<xsl:if test="//'+container.GET.path()+'/table/context-menu/item" gen-preserve="last"><td class="igrp-table-ctx-td" >'+
							'<xsl:apply-templates select="../../context-menu'+'" mode="table-context-inline">'+
								'<xsl:with-param name="row-params" select="context-menu"/>'+
							'</xsl:apply-templates>'+
						'</td></xsl:if>';
			}
		});

		container.setPropriety({
			name:'ctxInlineHeadTmpl',
			editable:false,
			value:true,
			xslValue:function(){
					return '<xsl:if test="'+container.GET.path()+'/table/context-menu/item" gen-preserve="last"><th class="igrp-table-ctx-th" gen-preserve="last"></th></xsl:if>';
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
		
		field.setPropriety({
			name : 'showLabel',
			label : 'Show Label',
			value:true
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
		
		GEN.SetJavaTypeAttr( field );
	}

	container.onCheckboxFieldSet = function(f){
		f.setProperty({
			name  	 : 'switch',
			label 	 : 'Switch',
			value    : false,
			xslValue : 'checkbox-switch switch'
		});
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
			
		})
		/*field.setProperty({
			
			name : 'info_window',
			
			label : 'Info Window',
			
			value : '',
			
			order: 4,
			
			inputType : 'texteditor',
			
			size : 12
			
		});*/
		
	};

	container.onColorFieldSet = function(field){
		//set legend xml
		container.xml.tableLegend = true;
		//set prop hasColor True
		container.SET.hasColorTmpl(true);
		//include  css
		container.includes.css.push(
			{ path:'/core/igrp/table/table-colors.css' }
		);

		if(!container.proprieties.legendColors)

			container.setPropriety({

				name:'legendColors',

				label : 'Legend Colors List',

				type : 'formlist',

				value : {

				value : params.proprieties && params.proprieties.legendColors || [
                        {
                            "color": "#dc2b4c",
                            "text": "Cor 1",
                            "value": "1"
                        },
                        {
                            "color": "#ea9126",
                            "text": "Cor 2",
                            "value": "2"
                        },
                        {
                            "color": "#95c11f",
                            "text": "Cor 3",
                            "value": "3"
                        }
                    ],

					setter:function(){
						
						var flist = $('<div class="box clean box-table-contents gen-container-item IGRP-gen-table-colors" gen-class="" item-name="gen_legend_colors_fl"><div class="box-body table-box"><table id="gen_legend_colors_fl" class="table table-striped gen-data-table IGRP_formlist " rel="T_gen_legend_colors_fl" data-control="data-gen_legend_colors_fl"><thead><tr><th align="" class="" style="width:33%;"><span>Text</span></th><th align="" class="" style="width:33%;"><span>Value</span></th><th align="" class="color-th" style="width:23%;"><span>Color</span></th><th class="table-btn add"><a class="formlist-row-add btn btn-primary" rel="gen_legend_colors_fl"><i class="fa fa-plus"/></a></th></tr></thead><tbody><tr row="0"><input type="hidden" name="p_gen_legend_colors_fl_id" value=""/><td align="" data-row="0" data-title="Text" class="text" item-name="text"><input type="hidden" name="p_text_fk_desc" value=""/><div class="form-group" item-name="text" item-type="text"><input type="text" name="p_text_fk" value="" class="text form-control" rel="F_gen_legend_colors_fl"/></div></td><td align="" data-row="0" data-title="Value" class="text" item-name="value"><input type="hidden" name="p_value_fk_desc" value=""/><div class="form-group" item-name="value" item-type="text"><input type="text" name="p_value_fk" value="" class="text form-control" rel="F_gen_legend_colors_fl"/></div></td><td align="" data-row="0" data-title="Color" class="color" item-name="color"><input type="hidden" name="p_color_fk_desc" value=""/><div class="form-group"><div class="input-group form-color-picker" format="hex"><input type="text" value="" format="hex" class="form-control" id="gen_legend_colors_fl_color_1" name="p_color_fk"/><span class="input-group-addon"><i/></span></div></div></td><td class="table-btn delete" data-row="0"><span class="formlist-row-remove btn btn-danger" rel="gen_legend_colors_fl"><i class="fa fa-times"/></span></td></tr></tbody></table></div></div>'),

							data  = 	container.GET.legendColors();

						$('.IGRP_formlist',flist).IGRP_formlist({

							data : data

						});

						$.IGRP.components.colorpicker.init(flist);

						return flist;

					}

				},

				size : 12

			});

	}	

	container.onColorFieldRemove = function(field){
		//has no Color 
		if(!container.hasFieldType('color')) {

			container.SET.hasColorTmpl(false);
			
			container.unsetProprieties(['legendColors']);
		}
	}
	
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
		if(container.GET.legendColors && container.GET.legendColors())
			$.IGRP.components.tableCtrl.setTableStyle( $('.box-table-contents',container.holder) );
		if(container.GET.ordertable())

			$.IGRP.components.tableCtrl.ordertable( 'table#'+container.GET.tag() );
	}

	var getTableFooter = function(){
		var rtn = '<tfoot><tr>';

		container.GET.fields().forEach(function(f){
			if(f.type != 'hidden'){
				var fValue = container.GET.path()+"/table/value/row[@total='yes']/"+f.GET.tag();
			var align  =  f.GET.align ? f.GET.align() : '';
			rtn+='<td align="'+align+'">';
				rtn+='<xsl:value-of select="'+fValue+'"/>'
			rtn+='</td>';
			}
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