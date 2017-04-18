var SELECTFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;

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
			xslValue : 'multiple="multiple"' //XSL VALUE WHEN PROPRIETY IS TRUE
		});

		field.parent.on('draw-end',function(){
			//console.log($('.select2',field.parent.holder));
			
			$.IGRP.components.select2.init(field.parent.holder);
			
		},true);
	}



}
this[VARS.name].declareField({
	type:'select',
	field:SELECTFIELD
});
