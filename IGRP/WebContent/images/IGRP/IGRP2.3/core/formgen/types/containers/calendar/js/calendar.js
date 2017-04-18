var GENCALENDAR = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	container.xml.type = 'calendar';

	container.autoSetField = false;

	container.contextMenu = {
		type   : 'button',
		holder : '.igrp-calendar-ctx',
		menu   : {
			selector: '.igrp-calendar-ctx-item',
			label   : 'span',
		}
	};

	container.includes = {
		xsl: ['calendar'],
		css: [
			{ 
				path:'/core/calendar/3.0.1/css/fullcalendar.print.css',
				media:'print'
			},
			{ 
				path:'/core/calendar/3.0.1/css/fullcalendar.min.css' 
			},
			{ 
				path:'/core/calendar/3.0.1/css/igrp.calendar.css' 
			}
		],
		js : [
			{ 
				path:'/core/moment/moment.min.js'
			},
			
			{ 
				path:'/core/calendar/3.0.1/js/fullcalendar.min.js'
			},
			{ 
				path:'/core/calendar/3.0.1/js/locale-all.js'
			},

			{ 
				path : '/core/igrp/table/table.contextmenu.js' 
			},
			
			{ 
				path:'/core/calendar/3.0.1/js/igrp.calendar.js'
			}
		]
	}

	container.onDrawEnd = function(){
		var c = $.IGRP.components.calendar.get( container.GET.tag() );
		c.fullCalendar('render');
	}

}

this[VARS.name].declareContainer({
	name:'calendar',
	container:GENCALENDAR
});