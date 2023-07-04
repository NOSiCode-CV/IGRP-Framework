
this[VARS.name].declareContainer({
	name:'statbox',
	container:function(name,params){
		CONTAINER.call(this,name,params);

		var GEN = VARS.getGen();

		var container = this;

		container.xml.structure = 'form';

		container.includes = {
			css:[ { path:'/plugins/statbox/statbox.css' } ]
		};

		container.ready = function(){
			
			container.unsetProprieties(['hasTitle']);
			
			container.setProperty({
				name      :'title',
				label     :'Box Title',
				value     :'Box Title',
				isField   : true,
				//valuePersist : true
			});

			container.setProperty({
				name      :'val',
				label     :'Value',
				value   : ""+Math.floor((Math.random() * 999) + 1),
				isField   : true,
				//valuePersist : true
			});

			container.setProperty({
				name      :'txt',
				label     :'Url Text',
				value     :'Read More...',
				isField   : true,
				//valuePersist : true 
			});

			container.setProperty({
				name      :'url',
				label     :'Url',
				value     :'http://www.example.com' ,
				isField   : true,
				//valuePersist : true 
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
						items:$.IGRP.components.colorPalettes.colors || [
							{"value":"cp-cyan","label":"Cyan"}
						],
						itemTemplate:'<span label="#label#" class="#value#" style="height:20px;width:20px;"></span>',
					
						
					},
					size:'12'
				},
				isField   : true
				//valuePersist : true
			});

			GEN.setImgAttr(container,{
				name:'icn',
				value:'fa-check',
				isField   : true,
				valuePersist : true
			});

			/*container.setPropriety({
				name:'icn',
				label:'Icon',
				value:{
					value:'fa-check',
					list:{
						items:GEN.icons.fontawesome,
						itemTemplate:'<span label="#label#" class="btn-i-setter"><i class="fa #value#"></i></span>',
						searcher:true
					},
					size:'12'
				},
				isField:true
			});*/

		}

	}
});