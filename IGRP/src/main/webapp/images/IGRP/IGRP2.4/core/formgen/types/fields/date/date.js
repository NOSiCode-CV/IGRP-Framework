var DATEFIELD = function(type,params){
	
	Field.call(this,type,params);
	
	var field 	    = this;

	var proprieties = params.properties;

	var DateProperties = GEN.getGlobalProperty('date-options');

	field.includes = {
		
		css :[ 
			//{ path: '/plugins/datepicker2/daterangepicker.css' },
			//{ path: '/plugins/datepicker2/IGRP.daterangepicker.css' } 
		],
		js  :[ 
			{ path: '/core/moment/moment.min.js'},
			{ path: '/libs/flatpickr/flatpickr.min.js'},
			{ path: '/libs/flatpickr/l10n/default.js'},
			{ path: '/libs/flatpickr/l10n/pt.js'},
			{ path: '/libs/choices.js/public/assets/scripts/choices.min.js'},
			{ path: '/components/datepicker/init.js'},

			//{ path: '/plugins/datepicker2/locale/dp.locale.pt.js'}
		]
	}

	var initDatePicker = function(){


		$.IGRP.components.datepicker?.init( )
		//flatpickr('#'+field.GET.tag())

		/*var component  = $.IGRP.components.daterangepicker,

			parent 	   = field.parent,

			holder     = field.parent.hasTableRows ? parent.holder : field.holder;

		component.init({

			selector : '.gen-date-picker',

			parent 	 : holder

		});*/
		
	};

	

	

	field.ready = function(){

		DateProperties(field);

		field.parent.on('draw-end',function(){
			initDatePicker();
		});

	};

}

this[VARS.name].declareField({
	type:'date',
	field:DATEFIELD
});
