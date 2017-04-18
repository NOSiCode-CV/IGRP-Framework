var GENVIEW = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	container.includes = {css:[{ path:'/plugins/view/igrp.view.css' }]};

	container.ready = function(){
		container.setPropriety({
			name      :'img',
			label     :'Image?',
			value     :true,
			transform :true
		});
	}
	container.onFieldsXMLGenerate = function(str){
		return container.GET.img() ? '<view_img>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</view_img>' : "";
	}
}

this[VARS.name].declareContainer({
	name:'view',
	container:GENVIEW
});