var VKBFIELD = function(type,params){
	Field.call(this,type,params);
	var field = this;
	
	field.includes = {
		xsl:['virtualkeyboard'],
		css:[ { path:'/plugins/virtualkeyboard/vkb.css' } ],
		js :[ { path:'/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js' } ]
	}
	
	field.ready = function(){
		field.setPropriety({
			name:'keyType',
			value:{
				value   : 'vkb_aznum',
				options : [
					{ label:'A-Z/0-9', value:'vkb_aznum' },
					{ label:'A-Z', value:'vkb_az' },
					{ label:'0-9', value:'vkb_num' }
				]
			}
		});
	}
	

}

this[VARS.name].declareField({
	type:'virtualkeyboard',
	field:VKBFIELD
});