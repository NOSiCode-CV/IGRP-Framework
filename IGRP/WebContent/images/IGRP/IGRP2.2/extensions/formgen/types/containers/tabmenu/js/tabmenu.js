var GENTABMENU = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	container.sortableOptions.placeholder = 'gen-tabmenu-placeholder';

	container.groups = {
		selector         : '.tabMenuGroups',
		itemsSelector    : 'li',
		contentsSelector : '.groupItemTab',
	}

	//container.includes = ['tab-menu'];

	container.includes = {
		xsl : ['tab-menu']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}

	container.imagePath = 'tab-menu';

	container.ready = function(){
		container.unsetProprieties(['title']);
	}


}

this[VARS.name].declareContainer({
	name:'tabmenu',
	container:GENTABMENU
});