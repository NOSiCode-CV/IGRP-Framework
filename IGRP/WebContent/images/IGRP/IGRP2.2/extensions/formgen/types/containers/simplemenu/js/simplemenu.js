var GENSIMPLEMENU = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	
	container.xml.type = 'items';
	
	container.sortableOptions.placeholder = 'gen-simplemenu-placeholder';

	container.includes = {
		xsl : ['menu']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}
	
	container.imagePath = 'menu';

	container.ready = function(){	

		container.unsetProprieties(['hasTitle','title','collapsible']);
		
		container.setPropriety({
			name:'align',
			value:{
				value: params && params.proprieties && params.proprieties.align ? params.proprieties.align : 'left',
				options:[
					{
						value:'right',
						label:'Direita'
					},
					{
						value:'left',
						label:'Esquerda'
					},
					{
						value:'center',
						label:'Centro'
					},
					{
						value:'justified',
						label:'Justificado'
					}
				]
			},
			transform:true/*,
			onChange:function(){
				container.Transform();
			}*/
		});
	}


	//VARS.getGen().includeTemplates(['menu']);

}

this[VARS.name].declareContainer({
	name:'simplemenu',
	container:GENSIMPLEMENU
});