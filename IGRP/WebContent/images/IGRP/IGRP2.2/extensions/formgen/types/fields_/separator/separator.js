var SEPARATORFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);

	var field = this;
	field.xml.value = false;

}

this[VARS.name].declareField({
	type:'separator',
	field:SEPARATORFIELD
});
