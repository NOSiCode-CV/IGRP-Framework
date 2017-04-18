var GENCAROUSEL = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.xml.type = 'items';

	container.xml.genType = 'menu';

	container.includes = {
		xsl:['carousel']
	}
	
}

VARS.getGen().declareContainer({
	name:'carousel',
	container:GENCAROUSEL
});