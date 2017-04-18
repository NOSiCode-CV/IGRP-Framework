var GENIFRAME = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	
	container.xml.type      = 'text';
	
	container.xml.valueAttr = 'source';

	container.ready = function(){
		
		container.setPropriety({
			name: 'height',
			value:250
		});

		container.setPropriety({
			name: 'source',
			size:12,
			value:'#'
		});

	}

}

this[VARS.name].declareContainer({
	name:'iframe',
	container:GENIFRAME
});