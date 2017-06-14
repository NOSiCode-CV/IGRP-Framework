var CHECKBOXFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}
this[VARS.name].declareField({
	type:'checkbox',
	field:CHECKBOXFIELD
});