var COLORFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;
	
	
	field.onDrawEnd = function(){
		var colorPicker = $('.colorPicker',field.holder);
		colorPicker.click();
	}
	
}
this[VARS.name].declareField({
	type:'color',
	field:COLORFIELD
});