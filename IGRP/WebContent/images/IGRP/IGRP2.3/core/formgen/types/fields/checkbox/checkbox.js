var CHECKBOXFIELD = function(type,params){
	Field.call(this,type,params);

	this.xml.check = true;
}
this[VARS.name].declareField({
	type:'checkbox',
	field:CHECKBOXFIELD
});