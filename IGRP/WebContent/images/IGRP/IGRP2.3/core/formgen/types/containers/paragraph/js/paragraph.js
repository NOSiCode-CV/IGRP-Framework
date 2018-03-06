var GENPARAGRAPH = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	container.xml.structure   = 'form';
	container.xml.type        = 'text';
	container.xml.dataExample = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'+
	'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'+
	'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

	container.ready = function(){
		//container.unsetProprieties(['title','hasTitle','collapsible']);
		container.setProperty({
			name:'boxed',
			value:false,
			xslValue:'box'
		});

		
	};

}

this[VARS.name].declareContainer({
	name:'paragraph',
	container:GENPARAGRAPH
});