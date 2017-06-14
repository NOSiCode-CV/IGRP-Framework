// JavaScript Document
function GetAjaxXml(pType){

	var vParam="&p_type="+pType, vImgError = path_tmpl+'/img/error.png';
	
	if(pType=='SELF')
		vParam+="&p_number_process="+$("input#number_process").val();
		
	$.ajax({
		// a url do xml
		url : path_xml+vParam,
		// o tipo de dados que é xml
		dataType : "xml",
		// se terminar com sucesso loga o retorno
		success : function(xml){
		
				if(xml==null){
					swapFoto(pType,vImgError);
					return;					
				}
				
				$(xml).find('rows').each(function(){
					try{
						$("input#number_process").val($(this).find('number_process').text().toString());
					}
					catch(e){null;}
					
					try{
						$(this).find('hidden').each(function() {
                            $("input[name='"+$(this).attr('name')+"']").val($(this).text());
                        });
					}catch(e){null;}
										
					if(pType!=('FINGER') && pType!=('SIG')){
						$('#bio_photo').attr('src', $(this).find('photo_link').text().toString());
						try{
							$("input[name='p_photo_id']").val($(this).find('photo_link').attr('photo_id'));
							$("input[name='p_photo_jp2000_id']").val($(this).find('photo_link').attr('photo_jp2000_id'));
							
						}catch(e){null;}
					}
					if(pType!=('FACE') && pType!=('SIG')){
						$('#bio_fingerleft').attr('src', $(this).find('fingerleft_link').text().toString());
						$('#bio_fingerright').attr('src', $(this).find('fingerright_link').text().toString());
						try{
							$("input[name='p_fingerleft_id']").val($(this).find('fingerleft_link').attr('fingerleft_id'));
							$("input[name='p_fingerleft_wsq_id']").val($(this).find('fingerleft_link').attr('fingerleft_wsq_id'));
							
							$("input[name='p_fingerright_id']").val($(this).find('fingerright_link').attr('fingerright_id'));
							$("input[name='p_fingerright_wsq_id']").val($(this).find('fingerright_link').attr('fingerright_wsq_id'));
							
						}catch(e){null;}
					}
					if(pType!=('FACE') && pType!=('FINGER')){
						$('#bio_signature').attr('src', $(this).find('signature_link').text().toString());
						try{
							$("input[name='p_signature_id']").val($(this).find('signature_link').attr('signature_id'));
							
						}catch(e){null;}
					}
				});
			},
			error: function() { 
				swapFoto(pType,vImgError);			
				
			}
		});
}

function swapFoto(pType,pFoto){
	
	if(pType!=('FINGER') && pType!=('SIG')){
		$("#bio_photo").attr('src', pFoto);
	}
	
	if(pType!=('FACE') && pType!=('SIG')){
		$("#bio_fingerleft").attr('src', pFoto);
		$("#bio_fingerright").attr('src', pFoto);
	}
	
	if(pType!=('FACE') && pType!=('FINGER')){
		$("#bio_signature").attr('src', pFoto);
	}
}

function resetError(){
	var label = $("label",$("input#number_process").parents("div:first"));
	$("span.error",label).remove();
	label.removeClass("error");
	$("input#number_process").removeClass("berror");
	if(!arguments[0])
		$("input#number_process").val('');
}

function setError(error){
	var label = $("label",$("input#number_process").parents("div:first"));
	if(!label.hasClass("error")){
		label.addClass("error");
		label.html(label.text()+" <span class='error'>"+error+"</span>");
		$("input#number_process").addClass("berror");
	}else{
		$("span.error",label).html('');
		$("span.error",label).html(error);
	}
}

$(function() {
	var img_loading = path_tmpl+'/img/loading.gif';
	
	$('#botton_photo').click(function(){
		resetError();
		swapFoto('FACE',img_loading);
		GetAjaxXml('FACE');
	});
	
	$('#botton_fingerleft, #botton_fingerright').click(function(){
		resetError();
		swapFoto('FINGER',img_loading);
		GetAjaxXml('FINGER');
	});
	
	$('#botton_signature').click(function(){
		resetError();
		swapFoto('SIG',img_loading);
		GetAjaxXml('SIG');
	});
		
	$('#botton_selfService').click(function(){
		var process_number = $("input#number_process").val();
		if(process_number =='' || process_number < 0 || process_number == null){
			setError(JSMSG_VALIDATE_FILD_REQUIRED);
		}
		else{
			resetError();
			swapFoto('SELF',img_loading);
			GetAjaxXml('SELF');
		}
	});
	$('#botton_processStart').click(function(){
		resetError();
		swapFoto('START',img_loading);
		GetAjaxXml('START');
	});
	
	$("input#number_process").on("keyup",function(e) {
		var vVal = $(this).val(), error = null;
		
		if(vVal != '' && vVal != null){
			error = isNaN(vVal)?JSMSG_VALIDATE_FILD_NUMBER:JSMSG_VALIDATE_FILD_REQUIRED;
			(error == null || !isNaN(vVal))?resetError(vVal):setError(error);
		}
	});
});