var BTNFIELD = function(type,params){
	Field.call(this,type,params);
	
	var GEN = VARS.getGen();
	var field = this;
	var proprieties = params && params.properties;


	field.ready = function(){

		GEN.setTargetAttr(field,{
			value: proprieties && proprieties.target ? proprieties.target : '_blank'
		});

		
		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : ''
		});

		GEN.service.set(field);

		field.setPropriety({
			name  :'transaction',
			value : false
		});
		
		field.setPropriety({
			name  :'custom_return',
			label : 'Custom Return',
			value : false,
			onEditionStart:function(e){
				
				var checker = e.input.find('.propriety-setter');
				
				var check = function(){
					
					var isChecked = checker.is(':checked'),
						
						operation = isChecked ? 'hide' : 'show';

					$('.gen-properties-setts-holder [rel="action"]')[operation]();
					
				};
				
				checker.on('change', check)
				
				check(); 	
				
			}
		});
/*
		field.setPropriety({
			name     :'outline',
			value    : false
			//xslValue : 'btn-outline'
		});*/

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