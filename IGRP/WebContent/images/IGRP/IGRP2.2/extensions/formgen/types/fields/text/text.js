var TEXTFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}

this[VARS.name].declareField({
	type:'text',
	field:TEXTFIELD
});