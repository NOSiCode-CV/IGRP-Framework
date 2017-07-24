function vkbNosiSam(vkb){
	var vInputType = vkb.pInputType?vkb.pInputType:'password';
	return '<div class="col '+vkb.pType+'">'+
		'<select id="samterminaltoken" name="p_sam_terminaltoken" class="hideItem token" chosen="select" data-placeholder="'+vkb.pSelectOptionText+'">'+
	        '<option value=""> - '+vkb.pSelectOptionText+' - </option>'+
	   	'</select>'+
	   	'<div class="fildvkb"><div class="img pass"/>'+
	   		'<div class="VKB_geral" rel="'+vkb.pRel+'" vkbtype="'+vkb.pType+'">'+
	   			'<input type="'+vInputType+'" name="'+vkb.pInputName+'" class="VKB_input notForm" id="INP_'+vkb.pRel+'" readonly rel="'+vkb.pRel+'" post="'+vkb.pType+'"/>'+
	   			'<div class="VKB_main '+vkb.pType+'" id="VKB_'+vkb.pRel+'">'+
	   				'<div class="VKB_num" id="VKBnum_'+vkb.pRel+'"></div>'+
	   				'<div class="VKB_az" id="VKBaz_'+vkb.pRel+'"></div>'+
	   				'<div class="_clear"/>'+
	   				'<div class="VKB_but">'+
	   					'<input type="button" id="VKBOK_'+vkb.pRel+'" class="VKBOK_but" value="'+vkb.pTextOk+'">'+
	   					'<input type="button" id="SHIFT_'+vkb.pRel+'" class="SHIFT_but but" value="shift" rel="'+vkb.pRel+'">'+
	   					'<input type="button" id="VKBCAN_'+vkb.pRel+'" class="VKBCAN_but but" value="'+vkb.pTextCancel+'">'+
	   					'<input type="button" id="VKBLP_'+vkb.pRel+'" class="VKBLP_but but" value="'+vkb.pTextReset+'">'+
	   					'<div class="_cliar"></div>'+
	   				'</div>'+
	   			'</div>'+
	   		'</div>'+
	   	'<div class="_clear"></div>'+
	'</div>';
}

function Local_isTokenPresent(p,div){
	if($("#activartoken")[0])
		$("#activartoken").addClass('hideItem');
	
	NosiSAM.start(null);
	var contTerminal = NosiSAM.getTerminals().length;
	
	if(contTerminal > 0){
		if($("#activartoken")[0])
			$("#activartoken").removeClass('hideItem');

		div.append(vkbNosiSam(p));

		if(contTerminal > 1){
			makeSelect();
			$("#samterminaltoken").removeClass('hideItem');
		}
		else
			$("#samterminaltoken").addClass('hideItem');
	}
}

function addOption(pDestino,pValue,pText,pSelected){
	var opt_new = document.createElement("option");
	opt_new.value = pValue;
	opt_new.text = pText!=null?pText:pValue;

	if(pValue==pSelected)
		opt_new.selected = true;

	try
	{
		pDestino.append(opt_new,null);
	}
	catch(ex)
	{
		pDestino.append(opt_new);
	}
}

function makeSelect(){
	try
	{
		var terminalSource = $("#samterminaltoken");
		var device = NosiSAM.getTerminals();
		for(var i= 0;i < device.length;i++){
			addOption(terminalSource,device[i].SerialString,device[i].SerialString+' - '+device[i].Label,NosiSAM.getCurrentTokenSerial());
		}
	}
	catch(e){null;}
}

function Local_LoadTerminal(){
	makeSelect();
}

function Local_LoadTokenDetail(pValue){
	NosiSAM.setCurrentTokenSerial(pValue);	
	var obj = JSON.parse(NosiSAM.getCurrentTokenInfo());
	tdTokenName.innerHTML = obj.Label;
	tdTokenSerial.innerHTML = obj.serial;
	tdTokenProductName.innerHTML = obj.ProductName;
	tdTokenModel.innerHTML = obj.Model;
	
	//alert(obj.SerializedInitResult);
}

function creatFild(pname,pvalue){
	if(!$('input[name="'+pname+'"]')[0])
		$('form').append('<input type="hidden" name="'+pname+'" value="'+pvalue+'"/>');
	else
		$('input[name="'+pname+'"]').val(pvalue);
}

function Local_Login(p){
	var obj = JSON.parse(NosiSAM.doAuthentication(p.pMessage,p.pPin,p.pToken));
	
	if(obj.status=="true"){
		creatFild('p_sam_message',obj.message);
		creatFild('p_sam_message_digest',obj.message_digest);
		creatFild('p_sam_certificate',obj.certificate);
		if($("#activartoken")[0])
			creatFild('p_buttontoken',$("#activartoken").attr('value'));

		if(!p.pSubmit)
			$('form').submit();
	}
		//alert("message:"+obj.message+"\nmessage_digest:"+obj.message_digest+"\ncertificate:"+obj.certificate);
	else{
		message = "<div class='notification error live'><div class='icon'></div><div class='messages'>"+obj.status_text+"</div><div class='close IGRP_notClose'/></div>";
		$('form').before(message);
		$("#dialog-token").remove();
		$(".IGRP_overlay").removeClass('active');
		$("body").removeClass("noscroll");
		return false;
	}
}