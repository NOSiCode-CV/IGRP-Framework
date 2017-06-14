// JavaScript Document Separator List and Dialog
var vRowId = "", vIdTr = -1, vDialogActive = null, vDialogBox = '', vRelBox = 0, vRowDiag = null, vGFile = null;

function RowTD(pObj){
	var vVal = '', vVal1 = pObj.pVal, vVal2 = '',vTd = '';

	if(!pObj.pLink)
		vVal1 = IGRP_htmlEncode(vVal1);

	try{
		vVal = FIELD({pType:'hidden',pName:pObj.pName+"_fk",pValue:IGRP_htmlEncode(pObj.pVal1)});
	}catch(e){
		vVal = FIELD({pType:'hidden',pName:pObj.pName+"_fk",pValue:pObj.pVal1});
	}

	vVal2 = pObj.pLink?FIELD({pType:'hidden',pName:pObj.pName+"_fk_desc",pValue:pObj.pValLink}):
			FIELD({pType:'hidden',pName:pObj.pName+"_fk_desc",pValue:vVal1});

	if(pObj.pHasFile){
		vVal = pObj.pObjt.clone(true);		
		pObj.pObjt.attr("name",pObj.pName+"_fk").removeAttr("rel id").removeClass("important uploadFile").attr("value",vVal1).hide();
		vVal.insertBefore(pObj.pObjt); 
		//pObj.pTr.prepend(pObj.pObjt);
		vGFile = pObj.pObjt;
		//var vFile = vVal1;
		//vVal1 = '<a href="'+vVal1+'" name="'+pObj.pName+'" target="_blank" class="bClick">'+pObj.pLabel+'</a>';
		//vVal = '<input type="file" name="'+pObj.pName+'_fk" value="'+vVal1+'" style="display:none;"/>';
	}

	vVal = pObj.pHasFile?'':vVal;
	vTd = pObj.pIndex == 0?'<td data-title="'+pObj.pLabel+'" data-row="'+pObj.pTrcount+'">'+
			vVal1+'<span class="showResponsiveTable ctxmenu"/>'+vVal+vVal2+'</td>':
		  '<td data-title="'+pObj.pLabel+'" data-row="'+pObj.pTrcount+'">'+vVal1+vVal+vVal2+'</td>';

	/*Campos escondidos não devem aparecer em separador lista*/
	return (pObj.pType.match(/hidden/i))?''+vVal+''+vVal2:vTd;
}

function ROW_id(pRel,pObj){
	return  $("input[name='p_"+pRel+"_id']", pObj)[0]?$("input[name='p_"+pRel+"_id']", pObj).val():null;
}

function Row_noClear(pRel){
	var v="false";
	try{
		v = $("#p_"+pRel+"_nocls").val();
	}catch(e) {null;}
	return v=="true";
}

function Row_noDelete(pRel){
	var v="false";
	try{
		v = $("#p_"+pRel+"_nodel").val();
	}catch(e) {null;}
	return v=="true";
}

function Row_noEdit(pRel){
	var v="false";
	try{
		v = $("#p_"+pRel+"_noedt").val();
	}catch(e) {null;}
	return v=="true";
}

function Row_tr(pRel){
	if(vIdTr < 0 && $("input[name='p_fwl_"+pRel+"idtr']")[0]){
		try{
			vIdTr = $("input[name='p_fwl_"+pRel+"idtr']").val()*1;
		}catch(e){null;}
	}
	return vIdTr;
}

function IGRP_setHtmlBtn(pObj){
	$('a[rel="'+pObj.pRel+'"]').each(function(){
		var vText = (pObj.pTr != -1)?JSMSG_EDIT:JSMSG_ADD;
		vText = !$(this).hasClass('IGRP_row_confirmClose')?vText:vText+' & '+JSMSG_CLOSE;
		$('span',$(this)).html(vText);
	});
}

function IGRP_AddPosRow(pObj){
	var vTrcount = $("table[rel='T_"+pObj.pRel+"'] tbody tr").length;
	vIdTr = Row_tr(pObj.pRel);

	if(vIdTr >= 0 && vIdTr < vTrcount){
		$("table[rel='T_"+pObj.pRel+"'] tbody tr:eq("+vIdTr+")").remove();
		if(vIdTr == 0)
			$("table[rel='T_"+pObj.pRel+"'] tbody").prepend(pObj.pTr);
		else{
			if((vIdTr + 1) == vTrcount)
				$("table[rel='T_"+pObj.pRel+"'] tbody").append(pObj.pTr);
			else
				$("table[rel='T_"+pObj.pRel+"'] tbody tr:eq("+vIdTr+")").before(pObj.pTr);
		}
	}
	else
		$("table[rel='T_"+pObj.pRel+"'] tbody").append(pObj.pTr);
	vIdTr = -1;
	IGRP_setHtmlBtn({pTr:vIdTr,pRel:pObj.pRel});
	try{
		if($("input[name='p_fwl_"+pObj.pRel+"idtr']")[0])
			$("input[name='p_fwl_"+pObj.pRel+"idtr']").val(-1);
	}catch(e){null;}
}

function IGRP_divObj(pRel){
	return $("div[sep-name='group-"+pRel+"']");
}

function IGRP_resetForm(pObj){
	$("*[rel='F_"+pObj.pRel+"']",pObj.pDiv).each(function() {
		var vType = $(this).attr('type');
		if(!$(this).attr('disabled') && !$(this).attr('readonly')){
			if(vType != 'file' && vType != 'radio' && vType != 'checkbox' && vType != 'link')
			 	$(this).val('');

			 else if(vType == 'file'){
				 $("input[file='"+$(this).attr('id')+"']").val('');
				 $(this).val('');

			 }else if(vType == 'radio' || vType == 'checkbox'){
				 $(this).removeAttr("checked").prop("checked",false);

			 }else if($(this).hasClass('color')){
				 $(this).spectrum("destroy");
			 }
			 if(($(this).prop('tagName')).toLowerCase() == "select"){
				 $(this).find("option").removeAttr("selected");
				 $(this).trigger("chosen:updated");
			}
		}
    });
}


function IGRP_AddRow(pObj){
	console.log(pObj)
	var vData = '', vDataHidden = '', vTd = '',vHas = false,
		vHasFile = false, vObj = '', vType = '', vLink = false,
		vValLink = '', vVal = '', vVal1 = '', vName = '', vLabel = '', vTr = '', vCalss = ''
		vTitem = 0, vNotVal = false, vCval = 0, vDiv = IGRP_divObj(pObj.pRel),
		vTrcount = $("table[rel='T_"+pObj.pRel+"'] tbody tr")[0]?
					($("table[rel='T_"+pObj.pRel+"'] tbody tr:last-child").attr("row")*1):0;

	vTrcount = (vTrcount >= 0 && Row_tr(pObj.pRel) < 0)?vTrcount+1:
		($("table[rel='T_"+pObj.pRel+"'] tbody tr:eq("+Row_tr(pObj.pRel)+")").attr("row")*1);

	vTr = $('<tr row="'+vTrcount+'">');
	$("*[rel='F_"+pObj.pRel+"']").each(function(index, element){
		
		console.log(element);

		vTitem += 1;
		vName 	= $(this).attr("name");
		$("label span.error",$(this).parents("div.igrp_item:first")).remove();
		vLabel 	= $("label",$(this).parents("div.igrp_item:first")).text();
		//vLabel 	= vLabel.indexOf('*')!=-1?vLabel.substring(1,vLabel.length):vLabel;

		if(!$(this).hasClass("hiddenItem") && !$(this).hasClass("error"))
			vVal = $(this).val();

		if(vVal != null && vVal != '')
			vHas = true;
		else{
			if($(this).hasClass("important") && !$(this).hasClass("ignore")){
				$(this).focus();
				vHas=false;
				$("label",$(this).parents("div.igrp_item:first")).html(vLabel+'<span class="error">'+JSMSG_VALIDATE_FILD_REQUIRED+'</span>');
				return false;
			}
			if($(this).attr('type') != 'radio' && $(this).attr('type') != 'checkbox')
				vCval += 1;
		}
		vVal1 = $(this).val();

		//select
		if(($(this).prop('tagName')).toLowerCase() == "select"  && !$(this).hasClass("ignore")){
			try{
				var vAux = "",vValAux = "", vIdx = 0;
				$(this).find("option:selected").each(function() {
					if($(this).val() != '' && $(this).val() != null){
						vIdx += 1;
						if(vIdx > 1){
							vAux+="; ";
							vValAux+=",";
						}
						vAux+= $(this).text();
						vValAux+=$(this).val();
						vHas=true;
					}
                });
				vVal 	= vAux;
				vVal1 	= vValAux;
			}catch(e){null;}
		}
		//radio or checkbox
		if($(this).attr('type') == 'radio' || $(this).attr('type') == 'checkbox'){
			try{
				vLabel = $(this).parent().text();
				if($(this).attr('checked') == 'checked' && !$(this).hasClass("hiddenItem")){
					vVal1 	= $(this).val();
					vVal 	= vLabel;
				}
				else{
					if($(this).hasClass("important")){
						vHas=false;
						return false;
					}
					vVal = '';
					vVal1 = '';
					vCval +=1;
				}
			}catch(e){null;}
		}
		//link
		if($(this).attr('type') == 'link'){
			try{
				var vDesc 	= $(this).attr('desc');
				vClass 		= $(this).attr("target");
				vValLink 	= $(this).val();
				vLabel 		= vDesc;

				try{
					if($('#p_'+pObj.pRel+'_p')[0]){
						var _p = $('#p_'+pObj.pRel+'_p').val(),
							nP = _p.split('|'), vIdx = 0,
							vParam = '';
						nP.forEach(function(e,i){
							vIdx +=1;
							var ne = e.split('::');
							if(vIdx > 1)
								vParam +='&';
							vParam +=ne[0]+'='+ne[1];
						});
					
						vValLink = IGRP_getUrl(vValLink)+vParam;
						vClass = '_blankTarget';
					}
				}catch(e){console.log(e.description);}

				if(vDesc == '' || vDesc == null)
					vDesc = vValLink;
				vVal = '';
				if(vValLink != '' && vValLink != null){
					vLink = true;
					vVal = '<a href="'+vValLink+'" relink="'+pObj.pRel+'" name="'+vName+'" target="'+vClass+'" class="bClick">'+vDesc+'</a>';
				}
			}catch(e){null;}
		}

		if($(this).hasClass('color') && !$(this).hasClass("hiddenItem")){
			try{
				vDesc	= $(this).prev('label:first').text();
				vLabel	= vDesc;
				vVal	= '';
				if(vVal1 != '' && vVal1 != null){
					vLink	= true;
					vVal	= '<span class="color" style="background-color:'+vVal1+'"></span>';
				}
			}catch(e){null;}
		}

		vType 		= $(this).attr("type")?$(this).attr("type"):"";
		vHasFile	= (vType.match(/file/i))?true:false;

		/*Para campos marcados como não visivel na lista, considera-se que o campo é escondido/hidden*/
		if(($(this).attr("visible")?$(this).attr("visible"):"")=='false')
			vType = "hidden";

		 vTd =  RowTD({pVal:vVal,pName:vName,pVal1:vVal1,pType:vType,pIndex:index,
		 				pObjt:$(this),pTr:vTr,pLink:vLink,pValLink:vDesc,
						pHasFile:vHasFile,pLabel:vLabel,pTrcount:vTrcount});

		 (vType.match(/hidden/i))?vDataHidden += vTd:vData += vTd;
	});

	vNotVal = (vTitem == vCval)?true:false;

	if(vNotVal){
		/*var vMessage = JSMSG_ERROR_FILD_REQUIRED, vErro = 'error';
		if(vNotVal){*/
			vMessage	= JSMSG_WARNING_FILD_REQUIRED;
			vErro		= 'warning';
		//}
		(pObj.pType == '_diag')?
		IGRP_message({pObjt:$("div.D_"+pObj.pRel+" .IGRP_dialogboxCenter"),pType:vErro,pMessage:vMessage,pPos:'after'}):
		IGRP_message({pObjt:$("table[rel='T_"+pObj.pRel+"']"),pType:vErro,pMessage:vMessage,pPos:'before'});
		return false;
	}

	if(vRowId == "" && $("input[name='p_fwl_"+pObj.pRel+"']")[0]){
		try{
			vRowId = $("input[name='p_fwl_"+pObj.pRel+"']").val();
		}catch(e){null;}
	}

	if(Row_noDelete(pObj.pRel))
		vData += vDataHidden+""+FIELD({pType:'hidden',pName:'p_'+pObj.pRel+'_id',pValue:vRowId});

	vData += "<td class='bEdDel'>";

	if(!Row_noDelete(pObj.pRel))
		vData += '<img title="'+JSMSG_EDIT+'" src="'+path_tmpl+'/img/icon/tools-bar/edit.png" class="IGRP_editRow'+pObj.pType+'" rel="'+pObj.pRel+'" name="btn_'+pObj.pRel+'_edit"/>';

	if(!Row_noEdit(pObj.pRel))
		vData += vDataHidden+""+FIELD({pType:'hidden',pName:'p_'+pObj.pRel+'_id',pValue:vRowId})+'<img title="'+JSMSG_DELETE+'" src="'+path_tmpl+'/img/icon/tools-bar/delete.png" class="IGRP_delRow" rel="'+pObj.pRel+'" name="btn_'+pObj.pRel+'_del"/>';
	vData += "</td>";

	if(vHas){
		vTr.append(vData);
		if(vHasFile){
			vTr.append(vGFile);
			vGFile = null;
		}
		if(vWidth <= vResTable){
			$("td","table[rel='T_"+pObj.pRel+"']").removeClass("active");
			$("td",vTr).each(function(){$(this).addClass("active");});
		}
		IGRP_AddPosRow({pRel:pObj.pRel,pTr:vTr});
		vRowId = '';

		try{
		  $("input[name='p_fwl_"+pObj.pRel+"']").val("");
		}catch(e){null;}

		if(!Row_noClear(pObj.pRel))
			IGRP_resetForm({pRel:pObj.pRel,pDiv:vDiv});


		if(pObj.pType == '_diag'){
			IGRP_dialogBox({pRel:pObj.pRel,pOption:pObj.pBox});
			IGRP_controlDialogBox({pRel:pObj.pRel,pOption:pObj.pBox});
			if(pObj.pBox)
				$("body").removeClass("noscroll");
		}
	}
}

function IGRP_h_ResetError(){
	$("input, textarea").on("keyup",function(e) {
		if($(this).hasClass("important") && !$(this).hasClass("ignore")){
			var vRel = $(this).attr("rel"), vObjGroup = null;
			vRel = vRel.split("F_");
			vObjGroup = $(this).parents("div[sep-name='group-"+vRel[1]+"']").length;

			if(vObjGroup)
				IGRP_ResetError($(this));
		}
	});
}

function IGRP_EditRow(pObj){
	var isChange = false, objChange = null, vRowId = ROW_id(pObj.pRel,pObj.pObjt),
		vDiv = IGRP_divObj(pObj.pRel);

	IGRP_resetForm({pRel:pObj.pRel,pDiv:vDiv});

	IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_'+pObj.pRel,pValue:vRowId});
	IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_'+pObj.pRel+'idtr',pValue:pObj.pTrId});

	IGRP_setHtmlBtn({pTr:pObj.pTrId,pRel:pObj.pRel});

	$("*[rel='F_"+pObj.pRel+"']",vDiv).each(function(){
		try{
			var vVal = IGRP_htmlEncode($("*[name='"+$(this).attr("name")+"_fk']", pObj.pObjt).val());

			if(($(this).prop('tagName')).toLowerCase()=="select"){
				var vArray = vVal.split(','), vLi = new Array(), vSel = $(this);
				$(this).find("option").removeAttr("selected");
				for(var i = 0; i < vArray.length; i++){
					$(this).find("option").each(function() {
						if(vArray[i] == $(this).val() && $(this).val() != '' && $(this).val() != null){
							$(this).attr("selected","selected");
							vLi.push($(this).val());
							vSel.val(vLi).trigger("chosen:updated");
						}
					});
				}

				if($(this).attr("multiple"))
					$(this).val(vLi).multiselect("refresh");
			}
			if($(this).attr('type') == 'radio' || $(this).attr('type') == 'checkbox'){
				if(vVal == $(this).val() && vVal != '' && vVal != null)
					$(this).attr("checked","checked").prop("checked",true);
				else
					$(this).removeAttr("checked").prop("checked",false);
			}else
				$(this).val(vVal);

		}catch(e){null;}

		try{
			if($(this).hasClass('IGRP_change'))
				$(this).change();
		}catch(e){null;}
	});

	$("table[rel='T_"+pObj.pRel+"'] tbody tr").removeClass("active");
	pObj.pObjt.addClass('active');
}

function IGRP_dialogboxPosition(pRel){
	var vTheight = $('.D_'+pRel+' .IGRP_dialogboxTop').height();
	var vCheight = $('.D_'+pRel+' .IGRP_dialogboxCenter').height();
	$('.D_'+pRel+' .dialog_btnContainer').css('top',vCheight+vTheight-1);
}

function IGRP_dialogBox(pObj){
	vDialogActive = pObj.pRel;
	if(pObj.pOption){
		IGRP_blackBody({pType:true});
		$('.D_'+pObj.pRel).show();
		IGRP_dialogboxPosition(pObj.pRel);
	}else{
		vDialogActive = null;
		IGRP_blackBody({pType:false});
		$('.D_'+pObj.pRel).hide();
		$(".liverror").remove();
	}
}

function IGRP_controlDialogBox(pObj){
	var vObjDiaBox = $("input[name='p_fwl_dialogbox']"),
		vObjRelBox = $("input[name='p_fwl_relbox']");

	!vObjDiaBox[0]?vObjForm.append(FIELD({pType:'hidden',pName:'p_fwl_dialogbox',pValue:0})):'';
	!vObjRelBox[0]?vObjForm.append(FIELD({pType:'hidden',pName:'p_fwl_relbox',pValue:''})):'';
	pObj.pOption?(vObjDiaBox.val(1),vObjRelBox.val(pObj.pRel)):(vObjDiaBox.val(0),vObjRelBox.val(''));
}

function IGRP_h_addRow(){
	try{
		vDialogBox 	= $("input[name='p_fwl_dialogbox']").val();
		vRelBox 	= $("input[name='p_fwl_relbox']").val();
		if(vRelBox!='' && vRelBox!=null && vDialogBox == 1){
			IGRP_dialogBox(vRelBox,vDialogBox);
		}
	}catch(e){null;}

	var vRel = '';

	$("body").on("click",".IGRP_addRow_diag",function(){
		vRel = $(this).attr("rel");
		$("body").addClass("noscroll");
		IGRP_dialogBox({pRel:vRel,pOption:1});
		IGRP_controlDialogBox({pRel:vRel,pOption:1});
	});

	$("body").on("click",".IGRP_row_confirm",function(){
		vRel = $(this).attr("rel");
		IGRP_AddRow({pRel:vRel,pType:'_diag',pBox:1});
	});

	$("body").on("click",".IGRP_row_confirmClose",function(){
		vRel = $(this).attr("rel");
		IGRP_AddRow({pRel:vRel,pType:'_diag',pBox:0});
	});

	$("body").on("click",".IGRP_addRow",function(){
		IGRP_AddRow({pRel:$(this).attr("rel"),pType:''});
	});
}

function IGRP_editRowDiag(pObj){
	$("body").addClass("noscroll");
	IGRP_controlDialogBox({pRel:pObj.pRel,pOption:1});
	IGRP_EditRow({pRel:pObj.pRel,pObjt:pObj.pRow,pTrId:pObj.pRow.index()*1});
	IGRP_dialogBox({pRel:pObj.pRel,pOption:1});
}

function IGRP_h_editRow(){
	$("body").on("click",".IGRP_editRow_diag",function(){
		IGRP_editRowDiag({pRel:$(this).attr("rel"),pRow:$(this).parents("tr:first")});
		return false;
	});

	$("body").on("click",".IGRP_btn_close",function(){
		var vRel = $(this).attr("rel");
		(!Row_noClear(vRel))?IGRP_resetForm({pRel:vRel,pDiv:IGRP_divObj(vRel)}):'';
		$("table[rel='T_"+vRel+"'] tr td").removeClass('active');
		vIdTr = -1;	vRowId = '';
		IGRP_setHtmlBtn({pTr:vIdTr,pRel:vRel});
		if($("input[name='p_fwl_"+vRel+"idtr']")[0])
			$("input[name='p_fwl_"+vRel+"idtr']").val(-1);

		if($("input[name='p_fwl_"+vRel+"']")[0])
			$("input[name='p_fwl_"+vRel+"']").val("");

		$("body").removeClass("noscroll");
		IGRP_dialogBox({pRel:vRel,pOption:0});
		IGRP_controlDialogBox({pRel:vRel,pOption:0});
	});

	$("body").on("click",".IGRP_editRow",function(){
		var vRow = $(this).parents("tr:first");
		IGRP_EditRow({pRel:$(this).attr("rel"),pObjt:vRow,pTrId:vRow.index()*1});
		return false;
	});
}

function IGRP_h_ctxMenuResp(){
	$("table[rel*='T_']").on("click","tr td .ctxmenu",function(e){
		var vObj = $(this).parents("tr:first"), vRole = vObj.attr('row'), _top =0,
			vTable = $(this).parents("table"), vHtable = vTable.height(),
			vCtxObj = $("ul#"+vTable.attr('data-control'));

		$("tbody tr",vTable).removeClass("active");
		$(".ctxSepListDialog").removeClass("active");
		//$("td[data-row='"+vRole+"']",vObj).toggleClass("active");

		_top	= e.currentTarget.offsetParent.offsetTop;
		_top	= ((_top + vCtxObj.height()) >= vHtable)?(_top - vCtxObj.height()):_top + e.currentTarget.clientHeight;

		vObj.addClass("active");
		vCtxObj.removeClass("active").css({top:_top}).addClass("active");

		vCtxObj.unbind("click").on("click","li",function(){
			var vTop 	= $("#igrp-topPage")[0]?$("#igrp-topPage").height()+30:0,
				vType 	= $(this).attr("type")?$(this).attr("type"):null,
				vRel	= $(this).attr("rel");

			if($(this).hasClass('IGRP_editRow')){
				(vType != null && vType == '_diag')?IGRP_editRowDiag({pRel:vRel,pRow:vObj}):
				(IGRP_EditRow({pRel:vRel,pObjt:vObj,pTrId:vObj.index()*1}),
				$('html, body').animate({scrollTop:(IGRP_divObj(vRel).offset().top)-vTop},500));
			}else
				IGRP_DelRow({pRel:vRel,pObjt:vObj});

			vCtxObj.removeClass("active");
			return false;
		});
	});

	$("body").on("click",function(e){
		!$(e.target).hasClass("ctxmenu")?$("#ctxSepListDialog").removeClass("active"):'';
	});
}

function IGRP_resizeDialogBtn(){
	if(vDialogActive){
		if($('.D_'+vDialogActive).css('display') == 'block'){
			IGRP_dialogboxPosition(vDialogActive);
		}
	}
}

function IGRP_h_separator(){
	IGRP_h_addRow();
	IGRP_h_delRow();
	IGRP_h_editRow();
	IGRP_h_ResetError();
	IGRP_h_ctxMenuResp();

	$(window).resize(function(e) {
        IGRP_resizeDialogBtn();
    });
}

$(function(){IGRP_h_separator();});
