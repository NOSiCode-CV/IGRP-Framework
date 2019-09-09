var NUMBERFIELD = function(type,params){
	Field.call(this,type,params);

	var GEN = VARS.getGen(),
		field 		= this,
		proprieties = params.properties;

	field.ready = function(){

		field.setPropriety({
			name :'min',
			label:'Min value',
			value:'',
			inputType : 'number'
		});

		field.setPropriety({
			name :'max',
			label:'Max value',
			value:'',
			inputType : 'number'
		});

	}
}



this[VARS.name].declareField({
	type:'number',
	field:NUMBERFIELD
});