var PLAINTEXT = function(type,params){
	Field.call(this,type,params);

	var field = this;
	
	var checkDisableOutput = function(v){
		
		var disable_output_escaping = v || field.GET.disable_output_escaping(),
		
			clss = disable_output_escaping ? 'ff-fix' : '';
		
		return clss;
		
	}

	field.ready = function(){
		if(field.parent.GET.type() == 'form'){
			field.setPropriety({
				name    :'clear',
				value   :false,
				xslValue:'clear'
			});
			
			
		}
		
		field.setPropriety({
			name    :'disable_output_escaping',
			label : 'Html Content',
			value   :false,
			xslValue:'disable-output-escaping="yes"',
			onEditionStart : function(){
				
				var setHTMLClss = function(){
					
					var clss = checkDisableOutput()
					
					field.SET.html_class(clss);
				}
				
				$('input[rel="disable_output_escaping"]').on('change', function(){
					
					var val = $(this).is(':checked');
					
					checkDisableOutput( val );
					
				});
				
				setHTMLClss();

			}
		});
		
		field.setPropriety({
			name    :'html_class',
			value   :'',
			editable : false
		});
		
		
		
	}
}
this[VARS.name].declareField({
	type:'plaintext',
	field:PLAINTEXT
});