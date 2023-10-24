var GENTOOLSBAR = function(name,params){
	CONTAINER.call(this,name,params);

	var container = this;

	container.xml.type = 'items';

	container.xml.genType = 'menu';
	
	container.includes = {
		css:[{path:'/core/igrp/toolsbar/igrp.ds.toolsbar.css'}]
	}

	container.autoTag = false;

	container.ready = function(){

		//container.unsetProprieties(['title']);

		/*container.setPropriety({
			name:'title',
			label : $.IGRP.locale.get('title'),
			value:'',
			isField: true, 
			valuePersist: false
		});*/

		container.setPropriety({
			name:'align',
			label : 'Alinhamento',
			value:{
				value:' justify-content-end',
				options:[
					{value:'justify-content-end',label:'Direta'},
					{value:'justify-content-center',label:'Centro'},
					{value:'justify-content-start',label:'Esquerda'}
					
				]
			}
		});


		
/*
		container.setPropriety({
			name:'btnSize',
			label:'Tamanho',
			value:{
				value:'',
				options:[
					{value:'',label:'Normal'},
					{value:'btn-group-lg',label:'Grande'},
					{value:'btn-group-xs',label:'Pequeno'}
					
				]
			}
		});
*/
		/*container.setPropriety({
			name:'style',
			label:'Estilo de Botões',
			type 	  : 'attrvalue',
			value:{
				value : '',
				size  : '12',
				setter:function(){
					let html = $('<div class="d-flex align-items-center button-style-wrapper"></div>');
					const options = [
						{value:'',label:'Normal'},
						{value:'soft',label:'Suave'},
						{value:'outline',label:'Linha'},
						{value:'ghost',label:'Transparente'}
					];
					options.forEach( (o)=>{
						const selected = container.proprieties.style.value;
					
						const opt = $(`
							<div class="me-2 btn-style-item ${selected == o.value ? 'active' : ''}">
								<button class=" btn-label btn btn-${o.value ? o.value+'-' : ''}primary d-flex align-items-center">
									<div class="label-icon align-middle fs-16 me-2">
										<i class="ri-checkbox-blank-circle-line icon"></i>
										<i class="ri-checkbox-circle-line icon icon-active"></i>
									</div>
									${o.label}
								</button>
							</div>
						`);

						opt.on('click', function(e){
							e.preventDefault();
							html.attr('attr-value', o.value||'' );
							$('.btn-style-item').removeClass('active')
							opt.addClass('active')
							e.stopPropagation();
							return false;
						});

						html.append(opt);
						return;
					});

					return html
				}
			}
		});*/

		container.setPropriety({
			name:'dynamic',
			label:'Menu Dinâmico',
			value:false
		});
	
		container.setPropriety({
			name     :'rounded',
			label : 'Botões Arredondados',
			value    : false,
			onChange : function(v){
				//console.log(v)
			}
			//xslValue : 'btn-outline'
		});
		
	}
			
}

this[VARS.name].declareContainer({
	name:'toolsbar',
	container:GENTOOLSBAR
});