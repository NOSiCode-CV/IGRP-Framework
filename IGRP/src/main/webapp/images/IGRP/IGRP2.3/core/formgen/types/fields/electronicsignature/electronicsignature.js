var ELECTRONICSIGNATURE = function(type,params){
	Field.call(this,type,params);

	var GEN 		= VARS.getGen(),
		field 		= this,
		proprieties = params.properties;

	field.xml.structure = 'link';

	field.xml.description = true;

	//field.xml.type = 'link';

	field.includes = {
		xsl : ['electronic-signature'],
		js  : [ { path:'/plugins/electronicsignature/electronicsignature.js'}],
		css : [ { path:'/plugins/electronicsignature/electronicsignature.css'}]
	}
	
	field.ready = function(){

		field.setPropriety({
			name :'height',
			label:'Max Height (Pixel value)',
			value:150
		});
	}
}

VARS.getGen().declareField({
	type : 'electronicsignature',
	field: ELECTRONICSIGNATURE
});