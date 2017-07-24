var TEXTEDITORFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;
	
	field.includes = ['form-text-editor'];

	field.ready = function(){
		//field.setIncludes(['form-text-editor']);
	}
	
	//VARS.getGen().includeTemplates(['form-text-editor']);

}

this[VARS.name].declareField({
	type:'texteditor',
	field:TEXTEDITORFIELD
});