function datePickerConfig(_input,f){

	$.each(_input,function(i,el){
		var input = $(el);
		var format = f ? f : input.attr('format');
		var valid  = input.attr('disabled') || input.attr('readonly') ? false : true;
		
		if(valid){
			//switch format to config
			switch(format){
				case "IGRP_timePicker":
					
					input.datetimepicker({
						lang:'pt',
						hours12: false,
						datepicker:false,
						format:'H:i',
						step:30,
						closeOnTimeSelect:true,
						scrollInput : false
					});
				break;
				
				case "IGRP_dateTimePicker":
					input.datetimepicker({
						lang:'pt',
						hours12: false,
						format: 'd-m-Y H:i',
						step:30,
						opened: false,
						validateOnBlur: false,
						closeOnDateSelect: false,
						closeOnTimeSelect: false,
						scrollInput : false
					});
				break;
				
				case "IGRP_datePicker":
					input.datetimepicker({
						lang:'pt',
						format: 'd-m-Y',
						timepicker:false,
						validateOnBlur: true,
						closeOnDateSelect: true,
						scrollInput : false
					});
				break;
			}
			//events
			input.next('.gen-date-icon').on('click',function(){
				input.datetimepicker('show');
			});
		}
		
	});

	//formlist event
	var formlist = _input.parents('table.IGRP_formlist')[0];
	if(formlist){
		formlist.events.on('row-add',function(row){
			datePickerConfig($('.gen-date',row));
		},true);
	}
}

$(function(){
	datePickerConfig($('.gen-date'));	
});