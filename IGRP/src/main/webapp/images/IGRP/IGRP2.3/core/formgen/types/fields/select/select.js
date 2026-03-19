const SELECTFIELD = function(type,params){
	Field.call(this,type,params);
	
	let field       = this;

	let GEN         = VARS.getGen();

	let proprieties = params?.properties ? params.properties : false;

	field.xml.options = true;

	field.includes = {
		xsl :[],
		css :[ 
			{ path:'/plugins/select2/select2.min.css' }, 
			{ path:'/plugins/select2/select2.style.css' } 
		],
		js  :[ 
			{ path:'/plugins/select2/select2.full.min.js'}, 
			{ path:'/plugins/select2/select2.init.js'} 
		]
	}
	
	field.ready = function(){

		field.setPropriety({
			name:'multiple',
			propriety:false,
			xslValue : 'multiple="multiple"', //XSL VALUE WHEN PROPRIETY IS TRUE
			onEditionStart:function(v){
				if(field.GET.delimiter){
					let input = $('input',v.input)
					input.on('change',function(){
						let action = $(this).is(':checked') ? 'show' : 'hide';
						$('.gen-properties-setts-holder div[rel="delimiter"]')[action]();
					});
				}
			}
		});
		

		field.setPropriety({
			label:'Dynamic option',
			name:'tags',
			propriety:false,
			xslValue : 'tags="true"'
		});

		field.setPropriety({
			label:'Load service data',
			name:'load_service_data',
			propriety:false,
			xslValue : 'load_service_data=""'
		});

		GEN.setDomainAttr(field,{
			value: proprieties?.domain ? proprieties.domain : '',
			selected : proprieties?.domain_value ? proprieties.domain_value : false
		});

		field.parent.on('draw-end',function(){
			$.IGRP.components.select2.init(field.parent.holder);
		},true);
	}

	field.onEditionStart = function(){
		let action = field.GET.multiple() ? 'show' : 'hide';
		$('.gen-properties-setts-holder div[rel="delimiter"]')[action]();
	}


}
[VARS.name].declareField({
	type:'select',
	field:SELECTFIELD
});
