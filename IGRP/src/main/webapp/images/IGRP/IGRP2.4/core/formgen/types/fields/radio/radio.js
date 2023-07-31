var RADIOFIELD = function(type,params){
	Field.call(this,type,params);

	this.xml.check = true;
}

this[VARS.name].declareField({
	type:'radio',
	field:RADIOFIELD
});