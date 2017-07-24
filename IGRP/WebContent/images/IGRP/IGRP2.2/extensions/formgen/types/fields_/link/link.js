var LINKFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	
	var field = this;

	field.xml.description = true;

	field.setPropriety({
		name:'target',
		propriety:{
			value:(proprieties && proprieties.target) ? proprieties.target : '_blank',
			options:[{value:'_blank',label:'Blank'},{value:'_self',label:'Self'}]
		}
	});

}
this[VARS.name].declareField({
	type:'link',
	field:LINKFIELD
});