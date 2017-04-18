var IMGFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;

	field.ready = function(){
		field.setPropriety({
			name:'img',
			label:'Image',
			value:'http://www.slidesjs.com/examples/callbacks/img/example-slide-1.jpg',
			size:'12'
		});
	}



}

VARS.getGen().declareField({
	type:'img',
	field:IMGFIELD
});