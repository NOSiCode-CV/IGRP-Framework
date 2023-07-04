var RADIOLIST = function(type,params){
	Field.call(this,type,params);

	var GEN         = VARS.getGen(),
		field       = this,
		proprieties = params && params.properties ? params.properties : false;

	field.xml.options = true;

	field.ready = function(){
		
		GEN.setDomainAttr(field,{
			value: proprieties && proprieties.domain ? proprieties.domain : '',
			selected : proprieties && proprieties.domain_value ? proprieties.domain_value : false
		});
		
	};
	
}
this[VARS.name].declareField({
	type:'radiolist',
	field:RADIOLIST
});
