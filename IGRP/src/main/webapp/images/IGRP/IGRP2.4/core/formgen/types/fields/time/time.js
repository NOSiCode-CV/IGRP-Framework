var TIMEFIELD = function(type,params){
	Field.call(this,type,params);
	
	var field 	    = this;
	var proprieties = params.properties;


	field.includes = {
		css :[ 
			{ path: '/plugins/datetimepicker/css/datetimepicker.css' } 
		],
		js  :[ 
			{ path: '/plugins/datetimepicker/js/datetimepicker.js'}, 
			{ path: '/plugins/datetimepicker/js/dtp.init.js' } 
		]
	}

	field.ready = function(){
		/*field.setPropriety({
			name:'format',
			value:{
				value: proprieties && proprieties.format ? proprieties.format : 'IGRP_datePicker',
				options:[
					//{ value :'IGRP_datePicker'    , label: 'Date' },
					//{ value :'IGRP_dateTimePicker', label: 'Date & Time' },
					//{ value :'IGRP_timePicker'    , label: 'Time' }
				]
			}
		});*/

		field.parent.on('draw-end',function(){

			datePickerConfig($('.gen-date',field.parent.holder));
			
		},true);
	}
}

this[VARS.name].declareField({
	type:'time',
	field:TIMEFIELD
});
