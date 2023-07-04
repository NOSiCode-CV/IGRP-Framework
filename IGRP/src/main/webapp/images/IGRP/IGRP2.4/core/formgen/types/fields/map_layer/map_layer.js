var MAPLAYERFIELD = function(type,params){
	Field.call(this,type,params);
}

this[VARS.name].declareField({
	type:'map_layer',
	field:MAPLAYERFIELD
});