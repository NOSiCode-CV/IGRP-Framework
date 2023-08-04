var CHECKBOXFIELD = function(type,params){
	Field.call(this,type,params);

	var field = this;
	
	field.xml.check = true;
	
	field.javaType = 'int';
	
	field.ready = function(){
		
		field.setProperty({
			name  	 : 'switch',
			label 	 : 'Switch',
			value    : false,
			xslValue : 'form-switch'
		});
			
		
	}
	
}
this[VARS.name].declareField({
	type:'checkbox',
	field:CHECKBOXFIELD
});