var GENIFRAME = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	container.fields = false;
	

	container.ready = function(){
		
		container.setPropriety({
			name: 'height',
			value:{
				value       :params && params.proprieties && params.proprieties.height ? parseInt(params.proprieties.height) : 250,
				changeEvent : 'blur',
			},
			transform:true
		});

		container.setPropriety({
			name: 'source',
			value:{
				value       :params && params.proprieties && params.proprieties.source ? params.proprieties.source : 'http://www.nosi.cv',
				changeEvent :'blur',
				xmlAttr     : true,
			},
			transform:true
		});

	}

}

this[VARS.name].declareContainer({
	name:'iframe',
	container:GENIFRAME
});