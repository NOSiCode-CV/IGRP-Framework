var INPUTSPIN = function(type,params){
	Field.call(this,type,params);

	
	var field = this;
	
    field.xml.description = true;

    field.includes = {
		js :[
			{ path:'/themes/default/assets/js/pages/form-input-spin.init.js' }
		],
		css:[]
	}
	
}



this[VARS.name].declareField({
	type:'inputspin',
	field:INPUTSPIN
});