
(function(){

	var GEN = VARS.getGen();

	GEN.declareContainer({

		name:'infopanel',

		container:function(name,params){

			var container = this;

			CONTAINER.call(container,name,params);
			
			container.xml.structure = 'form';

			container.includes = {

				css:[ { path:'/plugins/infopanel/infopanel.css' } ]

			};

			container.ready = function(){

				container.unsetProprieties(['hasTitle']);

				var defColors = [
					{
						label:"Primary",
						value:"bg-primary"
					},
					{
						label:"Danger",
						value:"bg-danger"
					},
					{
						label:"Info",
						value:"bg-info"
					},
					{
						label:"Warning",
						value:"bg-warning"
					}
				],

				bgColors = $.IGRP.components.colorPalettes.colors ? $.IGRP.components.colorPalettes.colors.concat(defColors) : defColors.push({"value":"cp-cyan","label":"Cyan"});

				container.propertiesOptions.title = {
					name : 'title',
					label : 'Title',
					isField: true, 
					valuePersist: false
				};

				container.setPropriety({
					name    : 'val',
					label   : 'Value',
					value   : ""+Math.floor((Math.random() * 99) + 1),
					isField : true,
					valuePersist : false
				});
				

				GEN.setBtnActionAttr(container,{
					value 		   : params.proprieties && params.proprieties.action ? params.proprieties.action : '',					
					isField 	   : true,
					valuePersist   : false,
					tag : 'url',
					
					type : 'action',
					//canAddOptions  : false,
					onChange:function(v){
//						console.log(v);
						/*var page   = v.params.page,
							app    = v.params.app,
							action = v.params.action,
							url    = 'webapps?r='+app+'/'+page+'/'+action;

						setTimeout(function(){

							container.SET.url(url);

						},200);*/
						
					}
				});

				/*container.setPropriety({
					name    : 'url',
					label   : 'URL',
					value   : "",
					isField : true,
					valuePersist : true,
					editable : false
				});*/

				GEN.setTargetAttr(container,{
					value:'modal'
				});

				container.setPropriety({
					name:'bg',
					label:'Background',
					value:{
						value:'cp-cyan',
						list:{
							items: bgColors || [
								{"value":"cp-cyan","label":"Cyan"}
							],
							itemTemplate:'<span label="#label#" class="#value#" style="height:20px;width:20px;"></span>',
						
							
						},
						size:'12'
					},
					isField   : true,
					valuePersist : false
				});

				GEN.setImgAttr(container,{
					name:'icn',
					value:'fa-info',
					isField   : true,
					valuePersist : false
				});


			}

		}
	});

})();

