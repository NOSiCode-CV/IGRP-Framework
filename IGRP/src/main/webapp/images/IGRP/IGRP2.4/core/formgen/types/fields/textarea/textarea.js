var TEXTAREAFIELD = function(type,params){
	Field.call(this,type,params);
}

this[VARS.name].declareField({
	type:'textarea',
	field:TEXTAREAFIELD
});