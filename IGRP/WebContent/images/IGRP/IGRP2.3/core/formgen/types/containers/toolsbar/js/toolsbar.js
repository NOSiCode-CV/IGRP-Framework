var GENTOOLSBAR = function(name,params){
	CONTAINER.call(this,name,params);

	var container = this;

	container.xml.type = 'items';

	container.xml.genType = 'menu';
	
	container.includes = {
		css:[{path:'/core/igrp/toolsbar/toolsbar.css'}]
	}

	container.autoTag = false;

	container.ready = function(){

		container.unsetProprieties(['title']);

		container.setPropriety({
			name:'align',
			value:{
				value:' pull-right',
				options:[
					{value:'pull-right',label:'Right'},
					{value:'centralized',label:'Center'},
					{value:'pull-left',label:'Left'},
					{value:'btn-group-justified',label:'Justify'}
				]
			}
		});

		container.setPropriety({
			name:'btnSize',
			label:'Buttons Size',
			value:{
				value:'',
				options:[
					{value:'',label:'Normal'},
					{value:'btn-group-lg',label:'Large'},
					{value:'btn-group-xs',label:'Small'}
					
				]
			}
		});

		container.setPropriety({
			name:'style',
			label:'Style',
			value:{
				value:'default',
				options:[
					{value:'boxed',label:'Boxed'},
					{value:'default',label:'Default'},
					{value:'clean',label:'Clean'}
					
				]
			}
		});

		container.setPropriety({
			name:'vertical',
			label:'Icon Inline',
			value:true
		});

		container.setPropriety({
			name:'dynamic',
			label:'Dynamic Menu',
			value:false
		});

		
		container.setPropriety({
			name     :'outline',
			value    : false
			//xslValue : 'btn-outline'
		});
		
	}
			
}

this[VARS.name].declareContainer({
	name:'toolsbar',
	container:GENTOOLSBAR
});