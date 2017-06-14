var VKBFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;
	
	field.includes = ['virtualkeyboard'];
	
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
			},
			transform:true
		})
		
	}
	

}

this[VARS.name].declareField({
	type:'virtualkeyboard',
	field:VKBFIELD
});