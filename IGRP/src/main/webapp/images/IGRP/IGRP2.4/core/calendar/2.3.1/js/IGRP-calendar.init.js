//NOSi Calendar init @2015
var vDateFormt = "DD-MM-YYYY, HH:mm", sDateFormat = "DD-MM-YYYYTHH:mm:ss", vIdObj = $('#calendar'), vObjForm = $("#formular_default"),
	vUrlEdit = $("#p_link_resize").val();

function IGRP_h_calendarInit(pObj){
	$(pObj.pThisId+':not(".fc-event")').on('contextmenu', function (e) {
			e.preventDefault();
	});
	vIdObj 			= pObj.pThisId?$(pObj.pThisId):vIdObj;
	vDefaultView 	= pObj.pDefaultView?pObj.pDefaultView:'month';

	console.log(vIdObj)

	vIdObj.fullCalendar({
		header:{
			left 	: '',
			center 	: 'prev,title,next',
			right 	: 'month,agendaWeek,agendaDay,today'
		},
		displayEventEnd :{
			month 	  :true,
			basicWeek : true,
			"default" : true
		},
		lang 		:pObj.pLng,
		defaultDate :IGRP_isoDate(pObj.pDefDate),
		editable  	:true,
		defaultView :vDefaultView,
		eventLimit  : true, // allow "more" link when too many events
		//businessHours:{start:'08:00',end:'18:00'},
		//hiddenDays:[0,6],
		loading:function(isLoading, view ){
			//isLoading?IGRP_pageLoading({pType:true}):IGRP_pageLoading({pType:false});
		},
		eventRender: function (event,element) {
			element.bind('mousedown', function (e) {
				if (e.which == 3) {
					IGRP_calendarCtx({pEvent:event,pThis:e,pObj:element,pThisId:pObj.pThisId});
				}
			});
		},
		dayClick: function(date, allDay ,jsEvent, view) {
			var vCategoria 	= getCategoria(),
				vParam 		= "p_date="+IGRP_isoDate(date.format());
			if(pObj.pUrlAdd != '' && pObj.pUrlAdd != null){
				if(vCategoria != null){
					if(vCategoria != '_o_')
						vParam +='&'+vCategoria;

					IGRP_h_popupCtx({pUrl:IGRP_getUrl(pObj.pUrlAdd)+vParam,pWin:"IGRP_winData"});
				}else{
					$('.selCalendar .chosen-single.chosen-default').addClass('error');
				}
			}
		 },
		 eventClick: function(event, jsEvent, view) {
			 //IGRP_calendarEventClick({pThis:event});
			 var vCategoria = getCategoria(),
			 	vParam 		= "p_id="+event.id;
			 vParam 		= (vCategoria != null && vCategoria != '_o_')?vParam+'&'+vCategoria:vParam;

			 IGRP_h_popupCtx({pUrl:IGRP_getUrl(pObj.pUrlAdd)+vParam,pWin:"IGRP_winData"+event.id});
		 },
		 eventDrop: function(event, delta, revertFunc, jsEvent) {
		 	IGRP_resizeORdropEvent({event:event,delta:delta,revert:revertFunc,pThisId:pObj.pThisId,jsEvent:jsEvent});
		 },
		 eventDragStart: function(event, revertFunc, jsEvent) {
			 $(".calendarCtx").removeClass("active").removeAttr('style');
		 },
		 eventDragStop: function(event, revertFunc, jsEvent) {

		 },
		 eventResize: function(event, delta, revertFunc) {
		 	IGRP_resizeORdropEvent({event:event,delta:delta,revert:revertFunc,pThisId:pObj.pThisId});
		 },
		 eventResizeStart: function(event, revertFunc) {
			 $(".calendarCtx").removeClass("active").removeAttr('style');
		 },
		 eventResizeStop: function(event, revertFunc) {

		 },
		events: function(start, end, timezone, callback) {
			getViewCalendar();
			var vUrl = pObj.pUrlEvents?pObj.pUrlEvents:window.location.href;
			$.ajax({
				url:vUrl,
				data:vObjForm.serializeArray(),
				type  :"POST",
				method:"POST",
				dataType: 'xml',
				cache: false,
				success: function(doc) {
					var events = [];
					$.each($(doc).find('value row'),function(i,row){
						var attrs	= $(row).find('> *:not(context-menu)').toArray(),
						eAtrrs		= {};
						for(var attr in attrs){
							var element	= $(attrs[attr]),
							name 		= element.prop('tagName'),
							value		= element.text(),
							nValue		= value;
							name 		= (name == 'ends')?'end':name;
							name 		= (name == 'starts')?'start':name;
							name 		= (name == 'backgroundcolor')?'backgroundColor':name;
							nValue 		= (name == 'end' || name == 'start')?IGRP_isoDate(value):value;
							eAtrrs[name]= nValue;
						}
						events.push(eAtrrs);
					});
					callback(events);
				},error:function(status){
					console.log('loading events report error: '+status);
				}
			});
		},
		timeFormat:'H(:mm)'
	});

	$('.fc-prev-button').click(function(e) {
		/*if(getCategoria() == null){
    		vIdObj.fullCalendar('next');
    		$('.selCalendar .chosen-single.chosen-default').addClass('error');
    	}else*/
    	getViewCalendar();
		if($(".selCalendar select")[0]){
			$(".selCalendar select").trigger('change');
		}
		else{
			if($('.buttonBar a.bClick')[0])
				$('.buttonBar a.bClick').click();
		}
	});

	$('.fc-next-button').click(function(e) {
		/*if(getCategoria() == null){
    		vIdObj.fullCalendar('prev');
    		$('.selCalendar .chosen-single.chosen-default').addClass('error');
    	}else*/
    	getViewCalendar();
		if($(".selCalendar select")[0]){
			$(".selCalendar select").trigger('change');
		}
		else{
			if($('.buttonBar a.bClick')[0])
				$('.buttonBar a.bClick').click();
		}
	});

	$(".selCalendar select").on('change',function(){
		getViewCalendar();

		var vUrl = $("input[name='p_env_frm_url']").val();
			vUrl = vUrl?vUrl:window.location.href;
		
		IGRP_notFildValidator(vObjForm);
		IGRP_pageLoading({pType:true});
		vObjForm.attr("action",IGRP_submit(vUrl)).submit();
	});

}

function getViewCalendar(){
	var vViewType  = vIdObj.fullCalendar('getView');

	$('.selCalendar .chosen-single.chosen-default').removeClass('error');
	//IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_start",pValue:IGRP_isoDate(vViewType.intervalStart.format())});
	//IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_end",pValue:IGRP_isoDate(vViewType.intervalEnd.format())});
	//IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_view_type",pValue:vViewType.type});
}

function getCategoria(){
	var vCategoria 	= null;
	if($(".selCalendar select")[0]){
		vCategoria 	= $(".selCalendar select").val();
	}
	vCategoria = (vCategoria != '' && vCategoria != null)?vCategoria:null;
	return (vCategoria != null)?catObj.attr('name')+'='+vCategoria:'_o_';
}

function IGRP_isoDate(pObj){
	try{
		var vVal = pObj.split('-'), vTime = '';
		vTime = (vVal[2].indexOf("T")!=-1)?vVal[2].split('T'):'';
		return (vTime[0])?vTime[0]+'-'+vVal[1]+'-'+vVal[0]+'T'+vTime[1]:vVal[2]+'-'+vVal[1]+'-'+vVal[0];
	}catch(e){console.log(e.description);}
}

function IGRP_submitEvent(pObj){
	var vParam	= vObjForm.find(pObj.pParam).serialize(),
	vArrPar		= {'path_tmpl':path_tmpl}, 
	vObj 		= $('#ctxCalendar',pObj.pThisId),
	vXsl 		= path+"/extensions/calendar/xsl/IGRP-remote.ctx.calendar.tmpl.xsl";
	IGRP_submitAjax({
		pUrl:pObj.pUrl,
		pData:vParam,
		pXsl:vXsl,
		pTransf:true,
		pXslParam:vArrPar,
		pDiv:vObj,
		pLoading:false,
		pComplete:function(){
			pObj.pConf?$(pObj.pThisId).fullCalendar('refetchEvents'):'';
		}
	});
	return false;
}

function IGRP_resizeORdropEvent(p){
	if(vUrlEdit != '' && vUrlEdit != null){
	 	if(getCategoria() != null){
			IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_start",pValue:IGRP_isoDate(p.event.start.format())});
			IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_id",pValue:p.event.id});

			var vDateEnd = p.event.end?IGRP_isoDate(p.event.end.format()):null;
			IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_end",pValue:vDateEnd});

			IGRP_submitEvent({pUrl:vUrlEdit,pParam:"#p_start,#p_id, #p_end, #p_categoria",pThisId:p.pThisId});
		}else
			$('.selCalendar .chosen-single.chosen-default').addClass('error');
	}
}

function IGRP_confirmSubmitEvent(pObj){
	IGRP_confirm({pFunction:pObj.pFunc,
		pParam:{
			pUrl:pObj.pUrl,
			pParam:pObj.pParam,
			pThisId:pObj.pThisId,
			pConf:true
		}
	});
}

var ctxDelete = false;

function IGRP_calendarCtx(pObj){
	$(".calendarCtx").removeClass("active").removeAttr('style');
	$("#ctxCalendar").removeAttr('style');
	var vObj = pObj.pEvent.id, thisParent = $(pObj.pObj).parents('.main-calendar'), vBoxCW = thisParent.width(), vBoxCH = thisParent.height(),  vBoxW = $("#ctx-"+vObj).width(),
	vBoxH 	= $("#ctx-"+vObj).height(),vLeft = pObj.pThis.pageX, vTop = pObj.pThis.pageY, vBoxTop = $(thisParent).offset().top;
	vLeft 	= ((vLeft + vBoxW) >= vBoxCW)?(vLeft - (vBoxW+5)):vLeft;
	vTop 	= (vTop - vBoxTop)+$(pObj.pObj).height();
	vTop	= ((vTop + vBoxH) >= vBoxCH)?(vTop - (vBoxH + 10)):vTop - 10;
	
	if(vBoxH > 5)
		$("#ctx-"+vObj).removeClass("active").removeAttr('style').css({left:vLeft,top:vTop}).addClass("active");

	$("#ctxCalendar").unbind("click").on("click","ul li a",function(e){
		e.preventDefault();
		var vTarget = $(this).attr("target"), vHref = $(this).attr("fw_href")?$(this).attr("fw_href"):$(this).attr("href");
		vHref = vHref?vHref:'XXX';
		/*if(vTarget == 'confirm' || vTarget == "alert_submit"){
			IGRP_creatField_OR_SetVal({pType:'hidden',pName:"p_id",pValue:vObj});
			IGRP_confirmSubmitEvent({
				pFunc:IGRP_submitEvent,
				pUrl:vHref,
				pParam:'#p_id, .selCalendar select',
				pThisId:pObj.pThisId
			});
		}else{
			IGRP_clickControllers({pUrl:vHref,pTarget:vTarget});
		}*/
		IGRP_clickControllers({pUrl:vHref,pTarget:vTarget});
		$(".calendarCtx").removeClass("active").removeAttr('style');
		return false;
	});
}

function IGRP_eventDialog(){
	$("#eDialog-modal").dialog({
		autoOpen: false,
		buttons:[{
			text:JSMSG_YES,
			click: function() {
				IGRP_blackBody({pType:false});
				$(this).dialog("close");
			}
		}]
	});
}

function IGRP_calendarEventClick(pObj){
	var vObj = pObj.pThis;
	IGRP_eventDialog();
	$("#eTitle").html('').html(vObj.title);
	$("#eDateStart").html('').html(vObj.start.format(vDateFormt));
	$("#eDateEnd").html('');
	vObj.end?$("#eDateEnd").html('').html(vObj.end.format(vDateFormt)):'';
	$("#eDescription").html('').html(vObj.description);
	IGRP_blackBody({pType:true});
	$("#eDialog-modal").dialog("open");
}