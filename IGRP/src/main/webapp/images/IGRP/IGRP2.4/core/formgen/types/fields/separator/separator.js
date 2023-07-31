var SEPARATORFIELD = function(type,params){
	Field.call(this,type,params);

	var field = this;
	field.xml.value = false;

	field.unsetProperties(['desclabel','tooltip','disable_copy_paste'])
	
	field.ready = ()=>{
		
	}

}

this[VARS.name].declareField({
	type:'separator',
	field:SEPARATORFIELD
});
