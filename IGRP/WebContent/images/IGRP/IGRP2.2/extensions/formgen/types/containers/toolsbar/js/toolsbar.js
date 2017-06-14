var GENTOOLSBAR = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	var toolsDir  = path_tmpl+'/img/icon/tools-bar/';

	container.includeCss();

	container.ready = function(){
		//xml struc config
		container.xml.type = 'items';
		//field edit config
		container.fieldEditParams = {
			display:'block',
			position: 'center center'
		}
		//sortable config
		container.sortableOptions.placeholder = 'gen-toolbar-placeholder';
		container.sortableOptions.tolerance = 'intersects';
		//remove unnecessary props
		container.unsetProprieties(['hasTitle','title','collapsible']);
		//set btns align prop
		container.setPropriety({
			name:'align',
			value:{
				value: params && params.proprieties && params.proprieties.align ? params.proprieties.align : 'right',
				options:[
					{value:'right'    ,label:'Direita'},
					{value:'left'     ,label:'Esquerda'},
					{value:'center'   ,label:'Centro'},
					{value:'justified',label:'Justificado'}
				]
			},
			transform:true
		});
	}
	container.onDrawEnd = function(){
		//if(container.GET.align() == 'justified')
			//IGRP_justifyItems({ holder : $('.tool-bar ul',container.holder),items  : 'li'});
	}

	/*container.on('field-set',function(f){
		console.log(f)
	})*/
	
}

this[VARS.name].declareContainer({
	name:'toolsbar',
	container:GENTOOLSBAR
});