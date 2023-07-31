(function(){

	'use strict';

	var GEN = VARS.getGen();

	var LoadContents = function(type,callback){
		
		GEN.waiting();

		var actual_contents = Object.assign([], GEN.getContainers());

		console.log(actual_contents)

		$.get(path+'/core/formgen/types/pages/'+type+'.json',function(d){

			d.rows.forEach(function(r){
				
				var columns = r.columns;

				columns.forEach(function(col){
					
					var containers = col.containers;

					containers.forEach(function(c){
						
						var type = c.proprieties.type;

						actual_contents.forEach(function(a,i){
							
							if(a){

								var actual_settings = a.export();

								if(actual_settings.proprieties.type == type){
									
									c = $.extend(c,actual_settings);

									actual_contents[i] = null;
								}
							}
							
							

						});

					});

				});

			});

			GEN.import(d,{

				callback:function(){
					
					if(callback)

						callback();

				}

			});

		});

	}

	var Init = function(){
		
		$('.gen-page-type-item').on('click',function(){
			
			var type = $(this).attr('type');

			$.IGRP.components.globalModal.set({
				rel    : 'gen-load-template',
				content: 'We’ll automatically transfer your copy and content block settings to the new template you choose. Styles will reset to match the new template.<br>Something missing after the template switch? Select a content block, then click “Recovered Content” in the side panel to retrieve content from your previous email template.',
				buttons: [
					{
						class   :'success',
						icon    :'check',
						text    :'Confirmar',
						attr  : { 
							target:'void'
						},
						onClick :function(e){

							LoadContents(type,$.IGRP.components.globalModal.hide);

						}
					},
					{
						class :'danger',
						icon  :'times',
						text  :'Cancelar',
						attr  :{ 
							"data-dismiss":"modal" 
						}
					}
				]
			});

		});

	};

	Init();

})();