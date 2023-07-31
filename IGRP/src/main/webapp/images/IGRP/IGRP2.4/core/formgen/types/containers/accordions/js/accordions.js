var GENACCORDION = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.xml.type = 'items';

	container.onDrawEnd = function(){
		//console.log(container.fieldDefaultTemplate);

		/*container.Transform = function(){
			container.holder.find('.c-holder-loading').hide();
			return false;
		};*/
	};

	container.XSLToString = function(e){
		console.log(e);
	}

}
this[VARS.name].declareContainer({
	name:'accordions',
	container:GENACCORDION
});