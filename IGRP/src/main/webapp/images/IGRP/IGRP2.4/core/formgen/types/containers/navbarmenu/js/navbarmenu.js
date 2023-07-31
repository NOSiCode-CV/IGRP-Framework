var GENNAVBAR = function(name,params){
	
	CONTAINER.call(this,name,params);

	var container = this;

	container.xml.table       = true;

	container.xml.fieldsValue = false;

	container.xml.genGroup 	  = true;

	/*container.xml.type = 'items';

	container.xml.genType = 'menu';
	
	container.includes = {
		css:[{path:'/core/igrp/toolsbar/toolsbar.css'}]
	}

	container.autoTag = false;*/

	container.ready = function(){
		

		console.log(container);

		
	}

	container.xml.getStructure = function(o){
		
		var rtn    = '',
			tag    = container.GET.tag(),
			fields = container.GET.fields();

		fields.forEach(function(f){

			var ftag = f.GET.tag();

			rtn += '<'+tag+'_'+ftag+'></'+tag+'_'+ftag+'>'

		})


		return rtn;
	}

			
}

this[VARS.name].declareContainer({
	name:'navbarmenu',
	container:GENNAVBAR
});