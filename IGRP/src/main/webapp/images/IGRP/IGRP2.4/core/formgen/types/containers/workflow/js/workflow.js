var WORKFLOW = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();

	var container = this;

	var proprieties = params && params.properties;
	
	container.fields 		= true;

	container.xml.type 		= 'workflow';

	container.xml.structure = 'table';

	container.includes = {
		xsl : ['IGRP-workflow.tmpl'],
		css : [ { path : '/plugins/workflow/workflow.css' } ]
	}
};

this[VARS.name].declareContainer({
	name:'workflow',
	container:WORKFLOW
});