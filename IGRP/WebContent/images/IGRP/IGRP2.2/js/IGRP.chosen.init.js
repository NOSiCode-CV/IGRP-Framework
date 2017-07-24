// JavaScript Document Select Chosen init @NOSi 2014
function IGRP_selectChosen(obj){
	var objSelector = obj? obj:"";
	var choseValidate = function(){
		if(($(this).hasClass("important") || $(this).hasClass("required")) && !$(this).hasClass("ignore")){
			IGRP_ResetError($(this));
			$('#'+$(this).attr('name')+'_chosen').removeClass("error");
		}
	}

	var config = {
		selector: objSelector+" select[chosen='select']",
		params  : {allow_single_deselect:true}
	}
	
    $(config.selector).chosen(config.params).change(choseValidate);
}
$(function(){IGRP_selectChosen();});