// JavaScript Document
function  JS_call_validation_xml(js_xml){
	var xmlDoc = $.parseXML(js_xml); 
	var $xml = $(xmlDoc);
  // Find Person Tag
	
	$xml.find("row").each(function(){
		var v_this = $(this);
		switch(v_this.find("event").text().toLowerCase()){
			
			case "load":
				JS_call_validation(
					{obj_name:v_this.find("field").text(),
					obj_value:$("*[name='"+v_this.find("field").text()+"']").val(),
					operation:v_this.find("operation").text(),
					value:v_this.find("value").text(),
					value1:v_this.find("value1").text(),
					action:v_this.find("action").text(),
					target:v_this.find("target").text(),
					action_url:v_this.find("action_url").text(),
					action_message:v_this.find("action_message").text(),
					action_type:v_this.find("action_type").text(),
					action_submit:v_this.find("action_submit").text()
					}									
				);
			break;
			
			case "blur":
				$("*[name='"+v_this.find("field").text()+"']").blur(function(){
					JS_call_validation(
						{obj_name:v_this.find("field").text(),
						obj_value:$(this).val(),
						operation:v_this.find("operation").text(),
						value:v_this.find("value").text(),
						value1:v_this.find("value1").text(),
						action:v_this.find("action").text(),
						target:v_this.find("target").text(),
						action_url:v_this.find("action_url").text(),
						action_message:v_this.find("action_message").text(),
						action_type:v_this.find("action_type").text(),
						action_submit:v_this.find("action_submit").text()
						}									
					);
				});
			break;
			
			case "change":
				$("*[name='"+v_this.find("field").text()+"']").change(function(){
					JS_call_validation(
						{obj_name:v_this.find("field").text(),
						obj_value:$(this).val(),
						operation:v_this.find("operation").text(),
						value:v_this.find("value").text(),
						value1:v_this.find("value1").text(),
						action:v_this.find("action").text(),
						target:v_this.find("target").text(),
						action_url:v_this.find("action_url").text(),
						action_message:v_this.find("action_message").text(),
						action_type:v_this.find("action_type").text(),
						action_submit:v_this.find("action_submit").text()
						}									
					);
				});
			break;
			
			case "click":
				$("*[name='"+v_this.find("field").text()+"']").click(function(){
					JS_call_validation(
						{obj_name:v_this.find("field").text(),
						obj_value:$(this).val(),
						operation:v_this.find("operation").text(),
						value:v_this.find("value").text(),
						value1:v_this.find("value1").text(),
						action:v_this.find("action").text(),
						target:v_this.find("target").text(),
						action_url:v_this.find("action_url").text(),
						action_message:v_this.find("action_message").text(),
						action_type:v_this.find("action_type").text(),
						action_submit:v_this.find("action_submit").text()
						}									
					);
				});
			break;
		}
	});
}


function JS_call_remote(p_url,p_field){	
	var vFild = p_field.split(',');
	$.ajax({
		url : p_url,
		dataType : "text",
		success : function(xml){
			if(xml!= null){
				var vXml = xml.split('|');
				vFild.forEach(function(e,i){
					var vObj = $("*[name='"+e+"']");
					if(vObj.prop('tagName').toLowerCase() == 'select'){
						vObj.find('option').prop("selected","");
						vObj.find('option').each(function(){
							if ($(this).val() != '' && $(this).val() != null) {
								if (!isNaN($(this).val()*1)) {
									if($(this).val() == vXml[i])
										$(this).prop("selected","selected");
								}else{
									if($(this).val().toLowerCase() == vXml[i].toLowerCase())
										$(this).prop("selected","selected");
								}
							}
						});
						vObj.trigger("chosen:updated");
					}else
						vObj.val(vXml[i]);	
				});
			}		
		}
	});
}

function JS_call_remote_combobox(p_url,p_field){	
	$.ajax({
		url : p_url,
		dataType : "xml",
		success : function(data){
			var vOption = null, vOptionSelect = false, 
				vSel = $("select[name='"+p_field+"']");
		    if (data !='') {
		      $("option",vSel).remove();
		      vSel.trigger("chosen:updated");
		      console.log($(data));
		      $(data).find('option').each(function(i,e){
		        var vText = $(e).find("text").text(),
		          vOptionVal = $(e).find("value").text();
		        try{
		          vOptionSelect = $(e).attr('selected');
		        }catch(e){null;}

		        vOption = new Option(vText, vOptionVal);

		        if (vOptionSelect)
		          vOption.selected = true;

		        vSel.append(vOption);
		      });
		      vSel.trigger("chosen:updated");
		  	}		
		}
	});
}

function JS_call_message(p_type,p_message){
	IGRP_message({pObjt:vObjForm,pType:p_type,pMessage:p_message,pPos:'prepend'});
}

function JS_call_remote_list(p_url,p_field,p_procedure){
	
	var v_form 		= vObjForm;
	var v_param 	= v_form.find("*").not("input[name='p_env_procedure'], input.notForm").serialize();
	var v_type 		= p_field;
	if(p_field.substring(0,2) == "p_")
		v_type = p_field.substring(2);
			
	v_param+="&p_env_procedure="+p_procedure;
	
	var v_arrPar 	= new Array('type',v_type,'path_tmpl',path_tmpl);
	var v_obj		= $("div[sep-name='"+v_type+"']");

	v_obj.XMLTransform({
		xsl:path+"/xsl/tmpl/IGRP-remote_list.tmpl.xsl",
		xml:p_url,
		xslParams:{type:v_type,path_tmpl:path_tmpl},
		xmlData:v_param,
		method:'POST'
	});
}

function JS_convertDate(date){
	date = Date.parse(new Date(date.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3")));
	
	return date;
}

function JS_between(p_valObj,p_val,p_val1,p_class){
	
	var v_between = false;
	
	if(p_class.match(/date/)){
		p_valObj 	= JS_convertDate(p_valObj);
		p_val 		= JS_convertDate(p_val);
		p_val1		= JS_convertDate(p_val1);	
		
		v_between 	= (p_valObj >= p_val && p_valObj <= p_val1);
	}
	else if(p_class.match(/number/))
		v_between 	= (p_valObj*1 >= p_val*1 && p_valObj*1 <= p_val1*1);
		
	else if(p_class.match(/text/))
		v_between 	= (p_valObj.toUpperCase() >= p_val.toUpperCase() && p_valObj.toUpperCase() <= p_val1.toUpperCase());
	
	return v_between;
}

function JS_sumNumber(p_inputName,p_target){
	var v_val = 0;
	$("input[name='"+p_inputName+"_fk']").each(function() {
		var v_livevalor = parseFloat($(this).val()*1);
		if(!isNaN(v_livevalor)){
			v_val += v_livevalor;
		}
	});
	
	$("input[name='"+p_target+"']").val(v_val);
}

function JS_hideGrupFild(pObj){
	$("input, select, textarea",pObj).not("*[type='hidden'], *[readonly='readonly'], *[disabled='disabled']").each(function(){
		$(this).addClass("hiddenItem");
		if($(this).hasClass("required") || $(this).hasClass("important"))
			$(this).addClass("ignore");
	});
}

function JS_showGrupFild(pObj){
	$("input, select, textarea",pObj).not("*[type='hidden'], *[readonly='readonly'], *[disabled='disabled']").each(function(){
		$(this).removeClass("hiddenItem");
		if($(this).hasClass("ignore"))
			$(this).removeClass("ignore");
	});
}

function JS_operation(pObject)
{
	var is_operation = true;
	var v_param = '';
	var v_value	= pObject.value;
	var v_class = $("*[name='"+pObject.obj_name+"']").attr("class");
	
	if(v_value.substring(0,2) == "p_")
		v_value = $("*[name='"+pObject.value+"']").val();
		
	<!--startwith|notstartwith|endwith|notendwith|contains|notcontains|equal|diff|greater|less|notnull|null-->
	
	switch(pObject.operation.toLowerCase())
	{
		case "equal":
			is_operation = !isNaN(pObject.obj_value*1)?(pObject.obj_value == pObject.value):(pObject.obj_value.toLowerCase() == pObject.value.toLowerCase());
		break;
		
		case "diff":
			is_operation = !isNaN(pObject.obj_value*1)?(pObject.obj_value != pObject.value):(pObject.obj_value.toLowerCase() != pObject.value.toLowerCase());
		break;
		
		case "greater":
			is_operation = !isNaN(pObject.obj_value*1)?(pObject.obj_value > pObject.value):(pObject.obj_value.length > pObject.value.length);
		break;
		
		case "less":
			is_operation = !isNaN(pObject.obj_value*1)?(pObject.obj_value < pObject.value):(pObject.obj_value.length < pObject.value.length);
		break;
		
		case "notnull":
			is_operation = (pObject.obj_value != null && pObject.obj_value != "");
		break;
		
		case "null":
			is_operation = (pObject.obj_value == null || pObject.obj_value == "");
		break;
		
		case "startwith":
			is_operation = ((pObject.obj_value.toUpperCase()).match("^"+pObject.value.toUpperCase()+".*$"));
		break;
		
		case "notstartwith":
			is_operation = (!(pObject.obj_value.toUpperCase()).match("^"+pObject.value.toUpperCase()+".*$"));
		break;
		
		case "endwith":
			is_operation = ((pObject.obj_value.toUpperCase()).match("^.*"+pObject.value.toUpperCase()+"$"));
		break;
		
		case "notendwith":
			is_operation = (!(pObject.obj_value.toUpperCase()).match("^.*"+pObject.value.toUpperCase()+"$"));
		break;
		
		case "contains":
			is_operation = ((pObject.obj_value.toUpperCase()).match("^.*"+pObject.value.toUpperCase()+".*$"));
		break;
		
		case "notcontains":
			is_operation = (!(pObject.obj_value.toUpperCase()).match("^.*"+pObject.value.toUpperCase()+".*$"));
		break;
		
		case "between":
			var v_value1 = pObject.value1;
			if(pObject.value1.substring(0,2) == "p_")
				v_value1	= $("*[name='"+pObject.value1+"']").val();
				
			is_operation = JS_between(pObject.obj_value,v_value,v_value1,v_class);
		break;
		
		case "regexp":
			is_operation = (pObject.obj_value.toUpperCase()).match(pObject.value.toUpperCase());
			//alert(pObject.obj_value);
		break;
		
		default:
			is_operation = true;
	}
	
	return is_operation;
		
}

function call_validation(pObject){
	var vRel= '', vText = '', vObjInp = '', vObjSep = '', vObjItem = '';
	if(JS_operation(pObject)){	
		vRel = pObject.target;
		if(pObject.target.substring(0,2) == "p_")
			vRel = pObject.target.substring(2);
		
		vObjInp 	= $('*[name="'+pObject.target+'"]');
		vObjItem	= $('*[item-name="'+vRel+'"]');
		vObjSep 	= $('*[sep-name="'+vRel+'"]');
		
		<!--hide|show|readonly|disabled|enabled|remote|remote_combobox|message-->
		switch(pObject.action){
			case "hide":
				vObjItem.hide();
				vObjSep.hide();
				var vObjt = $(vObjInp, vObjItem);
				
				if(vObjt.hasClass("required") || vObjt.hasClass("important"))
					vObjt.addClass("ignore");
				
				JS_hideGrupFild(vObjSep);
			break;
			
			case "show":
				if($(vObjInp, vObjItem).hasClass("ignore"))
					$(vObjInp, vObjItem).removeClass("ignore");
				
				JS_showGrupFild(vObjSep);
				
				vObjItem.show();
				vObjSep.show();
			break;
			
			case "readonly":
				vObjInp.attr("readonly","readonly");
			break;
			
			case "disabled":
				vObjInp.attr("disabled","disabled");
			break;
			
			case "required":
				vObjInp.addClass("required");
				vText = vObjItem.find("label:first").text();
				vObjItem.find("label:first").html('<span class="riquired">*</span> '+vText);
			break;
			
			case "notrequired":
				vObjInp.removeClass("required");
				vObjItem.find("span.riquired").remove();
			break;
			
			case "enabled":
				vObjInp.removeAttr("disabled");
				vObjInp.removeAttr("readonly");
			break;
			
			case "remote":
				v_param = pObject.obj_name+"="+pObject.obj_value;
				
				JS_call_remote(IGRP_getUrl(pObject.action_url)+v_param,pObject.target);
			break;
			
			case "remote_combobox":
				v_param = pObject.obj_name+"="+pObject.obj_value;
				
				JS_call_remote_combobox(IGRP_getUrl(pObject.action_url)+v_param,pObject.target);
			break;
			
			case "remote_list":
				JS_call_remote_list(pObject.action_submit,pObject.target,pObject.action_url);
			break;
			
			case "message":
				JS_call_message(pObject.action_type,pObject.action_message);
			break;
			
			case "sum":
				JS_sumNumber(pObject.valuesum,pObject.target);
			break;
		}
	}
}


function JS_call_validation(pObject){
	var v_target = pObject.target.split(",");
	if(pObject.action == 'remote'){
		call_validation(pObject);
	}
	else{
		for(var i = 0; i < v_target.length; i++){
			try{
				pObject.target = v_target[i];
				call_validation(pObject);
			}catch(e){null;}
		}
	}
}