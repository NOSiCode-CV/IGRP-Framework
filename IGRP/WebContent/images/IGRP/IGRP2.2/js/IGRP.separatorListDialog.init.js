// JavaScript Document Separator List and Dialog
(function($){
	$.fn.IGRP_sepListDialog = function(options){
		var defaults = {
			onInit				: null,
			afterInit			: null,
			beforeInit 			: null,
			onAdd 				: null,
			afterAdd 			: null,
			afterAddClose		: null,
			beforeAdd 			: null,
			classBtnAdd 		: "IGRP_addRow",
			onEdit 				: null,
			afterEdit 			: null,
			beforeEdit  		: null,
			classBtnEdit 		: "IGRP_editRow",
			imgEdit 			: path_tmpl+"/img/icon/tools-bar/edit.png",
			onDelete 			: null,
			afterDelete 		: null,
			beforeDelete 		: null,
			classBtnDelete		: "IGRP_delRow",
			imgDelete 			: path_tmpl+"/img/icon/tools-bar/delete.png",
			classBtnConfirm 	: "IGRP_row_confirm",
			classBtnConfClose 	: "IGRP_row_confirmClose",
			classBtnClose 		: "IGRP_btn_close",
			onCloseDialog 		: null,
			beforeCloseDialog 	: null,
			afterCloseDialog 	: null,
			onActiveDialog 		: null,
			beforeActiveDialog 	: null,
			afterActiveDialog 	: null
		};

		var settings		= $.extend( {}, defaults, options),
			_this 			= this,
			vSLD 			= $(this),
			vRel 			= vSLD.attr('sep-name'),
			vParent 		= vSLD.parents('div.box-collapser:first'),
			vRowId 			= '', 
			vIdTr 			= -1, 
			vDialogActive 	= null, 
			vDialogBox 		= '', 
			vRelBox 		= 0, 
			vRowDiag 		= null, 
			vGFile 			= null,
			vAddDialog      = settings.classBtnAdd+"_diag",
			vEditDialog 	= settings.classBtnEdit+"_diag",
			arrAddFild 		= Array(), 
			arrAddFildVal 	= Array();

		_this.destroy = function() {
           _this;
        }

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
				var vObjParent = $(pObj.pObjt).parents('div.igrp_item.file');
				vVal = pObj.pObjt.clone(true);		
				pObj.pObjt.attr("name",pObj.pName+"_fk").removeAttr("rel id").removeClass("important uploadFile").attr("value",vVal1).hide();
				vVal.insertBefore(pObj.pObjt); 
				vGFile = pObj.pObjt;
			}

			vVal = pObj.pHasFile?'':vVal;
			vTd = pObj.pIndex == 0?'<td data-title="'+pObj.pLabel+'" data-row="'+pObj.pTrcount+'">'+
					vVal1+'<span class="showResponsiveTable ctxmenu"/>'+vVal+vVal2+'</td>':
				  '<td data-title="'+pObj.pLabel+'" data-row="'+pObj.pTrcount+'">'+vVal1+vVal+vVal2+'</td>';

			/*Campos escondidos não devem aparecer em separador lista*/
			arrAddFild 		= Array();
			arrAddFildVal 	= Array();

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

		function IGRP_resetIdEditTr(p){
			vIdTr = p.pTrId;
			IGRP_setHtmlBtn({pTr:vIdTr,pRel:p.pRel});
			try{
				if($("input[name='p_fwl_"+p.pRel+"idtr']")[0])
					$("input[name='p_fwl_"+p.pRel+"idtr']").val(vIdTr);
			}catch(e){null;}
		}

		function IGRP_AddPosRow(pObj){
			var vTableBody  = $("table[rel='T_"+pObj.pRel+"'] > tbody");

			vIdTr = Row_tr(pObj.pRel);
			if(vIdTr > 0){
				var vNextRow = $("> tr[row='"+vIdTr+"']",vTableBody).nextAll('tr[row]:first'); 
				$("> tr[row='"+vIdTr+"']",vTableBody).remove();
				vNextRow[0]?vNextRow.before(pObj.pTr):vTableBody.append(pObj.pTr);
			}
			else
				vTableBody.append(pObj.pTr);
			
			IGRP_resetIdEditTr({pTrId:-1,pRel:pObj.pRel});

			return {pTr:pObj.pTr,pIdtr:pObj.pRowId};
		}

		function IGRP_divObj(pRel){
			return $("div[sep-name='group-"+pRel+"']");
		}

		function IGRP_resetForm(pObj){
			$("*[rel='F_"+pObj.pRel+"']").each(function() {
				var vType = $(this).attr('type');
				//!$(this).attr('disabled') && !$(this).attr('readonly') && 
				if(vType != 'hidden'){
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

		function IGRP_MaxRow(pRel){
			var vTableRow   = $("table[rel='T_"+pRel+"'] > tbody > tr[row]"),
				vRow 		= 0;
			if(vTableRow[0]){
				vTableRow.each(function(){
					var thisRow = $(this).attr('row')*1;
					if(thisRow > vRow)
						vRow = thisRow;
				});
			}
			return vRow+1;
		}

		function IGRP_AddRow(pObj){
			//console.log(pObj)
			var vData = '', vDataHidden = '', vTd = '',vHas = false, vRtr = '',
				vHasFile = false, vObj = '', vType = '', vLink = false,
				vValLink = '', vVal = '', vVal1 = '', vName = '', vLabel = '', vTr = '', vCalss = ''
				vTitem = 0, vNotVal = false, vCval = 0, vDiv = IGRP_divObj(pObj.pRel), vThisParent = '',
				vTrcount = IGRP_MaxRow(pObj.pRel);

			vTrcount = (vTrcount > 0 && Row_tr(pObj.pRel) < 0)?vTrcount:Row_tr(pObj.pRel);

			vTr = $('<tr row="'+vTrcount+'">');
			$("*[rel='F_"+pObj.pRel+"']").each(function(index, element){
				vVal 		= '';
				vName 		= $(this).attr("name");
				vThisParent	= $(this).parents("div.igrp_item:first");
				$("label span.error",vThisParent).remove();
				vLabel 	= $("label",vThisParent).text().replace(/\*/g, "");
				if($.inArray(vName,arrAddFild) == -1){
					vTitem 		+= 1;

					if(!$(this).hasClass("ignore") && !$(this).hasClass("error"))
						vVal = $(this).val();

					if(vVal != null && vVal != '')
						vHas = true;
					else{
						if($(this).hasClass("important") && !$(this).hasClass("ignore")){
							$(this).focus();
							vHas=false;
							$("label",vThisParent).html('<span class="riquired">*</span> '+vLabel.replace(/\*/g, "")+'<span class="error">'+JSMSG_VALIDATE_FILD_REQUIRED+'</span>');
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
						if (!vThisParent.hasClass('checkboxlist') && !vThisParent.hasClass('radiolist')){
							try{
								vLabel = $(this).parent().text();
								if($(this).attr('checked') == 'checked' && !$(this).hasClass("ignore")){
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
						}else{
							try{
								var vAux = "",vValAux = "", vIdx = 0;
								$('input[name="'+vName+'"]:checked',vThisParent).each(function(ix,ex){
									var exVal = $(ex).val();
									if($.inArray(exVal,arrAddFildVal) == -1){
										vIdx += 1;
										if(vIdx > 1){
											vAux+="; ";
											vValAux+=",";
										}

										vAux+= $(this).parent().text();
										vValAux+=exVal;
										vHas 	= true;

										vVal 	= vAux;
										vVal1 	= vValAux;
										arrAddFildVal.push(exVal);
									}
								});
								
								if(vIdx == 0){
									if($(this).hasClass("important")){
										$("label",vThisParent).html('<span class="riquired">*</span> '+vLabel.replace(/\*/g, "")+'<span class="error">'+JSMSG_VALIDATE_FILD_REQUIRED+'</span>');
										vHas = false;
										return false;
									}
									vVal = '';
									vVal1 = '';
									vCval +=1;
								}
							}catch(e){null;}
						}
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

					if($(this).hasClass('color') && !$(this).hasClass("ignore")){
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

					if($(this).hasClass('textEditor')){
						vLink = true;
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
					arrAddFild.push(vName);
				}
			});

			if(!vHas){
				arrAddFild 	= Array();
				vTitem 		= 0;
				vCval 		= 0;
			}
		
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

			if(!Row_noEdit(pObj.pRel))
				vData += '<img title="'+JSMSG_EDIT+'" src="'+settings.imgEdit+'" class="'+settings.classBtnEdit+pObj.pType+'" rel="'+pObj.pRel+'" name="btn_'+pObj.pRel+'_edit"/>';

			if(!Row_noDelete(pObj.pRel)){
				vData += vDataHidden+""+FIELD({pType:'hidden',pName:'p_'+pObj.pRel+'_id',pValue:vRowId})+
				'<img title="'+JSMSG_DELETE+'" src="'+settings.imgDelete+'" class="'+settings.classBtnDelete+'" rel="'+pObj.pRel+'" name="btn_'+pObj.pRel+'_del"/>';
			}
			vData += "</td>";

			if(vHas){
				vTr.append(vData);
				vTitem 	= 0;
				vCval 	= 0;
				arrAddFild = Array();
				if(vGFile!=null){
					vTr.append(vGFile);
					vGFile 	= null;
				}
				if(vWidth <= vResTable){
					$("td","table[rel='T_"+pObj.pRel+"']").removeClass("active");
					$("td",vTr).each(function(){$(this).addClass("active");});
				}
				vRtr = IGRP_AddPosRow({pRel:pObj.pRel,pTr:vTr,pRowId:vTrcount});
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
			return vRtr;
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

			$("*[rel='F_"+pObj.pRel+"']").each(function(){
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
					else if($(this).attr('type') == 'radio' || $(this).attr('type') == 'checkbox'){
						var vArray = vVal.split(',');
						for(var i = 0; i < vArray.length; i++){
							if(vArray[i] == $(this).val())
								$(this).attr("checked","checked").prop("checked",true);
						}
					}else if($(this).hasClass('textEditor')){
						var id = $(this).attr('id');
						CKEDITOR.instances[id].destroy();
						$(this).val(vVal);
						$('#'+id).ckeditor();
					}else
						$(this).val(vVal);

				}catch(e){null;}

				try{
					if($(this).hasClass('IGRP_change')){
						isChange = true;
						objChange = $(this);					
					}
				}catch(e){null;}
			});
			
			$("table[rel='T_"+pObj.pRel+"'] > tbody tr").removeClass("active");
			pObj.pObjt.addClass('active');

			if(isChange){
				objChange.change();
			}
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

		function IGRP_addRowDiag(p){
			$("body").addClass("noscroll");
			IGRP_dialogBox({pRel:p.pRel,pOption:1});
			IGRP_controlDialogBox({pRel:p.pRel,pOption:1});
		}

		function IGRP_h_controlDialogBox(){
			try{
				vDialogBox 	= $("input[name='p_fwl_dialogbox']").val();
				vRelBox 	= $("input[name='p_fwl_relbox']").val();
				if(vRelBox!='' && vRelBox!=null && vDialogBox == 1){
					IGRP_dialogBox({pRel:vRelBox,pOption:vDialogBox});
				}
			}catch(e){null;}
		}

		function IGRP_editRowDiag(pObj){
			$("body").addClass("noscroll");
			IGRP_controlDialogBox({pRel:pObj.pRel,pOption:1});
			IGRP_EditRow({pRel:pObj.pRel,pObjt:pObj.pRow,pTrId:pObj.pTrId});
			IGRP_dialogBox({pRel:pObj.pRel,pOption:1});
		}

		function IGRP_h_btnClose(p){
			$("table[rel='T_"+p.pRel+"'] tr, table[rel='T_"+p.pRel+"'] tr td").removeClass('active');
			vIdTr = -1;	vRowId = '';
			IGRP_setHtmlBtn({pTr:vIdTr,pRel:p.pRel});

			if($("input[name='p_fwl_"+p.pRel+"idtr']")[0])
				$("input[name='p_fwl_"+p.pRel+"idtr']").val(-1);

			if($("input[name='p_fwl_"+p.pRel+"']")[0])
				$("input[name='p_fwl_"+p.pRel+"']").val("");

			$("body").removeClass("noscroll");
			IGRP_dialogBox({pRel:p.pRel,pOption:0});
			IGRP_controlDialogBox({pRel:p.pRel,pOption:0});
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
						(IGRP_EditRow({pRel:vRel,pObjt:vObj,pTrId:vObj.attr('row')*1}),
						$('html, body').animate({scrollTop:(IGRP_divObj(vRel).offset().top)-vTop},500));
					}else
						IGRP_DelRow({pRel:vRel,pObjt:vObj});

					vCtxObj.removeClass("active");
					return false;
				});
			});

			$("body").on("click",function(e){
				!$(e.target).hasClass("ctxmenu")?$(".ctxSepListDialog").removeClass("active"):'';
			});
		}

		function IGRP_resizeDialogBtn(){
			if(vDialogActive){
				if($('.D_'+vDialogActive).css('display') == 'block'){
					IGRP_dialogboxPosition(vDialogActive);
				}
			}
		}

		function IGRP_DelRow(pObj){ 
			var vVal = ROW_id(pObj.pRel,pObj.pObjt);
			
			if(vVal != null && vVal != "")
				$("form").append(FIELD({pType:'hidden',pName:'p_'+pObj.pRel+"_del",pValue:vVal}));
			/*else
				IGRP_message({pObjt:$("table[rel='T_"+pObj.pRel+"']").parents(".box-table:first"),pType:"warning",
					pMessage:JSMSG_WARNING_DELETE_ITEM_TABLE,pPos:"before"});*/
				
			$(pObj.pObjt,"table[rel='T_"+pObj.pRel+"']").remove();
			IGRP_resetIdEditTr({pTrId:-1,pRel:pObj.pRel});
		}

		function IGRP_getTr(p){
			return $("table[rel='T_"+p.pRel+"'] > tbody tr:eq("+p.pTrId+")");
		}

		IGRP_h_controlDialogBox();

		function btnAction(p){
			$('form').on("click",p.pClass,function(){
				p.pFunction($(this));
			});
		};
		
		var onAdd = function(p){
			var vTr = null;
			vRel = p.attr("rel");
			if(settings.beforeAdd)
				settings.beforeAdd(p,vRel);

			if (settings.onAdd)
				settings.onAdd(p,vRel,IGRP_AddRow);
			else{
				var vOption = {pRel:vRel,pType:''};
				if(!p.hasClass(settings.classBtnAdd)){
					var vDialog = p.hasClass(settings.classBtnConfirm)?1:0;
					vOption = {pRel:vRel,pType:'_diag',pBox:vDialog};
				}
				vTr = IGRP_AddRow(vOption);
			}
			
			if(settings.afterAdd){
				var addClose = p.hasClass(settings.classBtnConfClose)?1:0;
				if(vTr){
					settings.afterAdd(p,vRel,$(vTr.pTr),vTr.pIdtr);

					if(addClose)
						settings.afterAddClose(p,vRel,$(vTr.pTr),vTr.pIdtr);
				}
				else{
					settings.afterAdd(p,vRel);
					if(addClose)
						settings.afterAddClose(p,vRel);
				}
			}
		};


		var onEdit = function(p){
			var vRow  = p.parents("tr:first"),
				vTrId = vRow.attr('row')*1;
				//vTrId = vRow.index()*1;
			vRel = p.attr("rel");

			if(settings.beforeEdit)
				settings.beforeEdit(p,vRel,vRow,vTrId);

			if(settings.onEdit)
				settings.onEdit(p,vRel,vRow,vTrId,IGRP_EditRow);
			else{
				if(p.hasClass(settings.classBtnEdit))
					IGRP_EditRow({pRel:vRel,pObjt:vRow,pTrId:vTrId});
				else
					IGRP_editRowDiag({pRel:vRel,pRow:vRow,pTrId:vTrId});
			}

			if(settings.afterEdit)
				settings.afterEdit(p,vRel,vRow,vTrId);
		};

		var onDelete = function(p){
			var vRow = p.parents("tr:first");
				vRel = p.attr("rel");

			if(settings.beforeDelete)
				settings.beforeDelete(p,vRel,vRow);

			if (settings.onDelete)
				settings.onDelete(p,vRel,vRow,IGRP_DelRow);
			else
				IGRP_DelRow({pRel:vRel,pObjt:vRow});

			if(settings.afterDelete)
				settings.afterDelete(p,vRel,vRow);
		};

		var onActiveDialog = function(p){
			vRel = p.attr("rel");

			if(settings.beforeActiveDialog)
				settings.beforeActiveDialog(p,vRel,IGRP_resetForm);
			else
				(!Row_noClear(vRel))?IGRP_resetForm({pRel:vRel,pDiv:IGRP_divObj(vRel)}):'';

			if(settings.onActiveDialog)
				settings.onActiveDialog(p,vRel,IGRP_addRowDiag);
			else
				IGRP_addRowDiag({pRel:vRel});

			if(settings.afterActiveDialog)
				settings.afterActiveDialog(p,vRel);
		};

		var onCloseDialog = function(p){
			vRel 		= p.attr("rel");
			//var vRow 	= IGRP_getTr({pRel:vRel,pTrId:vTrId});

			if(settings.beforeCloseDialog)
				settings.beforeCloseDialog(p,vRel,IGRP_resetForm);
			else
				!Row_noClear(vRel)?IGRP_resetForm({pRel:vRel,pDiv:IGRP_divObj(vRel)}):'';

			if (settings.onCloseDialog)
				settings.onCloseDialog(p,vRel,IGRP_h_btnClose);
			else
				IGRP_h_btnClose({pRel:vRel});

			if(settings.afterCloseDialog)
				settings.afterCloseDialog(p,vRel);
		};

		this.each(function(i,e){
			var rel = $(e).attr('sep-name').substring(6);
			var onInit 	= function(){
				if(Row_noDelete(rel))
					$('ul#data-'+rel+' li.IGRP_delRow').addClass('hideItem');

				if(Row_noEdit(rel))
					$('ul#data-'+rel+' li.IGRP_editRow').addClass('hideItem');

				if(settings.beforeInit)
					settings.beforeInit($(e),vRel,vParent);

				if(settings.onInit)
					settings.onInit($(e));
				else{
					vRel 	= rel;
					vParent = $(e).parents('div.box-collapser:first');
				}

				if(settings.afterInit)
					settings.afterInit($(e));
			};

			onInit();
		});
		
		btnAction({pFunction:onAdd,pClass:"."+settings.classBtnAdd});
		btnAction({pFunction:onAdd,pClass:"."+settings.classBtnConfirm});
		btnAction({pFunction:onAdd,pClass:"."+settings.classBtnConfClose});
		btnAction({pFunction:onActiveDialog,pClass:"."+vAddDialog});
		btnAction({pFunction:onEdit,pClass:"."+vEditDialog});
		btnAction({pFunction:onEdit,pClass:"."+settings.classBtnEdit});
		btnAction({pFunction:onDelete,pClass:"."+settings.classBtnDelete});
		btnAction({pFunction:onCloseDialog,pClass:"."+settings.classBtnClose});
	
		IGRP_h_ResetError();
		IGRP_h_ctxMenuResp();
		$(window).resize(function(e) {
        	IGRP_resizeDialogBtn();
    	});

		return _this;
	};
})(jQuery);

function IGRP_h_separator(){
	/*IGRP_h_addRow();
	IGRP_h_delRow();
	IGRP_h_editRow();
	*/
	if(!$('body').hasClass('liveSepList'))
		$('div[sep-name*="group-"]').IGRP_sepListDialog();
}

$(function(){IGRP_h_separator();});
