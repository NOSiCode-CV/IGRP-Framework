var SPINNERS = function(type,params){
	Field.call(this,type,params);

	
	var GEN         = VARS.getGen(),
		field       = this

    const ButtonAppearanceProperties = GEN.getGlobalProperty('button-appearance-properties');

    field.xml.options = true;

    field.ready = function(){
        
        ButtonAppearanceProperties(field);
		
	};
}



this[VARS.name].declareField({
	type:'spinners',
	field:SPINNERS
});