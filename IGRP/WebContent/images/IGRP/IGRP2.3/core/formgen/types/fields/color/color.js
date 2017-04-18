var COLORFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;
	var proprieties = params.properties;
	
	field.includes = {
		css:[
			{ path:'/plugins/colorpicker/css/bootstrap-colorpicker.min.css'}
		],
		js :[
			{ path:'/plugins/colorpicker/js/bootstrap-colorpicker.js' },
			{ path:'/plugins/colorpicker/colorpicker.init.js'}
		]
	}
	
	field.ready = function(){
		
		field.setPropriety({
			name:'format',
			value:{
				value   : 'hex',
				options : [
					{ label:'RGBA', value:'rgba' },
					{ label:'RGB', value:'rgb' },
					{ label:'Hexa', value:'hex' }
				]
			}
		});

		field.parent.on('draw-end',function(){
			$.IGRP.components.colorpicker.init(field.parent.holder);
		},true);
		
	}

}
this[VARS.name].declareField({
	type:'color',
	field:COLORFIELD
});