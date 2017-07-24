var RADIOFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}

this[VARS.name].declareField({
	type:'radio',
	field:RADIOFIELD
});