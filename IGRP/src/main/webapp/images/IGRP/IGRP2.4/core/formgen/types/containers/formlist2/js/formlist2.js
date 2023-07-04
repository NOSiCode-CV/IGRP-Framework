	var GENFORMLIST = function(name,params){
	CONTAINER.call(this,name,params);
	var GEN       = VARS.getGen(); 
	var container = this;
	
	container.xml.table       = true;
	container.xml.fieldsValue = false;
	container.xml.genGroup = true;

	/*CONFIG FIELD SORT*/
	container.sortableOptions.axis = "x";


	
	//import : { table:'import.all'
	container.includes = {
		xsl : [ 'form-utils'],
		css : [ 
			{ 
				path:'/plugins/formlist/igrp.formlist.css' 
			}, 
			/*{
				path:'/core/igrp/form/igrp.forms.css'
			},*/
			{
				path:'/core/igrp/table/igrp.tables.css'
			},
			{
				path:'/core/igrp/table/dataTables.bootstrap.css'
			}
		],
		js  : [ 
			{ 
				path:'/plugins/formlist/igrp.formlist.js' 
			},  
			{
				path:'/core/igrp/form/igrp.forms.js'
			} 
		]
	}

	container.sortableOptions.onOver = function(){
		$('tbody',container.holder).hide();
	}

	container.sortableOptions.onOut = function(){
		$('tbody',container.holder).show();
	}

	container.onFieldSet = function(field){
		
		GEN.setFormFieldAttr(field);

		field.xml.desc = true;
	
	}

	container.onFileFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onDateFieldSet = function(field){
		GEN.setBTNClass(field);
	}
 	
	container.onDrawEnd = function(){
		$('.IGRP_formlist',container.holder).IGRP_formlist();
	}
}

this[VARS.name].declareContainer({
	name:'formlist2',
	container:GENFORMLIST
});