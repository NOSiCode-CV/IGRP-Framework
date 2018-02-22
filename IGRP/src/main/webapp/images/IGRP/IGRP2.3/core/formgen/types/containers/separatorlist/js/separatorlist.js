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
	}

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
	}

	container.onDrawEnd = function(){
		$('.IGRP-separatorlist',container.holder).separatorList();
	}
}

this[VARS.name].declareContainer({
	name:'separatorlist',
	container:GENSEPARATORLIST
});