var GENVIDEO = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.xml.type        = 'text';
	container.xml.dataExample = 'https://www.youtube.com/embed/nbcj8C_FQEw';
	container.xml.inputType = 'text';

	container.ready = function(){
		
		/*container.setProperty({
			name:'boxed',
			value:false,
			xslValue:'box'
		});*/

		container.setProperty({
			name:'height',
			label : $.IGRP.locale.get('height'),
			value:300
		});
	};

}
this[VARS.name].declareContainer({
	name:'video',
	container:GENVIDEO
});