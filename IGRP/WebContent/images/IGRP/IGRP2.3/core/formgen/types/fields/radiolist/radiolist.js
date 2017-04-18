var RADIOLIST = function(type,params){
	Field.call(this,type,params);

	this.xml.options = true;
	
}
this[VARS.name].declareField({
	type:'radiolist',
	field:RADIOLIST
});
