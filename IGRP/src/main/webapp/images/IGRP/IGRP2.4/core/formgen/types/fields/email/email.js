var EMAILFIELD = function(type,params){
	Field.call(this,type,params);
}
this[VARS.name].declareField({
	type:'email',
	field:EMAILFIELD
});
