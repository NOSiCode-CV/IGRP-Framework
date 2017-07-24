// JavaScript Document Form Lista @NOSi 2014
function IGRP_formListItem(pObj){
	$("tbody tr",pObj.pObjt).length * 1 > 1?$("tbody tr:first-child",pObj.pObjt).removeClass("noDelete"):
	$("tbody tr:first-child",pObj.pObjt).addClass("noDelete");
}

function IGRP_formList(){
	IGRP_formListItem({pObjt:$("table.IGRP_formlist")});
	var vTable, vObjTr;
	$("body").on("click",".IGRP_addRowForm",function(){
		vTable = $("table[rel='T_"+$(this).attr('rel')+"']");
		vTrRow = ($("tbody tr:last",vTable).attr("row")*1)+1;
		vObjTr = $("tbody tr:last",vTable).removeClass("noDelete").clone(!1);
		vObjTr = vObjTr.attr("row",vTrRow);
		
		if(vWidth <= vResTable){
			$("td",vTable).removeClass("active");
			$("td",vObjTr).each(function() {$(this).attr("data-row",vTrRow).addClass('active');});
		}
		
		$("*",vObjTr).each(function(i,e){
			if($(e).attr("type")=='text' || $(e).attr("type")=='texteditor' || $(e).attr("type")=='number'){
				$(this).val('');
				$(this).attr("value",'');
			}
			if($(e).attr("type")=='radio' || $(e).attr("type")=='checkbox')
				$(e).removeAttr("checked").prop("checked",false);
				
			if($(e).prop('tagName').toLowerCase() == 'textarea')
				$(this).text('');
		});
		
		if(($("div.chosen-container")[0],vObjTr)){
			$("div.chosen-container",vObjTr).remove();
			$("select[chosen='select']",vObjTr).find("option:selected").removeAttr("selected");
		}
	
		$("tbody",vTable).append(vObjTr);
		if($("select[chosen='select']"[0],vObjTr)){
			IGRP_selectChosen();
		}
	});
	IGRP_h_delRow();
}

$(function(){IGRP_formList();});