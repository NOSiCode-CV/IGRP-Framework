
this[VARS.name].declareContainer({
	name:'quickbuttonbox',
	container:function(name,params){
		CONTAINER.call(this,name,params);
		var GEN = VARS.getGen();
		var container = this;

		container.xml.structure = 'form';

		container.includes = {
			css:[ 
				{ path:'/plugins/quickbuttonbox/quickbuttonbox.css' } 
			]
		};

		container.ready = function(){

			container.unsetProprieties(['title','hasTitle']);
			
			container.setProperty({
				name      :'tit',
				label     :'Title',
				value     :'Box Title',
				isField   : true,
				valuePersist : true
			});

			container.setProperty({
				name      :'val',
				label     :'Value',
				value     :'895',
				isField   : true
			});
			
			container.setProperty({
				name : 'url',
				value : '',
				isField : true,
				valuePersist : true,
				editable : false
			});
			
			GEN.setBtnActionAttr(container,{
				value: '',
				label : 'Action',
				customAction : true,

				onChange:function(v){
					
					var isCustom 	 = $('.propriety-setter[rel="action_type"]').is(':checked') || false,

						customAction = $('.propriety-setter[rel="custom_action"]').val();
					
					if(!isCustom){
						
						var params = $.extend({},v.params);
						
						params.type = 'action';
						
						container.SET.url(params);
					
					}else{
						
						container.SET.url(customAction)
						
					}
					
					console.log(container.GET.url())


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
				valuePersist : true
				
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
				isField   : true,
				valuePersist : true
			});*/

		}

	}
});