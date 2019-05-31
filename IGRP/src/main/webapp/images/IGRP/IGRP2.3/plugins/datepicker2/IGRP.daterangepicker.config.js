(function(){
	
	var selector = '.gen-date-picker',

		exclude  = ':not([date-picker-set="true"])',

		clearBtn = '.datepicker-clear',

		inputBtn = '.gen-date-picker-wrapper .gen-date-icon',

		com

	$.IGRP.component('daterangepicker', {

		locale: {},

		set:function(el){
			
			var element 		 = el,

				data 			 = element.data() || {},

				singleDatePicker = !data.range,

				formlist 	     = element.parents('.IGRP_formlist')[0],

				value 			 = element.val() || '';


			element.daterangepicker({

				showDropdowns	 : true,

				autoUpdateInput  : false,

			    autoApply		 : true,

			    singleDatePicker : singleDatePicker,

			    locale 			 : com.locale,

			    minDate			 : "01/01/1900",

			    maxDate			 : "01/01/2099",

			    //opens	  		 : "left"

			}).attr('date-picker-set',true).val(value);

			element.on('apply.daterangepicker', function(ev, picker) {

				var date   = picker.startDate,

					date2  = picker.endDate,

					locale = com.locale,

					value  = singleDatePicker ? date.format(locale.format) : 

											   date.format(locale.format)+locale.separator+date2.format(locale.format)

				el.val( value ).change();
				
			});

			if( formlist && formlist.events)

				formlist.events.on('row-add',function(row){
	
					com.init({

						selector : selector,

						parent   : row

					} );

				},true);
	
		},

		init:function(options){

			com = this;

			var o      = options || {};

			var parent = o.parent   || null;

			selector   = o.selector || selector;

			exclude    = o.exclude  || exclude;

			$.each($(selector,parent),function(){
				com.set( $(this) );
			});

			$(document).on('click',inputBtn,function(){
				$(this).parent().find('input'+selector).trigger('click');
			});

			$(document).on('click',clearBtn,function(){
				$(this).parent().find('input'+selector).val('');
			});
			
			$(document).on('formlist:init', function(o,e){
                com.init( {parent : $(e)} );
            });
		}

	},true);

})();