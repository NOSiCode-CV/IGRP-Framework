var CHECKBOXLIST = function(type,params){
	Field.call(this,type,params);

	this.xml.options = true;
	
}
this[VARS.name].declareField({
	type:'checkboxlist',
	field:CHECKBOXLIST
});
