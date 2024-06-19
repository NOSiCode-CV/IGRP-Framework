var SELECTFIELD = function(type,params){
	Field.call(this,type,params);
	
	var field       = this;

	var GEN         = VARS.getGen();

	var proprieties = params && params.properties ? params.properties : false;

	field.xml.options = true;

	field.includes = {
		xsl :[],
		css :[ 
			//{ path:'/libs/select2/select2.min.css' }, 
			//{ path:'/plugins/select2/select2.style.css' } 
		],
		js  :[ 
			// { path:'/libs/choices.js/public/assets/scripts/choices.min.js'}, 
			// { path:'/components/select.choices/select.choices.js'} 
			//{ path:'/components/select-choices/init.js'} 
		]
	}
	
	field.ready = function(){

		field.setPropriety({
			label:'Placeholder',
			name:'placeholder',
			value: ''
			//xslValue : 'tags="true"'
		});


		field.setPropriety({
			name:'multiple',
			propriety:false,
			//xslValue : 'multiple="multiple"', //XSL VALUE WHEN PROPRIETY IS TRUE
			onEditionStart:function(v){
				if(field.GET.delimiter){
					var input = $('input',v.input)
					input.on('change',function(){
						var action = $(this).is(':checked') ? 'show' : 'hide';
						$('.gen-properties-setts-holder div[rel="delimiter"]')[action]();
					});
				}
			}
		});
		

		field.setPropriety({
			label:'Dynamic option',
			name:'tags',
			propriety:false,
			//xslValue : 'tags="true"'
		});

		field.setPropriety({
			label:'Load service data',
			name:'load_service_data',
			propriety:false,
			//xslValue : 'load_service_data=""'
		});

		GEN.setDomainAttr(field,{
			value: proprieties && proprieties.domain ? proprieties.domain : '',
			selected : proprieties && proprieties.domain_value ? proprieties.domain_value : false
		});

		field.on('draw-end',function(){
			const inputs = $(`.form-group[item-name="${field.GET.tag()}"] select`);

			$.IGRP.components.choices.init(inputs);
			
			/*inputs.each( (i,el)=>{
				const choices = new Choices(el,{
				
				});
			} )*/


			
			//$.IGRP.components.select2.init(field.parent.holder);
		},true);
	}

	field.onEditionStart = function(){
		var action = field.GET.multiple() ? 'show' : 'hide';
		$('.gen-properties-setts-holder div[rel="delimiter"]')[action]();
	}


}
this[VARS.name].declareField({
	type:'select',
	field:SELECTFIELD
});
