var GENSEPARATORLIST = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN 	  = VARS.getGen();
	var container = this;

	container.xml.table = true;

	container.xml.genGroup = true;

	container.xml.clean = true;

	container.sortableOptions.placeholder = 'gen-form-placeholder';

	container.includes = {
		xsl : [ 'form-utils'],
		css : [ 
			{ path   : '/plugins/separatorlist/igrp.separatorlist.css' },
			/*{ path   : '/core/igrp/form/igrp.forms.css' }, */
			{ path   : '/core/igrp/table/igrp.tables.css' },
			{ path   : '/core/igrp/table/dataTables.bootstrap.css' }
			
		],
		js  : [ 
			{ path   : '/plugins/separatorlist/igrp.separatorlist.js' },
			{ path   : '/core/igrp/form/igrp.forms.js' }, 
		]
	};

	var tableOrderIncludes = [
		{path : '/core/igrp/table/igrp.table.js'},
		{path : '/core/formgen/js/jquery-ui.min.js'}
	],
	tableOrderInc  = false;

	container.onLinkFieldSet = function(field){
		field.setPropriety({
			name:'button',
			value:false,
			xslValue:'btn btn-primary'
		});
	}

	container.onFileFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onDateFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onFieldSet = function(field){

		GEN.setFormFieldAttr(field);

		field.setPropriety({
			name      : 'visible',
			label  	  : 'Table',
			value     : 'visible' in field.proprieties ? field.proprieties.visible : true
		});

		field.xml.desc = true;
		
		//field.xml.desc = true;
	};

	container.ready = function(){

		container.setPropriety({
			name:'dialog',
			value:false
		});

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
					tableOrderIncludes.forEach(function(e){
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

					tableOrderInc = false;
				}
			}
		});
		
		container.setPropriety({
			name:'countRow',
			label : 'Count Rows',
			value:false,
			xslValue : '<td class="IGRP-separatorlist-count-row"></td>',
			onChange:function(v){
				container.SET.countHeader(v);
			}
		});

		container.setPropriety({
			name:'countHeader',
			value:false,
			editable : false,
			xslValue : '<th class="IGRP-separatorlist-count-header"></th>'
		});
		
	}

	container.onDrawEnd = function(){
		$('.IGRP-separatorlist',container.holder).separatorList();
	}
}

this[VARS.name].declareContainer({
	name:'separatorlist',
	container:GENSEPARATORLIST
});