var IMGFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;

	field.ready = function(){
		//alert('IMG');
	}



}

VARS.getGen().declareField({
	type:'img',
	field:IMGFIELD
});