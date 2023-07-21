this[VARS.name].declareContainer({
	name:'statbox_list',
	container:function(name,params){
		CONTAINER.call(this,name,params);

		var GEN = VARS.getGen();

		var container = this;

		const IconsProperty = GEN.getGlobalProperty('icons-property');

		/*container.getXML = function(callback){
			var xml;
			const tag  = container.GET.tag();
			const qtd = ''//container.GET.qtd();
			
		
			xml = $.parseXML(`
				<${tag} type="statbox_list" xml-type="statbox_list" gen-type="container" gen-group="">

				</${tag}>
			`);
	
			return xml;
		}*/


		container.includes = {
			css:[ { path:'/plugins/statbox/statbox.css' } ]
		};

		container.ready = function(){

			container.unsetProprieties(['hasTitle'])

			container.setPropriety({

				name  :'stats',

				label : '	',

				type  : 'formlist',

				fields : {

					stat : {

						label : 'Item',
						type : 'text'

					}

				},

				sortable : true,

				value : {

					value : container.proprieties && container.proprieties.stats || []

				},

				size : 12

			});

			container.setProperty({
				name:'widget_style',
				label : 'Estilo',
				value : {
					value: '1',
					options : [
						{ value: '1', label:'Style 1' },
						{ value: '2', label:'Style 2' }
					]
				}
			});
			
			/*container.unsetProprieties(['hasTitle']);
			
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

			IconsProperty(container,{
				name:'icn',
				value:'fa-check',
				isField : true,
				valuePersist : true,
				showPosition : false
			});
			*/

		}

	}
});