var BTNFIELD = function(type,params){
	Field.call(this,type,params);
	
	var GEN = VARS.getGen();
	var field = this;
	var proprieties = params && params.properties;
	var submitTargets = $.IGRP.defaults.buttons.submitTargets();

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

		field.setPropriety({
			name    :'notvalidatefields',
			label   :'Not Validate Form Fields',
			value   : false,
			onEditionStart : function(o){

				var toggle = function(v) {

					var _target = v || ( field.GET.target ?  field.GET.target() : '_blank'),
					
						action  = submitTargets.includes(_target) ? 'show' : 'hide'; 
					
					o.input[action]();
				};

				$('#gen-edition-modal select[name="edit-target"]').on('change', function(){
					
					toggle( $(this).val() );
					
				});

				toggle();

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