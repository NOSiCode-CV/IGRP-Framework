var BTNFIELD = function(type,params){
	Field.call(this,type,params);
	
	var GEN = VARS.getGen();
	var field = this;
	var proprieties = params && params.properties;

	field.ready = function(){

		GEN.setTargetAttr(field,{
			value: (proprieties && proprieties.target) ? proprieties.target : '_blank'
		});
		try{
			GEN.setBtnActionAttr(field,{
				value: proprieties && proprieties.action ? proprieties.action : ''
			});
		}catch(e){
			null;
		}

		GEN.service.set(field);

		field.setPropriety({
			name  :'transaction',
			value : false
		});

		field.setPropriety({
			name     :'outline',
			value    : false,
			xslValue : 'btn-outline'
		});

		GEN.setBTNClass(field);

		GEN.setImgAttr(field,{
			value:'fa-angle-right',
			paramName:field.parent.imagePath ? field.parent.imagePath : 'tools-bar'
		});
		
	}
}

this[VARS.name].declareField({
	type:'button',
	field:BTNFIELD
});