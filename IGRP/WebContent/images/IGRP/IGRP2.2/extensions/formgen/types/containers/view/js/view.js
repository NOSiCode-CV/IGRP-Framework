var GENVIEW = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	
	container.ready = function(){
		
		container.setPropriety({
			name      :'img',
			value     :true,
			transform :true
		});

	}

	container.onFieldsXMLGenerate = function(str){
		//console.log(str);
		return container.GET.img() ? '<view_img>http://igrp.teste.gov.cv/images/IGRPLAB2.2/themes/default/img/funcionario.png</view_img>' : "";
	}

}

this[VARS.name].declareContainer({
	name:'view',
	container:GENVIEW
});