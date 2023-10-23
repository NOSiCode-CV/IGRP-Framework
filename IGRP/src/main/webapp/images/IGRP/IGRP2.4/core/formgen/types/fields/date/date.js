var DATEFIELD = function(type,params){
	
	Field.call(this,type,params);
	
	var field 	    = this;

	var proprieties = params.properties;


	field.includes = {
		
		css :[ 
			//{ path: '/plugins/datepicker2/daterangepicker.css' },
			//{ path: '/plugins/datepicker2/IGRP.daterangepicker.css' } 
		],
		js  :[ 
			{ path: '/core/moment/moment.min.js'},
			{ path: '/libs/flatpickr/flatpickr.min.js'},
			{ path: '/libs/flatpickr/l10n/default.js'},
			{ path: '/libs/flatpickr/l10n/en.js'},
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

		field.setPropriety({
			name  : 'format',
			//label : 'For',
			value : {
				value:'d-m-Y',
				options : [
					{value: 'd-M-Y', label:'Dia-Mês-Ano'},
					{value: 'M-Y', label:'Mês/Ano'},
					{value: 'd-M', label:'Mês/Ano'}
				]
			},
			editable: false
		});

		field.setPropriety({
			name  	: 'enableTime',
			label 	: $.IGRP.locale.get('enable-time'),
			value 	: false,
			//xslValue: 'data-enable-time="true"'
		});

		field.setPropriety({
			name  : 'range',
			label : 'From/To',
			value : false 
		});

		field.setPropriety({
			name  : 'disableWeekends',
			label : 'Disable Weekends',
			value : false 
		});

		field.setPropriety({
			name  : 'disabledBeforetoday',
			label : 'Disable Before Today',
			value : false 
		});

		field.setPropriety({
			name  	: 'daysoff',
			label 	: 'Days Off',
			value 	: false,
			//xslValue: 'daysoff=""'
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
