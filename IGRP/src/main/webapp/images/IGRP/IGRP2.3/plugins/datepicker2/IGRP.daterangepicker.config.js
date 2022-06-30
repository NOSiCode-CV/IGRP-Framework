(function(){
	
	var selector = '.gen-date-picker',

		exclude  = ':not([date-picker-set="true"])',

		clearBtn = '.datepicker-clear',

		inputBtn = '.gen-date-picker-wrapper .gen-date-icon',

		com

	$.IGRP.component('daterangepicker', {

		locale: {},

		set:function(el){
			
			var element 		 	= el,

				data 			 	= element.data() || {},

				singleDatePicker 	= !data.range,

				formlist 	     	= element.parents('.IGRP_formlist')[0],

				value 			 	= element.val() || '',
				
				disableWeekends  	= element.is('[disableWeekends="true"]') ? true : false,

				datesDisabled    	= element.is('[daysoff]') && element.attr('daysoff') != '' ? element.attr('daysoff').split(',') : [],
				
				disabledBeforetoday	= element.is('[disabledBeforetoday="true"]') ? true : false;


			element.daterangepicker({

				showDropdowns	 : true,

				autoUpdateInput  : false,

			    autoApply		 : true,

			    singleDatePicker : singleDatePicker,

			    locale 			 : com.locale,

			    minDate			 : "01/01/1900",

			    maxDate			 : "01/01/2099",

				isInvalidDate: function(date) {
					var _date = date.format('DD-MM-YYYY'),
						_day = date.day();

						console.log("date :: ",date);
						console.log("day -1:: ",moment(date).day(-1));

					if ((disableWeekends && (_day === 0 || _day === 6)) || $.inArray(_date,datesDisabled) !== -1 || (disabledBeforetoday && moment().isAfter(moment(date).add(1, 'day'))))
						return true;

					return false;
				}

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
			
			$.IGRP.events.on('element-transform',function(p){
				
		        if($(selector,p.content)[0]){
		        	$.each($(selector,p.content),function(){
		        		com.set($(this));
					});
		        }
			});
		}

	},true);

})();