var RANGEFIELD = function(type,params){
	
	Field.call(this,type,params);
	
	var GEN        = VARS.getGen();

	var field 	   = this;
	
	var proprieties = params.properties;

	field.includes = {
		js :[
			{ path:'/plugins/bs.range/bootstrap.slider.min.js' },
			{ path:'/plugins/bs.range/igrp.range.js' }
		],
		css:[
			{ path: '/plugins/bs.range/css/bootstrap.slider.min.css' },
			{ path: '/plugins/bs.range/css/igrp.slider.css' }
		]
	}

	field.ready = function(){
		
		field.setProperty({
			name: 'rangeMin',
			value: 0
		});

		field.setProperty({
			name: 'rangeMax',
			value: 10
		});
		
	};

	field.onDrawEnd = function(){

		var range = $('[range-id="range-'+field.GET.tag()+'"]',$('[item-name="'+field.GET.tag()+'"]'));

		$.IGRP.components['bsRange'].render(range);

	}
	
}

this[VARS.name].declareField({
	type:'range',
	field:RANGEFIELD
});