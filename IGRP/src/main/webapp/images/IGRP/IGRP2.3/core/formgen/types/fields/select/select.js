var SELECTFIELD = function(type,params){
	Field.call(this,type,params);
	
	var field       = this;

	var GEN         = VARS.getGen();

	var proprieties = params && params.properties;

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
			xslValue : 'tags="true"'
		});

		GEN.setDomainAttr(field,{
			value: proprieties && proprieties.domain ? proprieties.domain : ''
		});

		field.parent.on('draw-end',function(){
			$.IGRP.components.select2.init(field.parent.holder);
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
