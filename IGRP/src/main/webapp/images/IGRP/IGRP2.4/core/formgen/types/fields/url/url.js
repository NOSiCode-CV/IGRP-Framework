var URLFIELD = function(type,params){
	Field.call(this,type,params);
}

this[VARS.name].declareField({
	type:'url',
	field:URLFIELD
});