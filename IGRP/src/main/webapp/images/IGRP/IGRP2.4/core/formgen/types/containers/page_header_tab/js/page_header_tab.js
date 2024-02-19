this[VARS.name].declareContainer({
	name:'page_header_tab',
	container:function(name,params){
		CONTAINER.call(this,name,params);
	
		var container = this;
        container.xml.structure = 'page_header';
		container.contextMenu = {
			type   : 'button',
			holder : '.buttons-holder',
			menu   : {
				selector: '>.btn'
				
			},
			xmlTag:'tools-bar'
		}

		container.unsetProprieties(['collapsible','collapsed', 'hasTitle']);

		container.ready = ()=>{
			const PageTab = GEN.getContainerByTag('page_tab');
			
			if(!PageTab){

				const pageTabParams = GEN.importedData?.header?.columns[0].containers?.filter( (c)=>c.proprieties?.tag == 'page_tab' )[0];

				const params = Object.assign({
					genType : 'container',
					proprieties : {
						tag : 'page_tab'
					}
				},pageTabParams)


				const row = GEN.Headers.row();

				var tabContainer = {
					name   : 'tabcontent',
					row    : row,
					column : row.find('.gen-column'),
					index  : 1,
					params : params
				}

				GEN.dropContainers_ROW([tabContainer],{
					placeholder:  $('.gen-container-placeholder',row)
				});

			}
				
		}

		/*container.setProperty({
			name : 'tab',
			label : $.IGRP.locale?.get('gen-page-header-tab'),
			value : true,
			editable : false,
			onChange : (v)=>{

				const PageTab = GEN.getContainerByTag('page_tab');
				
				if(v){
					if(!PageTab){
						const params = {
							genType : 'container',
							proprieties : {
								tag : 'page_tab'
							}
						}

						const row = GEN.Headers.row();

						var tabContainer = {
							name   : 'tabcontent',
							row    : row,
							column : row.find('.gen-column'),
							index  : 1,
							params : params
						}

						GEN.dropContainers_ROW([tabContainer],{
							placeholder:  $('.gen-container-placeholder',row)
						});

					}
				}else{
					if(PageTab)
						GEN.removeContainer(PageTab.GET.id())
				}
			}
		})*/

		
		
		

	}
});