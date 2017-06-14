var GENTREEMENU = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	container.sortableOptions.placeholder = 'gen-tabmenu-placeholder';

	container.groups = {
		selector         : '.process_menu',
		itemsSelector    : 'li',
		contentsSelector : 'ul.bodyColor',
	}

	//container.includes = ['menu'];

	container.includes = {
		xsl : ['menu']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}

	container.imagePath = 'menu';

	container.ready = function(){
		container.unsetProprieties(['title']);
	}

}

this[VARS.name].declareContainer({
	name:'treemenu',
	container:GENTREEMENU
});