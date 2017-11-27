var GENCALENDAR = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	var GEN = VARS.getGen();

	container.xml.type 		= 'calendar';
	container.xml.structure = 'form';
	container.xml.genRemote = true;
	container.autoSetField 	= false;

	container.contextMenu = {
		type   : 'button',
		holder : '.igrp-calendar-ctx',
		menu   : {
			selector: '.igrp-calendar-ctx-item',
			label   : 'span',
		}
	};

	var date = new Date().toJSON().slice(0,10);

	/*GEN.setBtnActionAttr(container,{
		value:''
	});*/

	container.onXMLGenerate = function(xmlStr){
		var tag  = $.trim(container.GET.tag()),
			rtn  = '<'+tag+'_events type="table" xml-type="table" gen-type="container" gen-group="true">'+
			'<fields>'+
				'<'+tag+'_title name="p_'+tag+'_title" type="text" maxlength="200"><label>Titulo do Evento</label></'+tag+'_title>'+
				'<'+tag+'_description name="p_'+tag+'_description" type="text" maxlength="400"><label>Descricao do evento</label></'+tag+'_description>'+
				'<'+tag+'_id name="p_'+tag+'_id" type="text" maxlength="30"><label>ID do Evento</label></'+tag+'_id>'+
				'<'+tag+'_start name="p_'+tag+'_start" type="date" maxlength="30"><label>Data Inicio do Evento</label></'+tag+'_start>'+
				'<'+tag+'_end name="p_'+tag+'_end" type="date" maxlength="30"><label>Data Fim do Evento</label></'+tag+'_end>'+
				'<'+tag+'_color name="p_'+tag+'_color" type="text" maxlength="30"><label>Cor de Fundo do Evento simboliza prioridade</label></'+tag+'_color>'+
				'<'+tag+'_allday name="p_'+tag+'_allday" type="text" maxlength="30"><label>Evento Dia Todo (value Boolean)</label></'+tag+'_allday>'+
			'</fields>'+
			'<table><value>'+
				'<row>'+
			        '<'+tag+'_title>Event</'+tag+'_title>'+
			        '<'+tag+'_start>'+date.replace(/(\d*)-(\d*)-(\d*)/,'$3-$2-$1')+'T10:00:00</'+tag+'_start>'+
			        '<'+tag+'_id>1</'+tag+'_id>'+
			        '<'+tag+'_end>'+date.replace(/(\d*)-(\d*)-(\d*)/,'$3-$2-$1')+'T12:00:00</'+tag+'_end>'+
					'<'+tag+'_allday>true</'+tag+'_allday>'+
					'<'+tag+'_description>Event Event Event</'+tag+'_description>'+
				'</row>'+
			'</value>';

			if(container.contextMenu && container.contextMenu.items[0])
				rtn+=GEN.genContextMenu(container);

		rtn+='</table></'+tag+'_events>';

		return rtn;
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
				path	:'/core/calendar/3.0.1/js/fullcalendar.min.js',
				charset : 'UTF-8'
			},
			{ 
				path 	:'/core/calendar/3.0.1/js/locale-all.js',
				charset : 'UTF-8'
			},

			{ 
				path : '/core/igrp/table/table.contextmenu.js' 
			},
			
			{ 
				path:'/core/calendar/3.0.1/js/igrp.calendar.js'
			}
		]
	}

	container.setPropriety({
		name:'header',
		label:'Header Views',
		value:{
			value   : '',
			options :[
				{value : 'prev', label : 'Prev'},
				{value : 'title', label : 'Title'},
				{value : 'next', label : 'Next'}
			],
			multiple:true
		}
	});

	container.setPropriety({
		name:'views',
		label:'Views',
		value:{
			value   : '',
			options :[
				{value : 'month', label : 'Month'},
				{value : 'agendaWeek', label : 'Week'},
				{value : 'agendaDay', label : 'Day'},
				{value : 'today', label : 'Today'}
			],
			multiple:true
		}
	});

	container.setPropriety({
		name:'editevents',
		value:true,
		editable:false,
		xslValue:function(){
			var app     = GEN.SETTINGS.table ? GEN.SETTINGS.table.split('.')[0] : GEN.DETAILS.app,
            	package = GEN.SETTINGS.package;
			
			return '<xsl:with-param name="editevents" select="\''+app+'.'+package+'\'"/>';
		}
	});

	container.onDrawEnd = function(){
		var c  = $.IGRP.components.calendar.get( container.GET.tag() );
   	 	c.fullCalendar('render');
   	 	c.fullCalendar('addEventSource',path+'/core/calendar/3.0.1/data/calendar.json');
	}
}

this[VARS.name].declareContainer({
	name:'calendar',
	container:GENCALENDAR
});