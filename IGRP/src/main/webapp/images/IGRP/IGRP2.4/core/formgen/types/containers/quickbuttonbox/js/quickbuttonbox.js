
(function(){
	var GEN = VARS.getGen();
	GEN.declareContainer({

		name:'quickbuttonbox',
		
		container:function(name,params){		
			
			var container = this;
		
		CONTAINER.call(this,name,params);
		
	

		container.xml.structure = 'form';

		container.includes = {
			css:[ 
				{ path:'/plugins/quickbuttonbox/quickbuttonbox.css' } 
			]
		};

		container.ready = function(){

			container.unsetProprieties(['hasTitle']);
			
			container.setProperty({
				name      :'title',
				label     :'Title',
				value     :'Box Title',
				isField   : true,
				valuePersist : false
			});

			container.setPropriety({
				name    : 'val',
				label   : 'Value',
				value   : ""+Math.floor((Math.random() * 999) + 1),
				isField : true
				//valuePersist : true
			});
			
			GEN.setBtnActionAttr(container,{
				value 		   : params.proprieties && params.proprieties.action ? params.proprieties.action : '',					
				isField 	   : true,
				valuePersist   : true,
				tag : 'url',
				type : 'action',
			
				onChange:function(v){
//					console.log(v);			
					
				}
			});
			
			GEN.setTargetAttr(container,{
				value:'modal'
			});

			container.setPropriety({
				name:'bg',
				label:'Background',
				value:{
					value:'cp-cyan',
					list:{
						items: $.IGRP.components.colorPalettes.colors || [
							{"value":"cp-cyan","label":"Cyan"}
						],
						itemTemplate:'<span label="#label#" class="#value#" style="height:20px;width:20px;"></span>'
					},
					size:'12'
				},
				isField   : true,
				valuePersist : false
				
			});

			GEN.setImgAttr(container,{
				name:'icn',
				value:'fa-check',
				isField   : true,
				valuePersist : false
			});


		}

	}
});
	
})();