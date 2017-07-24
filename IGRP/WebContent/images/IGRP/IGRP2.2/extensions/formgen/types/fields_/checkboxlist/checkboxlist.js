var CHECKBOXLIST = function(type,proprieties){
	Field.call(this,type,proprieties);

	this.xml.options = true;
	
}
this[VARS.name].declareField({
	type:'checkboxlist',
	field:CHECKBOXLIST
});
