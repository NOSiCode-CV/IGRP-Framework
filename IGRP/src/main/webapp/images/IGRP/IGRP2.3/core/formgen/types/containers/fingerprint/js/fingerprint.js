var FINGERPRINT = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();

	var container = this;
	
	container.fields = false;

	container.xml.type = 'fingerprint';

	container.includes = {
		xsl : ['fingerprint'],
		css : [ { path : '/plugins/fingerprint/fingerprint.css' } ], 
		js  : [ { path : '/plugins/fingerprint/fingerprint.js' }]
	}

	container.ready = function(){
		container.SET.hasTitle(true);

		container.setPropriety({
			name 	 :'view',
			label 	 : 'View Only',
			value 	 : false,
			xslValue : '<xsl:with-param name="view" select="\'true\'"/>' //XSL VALUE WHEN PROPRIETY IS TRUE
		});
	}
};

this[VARS.name].declareContainer({
	name:'fingerprint',
	container:FINGERPRINT
});