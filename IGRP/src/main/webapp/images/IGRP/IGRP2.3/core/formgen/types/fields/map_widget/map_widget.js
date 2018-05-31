var MAPWIDGETFIELD = function(type,params){
	Field.call(this,type,params);
}

this[VARS.name].declareField({
	type:'map_widget',
	field:MAPWIDGETFIELD
});