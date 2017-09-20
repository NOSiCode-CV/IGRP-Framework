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
		return container.GET.img() ? '<'+container.GET.tag()+'_img type="text" name="p_'+container.GET.tag()+'_img" maxlength="300"><value>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</value></'+container.GET.tag()+'_img>' : "";
	}

	container.onFieldSet = function(f){
		
		f.setProperty({
			name  : 'maxlength',
			value : 30 
		});

	}
}

this[VARS.name].declareContainer({
	name:'view',
	container:GENVIEW
});