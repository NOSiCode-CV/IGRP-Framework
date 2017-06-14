var SELECTFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;

	field.xml.options = true;
	
	field.ready = function(){
		field.setPropriety({
			name:'multiple',
			propriety:false,
			xslValue : 'multiple="multiple"', //XSL VALUE WHEN PROPRIETY IS TRUE
			transform:true
		});
	}
	
	field.onDrawEnd = function(){
		 IGRP_selectChosen();
	}

}
this[VARS.name].declareField({
	type:'select',
	field:SELECTFIELD
});
