// JavaScript Document NOSi 2014
var vObjForm = null, vFormValidator = null, vErrorForm = 0, 
	vDcument = null, vLastScrollTop = 0, vToolBar = 0, vArrayIdTreeMenu = [],
	vScriptHash = 'sha1', vHashMac = 'password';

String.prototype.capitalizeFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}
function IGRP_h_topMenu(){
	$("body").on("click",".IGRP_overlay.menu, .slideMenu ul.menu li ul.submenu li",function(e) {
		if(!$(e.target).hasClass("star")){
			$("#igrp-bodyPage").removeClass("open");
			IGRP_blackBody({pType:false});
			$(".IGRP_overlay").removeClass("menu");
		}
    });
	$("#iconMenu").on("click",function(){
		$(".IGRP_overlay").addClass("menu");
		IGRP_blackBody({pType:true});
		$("#igrp-bodyPage").addClass("open");
	});
}


function IGRP_h_slideMenu(){
	$("ul.menu li").click(function(e) {
		if($(this).children("div.liMenu").hasClass("active")){
			$(this).children("ul.submenu, div.liMenu").removeClass("active");
		}else{
			$("ul.menu li ul.submenu, ul.menu li div.liMenu").removeClass("active");
			$(this).children("ul.submenu, div.liMenu").addClass("active");
		}
    });

	$("body").on("click","ul.process_menu li",function(){
		var vObg = $(this).children("ul"), vObgPar = $(this).parents("div.col:first");
		if(vObg.hasClass("active")){
			$(this).removeClass("active");
			vObg.removeClass("active");
		}
		else{
			$("ul.process_menu li ul",vObgPar).removeClass("active");
			$("ul.process_menu li",vObgPar).removeClass("active");
			$(this).addClass("active");
			vObg.addClass("active");
		}
	});
}

function IGRP_treeMenuActiveItem(pObj){
    pObj.parent("li.listGetter:first").children("a[type='node']").toggleClass("active");
    pObj.parent("li.listGetter:first").children("ul.subListTree:first").toggleClass("active");
 }

function IGRP_h_treeMenu(){
	$("body").on("click",".listGetter a[type='node']",function(e) {
	    if(!$(e.target).hasClass("btn")){
	      IGRP_set_OR_RemoveItemArray({pArray:vArrayIdTreeMenu,pItem:$(this).attr('id')});
	      IGRP_treeMenuActiveItem($(this));
	    }
  	});
}

function IGRP_treeMenuActiveAllItem(){
	vArrayIdTreeMenu.forEach(function(e,i){
		IGRP_treeMenuActiveItem($("a#"+e));
	});
}

function IGRP_h_collapser(){
	$(".bodyPageRigth").on("click",".titlecollapser",function(e) {
		if(!$(this).parents('div:first').hasClass('IGRP_dialogboxTop')){
			if($(this).parents(".box-content:first").hasClass("collapsed"))
				$(this).parents(".box-content:first").removeClass("collapsed");
			else
				$(this).parents(".box-content:first").addClass("collapsed");
			//$(this).parents(".box-content").toggleClass("collapsed");
		}
    });

	$("div[mobile='true'] .icon").click(function(e) {
        $(this).next("ul:first").toggleClass("active");
    });
}

function IGRP_h_tabMenu(){
	try{
		var vObjTab = $("input[name='p_fwl_tab_page']"),
			vTab 	= (vObjTab[0] && vObjTab.val() != '' && vObjTab.val() != null)?vObjTab.val():'0';
		
		$(".groupItemTab, #tabs li, .tab span").removeClass("active");
		$("#tab"+vTab+", #tabs li[rel='tab"+vTab+"'], .tab span[rel='tab"+vTab+"']").addClass("active");
		$(".lateralMenu ul.process_menu li[groupmenu-name='group"+vTab+"'], .lateralMenu ul.process_menu li[groupmenu-name='group"+vTab+"'] > ul").addClass("active");
		$(".lateralMenu ul.process_menu li > a").removeClass("addcc");
		$(".lateralMenu ul.process_menu li[groupmenu-name='group"+vTab+"'] > a").addClass("addcc");
	}catch(e){null;}

	$("body").on("click","#tabs li, .tabMenuGroups li, .tab span",function(){
		try{
			var parent = $(this).parents('.tabMenuHolder');
		}catch(e){null;}
		var vTab = $(this).attr("rel").substring(($(this).attr("rel").length - 1),$(this).attr("rel").length);
		
		if (parent[0]) {
			$(".groupItemTab, #tabs li, .tabMenuGroups li, .tab span",parent).removeClass("active");
			$("#tab"+vTab+", #tabs li[rel='tab"+vTab+"'], .tabMenuGroups li[rel='tab"+vTab+"'], .tab span[rel='tab"+vTab+"']",parent).addClass("active");
		}
		else{
			$(".groupItemTab, #tabs li, .tab span").removeClass("active");
			$("#tab"+vTab+", #tabs li[rel='tab"+vTab+"'], .tab span[rel='tab"+vTab+"']").addClass("active");
		}
	});
}

function IGRP_h_simpleMenu(){
	try{
		var vPosTab 	= $("input[name='p_fwl_tab_menu']").val(),
			vObjSimp 	= $("input[name='p_fwl_simple_menu']"),
		 	vSimple 	= (vObjSimp[0] && vObjSimp.val() != '' && vObjSimp.val() != null)?vObjSimp.val():'',
			vPosSimple	= (vSimple != '')?vSimple:vPosTab;

		vPosSimple 	= (vPosSimple != '' && vPosSimple != null)?vPosSimple:'0';
		vPosTab 	= (vPosTab != '' && vPosTab != null)?vPosTab:'00';

		$("#simpleMenu ul.itemMenu li a, .itemTab ul.itemMenu li a").removeClass('active');
		$("#simpleMenu ul.itemMenu li a[pos='"+vPosSimple+"'], .itemTab ul.itemMenu li a[pos='"+vPosTab+"']").addClass('active');
		$('.lateralMenu ul.process_menu li ul li[itemmenu-name="item'+vPosTab+'"], .lateralMenu ul.process_menu li ul li[itemmenu-name="item'+vPosTab+'"] a').addClass("active");
	}catch(e){null;}
}


function FIELD(pObj){
	return  '<input type="'+pObj.pType+'" name="'+pObj.pName+'" id="'+pObj.pName+'" value="'+pObj.pValue+'"/>';
}

function IGRP_creatField_OR_SetVal(pObj){
	var vObj = $("input[name='"+pObj.pName+"']");
	!vObj[0]?vObjForm.append(FIELD({pType:pObj.pType,pName:pObj.pName,pValue:pObj.pValue})):vObj.val(pObj.pValue);
}

function IGRP_getUrl(pUrl){
	return (pUrl.indexOf("?")==-1)?pUrl+="?":pUrl+="&";
}

function IGRP_getUrlForm(pUrl){
	var param = vObjForm.not(".notForm").serialize();
	return IGRP_getUrl(pUrl)+param;
}

function IGRP_getParam(pLink, pName){
	var vNewLink = pLink.substring(pLink.indexOf("?")+1);
	var vOp = vNewLink.split("&");
	for(var i= 0; i < vOp.length; i++){
		var vNop = vOp[i].split("=");
		if(vNop[0].toLowerCase()==pName.toLowerCase()){
			return vNop[1];
		}
	}
	return null;
}

function IGRP_htmlEncode(pVal){
	return pVal?jQuery('<div />').text(pVal).html():"";
}

function IGRP_htmlDecode(pVal){
	return pVal?jQuery('<div />').html(pVal).text():"";
}

function IGRP_sanitize(pOp){
	var vTexto = pOp;
	try{
		vTexto = vTexto.replace('\'','&#92;');
		return(vTexto);
	}catch(e){return vTexto;}
}

function IGRP_set_OR_RemoveItemArray(pObj){
	($.inArray(pObj.pItem,pObj.pArray) != -1)?pObj.pArray.splice(pObj.pArray.indexOf(pObj.pItem), 1):pObj.pArray.push(pObj.pItem);
}

function IGRP_openWin(pObj){
    //Função para abrir janela em CenterScreen
    var width = pObj.pWidth;
    var height = pObj.pHeight;
    var left = parseInt((screen.availWidth/2) - (width/2));
    var top = parseInt((screen.availHeight/2) - (height/2));
    var windowFeatures = "scrollbars, width=" + width + ",height=" + height +
        ",status,resizable,left=" + left + ",top=" + top +
        ",screenX=" + left + ",screenY=" + top;
  	window.open(pObj.pUrl, pObj.pWin, windowFeatures);
	return false;
}

function IGRP_h_popupCtx(pObj){
	IGRP_openWin({pUrl:pObj.pUrl,pWidth:980,pHeight:520,pWin:pObj.pWin});
	return false;
}

function IGRP_returnTime(){
	return new Date().getTime();
}

function IGRP_blackBody(pObj){
	pObj.pType?($(".IGRP_overlay").addClass('active'),$("body").addClass("noscroll")):
	($(".IGRP_overlay").removeClass('active'),$("body").removeClass("noscroll"));
}

function IGRP_h_textarea(){
	$('textarea').blur(function(){
		($(this).val().length > ($(this).attr("maxlength")*1))?$(this).val($(this).val().substring(0,($(this).attr("maxlength")*1))):
		$(this).val($(this).val());
	});

	$('input[type="number"]').each(function(){$(this).attr('min',0);});
}

function IGRP_submit(){
	var vUrl = arguments[0], vForm = $("#formular_default"), vHref = "", vNewUrl = "";
	//Para form opener
	if(arguments[1] && arguments[1] != null)
		vForm=arguments[1];

	vHref 	= vUrl.substring(0,vUrl.indexOf("#"))?vUrl.substring(0,vUrl.indexOf("#")):vUrl;
	vNewUrl = vHref.substring(0,vHref.indexOf("?"))?vHref.substring(0,vHref.indexOf("?")):vHref;

	if(vHref.indexOf("?")>-1)
	{
		var vParam = vHref.substring(vHref.indexOf("?")+1);

		var vP = vParam.split("&");

		for(var i=0;i<vP.length;i++)
		{
			var vP1 = vP[i].split("=");
			if(vP1[0].toLowerCase()!="p_env_frm_url"){
				if(!vForm.find("input[name='"+vP1[0]+"']")[0])
					vForm.prepend(FIELD({pType:'hidden',pName:vP1[0],pValue:vP1[1]}));
			}
		}
	}
	else
		vUrl = vHref;

	//Comentado em 23-01-2012 problemas em RELOAD
	vUrl = vHref;
	if(arguments.length==3){
		var vIchange=arguments[2].replace("#id","");
		vUrl = IGRP_getUrl(vUrl);
		vUrl+="ichange="+vIchange+arguments[2];
		if(!vForm.find("input[name='ichange']")[0])
			vForm.prepend(FIELD({pType:'hidden',pName:"ichange",pValue:vIchange}));
	}

	return vUrl;
}

function IGRP_setErrorTab(_this){
	if(_this.parents('.workFlow-content')[0]){
		$('.workFlow .process-flow li').removeClass('active');
		$('.workFlow-tab li').removeClass('active');
		$('.workFlow-content').removeClass('active');

		$('.workFlow .process-flow li[rel="'+_this.parents('.workFlow-content').attr('id')+'"]').addClass('active');
		$('.workFlow-tab li[rel="'+_this.parents('.workFlow-content').attr('id')+'"]').addClass('active');
		_this.parents('.workFlow-content').addClass('active');
	}
}

$.validator.setDefaults({ignore: ":hidden:not(select[chosen='select'], div *), .ignore, .important"});
function IGRP_fildValidator(){
	vFormValidator = vObjForm.validate({
		errorPlacement: function(error, element) {
			$("label:first",$(element).parents("div.igrp_item:first")).addClass("error").append(error);
			if($(element).prop('tagName').toLowerCase() == 'select')
			 	$('#'+$(element).attr('name')+'_chosen').addClass("error");
		},
		success:function(label, element){
			$("label:first",$(element).parents("div.igrp_item:first")).removeClass("error");
			if($(element).prop('tagName').toLowerCase() == 'select')
				$('#'+$(element).attr('name')+'_chosen').removeClass("error");
		},
		errorElement: "span",
		invalidHandler: function(e, validator){
			vErrorForm		= validator.numberOfInvalids();
			var vElement 	= $(validator.errorList[0].element),
				vErrorFild 	= validator.errorMap[vElement.attr('name')];
			
			if(vElement.hasClass('textEditor') && vErrorForm){
				IGRP_message({pObjt:vElement.parents('div.box-content:first'),pType:"error",pMessage:vErrorFild,pPos:'prepend'});
			}

			if(vElement.parents("table")[0] && vErrorForm){
				var vRel = vElement.parents("table").attr("rel");
				IGRP_message({pObjt:$("table[rel='"+vRel+"']"),pType:"error",pMessage:vErrorFild,pPos:'before'});
			}
			vElement = vElement.prop('tagName').toLowerCase() == 'select'?$('#'+$(vElement).attr('name')+'_chosen'):vElement;
			try{
				vErrorForm?$(validator.errorList[0].element).prop('tagName').toLowerCase() == 'select'?
				$('html, body').animate({scrollTop:vElement.offset().top}, 500):vElement.focus():'';
			}catch(e){null;}
			
			IGRP_setErrorTab(vElement);
		}
	});
}

function IGRP_notFildValidator(pObj){
	$("*",pObj).each(function() {
		($(this).hasClass("required"))?$(this).addClass("ignore"):'';
	});
}

function IGRP_validate(pObj){
	var vValid = true;
	$("*.required",pObj).each(function() {
		if($(this).val() == '' || $(this).val() == null){
			vValid = false;
			$(this).addClass("error");
			($(this).prop('tagName').toLowerCase() == 'select')?$('#'+$(this).attr('name')+'_chosen').addClass("error"):'';
			IGRP_setErrorTab($(this));
		}else
			vValid = $(this).hasClass("error")?false:vValid;
		//vValid = ($(this).val() == '' || $(this).val() == null)?false:($(this).hasClass("error")?false:vValid);
	});
	return vValid;
}

function IGRP_pageLoading(pObj){
	if(pObj.pType){
		$("body").addClass("loading");
		IGRP_blackBody({pType:true});
	}else{
		IGRP_blackBody({pType:false});
		$("body").removeClass("loading");
	}
}

function IGRP_h_submit(pObj){
	var vImg = $("img",pObj.pThis), vSrc = vImg.attr("src");
	IGRP_pageLoading({pType:true});
	vImg.attr("src",path_tmpl+"/img/icon/tools-bar/loadingSubmit.gif")
	vObjForm.attr("action",IGRP_submit(pObj.pUrl)).submit();
	vErrorForm?(vImg.attr("src",vSrc),IGRP_pageLoading({pType:false})):'';
}

function IGRP_h_change(){
	var vUrl = $("input[name='p_env_frm_url']").val();
		vUrl = vUrl?vUrl:window.location.href;
	$("body").on("change",".IGRP_change",function(){
		IGRP_notFildValidator(vObjForm);
		;IGRP_pageLoading({pType:true})
		vObjForm.attr("action",IGRP_submit(vUrl,null,"#id"+$(this).attr("name"))).submit();
	});
}

function IGRP_ResetError(pObj){
	var vObjDiv = pObj.parents("div.igrp_item:first"), vVal = pObj.val(), vLabel = null, vTable = pObj.parents("table:first"),
	vName = pObj.prop('tagName').toLowerCase(), vCont = pObj.nextAll("div.chosen-container:first");
	$("label span.error",vObjDiv).remove();
	vLabel = $("label",vObjDiv).text();
	if(vVal != '' && vVal != null){
		$("label span.error",vObjDiv).remove();
		pObj.removeClass("error");
		if(vTable[0]){
			if(vName == 'select')
				vCont.removeClass("error");
		}
	}else{
		pObj.addClass("error");
		if(vTable[0]){
			IGRP_message({pObjt:vTable,pType:"error",pMessage:JSMSG_ERROR_FILD_REQUIRED,pPos:'before'});
			if(vName == 'select')
				vCont.addClass("error");
		}
		else{
			$("label",vObjDiv).html(vLabel+'<span class="error">'+JSMSG_VALIDATE_FILD_REQUIRED+'</span>');
		}
	}
}

function IGRP_maxHeightElement(p){
	var vMax = 0;
	p.pObj.each(function(i, e) {
		var vHeight = $(this).height();
		if(vHeight > p.pVal)
        	vMax = (vHeight > vMax)?vHeight:vMax;
    });
    return vMax;
}

function IGRP_h_formatItemForm(){
	/*var container = document.querySelector('#IGRP_item_form');
	var msnry = new Masonry( container, {
		 // options
		//columnWidth: 200,
		itemSelector: ".item"
	});*/

	$("body").on("change",".uploadFile",function(){
		$("input[file='"+$(this).attr("id")+"']",$(this).parents("div:first")).click().val($(this).val());
	});
	//$('.jqte-test').jqte();

	$("body").on("click",".IGRP_notClose",function(){
		$(this).parents(".notification:first").remove();
	});

	$("body").on("click","input[type='checkbox']",function(){
		$(this).prop("checked", this.checked).attr("checked", this.checked);
	});

	var vVal = 22, 
	vMax = IGRP_maxHeightElement({pObj:$(".box-func .title"),pVal:vVal});
	if(vMax > vVal)
		$(".box-func .title").height(vMax);


	IGRP_h_textarea();
	IGRP_h_change();
	IGRP_fildValidator(vObjForm);
}

function IGRP_h_confirm(){
	try{
		$("#dialog-modal").dialog({
			autoOpen: false,
			buttons:[
				{
					text:JSMSG_YES,
					click: function() {
						$(this).data("param")?$(this).data("function")($(this).data("param")):$(this).data("function")();
						IGRP_blackBody({pType:false});
						$(this).dialog("close");
					}
				},
				{
					text:JSMSG_NO,
					click: function(){
						IGRP_blackBody({pType:false});
						$(this).dialog("close");
					}
				}
			]
		});
	}catch(e){null;}
}

function IGRP_confirm(pObj){
	IGRP_h_confirm();
	IGRP_blackBody({pType:true});
	$("#dialog-modal").data("function",pObj.pFunction).data('param',pObj.pParam);
	pObj.pTitle?$(".title","#dialog-modal").html(pObj.pTitle):'';
	pObj.pMessage?$(".message","#dialog-modal").html(pObj.pMessage):'';
	$("#dialog-modal").dialog("open");
}

function IGRP_confirmSubmit(pObj){
	IGRP_pageLoading({type:true});
	(pObj.pTarget == "confirm")?window.location.replace(pObj.pUrl):vObjForm.attr("action",IGRP_submit(pObj.pUrl)).submit();
}

function IGRP_submitPopup(pObj){
	IGRP_validate(vObjForm)?IGRP_h_popupCtx({pUrl:IGRP_getUrlForm(pObj.pUrl),pWin:"IGRP"}):vObjForm.attr("action",pObj.pUrl).submit();
}

function IGRP_hashjs(p){
	var vHash = '',pHash = p.pHash.toLowerCase(),
		vString = $('form').find('*').not('input[type="hidden"]').serialize();
	vString = (vString != '' && vString != null)?vString.toUpperCase():vString;

	var script = document.createElement('script');
	    $(script).attr('src','/images/IGRP/extentions/nosiSam/js/hash/'+pHash+'.js');
	    $("head").append(script);

	switch(pHash){
		case 'md5':
			vHash = CryptoJS.MD5(vString).toString();
		break;
		case 'sha256':
			vHash = CryptoJS.SHA256(vString).toString();
		break;
		case 'sha512':
			vHash = CryptoJS.SHA512(vString).toString();
		break;
		case 'sha3':
			vHash = CryptoJS.SHA3(vString).toString();
		break;
		case 'ripemd160':
			vHash = CryptoJS.RIPEMD160(vString).toString();
		break;
		case 'hmac-md5':
			vHash = CryptoJS.HmacMD5(vString,vHashMac).toString();
		break;
		case 'hmac-sha1':
			vHash = CryptoJS.HmacSHA1(vString,vHashMac).toString();
		break;
		case 'hmac-sha256':
			vHash = CryptoJS.HmacSHA256(vString,vHashMac).toString();
		break;
		case 'hmac-sha512':
			vHash = CryptoJS.HmacSHA512(vString,vHashMac).toString();
		break;
		default:
			vHash = CryptoJS.SHA1(vString).toString();
		break;
	}
	$(script).remove();
	return vHash!= ''?vHash.toUpperCase():vHash;
}

function IGRP_submitSam(pObj){
	try{
		if(IGRP_validate(vObjForm)){
			var vDiv = document.createElement('div');
			$(vDiv).addClass('ui-dialog dialog hideItem').attr('id','dialog-token').append('<div class="title token"/><div class="message token"/>');
			$('body').append(vDiv);
			$(".title","#dialog-token").html('Submit Token');
			
			Local_isTokenPresent({
	            pSelectOptionText:'Escolher Token',
	            pRel:'vkball',
	            pType:'vkb_all',
	            pInputName:'p_sam_password',
	            pTextOk:'OK',
	            pTextReset:'Limpar',
	            pTextCancel:'Cancelar'
	       	},$(".message","#dialog-token"));

			IGRP_blackBody({pType:true});
			$("#dialog-token").removeClass('hideItem');

			$(".VKB_geral","#dialog-token .message").IGRP_vkboard({
	        	vkbonload:true,
		        beforecancel:function(e,rel){
		            $("#INP_"+rel).val('');
		        },
		        oncancel:function(e,rel){
		        	$("#dialog-token").remove();
		            IGRP_blackBody({pType:false});
		        },
		        onok:function(e,rel){
		  			var vResultHash = IGRP_hashjs({pHash:vScriptHash}),
		  				vPin    	= $("#INP_"+rel).val(),
		                vToken  	= $('#terminal').val(),
		                vMessage 	= ($('#p_sam_message')[0])?$('#p_sam_message').val():vResultHash;

		            if(vPin != '' && vPin != null){
		            	IGRP_blackBody({pType:false});
						$("#dialog-token").remove();
		                Local_Login({
		                	pPin:vPin,
		                	pToken:vToken,
		                	pMessage:vMessage,
		                	pSubmit:true,
		                	pObj:pObj
		                });
		                IGRP_pageLoading({pType:true});
		                vObjForm.attr("action",IGRP_submit(pObj.pUrl)).submit();
					}
		        }
	    	});
		}else
			IGRP_message({pObjt:vObjForm,pType:"error",pMessage:JSMSG_ERROR_FILD_REQUIRED,pPos:'before'});
	}catch(e){null;}
}

function IGRP_validateSam(pObj){
	try{
		var vResultHash = IGRP_hashjs({pHash:vScriptHash});
		IGRP_h_popupCtx({pUrl:IGRP_getUrl(pObj.pUrl)+'p_sam_message='+vResultHash,pWin:"IGRP_win"+IGRP_returnTime()});
	}catch(e){null;}
}

function IGRP_blankTargetOpen(pObj){
	var vUrl = IGRP_getUrl(pObj.pUrl);
	vUrl+='p_fwl_'+pObj.pThis.attr('relink')+'tr='+pObj.pThis.parents("tr:first").index()*1+'&p_fwl_relboxopen='+pObj.pThis.attr('relink');
	IGRP_openWin({pUrl:vUrl,pWidth:($(window).width()-100),pHeight:($(window).height()-100),pWin:'_blankTargetOpen'});
}

function IGRP_filter(pObj){
	var vUrl = $("input[name='p_env_frm_url']").val(), vParam = pObj.pUrl.split("=");
	$(".filterAz span a").removeClass("active");
	pObj.pThis.addClass('active');
	vUrl = vUrl?vUrl:window.location.href;
	IGRP_creatField_OR_SetVal({pType:'hidden',pName:vParam[0],pValue:vParam[1]});
	IGRP_notFildValidator(vObjForm);
	IGRP_pageLoading({pType:true});
	vObjForm.attr("action",IGRP_submit(vUrl)).submit();
}

function IGRP_windowClose(){
	window.opener = top;
	window.close();
}

function IGRP_setValSelect(obj,val,form){
	var id = obj.attr('id');
	obj.find('option').prop("selected","");
	obj.find('option').removeAttr("selected","");
	$('#'+id+'_chosen',form).remove();
	obj.find('option').each(function(){
		if($(this).val() != '' && $(this).val() != null) {
			if(!isNaN($(this).val()*1)) {
				if($(this).val() == val){
					$(this).prop("selected","selected");
					$(this).attr("selected","selected");
				}
			}else{
				if($(this).val().toLowerCase() == val.toLowerCase()){
					$(this).prop("selected","selected");
					$(this).attr("selected","selected");
				}
			}
		}
	});
	$(obj,form).chosen({allow_single_deselect:true}).change(choseValidate);
}

function IGRP_lookup(pObj){ //passa valor
	//console.log(pObj)
	var vTag        = pObj.pThis.parents().prop('tagName'), 
		vObj        = null, 
		vTparam     = 0, 
		vNobj       = null,
		vCtxFormIdx = 0, 
		vCtxForm    = vObjForm, 
		vParam      = "", 
		vIsChanged  = false,
		vObjChanged = null, 
		vFwlNoclose = 0, 
		vFwlAdd     = 0, 
		vNobjForm   = null;

	//console.log(pObj.pThis.parents(':first'));
	//console.log(vTag)

	vTag	= (vTag == "TD")?"tr":vTag;
	vObj 	= pObj.pThis.parents(vTag+":first");
	vTparam = 1*vObj.attr("CTX_PARAM_COUNT")+1;

	var _vCtxForm;
	//Nome de Formulario destino
	try{_vCtxForm = vObj.attr("CTX_FORM");}catch(e){null;}

	vCtxForm = (_vCtxForm==null||_vCtxForm=="")? vCtxForm : _vCtxForm;

	//console.log(vCtxForm)

	//Indice de campo em caso de ARRAY
	try{
		vCtxFormIdx = vObj.attr("CTX_FORM_IDX");
	}catch(e){null;}

	vNobjForm = window.opener?window.opener.document.forms[vCtxForm]:window.parent.document.forms[vCtxForm];
	
	//console.log(vNobjForm)

	for(var i = 1; i < vTparam; i++){
		var vOp = vObj.attr("CTX_P"+i).split("=");

		try{
			vFwlNoclose = (vOp[0]=="p_fwl_noclose")?vOp[1]*1:vFwlNoclose;
			vFwlAdd		= (vOp[0]=="p_fwl_add")?vOp[1]*1:vFwlAdd;

			vNobj		= $("*[name='"+vOp[0]+"']", vNobjForm);

			if(vCtxFormIdx == "" || vCtxFormIdx == null){
				if(vNobj.prop('tagName') == "SELECT")
					IGRP_setValSelect(vNobj,vOp[1],vNobjForm);
				else
					vNobj.val(vOp[1]);

				if($(vNobj[(1*vCtxFormIdx)])[0].lookupCallback)
					$(vNobj[(1*vCtxFormIdx)])[0].lookupCallback($(vNobj[(1*vCtxFormIdx)]));
			}else{
				try {
					$(vNobj[(1*vCtxFormIdx)]).val(vOp[1]);

					if($(vNobj[(1*vCtxFormIdx)]).prop('tagName') == "SELECT")
						IGRP_setValSelect($(vNobj[(1*vCtxFormIdx)]),vOp[1],vNobjForm);
					else
						$(vNobj[(1*vCtxFormIdx)]).val(vOp[1]);

					if($(vNobj[(1*vCtxFormIdx)])[0].lookupCallback)
						$(vNobj[(1*vCtxFormIdx)])[0].lookupCallback($(vNobj[(1*vCtxFormIdx)]));
				}
				catch(e){
					if(1*vCtxFormIdx == 0){
						if(vNobj.prop('tagName') == "SELECT")
							IGRP_setValSelect(vNobj,vOp[1],vNobjForm);
						else
							vNobj.val(vOp[1]);
					}

					if(vNobj[0].lookupCallback)
						vNobj[0].lookupCallback(vNobj);
				}
			}
			if(vNobj.hasClass('IGRP_change')){
				vIsChanged	= true;
				vObjChanged	= vNobj.attr('name');
			}
		}catch(e){null;}
	}

	try{
		if(vIsChanged){
			var vUrl = $("input[name='p_env_frm_url']", vNobjForm).val();
		    	vUrl = vUrl?vUrl:window.parent.location.href;
			IGRP_notFildValidator($(vNobjForm));
			$(vNobjForm).attr("action",IGRP_submit(vUrl,$(vNobjForm),"#id"+vObjChanged)).submit();
		}
	}
	catch(e) {null;}

	try{
		if(!vFwlNoclose){
			$(".link-opener", window.parent.document).removeClass("active");
			$("body", window.parent.document).removeClass("noscroll");
			$(".IGRP_overlay", window.parent.document).removeClass('active');

			if (window.opener)
				window.close();
		}
		vFwlAdd?$("a.IGRP_addRow img", window.parent.document.forms[vCtxForm]).click():"";
	}
	catch(e){null}

	return true;
}


function IGRP_clickControllers(pObj){

	switch(pObj.pTarget.toLowerCase()){
		case "confirm":
			IGRP_confirm({pFunction:IGRP_confirmSubmit,pParam:{pTarget:pObj.pTarget,pUrl:pObj.pUrl}});
		break;

		case "_close":
			IGRP_windowClose();
		break;

		case "_back":
			window.history.back();
		break;

		case "submit":
			IGRP_h_submit({pThis:pObj.pThis,pUrl:pObj.pUrl});
		break;

		case "alert_submit":
			IGRP_confirm({pFunction:IGRP_confirmSubmit,pParam:{pUrl:pObj.pUrl,pTarget:pObj.pTarget}});
		break;

		case "submit_popup":
			IGRP_submitPopup({pUrl:pObj.pUrl});
		break;

		case "lookup"://passa valor
			IGRP_lookup({pThis:pObj.pThis});
		break;

		case "filter"://filter AZ
			IGRP_filter({pThis:pObj.pThis,pUrl:pObj.pUrl});
		break;

		case "_self":
			window.location.replace(pObj.pUrl);
		break;

		case "specific"://mesma pagina
			window.location.replace(pObj.pUrl);
		break;

		case "_newtab":
			window.open(pObj.pUrl,'_blank');
		break;

		case "submit_sam":
			IGRP_submitSam({pThis:pObj.pThis,pUrl:pObj.pUrl});
		break;

		case "validate_sam":
			IGRP_validateSam({pThis:pObj.pThis,pUrl:pObj.pUrl});
		break;

		case "_blankTarget":
			IGRP_blankTargetOpen({pThis:pObj.pThis,pUrl:pObj.pUrl});
		break;

		default:
			IGRP_h_popupCtx({pUrl:pObj.pUrl,pWin:"IGRP_win"+IGRP_returnTime()});
	}
	return false;
}

function IGRP_message(pObj){
	var vCall = !pObj.pNotLive?'live':'remove';
	var message = "<div class='notification "+vCall+" "+pObj.pType+"'><div class='icon'></div><div class='messages'>"+pObj.pMessage+"</div><div class='close IGRP_notClose'/></div>";

	$(".notification.remove")[0]?$(".notification.remove").remove():"";
	switch(pObj.pPos.toLowerCase()){
		case "after":
			pObj.pObjt.after(message);
		break;

		case "before":
			pObj.pObjt.before(message);
		break;

		case "prepend":
			pObj.pObjt.prepend(message);
		break;

		default:
			pObj.pObjt.append(message);
	}
	setTimeout(function(){$('.notification.live').remove();},8000);
	return false;
}

function IGRP_h_buttonClick(){
	$("body").on("click",".bClick",function(e){
		e.preventDefault();
		var vUrl 		= $(this).attr("fw_href")?$(this).attr("fw_href"):$(this).attr("href"),
			vPos 		= '00', vTab = '0',
			vTarget 	= $(this).attr("target"),
			vParent 	= $(this).parents('ul.itemMenu'),
			vParentLat 	= $(this).parents('.lateralMenu');
		
		try{
			if(vParent[0] || vParentLat[0]){
				var vMenu 	= vParent[0]?vParent.attr("type"):'tab';
					vPos 	= $(this).attr('pos');
					vTab 	= vPos.substring(0,1);
				
				IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_'+vMenu+'_menu',pValue:vPos});
				(vMenu == 'tab')?IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_tab_page',pValue:vTab}):'';
			
				vUrl = IGRP_getUrl(vUrl)+'p_fwl_tab_page='+vTab+'&p_fwl_'+vMenu+'_menu='+vPos;
			}
		}catch(e){console.log('error itemMenu report : '+e.description); null;}

		IGRP_clickControllers({pThis:$(this),pUrl:vUrl,pTarget:$(this).attr("target")});
		return false;
	});
}

function IGRP_h_windowResize(){
	$(window).resize(function(e) {
        $(".contextMenu").removeClass("active");
		$("td, tr").removeClass("active");
    });
}

function IGRP_graphUrlOpen(pObj){
	if (pObj.pUrl != null && pObj.pUrl != '') {
		var vUrl = IGRP_getUrl(pObj.pUrl), vParam = 'p_x='+pObj.pX+'&p_y='+pObj.pY+'&p_z='+pObj.pZ;
			vUrl += vParam;
		IGRP_h_popupCtx({pUrl:vUrl,pWin:"IGRP_win"+IGRP_returnTime()});
	}
}

function IGRP_h_tableChartsClick(){
	$('body').on('click','.nodegraphe',function(){
		var vRel = $(this).attr('rel'), vX = $(this).attr('x'),
			vObj = $(this).parent('td'), vY = '', vZ = '';

		vZ = $("table#"+vObj.attr('class')+" tbody tr td a.nodegraphe_"+vObj.attr('pos')).text();
		vY = $("table#"+vObj.attr('class')+" thead th:eq("+vObj.index()+")").text();
		IGRP_graphUrlOpen({pUrl:vRel,pX:vX,pY:vY,pZ:vZ});
	});
}

$.extend($.expr[":"], {
	"containsIN": function(elem, i, match, array) {
		return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
	}
});

function IGRP_h_debug(){
	$("#igrp-footerPage").on("click",".iconDebug",function(e) {
        $("#igrp-footerPage").toggleClass("active");
		$("body").toggleClass("noscroll");
    });

	var isShift = false;
	document.onkeyup=function(e){
		if(e.which == 16) isShift=false;
	}
	document.onkeydown=function(e){
		if(e.which == 16) isShift=true;
		if(e.which == 38 && isShift == true) {
			$("#igrp-footerPage").addClass("active");
			$("body").addClass("noscroll");
			return false;
		}

		if(e.which == 40 && isShift == true) {
			$("#igrp-footerPage").removeClass("active");
			$("body").removeClass("noscroll");
			return false;
		}
	}

	$("#searchDebug").on("keyup",function(e) {
		var vVal = $(this).val();
		if(vVal != '' && vVal != null){
			$(".debug ul li").addClass("noSearch");
			$(".debug ul li:containsIN('"+vVal+"')").removeClass("noSearch");
		}else
			$(".debug ul li").removeClass("noSearch");
    });
}

function IGRP_h_workFlow(){
	$("body").on("click",".workFlow .stp_num",function(){
		var vLi = $(this).parents("li"), vRel = vLi.attr('rel');
		$(".workFlow ul li").removeClass("active");
		vLi.addClass("active");
		IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_workflow',pValue:vRel});
		$(".workFlow-content").removeClass("active");
		$("#"+vRel).addClass("active");
	});

	$("body").on("click",".workFlow-tab li",function(){
		var vRel = $(this).attr('rel');
		$(".workFlow-tab li").removeClass("active");
		$(".workFlow-content").removeClass("active");

		IGRP_creatField_OR_SetVal({pType:'hidden',pName:'p_fwl_workflow',pValue:vRel});
		$(this).addClass("active");
		$("#"+vRel).addClass("active");
	});

	try{
		var vRel = $("input[name='p_fwl_workflow']").val();
		if(vRel != '' && vRel != null){
			$(".workFlow ul li").removeClass("active");
			$(".workFlow ul li[rel='"+vRel+"']").addClass("active");

			$(".workFlow-tab li").removeClass("active");
			$(".workFlow-tab li[rel='"+vRel+"']").addClass("active");

			$(".workFlow-content").removeClass("active");
			$("#"+vRel).addClass("active");
		}else
			$(".workFlow-content:first").addClass("active");

	}catch(e){null;}
}

$(window).scroll(function(e){
   var vScrollPos = $(this).scrollTop();
   vLastScrollTop = $("#igrp-topPage").height()+65;
   vLastScrollTop = $("#tabsMenu")[0]?vLastScrollTop+$("#tabsMenu").height():vLastScrollTop;
   vLastScrollTop = $("#simpleMenu")[0]?vLastScrollTop+$("#simpleMenu").height():vLastScrollTop;
   vLastScrollTop = $('ul.process-flow')[0]?vLastScrollTop+$("ul.process-flow").height():vLastScrollTop;

   if (vScrollPos > vLastScrollTop){
       // downscroll code
	   $("#igrp-topLogo").addClass("hideItem");
	   $("#igrp-bodyPage").addClass("noTop");
   } else {
      // upscroll code
	  $("#igrp-topLogo").removeClass("hideItem");
	   $("#igrp-bodyPage").removeClass("noTop");
   }
   if(vScrollPos > vToolBar){
   		$(".tool-bar[rel='noTable']").addClass("itemFixed");
		if($("#igrp-topMenu")[0])
			$(".tool-bar[rel='noTable']").addClass("top");
   }
   else{
		$(".tool-bar[rel='noTable']").removeClass("itemFixed");
	}
   vLastScrollTop = vScrollPos;
});

function IGRP_submitAjaxShowMessages(pObj){
	try{
		$.each($(pObj).find('messages message'),function(i,row){
			var vAttr = $(row).attr('type');
			if (vAttr!='debug' && vAttr!='confirm'){
				IGRP_message({pObjt:vObjForm,pType:vAttr,pMessage:$(row).text(),pPos:'before',pNotLive:true});
			}
		});
	}catch(e){null;}
}

$.fn.getXMLDocument = function(s) {
	var rtn;
	try{
		if(this[0]){
			var str = new XMLSerializer().serializeToString(this[0]);
			rtn = $.parseXML(str);
		}	
	}catch(e){
		rtn = false;
	}
    return rtn;
};


function IGRP_uploadStringAsFile(pObj){
	var vFormData = new FormData(), vBlod = null,
		vType = pObj.pContentType?pObj.pContentType:'plain/text',
		vFormat = pObj.pFormat?pObj.pFormat:'txt';

	pObj.pArrayFiles.forEach(function(pfile){
		var vName = pfile.name,
			vFileName = (vName.substring(0,2) == 'p_')?vName.substring(2):vName;
		vBlod = new Blob([pfile.value], {type:vType});
			vFormData.append(vName, vBlod, vFileName+"."+vFormat);			
	});
	if (pObj.pArrayItem) {
		pObj.pArrayItem.forEach(function(pItem){
			vFormData.append(pItem.name,pItem.value);
		});
	}
	return vFormData;
}

function IGRP_submitStringAsFile(pObj){
	var vRequest = new XMLHttpRequest(), vData = IGRP_uploadStringAsFile(pObj.pParam);
    vRequest.open("POST",pObj.pUrl);
    pObj.pLoading?IGRP_pageLoading({pType:true}):'';
    vRequest.onreadystatechange = function(){
    	if (vRequest.readyState == 4) {
    		if (vRequest.status == 200){
	    		if(pObj.pComplete) 
	    			pObj.pComplete(vRequest.responseXML,vRequest.responseText,vRequest.readyState); 
	    		if (pObj.pMessage)
	    			IGRP_submitAjaxShowMessages(vRequest.responseXML);
    		}
    		pObj.pLoading?IGRP_pageLoading({pType:false}):'';
    	}
    }
    vRequest.send(vData);
}

function IGRP_downloadImg(pObj){
	var vElement = document.createElement('a');
	vElement.href = pObj.pImg;
	vElement.download = pObj.pOutput;
	document.body.appendChild(vElement);
	vElement.click();
	document.body.removeChild(vElement);
}

function IGRP_submitAjax(pObj){
	pObj.pLoading?IGRP_pageLoading({pType:true}):'';
	try{
		$.ajax({
			url   :pObj.pUrl,
			type  :"POST",
			method:"POST",
			data  : pObj.pData,
			success:function(data, textStatus, jqXHR){
				var vXml = pObj.pMatch?$(data).find(pObj.pMatch).getXMLDocument():data;
				if(pObj.pTransf){
					pObj.pDiv.XMLTransform({
				      xsl:pObj.pXsl,
				      xml:vXml,
				      xslParams:pObj.pXslParam,
				      xmlData:pObj.pXmlParam,
				      complete:pObj.pComplete
				    });
				}
				pObj.pMessage?IGRP_submitAjaxShowMessages(data):'';
				pObj.pLoading?IGRP_pageLoading({pType:false}):'';
			},
			complete:function(data){
				pObj.pLoading?IGRP_pageLoading({pType:false}):'';
				pObj.pAjaxComplete?pObj.pAjaxComplete(data):'';
			},
			error: function(jqXHR, textStatus, errorThrown){
				pObj.pLoading?IGRP_pageLoading({pType:false}):'';
			 	console.log('Submit Ajax report: '+textStatus);
			}
		});
		return false;
	}catch(e){null;}
}

function IGRP_h_submitFav(){
	$(".star").click(function(){
		IGRP_submitAjax({pUrl:vFavUrl+$(this).attr("rel")});
		$(this).toggleClass("active");
	});
}

function IGRP_hackerIframe(){
  function getChromeVersion () {
    var raw = navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./);
    return raw ? parseInt(raw[2], 10) : false;
  }

  function redrawElement(el,delay){
      el.css('display','none');
      setTimeout(function(){
          var te = document.createTextNode(' ');
          el.css('display','block');
      },delay);
  }
  
  $('frame, iframe').load(function(e){
    if (getChromeVersion() == 44) {
      redrawElement($(this),90);
    }
  });
}

function IGRP_includScriptWebSin(){
	try{
		if($(".igrp_item.signature")[0]){
			var script 	= document.createElement('script'), 
				script1 = document.createElement('script');
		    $(script).attr('src',path+'/extensions/webSign/js/webSign.js');
		    $(script1).attr('src',path+'/extensions/webSign/js/webSignControl.js');
		    $("head").append(script);
		    $("head").append(script1);
		}
	}catch(e){console.log('webSign: '+e.description); null;}
}


function IGRP_handler(){
	vObjForm = $("#formular_default");
	try{
		vToolBar = $(".col.tool-bar").offset().top;
	}catch(e){null;}
	vDcument = document;
	IGRP_h_topMenu();
	IGRP_h_slideMenu();
	IGRP_h_collapser();
	IGRP_h_tabMenu();
	IGRP_h_simpleMenu();
	IGRP_h_buttonClick();
	IGRP_h_formatItemForm();
	IGRP_h_windowResize();
	IGRP_h_debug();
	IGRP_h_workFlow();
	IGRP_h_submitFav();
	IGRP_h_tableChartsClick();
	IGRP_h_treeMenu();
	IGRP_hackerIframe();
	IGRP_includScriptWebSin();
	try{
		$('.VKB_geral').IGRP_vkboard();
	}catch(e){null;}
	vScriptHash = 'sha1';
	vHashMac = 'password';
}

$(function(){IGRP_handler();});
