var PAGE_HEADER = function(name,params){
	CONTAINER.call(this,name,params);

	var container = this;

	container.autoSetField = false;

	container.xslValidation = false;
	
	container.xml.type = 'items';
	container.xml.genType = 'menu';
	container.xml.structure = 'toolsbar';
	container.xml.genStart = ()=>{
		return '<'+container.GET.tag()+'  type="toolsbar" xml-type="toolsbar" gen-type="menu" gen-group="">';
	}

	container.autoTag = false;
	
	container.ready = function(){
		container.unsetProprieties(['title']);
	}	
}

this[VARS.name].declareContainer({
	name:'page_header',
	container:PAGE_HEADER
});