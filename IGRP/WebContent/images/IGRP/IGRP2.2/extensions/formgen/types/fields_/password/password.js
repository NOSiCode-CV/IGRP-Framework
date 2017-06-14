var PWDFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
}
this[VARS.name].declareField({
	type:'password',
	field:PWDFIELD
});