var EMAILFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}
this[VARS.name].declareField({
	type:'email',
	field:EMAILFIELD
});
