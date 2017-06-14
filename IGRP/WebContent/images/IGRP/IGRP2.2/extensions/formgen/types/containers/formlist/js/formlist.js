	var GENFORMLIST = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.xml.table       = true;
	container.xml.fieldsValue = false;
	/*CONFIG FIELD SORT*/
	container.sortableOptions.axis = "x";

	container.contextMenu = {
		type   : 'button',
		holder : 'ul.contextMenu',
		menu   : {
			selector: '.operationTable',
			label   : 'span',
		}
	}

	//container.includes = ['setAttribute'];

	container.includes = {
		xsl : ['setAttribute']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}

	container.onDrawEnd = IGRP_contexMenu;
	
	container.onContextMenuSet = function(field){
		VARS.getGen().includeTemplates(['context']);
	}

	container.onCheckboxlistFieldSet = function(field){
		field.onDrawEnd = IGRP_selectChosen;
	}

	container.onRadiolistFieldSet = function(field){
		field.onDrawEnd = IGRP_selectChosen;
	}

	container.onFieldSet = function(field){
		field.xml.desc = true;
	}
	
	//VARS.getGen().includeTemplates(['setAttribute']);	
}

this[VARS.name].declareContainer({
	name:'formlist',
	container:GENFORMLIST
});