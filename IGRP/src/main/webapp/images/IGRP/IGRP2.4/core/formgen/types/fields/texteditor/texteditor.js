var TEXTEDITORFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;
	
	field.includes = {
		js  :[{ path:'/core/ckeditor/ckeditor.js' }]
	}

	field.onDrawEnd = function(){
		$.IGRP.components.form.texteditor({
			parent:field.holder
		});
	}

}

this[VARS.name].declareField({
	type:'texteditor',
	field:TEXTEDITORFIELD
});