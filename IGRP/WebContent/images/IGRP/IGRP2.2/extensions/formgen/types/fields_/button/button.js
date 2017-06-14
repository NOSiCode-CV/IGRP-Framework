var BTNFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	
	var GEN = VARS.getGen();
	var field = this;

	field.ready = function(){

		GEN.setTargetAttr(field,{
			value: (proprieties && proprieties.target) ? proprieties.target : '_blank'
		});
		
		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : ''
		});

		field.setPropriety({
			name  :'transaction',
			value : false
		});

		GEN.service.set(field);

		GEN.setImgAttr(field,{
			value:(proprieties && proprieties.img) ? proprieties.img  : 'default.png',
			paramName:field.parent.imagePath ? field.parent.imagePath : 'tools-bar'
		});
		
	}
}

this[VARS.name].declareField({
	type:'button',
	field:BTNFIELD
});