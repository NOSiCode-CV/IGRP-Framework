var HIDDENFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;
 
	field.hidden = true;

	field.autoTag = false;

	field.xml.label = false;

	field.xml.value = false;
	
	//field.xml.tag = 'hidden';
	
	field.unsetProprieties(['label']);

}

this[VARS.name].declareField({
	type:'hidden',
	field:HIDDENFIELD
});