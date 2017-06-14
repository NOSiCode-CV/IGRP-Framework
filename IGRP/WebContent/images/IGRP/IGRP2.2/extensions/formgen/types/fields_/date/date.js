var DATEFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	
	var field = this;

	field.ready = function(){
		field.setPropriety({
			name:'format',
			value:{
				value: proprieties && proprieties.format ? proprieties.format : 'IGRP_datePicker',
				options:[
					{ value:'IGRP_datePicker'    , label: 'Date' },
					{ value:'IGRP_dateTimePicker', label: 'Date & Time' },
					{ value:'IGRP_timePicker'    , label: 'Time' }
				]
			},
			onChange:function(){
				field.parent.Transform();
			}
		});
	}


}

this[VARS.name].declareField({
	type:'date',
	field:DATEFIELD
});
