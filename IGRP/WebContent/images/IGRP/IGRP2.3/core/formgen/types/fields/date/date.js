var DATEFIELD = function(type,params){
	
	Field.call(this,type,params);
	
	var field 	    = this;

	var proprieties = params.properties;


	field.includes = {
		css :[ 
			{ path: '/plugins/datepicker2/daterangepicker.css' },
			{ path: '/plugins/datepicker2/IGRP.daterangepicker.css' } 
		],
		js  :[ 
			{ path: '/core/moment/moment.min.js'},
			{ path: '/plugins/datepicker2/daterangepicker.js'},
			{ path: '/plugins/datepicker2/IGRP.daterangepicker.config.js'},
			{ path: '/plugins/datepicker2/locale/dp.locale.pt.js'}
		]
	}

	var initDatePicker = function(){

		var component  = $.IGRP.components.daterangepicker,

			parent 	   = field.parent,

			holder     = field.parent.hasTableRows ? parent.holder : field.holder;

		component.init({

			selector : '.gen-date-picker',

			parent 	 : holder

		});
		
	};

	field.ready = function(){

		field.setPropriety({
			name  : 'range',
			label : 'From/To',
			value : false 
		});

		field.parent.on('draw-end',function(){
			initDatePicker();
		});

	};

}

this[VARS.name].declareField({
	type:'date',
	field:DATEFIELD
});
