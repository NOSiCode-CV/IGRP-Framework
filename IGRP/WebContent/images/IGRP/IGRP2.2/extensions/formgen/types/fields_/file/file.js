var FILEFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}
this[VARS.name].declareField({
	type:'file',
	field:FILEFIELD
});