var VARS = {
	name:'IGRPGEN',
	html:{
		content 			  : '#form-gen #content',
		typesMenu 		      : '#gen-types-menu li', //types (containers/fields) tab menu li
		typesHolder 		  : 'section#gen-types-holder',//types div holder id
		typesRel 		      : '.gen-menu-rel', //types div holder class
		containers 		      : 'ul.gen-containers li',//containers li
		fields	 		      : 'ul.gen-fields li',//fields li
		tab               	  : '#gen-tab-js-holder ul li',//other containers (custom)
		viewers			      : '.gen-viewers',
		declaredContainers    : '.gen-declared-containers',
		containersContents    : '.container-contents',//class of where container html will be dropped
		containersPlaceHolder : '.gen-container-placeholder',//screen placeholders of containers
		view	    	      : '#gen-view',//view id
		code	    	      : '#gen-code',//code id
		codeArea 		      : '#gen-code #gen-code-view',//code are
		viewsController       : '.gen-views-control',///
		layoutMenu            : '#view-types li[rel="layout"]',//layout menu

	},
	layout: {
		rows       		   : '.gen-row',
		columns    		   : '.gen-column',
		options    		   : '.gen-row-options',
		optionItem 		   : '.gen-row-options ul li',
		addColumn  		   : '.gen-row-options ul li[rel="column"]',
		columnSettings     : '.gen-row-options ul li[rel="column"]',
		columnSettingsItem : '.gen-row-options ul li[rel="column"] .columns-structure > span',
		addRow     		   : '.gen-row-options ul li[rel="add-row"]',
		deleteRow    	   : '.gen-row-options ul li[rel="delete-row"]',
		rowsHtml   		   : '<div class="gen-row"><div class="gen-row-options"><ul><li rel="column"><span>column</span></li><li rel="add-row"><span>add row</span></li><li rel="delete-row"><span>delete</span></li></ul></div></div>',
		//rowsHtml   : '<div class="gen-row"><div class="gen-row-options"><ul><li rel="column">[add column]</li><li rel="row">[add row]</li></ul></div><div class="gen-column col"><div class="gen-column-inner"><div place="c" class="gen-container-placeholder"></div></div></div></div>',
		columnsHtml 	   : '<div class="gen-column"><div class="gen-column-inner"><div place="c" class="gen-container-placeholder"></div></div></div>',	
		
		columnOptionsHtml  :'<div class="columns-structure">'+
								'<span type="1-1"></span>'+
								'<span type="1-2|1-2"></span>'+
								'<span type="1-4|9-12"></span>'+
								'<span type="9-12|1-4"></span>'+
								'<span type="1-3|1-3|1-3"></span>'+
								'<span type="1-4|1-2|1-4"></span>'+
								'<span type="1-4|1-4|1-2"></span>'+
								'<span type="1-2|1-4|1-4"></span>'+
								'<span type="1-4|1-4|1-4|1-4"></span>'+
							'</div>',
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
		id               : 'gen-edition-dialog',
		dialog           : '#gen-edition-dialog',
		holder           : '#gen-edition-dialog-holder',
		arrow 			 : '#gen-edition-dialog-holder .arrow_box',
		table            : '#gen-edition-proprieties',
		//table 			 : '#gen-edition-dialog table',
		proprietySetter  : 'input.propriety-setter',
		proprietyChecker : '.propriety-setter input.checker',
		proprietySelecter: 'select.propriety-setter',
		class            : {
			setterHolder : 'setter-holder',
			propSetter   : 'propriety-setter',
			label        : 'edition-lbl',
			value 		 : 'edition-val'
		}
	},
	tags:{
		plsql:'plsql'
	},
	templates:{
		tittleCollapserStr:'<xsl:call-template name="titlecollapser"><xsl:with-param name="title" select="'+"'#title#'"+'"/><xsl:with-param name="collapsible" select="'+"'#collapsible#'"+'"/></xsl:call-template>',
		
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
				        '<preserve_url>'+GEN.UTILS.preserve_url+'</preserve_url>'+
			    	'</'+VARS.tags.plsql+'>';
		},

		site:'<site>'+
		        '<welcome_note>Ola</welcome_note>'+
		        '<footer_note>2011 - Copyright NOSI</footer_note>'+
		        '<user_name>red-igrp</user_name>'+
		        '<button		type="specific">'+
		            '<title>Sair</title>'+
		            '<app>RED</app>'+
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
	getGen:function(){
		return window[VARS.name];
	}
}