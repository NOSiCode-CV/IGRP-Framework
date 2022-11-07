var FILESIGNER = function(type,params){
	Field.call(this,type,params);

	var GEN 		= VARS.getGen(),
		field 		= this,
		proprieties = params.properties;

	field.xml.structure = 'text';

	field.xml.type = 'text';

	field.includes = {
		js  :[ { path:'/plugins/nosicaSigner/nosicaSigner.js'}]
	}

	field.ready = function(){
		console.log('read');
	}
}

VARS.getGen().declareField({
	type:'filesigner',
	field:FILESIGNER
});