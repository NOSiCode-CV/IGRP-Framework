var PLAINTEXT = function(type,params){
	Field.call(this,type,params);

	var field = this;

	field.ready = function(){
		if(field.parent.GET.type() == 'form'){
			field.setPropriety({
				name    :'clear',
				value   :false,
				xslValue:'clear'
			});
		}
		
	}
}
this[VARS.name].declareField({
	type:'plaintext',
	field:PLAINTEXT
});