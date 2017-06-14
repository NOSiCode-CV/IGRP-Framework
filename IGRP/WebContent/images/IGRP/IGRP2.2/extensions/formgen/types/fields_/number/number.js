var NUMBERFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}
this[VARS.name].declareField({
	type:'number',
	field:NUMBERFIELD
});