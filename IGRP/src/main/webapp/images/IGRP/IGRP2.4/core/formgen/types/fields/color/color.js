var COLORFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;

	field.includes = {
		css:[
			{ path:'/libs/@simonwep/pickr/themes/nano.min.css', position:'before'},

		],
		js :[
			{ path : '/libs/@simonwep/pickr/pickr.min.js' },
			{ path:'/components/colorpicker/init.js'}
		]
	}

	field.ready = ()=>{
		field.on('draw-end',(f)=>{
			var fieldHolder = field.holder || field.parent.holder.find('.gen-fields-holder[item-name="'+field.GET.tag()+'"]');
	
			if(field.parent.type === 'formlist')
				fieldHolder = field.parent.holder.find('td[item-name="'+field.GET.tag()+'"]');

			setTimeout(()=>{
				$.IGRP.components.colorpicker2.init(fieldHolder);
			},100)
			
		})
		/*field.parent.on('draw-end',(f)=>{

			
	
	
		},true);*/
	}

}
this[VARS.name].declareField({
	type:'color',
	field:COLORFIELD
});