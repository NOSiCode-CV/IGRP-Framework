var GENVIDEO = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.xml.type        = 'text';
	container.xml.dataExample = 'https://www.youtube.com/embed/Viz9FefXZYg';

	container.ready = function(){
		
		container.setProperty({
			name:'boxed',
			value:false,
			xslValue:'box'
		});

		container.setProperty({
			name:'height',
			value:200
		});
	};

}
this[VARS.name].declareContainer({
	name:'video',
	container:GENVIDEO
});