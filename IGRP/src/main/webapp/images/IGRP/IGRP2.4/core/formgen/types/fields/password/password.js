var PWDFIELD = function(type,params){
	Field.call(this,type,params);
}
this[VARS.name].declareField({
	type:'password',
	field:PWDFIELD
});