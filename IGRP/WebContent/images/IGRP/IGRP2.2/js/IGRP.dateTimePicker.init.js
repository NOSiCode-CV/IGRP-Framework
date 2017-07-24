// JavaScript Document dateTimePicker init @NOSi 2014
function  IGRP_dateTimePicker(pObj){
	switch(pObj.pClass){
		case "IGRP_timePicker":
			
			$("input[drel='"+pObj.pId+"']").datetimepicker({
				lang:'es',
				hours12: false,
				datepicker:false,
				format:'H:i',
				step:30,
				closeOnTimeSelect:true,
			});
		break;
		
		case "IGRP_dateTimePicker":
			$("input[drel='"+pObj.pId+"']").datetimepicker({
				lang:'es',
				hours12: false,
				format: 'd-m-Y H:i',
				step:30,
				opened: false,
				validateOnBlur: false,
				closeOnDateSelect: false,
				closeOnTimeSelect: false
			});
		break;
		
		case "IGRP_datePicker":
			$("input[drel='"+pObj.pId+"']").datetimepicker({
				lang:'es',
				format: 'd-m-Y',
				timepicker:false,
				validateOnBlur: true,
				closeOnDateSelect: true
			});
		break;
	}
	return false;
}

function IGRP_h_dateTimePicker(){
	$("#igrp-bodyPage").on("click","input.date, input.time, input.datetime",function(){
		$(this).next("div.calendar").trigger("click");
	});
	$("#igrp-bodyPage").on("click","div.calendar",function(){
		var vClass 		= $(this).prev("input:first").attr("trel");
		var vClassTime  = vClass+IGRP_returnTime();
		$(this).prev("input:first").attr("drel",vClassTime);
		IGRP_dateTimePicker({pClass:vClass, pId:vClassTime});
		$("input[drel='"+vClassTime+"']").datetimepicker('show');
	});
	
	$('input.date:disabled, input.datetime:disabled, input.time:disabled').each(function(){
		$(this).removeClass('date time datetime').removeAttr('trel');
	});
}

$(function(){IGRP_h_dateTimePicker();});