var VARS = {
	name    :'IGRPGEN',
	genPath :'/core/formgen',
	html:{
		content 			  : '#form-gen #content',
		typesMenu 		      : '#gen-types-menu li', //types (containers/fields) tab menu li
		typesHolder 		  : 'section#gen-types-holder',//types div holder id
		typesRel 		      : '.gen-menu-rel', //types div holder class
		htmls   		      : 'ul.gen-htmls > li.gen-declared-htmls',//htmls
		containers 		      : 'ul.gen-containers > li.gen-declared-containers',//containers li
		fields	 		      : 'ul.gen-fields > li.gen-declared-fields',//fields li
		tab               	  : '#gen-tab-js-holder ul li',//other containers (custom)
		viewers			      : '.gen-viewers',
		declaredContainers    : '.gen-declared-containers',
		declaredHtmls         : '.gen-declared-htmls',
		containersContents    : '.container-contents',//class of where container html will be dropped
		containersPlaceHolder : '.gen-container-placeholder',//screen placeholders of containers
		view	    	      : '#igrp-contents',//view id
		code	    	      : '#gen-xsl',//code id
		codeArea 		      : '#gen-xsl #gen-xsl-view',//code are
		viewsController       : '#gen-views-ctrl ul li',///
		layoutMenu            : '#view-types li[rel="layout"]',//layout menu
		pageCopySelecter      : '#gen-page-copy-selecter',
		pageCopyContainerList : '#gen-page-copy-c-list'
	},
	layout: {
		rows       		   : '.gen-row',
		columns    		   : '.gen-column',
		options    		   : '.row-options',
		optionItem 		   : '.row-options ul li',
		moveColumnContent  : '.row-options ul li[rel="move-columns-content"]',
		addColumn  		   : '.row-options ul li[rel="columns"]',
		columnSettings     : '.row-options ul li[rel="columns"]',
		columnSettingsItem : '.row-options ul li[rel="columns"] .column-setter[data-layout]',
		addRow     		   : '.row-options ul li[rel="add-row"]',
		deleteRow    	   : '.row-options ul li[rel="delete-row"]',
		rowsHtml   		   : `<div class="row">
		
		<div class="text-light add-row-control d-flex align-items-center justify-content-center" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">
			<i class="ri-add-fill"></i>
		</div>

		<div class="text-light add-row-control control-top d-flex align-items-center justify-content-center" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">
			<i class="ri-add-fill"></i>
		</div>


		<div class="row-options ">
		  <ul>
			
		 	<li class="d-flex align-items-center" rel="move" data-bs-toggle="tooltip" data-bs-title="Ordenar" >
			  <a class="btn-small d-flex align-items-center move-row" href="#">
				<span class="small d-none">Mover</span>
				<i class="ri-drag-move-2-fill"></i>
			  </a>
			</li>

			<li class="d-flex align-items-center" rel="clone" data-bs-toggle="tooltip" data-bs-title="Clonar" >
			  <a class="btn-small d-flex align-items-center clone-row" href="#">
				<span class="small d-none">Clonar</span>
				<i class=" ri-file-copy-line"></i>
			  </a>
			</li>

			<li class="d-flex align-items-center position-relative" rel="columns" data-bs-toggle="tooltip" data-bs-title="Estrutura" >
			  <a class="btn-small d-flex align-items-center add-columns" data-bs-toggle="dropdown" data-bs-auto-close="outside" href="#">
				<span class="small d-none">Grid</span>
				<i class=" ri-layout-grid-line"></i>
			  </a>
			  <div class="dropdown-menu p-0">
			  		<div class="dropdown-header px-2">
						Estrutura 
				
					</div>
					<div class="p-3">
						<div class="row-structures-wrapper row g-3 ">
						${ [ [12], [6,6], [4,4,4],[3,3,3,3], [8,4], [4,8], [9,3],[3,9], [10,2], [2,10]  ].map( (r)=>(
							`<div class="col-3">
								<div class="row gx-1 column-setter" data-layout="${r.join(',')}">
									${r.map( (c)=>(`
										<div class="col-${c}"><div class="struc-col-inner"></div></div>
									`) ).join('')}
								</div>
							</div>
							`
						) ).join('') }
						</div>
						<div class="vertical-alignment my-3 d-none ">
							Alinhamento Vertical
							<div class="d-flex h4 m-0 g-4">
								<div>
									<i class="ri-align-top"></i>
								</div>
								<div>
									<i class=" ri-align-vertically"></i>
								</div>
								<div>
									<i class="ri-align-bottom"></i>
								</div>
							</div>
						</div>
						<div class="horizontal-alignment">
						
						</div>
					</div>
			  </div>
			</li>

			<li class="d-flex align-items-center" rel="delete-row" data-bs-toggle="tooltip" data-bs-title="Eliminar Seção">
			  <a class="btn-small d-flex align-items-center" href="#">
			  	<i class="ri-delete-bin-line"></i>
				
			  </a>
			</li>

			<li class="d-none align-items-center " rel="add-row" data-bs-toggle="tooltip" data-bs-title="Adicionar Seção">
			  <a class="btn-small d-flex align-items-center" href="#">
			  	<span class="small d-none">Nova Seção</span>
				<i class="ri-layout-row-line"></i>
				
			  </a>
			</li>


		  </ul>
		  <input type="text" class="row-class-setter" placeholder="ROW" />

		  
		</div>
	  </div>
	  
	  
		`,
		columnsHtml 	   : '<div class="gen-column"><div class="col-options clearfix d-flex"><ul class="pull-right ms-auto"><li class="move-col" title="Move Column"><a class="btn-small" href="#"><i class="ri-arrow-left-right-line"></i></a></li></ul></div><div class="gen-column-inner gen-inner"><div place="c" class="gen-container-placeholder"></div></div></div>',	
		columnOptionsHtml  : `
		<div class="column-list">
			<ul class="p-0">
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-12"
					data-layout="12"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-66 active"
					data-layout="6,6"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-444"
					data-layout="4,4,4"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-3333"
					data-layout="3,3,3,3"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-48"
					data-layout="4,8"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-39"
					data-layout="3,9"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-363"
					data-layout="3,6,3"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-264"
					data-layout="2,6,4"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-210"
					data-layout="2,10"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-57"
					data-layout="5,7"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-237"
					data-layout="2,3,7"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-255"
					data-layout="2,5,5"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-282"
					data-layout="2,8,2"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-2442"
					data-layout="2,4,4,2"
					></a>
				</li>
				<li>
					<a
					href="#"
					class="column-layout hasTooltip column-layout-custom"
					data-layout="custom"
					></a>
				</li>
			</ul>
		</div>
		
		`,
		columnOptionClass  :'gen-column-option'
	},
	types:{
		containers:'container'
	},
	attrs:{
		structure:'gen-structure'
	},
	ids:{
		theadContent:'thead-content',
		dropZone	:'drop-zone',
	},
	class:{
		containersHolder    : 'gen-container-holder',
		containersContent   : 'container-contents',
		placeHolderHover    : 'gen-container-hover',
		sortablePlaceholder : 'gen-container-sortable-placeholder',
		formHidden          : 'hidden-item-holder',
		fieldsHolder        : 'gen-fields-holder',
		ctxMenuHolder 	    : 'gen-ctx-menu-holder',
		labelSetter         : 'gen-lbl-setter',
		btnClick			: 'bClick',
		columnOptions       : 'columns-structure',
		//ctxMenu
		ctxMenu 			: 'gen-ctx-menu',
		ctxMenuOn 			: 'gen-ctx-on',
		IGRP                : {
			checkAll : 'IGRP_checkall'
		}
	},
	groups:{
		adderClass       : 'gen-group-adder',
		itemMenuClass    : 'gen-group-menu',
		itemEditClass    : 'gen-group-item-edit',
		itemRemoveClass  : 'gen-group-item-rmv',
	},	
	edition:{
		modal 			 : '#gen-edition-modal',
		id               : 'gen-edition-modal',
		dialog           : '#gen-edition-modal',
		holder           : '#gen-edition-modal',
		arrow 			 : '#gen-edition-dialog-holder .arrow_box',
		table            : '#gen-edition-proprieties',
		//table 			 : '#gen-edition-dialog table',
		proprietySetter  : 'input.propriety-setter',
		proprietyChecker : '.propriety-setter.checker',
		proprietySelecter: 'select.propriety-setter',
		class            : {
			setterHolder : 'setter-holder',
			propSetter   : 'propriety-setter',
			label        : 'edition-lbl',
			value 		 : 'edition-val'
		}
	},
	tags:{
		plsql:'plsql',
		php:'php'
	},
	templates:{

		accordionItemHtml : ( { id, title, headingId,parentId, content } )=>{
			return `
				<div class="accordion-item px-3 pt-4 bg-transparent">
					<h2 class="accordion-header" id="${headingId}">
						<span
							class="collapsed d-flex align-items-center"
						
							data-bs-toggle="collapse"
							data-bs-target="#${id}"
						
							aria-controls="${id}"
						>
							${title}
						</span>
					</h2>
					<div
						id="${id}"
						class="accordion-collapse collapse "
						aria-labelledby="${headingId}"
						data-bs-parent="#${parentId}"
					>
						<div class="accordion-body">

						</div>
					</div>
				</div>
			`
		},

		//tittleCollapserStr:'<xsl:call-template name="titlecollapser"><xsl:with-param name="title" select="'+"'#title#'"+'"/><xsl:with-param name="collapsible" select="'+"'#collapsible#'"+'"/></xsl:call-template>',
		tittleCollapserStr:'<xsl:call-template name="box-header">'+
								'<xsl:with-param name="title" select="#path#/@title"/>'+
								'<xsl:with-param name="collapsible" select="'+"'#collapsible#'"+'"/>'+
								'<xsl:with-param name="collapsed" select="'+"'#[collapsed]#'"+'"/>'+
							'</xsl:call-template>',
		/*
		
		*/
		fieldValidator:function(fieldPath){
			return '<xsl:call-template name="FIELD_validator">'+
                        '<xsl:with-param name="field" select="'+fieldPath+'"/>'+
                    '</xsl:call-template>';
		}
	},
	xsl:{
		allIncludes:'<xsl:include href="../../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150309"/>'+
	  				'<xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>'+
  					'<xsl:include href="../../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>'+
  					'<xsl:include href="../../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>',
	},
	xml:{
		plsql:function(){
			var GEN = VARS.getGen();
			var action = GEN.DETAILS ? GEN.DETAILS.action : '';
			return  '<'+VARS.tags.plsql+'>'+
				        '<action>'+action+'</action>'+
				        '<package_instance>'+GEN.SETTINGS.instance+'</package_instance>'+
				        '<package_db>'+GEN.SETTINGS.package+'</package_db>'+
				        '<package_html>'+GEN.SETTINGS.html+'</package_html>'+
				        '<table_name>'+GEN.SETTINGS.table+'</table_name>'+
				        '<with_replace>'+GEN.SETTINGS.replace+'</with_replace>'+
				        '<with_label>'+GEN.SETTINGS.label+'</with_label>'+
				        '<with_biztalk>'+GEN.SETTINGS.biztalk+'</with_biztalk>'+
				        '<dynamic_menu>false</dynamic_menu>'+
				        '<copy_menu>false</copy_menu>'+
				        '<package_copy_db />'+
				        '<package_copy_html />'+
				        '<preserve_url>'+GEN.UTILS.preserve_url+GEN.DETAILS.id+'</preserve_url>'+
			    	'</'+VARS.tags.plsql+'>';
		},

		site:'<link_img>'+path+'</link_img><title>Dummie XML prototype</title>'+
				'<site>'+
		        '<welcome_note>Oba</welcome_note>'+
		        '<footer_note>2019 - Copyright NOSI v.190711</footer_note>'+
		        '<user_name>Hexagon</user_name>'+
		        '<button type="specific">'+
		            '<title>Sair</title>'+
		            '<app>DUA</app>'+
		            '<page />'+
		            '<link>#</link>'+
		            '<target>_self</target>'+
		            '<img>exit.png</img>'+
		        '</button>'+
		     '</site>',

		init:'<rows>'+
				'<content></content>'+
			 '</rows>'
	},
	hack:{
		input:'_input',
		form : 'formsssss'
		//img  :'_img'
	},
	getContainerFieldItems : function(c){
		let ret = "";
		c?.acceptableFields?.map( (field)=>{
			const elem = $('.treeview-menu li.gen-declared-fields[name="'+field+'"]');
			const title = $('a span', elem).text();
			const icon = $('i',elem).attr('class');

			ret+= `
			<div field-name="${field}" class="container-field-item text-truncate d-flex flex-column align-items-center justify-content-center text-truncate">
				<i class="${icon}" style="font-size: 20px;"></i>
				<span class="text-truncate">${title}</span>
			</div>
			`
			
		} ) 
	
		return ret;
	},
	getContainerSettsHtml:function(c){
		
		return '<div id="'+c.id+'" type="'+c.GET.type()+'" class="'+VARS.class.containersHolder+'">'+
					//header
				    '<div class="box-tools gen-container-setts shadow-lg  gen-settings-holder d-flex align-items-center">'+
				    	'<span class="gen-c-copy-i"  title="Container Copied">*</span>'+
				    	'<span class="c-holder-loading"></span>'+

				    	'<span class="c-type me-2" style="font-size:10px;color:#a7a7a7">'+c.GET.tag()+'</span>'+
				        
				        /*(c.canRecieveFields ?  (
							`<div class="btn btn-box-tool container-add-field ">
								<span><i class="ri-add-line"></i></span>
								<div class="container-fields-wrapper border rounded">
									<div class="d-flex flex-wrap bg-light shadow ">
									${this.getContainerFieldItems(c)}
									</div>
								</div>
								
							</div>`
						):'')+*/

					
						
						'<div class="btn btn-box-tool container-mover">'+
				            '<i class="ri-drag-move-2-fill"></i>'+
				        '</div>'+

				        '<a class="btn btn-box-tool container-clone gen-clone-btn" title="Clonar">'+
				            '<i class="ri-file-copy-line"></i>'+
				        '</a>'+

				        '<a class="btn btn-box-tool container-edit gen-edition-btn" title="Editar"	>'+
				            '<i class="ri-settings-5-line"></i>'+
				        '</a>'+

				        '<a class="btn btn-box-tool container-remove" title="Remover">'+
				            '<i class="ri-delete-bin-line"></i>'+
				        '</a>'+
				        
				    '</div>'+
					//contents
					'<div class="'+VARS.class.containersContent+'"></div>'+
				'</div>';
	},
	getFieldsSettsHtml:function(f){
		var hasContents = f.parent && f.parent.contents ? true : false,

			cloneHtml   = !hasContents ? '<a class="btn btn-box-tool d-flex align-items-center justify-content-center  field-clone gen-clone-btn" title="">'+
				            	'<i class="ri-file-copy-line"></i>'+
				          '</a>' : '';

		return '<div class="box-tools gen-field-edt-options  shadow-lg gen-settings-holder d-flex align-items-center">'+

			        cloneHtml+

			        '<a class="btn btn-box-tool d-flex align-items-center justify-content-center  field-edit gen-edition-btn" title="">'+
			            '<i class="ri-settings-5-line"></i>'+
			        '</a>'+

			        '<a class="btn btn-box-tool d-flex align-items-center justify-content-center  field-remove">'+
			            '<i class="ri-delete-bin-line"></i>'+
			        '</a>'+
			    '</div>';
	},

	fontawesome:{
		setter:null,
		setHTML:function(fa){
			
			var holder    = $('<div class="gen-fa-setter">'),
				ul        = $('<ul class="nav nav-tabs icons-list-tab d-flex flex-nowrap overflow-auto" style="height:32px"/>'),
				contents  = $('<div class="tab-content icons-list-tab"/>'),
				searcher  = $('<div class="form-group icon-searcher col-md-12"><input class="form-control" type="text" placeholder="Pesquisar"></div>'),
				searchRes = $('<div class="icon-search-result clearfix"/>'),
				idx       = 0;

			holder.append([searcher,ul,contents,searchRes]);

			searcher.on('keyup','input',function(){

				var word   = $(this).val(),

					parent = $(this).parents('.gen-fa-setter');
				
				if(word.length > 0){

					$('.icons-list-tab',parent).hide();
					
					$('.gen-fa-icon',parent).hide();

					$('.icon-search-result',parent).html('');

					var items = $('.gen-fa-icon[title*="'+word+'"]:not(.duplicated)',parent).clone().show();

					$('.icon-search-result',parent).append(items);

					$('.icon-search-result',parent).show();

				}else{

					$('.icons-list-tab',parent).show();
					
					$('.icons-list-tab .gen-fa-icon',parent).show();

					$('.icon-search-result',parent).html('');
				}

			});

			for(var c in fa){

				var icons   = fa[c],
					id      = 'gen-fa-'+c,
					active  = idx == 0 ? 'active in' : '';
					li 	    = $('<li rel="'+c+'" class="'+active+'"><a data-toggle="tab" href="#'+id+'">'+c+'</a></li>'),
					content = $('<div id="'+id+'" class="tab-pane '+active+'"></div>');

					for(var i in icons){
						
						var duplicatedClss = icons[i].duplicated ? 'duplicated' : '',
							icon           = $('<span class="gen-fa-icon '+duplicatedClss+'" parent="'+c+'" rel="'+icons[i].value+'" title="'+icons[i].label+'"><i class="fa '+icons[i].value+'"></i></span>')
						
						content.append(icon);
					}

					contents.append(content);

					ul.append(li);

					idx++;
			}

			VARS.fontawesome.setter = holder[0];

		}
	},

	getGen:function(){
		return window[VARS.name];
	}
}