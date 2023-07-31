var TEXTFIELD = function(type,params){
	Field.call(this,type,params);
}

this[VARS.name].declareField({
	type:'text',
	field:TEXTFIELD
});