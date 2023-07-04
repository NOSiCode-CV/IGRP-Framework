
this[VARS.name].declareContainer({
	name:'smallbox',
	container:function(name,params){
		CONTAINER.call(this,name,params);
		var GEN = VARS.getGen();
		var container = this;

		container.xml.structure = 'form';

		container.includes = {
			css:[ { path:'/plugins/smallbox/smallbox.css' } ]
			//js :[ { path:'path_to_js.js' } ]
		};

		container.ready = function(){

			container.unsetProprieties(['hasTitle']);
			
			container.setProperty({
				name      :'title',
				label     :'Small Box Title',
				value     :'Small Box Title',
				isField   : true
				//valuePersist : true
			});

			container.setProperty({
				name      :'val',
				label     :'Value',
				value   : ""+Math.floor((Math.random() * 999) + 1),
				isField   : true
			});

			container.setProperty({
				name      :'url',
				label     :'Url',
				value     :'http://www.example.com',
				isField   : true
			});

			GEN.setTargetAttr(container,{
				value:'modal'
			});

			container.setProperty({
				name      :'lbl',
				label     :'Url label',
				value     :'View Details',
				isField   : true
			//	valuePersist : true
			});


			container.setPropriety({
				name:'bg',
				label:'Background',
				value:{
					value:'cp-cyan',
					list:{
						items: $.IGRP.components.colorPalettes.colors ,
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
				isField   : true
				//valuePersist : true
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
				isField   : true,
				valuePersist : true
			});*/

		}

	}
});