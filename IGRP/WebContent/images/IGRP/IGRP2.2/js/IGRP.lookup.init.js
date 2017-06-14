// JavaScript Document NOSi 2015
var vPageIndex = 0, vIframeWindow = null;

var setLookupOpener = function(pPage,pInput){
	$.data(document,'lookUpOpener',pPage);
	$.data(document,'lookUpInput',pInput);
}

var getLookupOpener = function(){
	vRtn = null;
	if($.data(document,'lookUpOpener') && $.data(document,'lookUpInput')){
		vRtn = {
			pOpener:$.data(document,'lookUpOpener'),
			pInput :$.data(document,'lookUpInput')
		}
	}
	return vRtn;
}
var setOpenerIndex = function(pIdx){
	vPageIndex = pIdx;
}

var getOpenerIndex = function(){
	return (vPageIndex >= 0)?vPageIndex:0
}

function showIframeContent(){
	$('.link-opener').addClass('active');
}
function hideIframeContent(){
	$('.link-opener').removeClass('active');
}

function setIframeContentLookup(pObj){
	var vHolder = pObj.holder ? pObj.holder : $('.link-opener');
	var vOframe = pObj.iframe ? pObj.iframe : $('.link-opener #opener-frame');

	if(pObj.pUrl){
		try{
			var vNframe = vOframe.clone();
			vNframe.attr('src',pObj.pUrl);

			vNframe.bind('load',function(e){
				var vContents = vNframe.contents();
				if(pObj.pBeforeReady){
					pObj.pBeforeReady(vContents);
				}

				if(pObj.pCallback){ //expects a callback
					vContents.ready(function(){ //wait till page is ready
						if(vContents.find('body')[0]){ //hack - page is ready now!
							var vIframeWindow = (vNframe[0].contentWindow);
							pObj.pCallback(vIframeWindow);//do it (iframe content,page that called this func)
						}
					})
				}
					
			});

			vOframe.replaceWith(vNframe);
		}catch(err){
			console.log(err);
		}
	}
}


function setIframeContent(pUrl,pCallback){
	var vOFrame = $('.link-opener #opener-frame');
	if(pUrl){
		var vNframe = vOFrame.clone();
			vNframe.attr('src',pUrl);
			vOFrame.replaceWith(vNframe);
			vNframe.bind('load',function(e){
				if(pCallback)
					pCallback(e);
			});
	}
}
var vFrameSetControl = false;
function setIframeUrl(pUrl){
	if(!vFrameSetControl){
		setIframeContent(pUrl,function(){
			setTimeout(function(){
					showIframeContent();
					//frameSetControl = true;
			},650)
		})
	}else{
		$('.link-opener').addClass('active');
	}
	
	return false;	
}

function pageShadow(pOp,pCallback){
	pOp?IGRP_blackBody({pType:true}):IGRP_blackBody({pType:false});
	if(pCallback)
		callback();
}

function IGRP_openerClose(){
	try{
		var vIframeW = getIframeWindow();
		if(vIframeW.getIframeWindow()){
			vIframeW.pageShadow(false);
			vIframeW.hideIframeContent();
			vIframeW.unsetIframeWindow();
		}else if(getIframeWindow()){
			pageShadow(false);
			hideIframeContent();
			unsetIframeWindow();
		}
	}catch(e){
		pageShadow(false);
		hideIframeContent();
		unsetIframeWindow();
	}
}


function eraseLookUp(lookup,cleanInpt){
    var holder      = lookup.parents('div.itemIcon'),//holder that supports the input
    	btn         = $('.IGRP_lookupPopup',holder),
    	clean       = cleanInpt && cleanInpt == true ? true : false,
     	btnParams   = btn.attr("fw_href")?btn.attr("fw_href").split('?'):btn.attr("href").split('?');
   
    if(btnParams[1]){
      	btnParams[1].split('&').forEach(function(p){
	        var paramName  = p.split('=')[0]?p.split('=')[0]:null;
	        var paramField = p.split('=')[1]?p.split('=')[1]:null;
	        
	        if(paramName != null && paramField != null && (paramName.substring(0,6) == "p_fwl_" || paramName.substring(0,5) == "p_cx_")){
				$('[name="'+paramField+'"]').not(lookup).val('');
				if(clean) lookup.val('');
				lookup[0].select();
	        }
      	});
    }
}

function IGRP_h_lookUpConfig(){
	$.each($('a.IGRP_lookupPopup'),function(){
	    var lookup 		= $(this).parent().find('[type*="LOOKUP"]');
	    var searcher 	= $(this);
	    var eraser   	= $('<span class="lookup-eraser" title="Reestablecer Campos"></span>');
	    searcher.after(eraser);
	    
	    eraser.click(function(){
	    	eraseLookUp(lookup,true);
	    }); 
	});

	$('form').on('click','input[type*="LOOKUP"]',function(){ //click on input to slide iframe
		//$(this).parent().find('.IGRP_lookupPopup').click();
		return false;
	});
	
	$('.opener-close').on('click',function(){ //close iframe window and parent iframe window
		IGRP_openerClose();
	});
	
	$('#formular_default').on('click','.IGRP_lookupPopup',function(e){
		e.preventDefault();
		if(!$(this).hasClass('loading')){
			try{
				var vInput		= $(this).parent().find('input[type*="LOOKUP"]');
				var vName		= vInput.attr('name');
				var vPageDoc 	= window; //lookup opener
				var vFirstRun 	= true; 
				var vCtxParam 	= $('.IGRP_lookupPopup[ctx_param="'+vName+'"]').attr("ctx_param");
				
				try{
					var vPageUrl = getLookupUrl({pUrl:$(this).attr('href'),pCtxParam:vCtxParam,pThis:$(this)});
				}catch(getErr){
					console.log(getErr);
				}

				
				
				setIframeContentLookup({
					pUrl:vPageUrl,
					pBeforeReady:function(){
						$('.link-opener #opener-frame').hide();
					},
					pCallback:function(iWindow){ //iWindow = iframe window
						setIframeWindow(iWindow);
						var vContent = $(iWindow.document);//iframe content (document)
						
						if(iWindow.setLookupOpener){
							pageShadow(true);
							vInput.blur();
							iWindow.setLookupOpener(vPageDoc,vInput);
							
							iWindow.setOpenerIndex(vPageIndex+1);

							var vFirstInput = $(vContent.find('input:not([type="hidden"]):not([disabled]):not([readonly]):not([class*="LOOKUP"])')[0]);
							vFirstInput.focus();

							$('.link-opener').addClass('active');	//show page
							
							setTimeout(function(){
								$('.link-opener #opener-frame').show();
							},500);
						}else{
							IGRP_h_popupCtx({pUrl:vPageUrl,pWin:'Lookup'});
						}
					}	
				});
			}catch(error){
				console.log(error);
			}
		}
		return false;
	});
}

function getLookupUrl(pObj){
  
	try{
		var vParent = pObj.pThis.parents('td:first').prop('tagName');
		var vParentId = pObj.pThis.parents('tr:first').index();
	}catch(e){null;}
	
	var vNewLink = pObj.pUrl;
	
	var v_fwl_search_copy = IGRP_getParam(vNewLink, "p_fwl_search_copy");
	
	if(v_fwl_search_copy=="" || v_fwl_search_copy==null){
		v_fwl_search_copy = pObj.pCtxParam;
	}
	vNewLink 	= vNewLink;
	var vObj 	= (vParent == "TD")?$("input[name='"+v_fwl_search_copy+"']",pObj.pThis.parents('tr:first')):$("input[name='"+v_fwl_search_copy+"']");
	var vParam 	= IGRP_sanitize(vObj.val());	
	vNewLink 	= (vParam != undefined)?IGRP_getUrl(vNewLink)+"p_fwl_search="+vParam:vNewLink;
	var vNparam = "";
	try{
		vNparam = IGRP_getParam(vNewLink, "p_fwl_copy_id");
		vNparam = (vNparam!=null && vNparam!="XXX")?"p_id="+$("*[name='"+vNparam+"']").val():"";
		
		if(vNewLink.indexOf("p_fwl_copy")){
			var vNLink 	= vNewLink.substring(vNewLink.indexOf("?")+1),
				vObj 	= vNLink.split("&");
			for (var i = 0; i < vObj.length; i++){
				var vNobj = vObj[i].split('=');
				if(vNobj[0].toLowerCase() == 'p_fwl_copy'){
					vNobj = IGRP_getParam(vNewLink, vNobj[1]);
					if(vNobj != null && vNobj != 'XXX'){
						vNobj 	= vNobj+'='+$("*[name='"+vNobj+"']").val();
						vNparam = (vNparam != '')?vNparam+'&'+vNobj:vNobj;
					}
				}
			}
		}
	}
	catch(e) {console.log('LOOKUP get param report error: '+e);null;}
	vNewLink = (vNparam != "")?IGRP_getUrl(vNewLink)+vNparam:vNewLink;
	
	try{
		vNewLink = (vParent == "TD")?IGRP_getUrl(vNewLink)+"p_fwl_form_idx="+vParentId:vNewLink;
	}catch(e){null;}

	return vNewLink;	
}

function setIframeWindow(pW){
	vIframeWindow = pW?pW:vIframeWindow;
}

function unsetIframeWindow(){
	vIframeWindow = null;
}

function getIframeWindow(){
	return vIframeWindow?vIframeWindow:null;
}


$(function(){IGRP_h_lookUpConfig();});