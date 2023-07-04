var SEPARATORFIELD = function(type,params){
	Field.call(this,type,params);

	var field = this;
	field.xml.value = false;

}

this[VARS.name].declareField({
	type:'separator',
	field:SEPARATORFIELD
});
