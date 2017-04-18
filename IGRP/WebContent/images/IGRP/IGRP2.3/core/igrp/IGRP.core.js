(function($){
	if($ && $.IGRP){

		$.IGRP.utils = {
			openWin:function(p){

				var width  = p.width ? p.width : 980;
			    var height = p.height ? p.height : 520;

			    var left = parseInt((screen.availWidth/2)  - (width/2));
			    var top  = parseInt((screen.availHeight/2) - (height/2));
			    
			    var windowFeatures = "scrollbars, width=" + width + ",height=" + height +
			        ",status,resizable,left=" + left + ",top=" + top +
			        ",screenX=" + left + ",screenY=" + top;

			  	window.open(p.url, p.win, windowFeatures);

				return false;
			},
			openChartURL : function(pObj){
				if (pObj.pUrl != null && pObj.pUrl != '') {
					
					var vUrl   = $.IGRP.utils.getUrl(pObj.pUrl), 
						vParam = 'p_x='+pObj.pX+'&p_y='+pObj.pY+'&p_z='+pObj.pZ;

					vUrl += vParam;

					$.IGRP.utils.openWin({
						url    :vUrl,
						width  :980,
						height :520,
						win    :"IGRP_win"+(new Date()).getTime()
					});

				}
			},
			getForm:function(){
				return $('form.IGRP-form');
			},
			getFieldsValidate:function(){
				var fields = $('input,select,textarea',$.IGRP.utils.getForm()).not('.no-validation').not('.IGRP_checkall');
				return fields;
			},
			getUrl:function(url){
				url = url && url != undefined ? url : 'XXX';
				return (url.indexOf("?")==-1)?url+="?":url+="&";
			},
			getFormUrl:function(url){
				var param = $.IGRP.utils.getForm().not(".notForm").serialize();
				return $.IGRP.utils.getUrl(url)+param;
			},
			getParam:function(pLink, pName){
				var vNewLink = pLink.substring(pLink.indexOf("?")+1);
				var vOp = vNewLink.split("&");
				for(var i= 0; i < vOp.length; i++){
					var vNop = vOp[i].split("=");
					if(vNop[0].toLowerCase()==pName.toLowerCase()){
						return vNop[1];
					}
				}
				return null;
			},
			getSubmitParams:function(url,form,scrollTo){
				var vUrl    = url, 
					vForm   = $.IGRP.utils.getForm(),
					vHref   = "", 
					vNewUrl = "";
				
				if(form && form != null)
					vForm = form;

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
								$.IGRP.utils.createHidden({name:vP1[0],value:vP1[1]});
						}
					}
				}
				else
					vUrl = vHref;

				//Comentado em 23-01-2012 problemas em RELOAD
				vUrl = vHref;
				if(scrollTo){
					var vIchange = scrollTo.replace("#id","");
					vUrl = $.IGRP.utils.getUrl(vUrl);
					vUrl+="ichange="+vIchange+scrollTo;
					if(!vForm.find("input[name='ichange']")[0])
						$.IGRP.utils.createHidden({name:'ichange',value:vIchange});
					else
	  					$('input[name="ichange"]',form).val(vIchange);
				}
				
				return vUrl;
			},
			sanitize:function(pOp){
				var vTexto = pOp;
				try{
					vTexto = vTexto.replace('\'','&#92;');
					return(vTexto);
				}catch(e){return vTexto;}
			},
			createHidden:function(p){
				var form = $.IGRP.utils.getForm();
				if(p.name)
					form.prepend('<input type="hidden" name="'+p.name+'" value="'+p.value+'"/>');
			},
			htmlEncode:function(str){
				return str?$('<div />').text(str).html():"";
			},
			htmlDecode:function(str){
				return str?$('<div />').html(str).text():"";
			},
			isNotNaN : function(v){
				return isNaN(v)? 0:v*1;
			},
			loading : {
				show : function(o){
					var obj = o ? o : $('body');
					$.IGRP.utils.loading.hide(obj);
					$('body').addClass('hidescrool');
					obj.addClass('loading').append('<div class="loader"/>');
				},
				hide : function(o){
					var obj = o ? o : $('body');
					if($('.loader',obj)[0]) {
						obj.removeClass('loading');
						$('.loader',obj).remove();
						$('body').removeClass('hidescrool');
					}
				}
			}
		}
		/*FILE SUBMIT*/
		/*Get Form Data as Object*/
		$.IGRP.utils.getFormData = function(p){
			var vFormData = new FormData(), 
				vBlod     = null,
				vType     = p.pContentType ? p.pContentType : 'plain/text',
				vFormat   = p.pFormat ? p.pFormat : 'txt';

			p.pArrayFiles.forEach(function(pfile){
				var vName     = pfile.name,
					vFileName = (vName.substring(0,2) == 'p_')?vName.substring(2):vName;

				vBlod = new Blob([pfile.value], {type:vType});
					vFormData.append(vName, vBlod, vFileName+"."+vFormat);			
			});

			if (p.pArrayItem) {
				p.pArrayItem.forEach(function(pItem){
					vFormData.append(pItem.name,pItem.value);
				});
			}
			return vFormData;
		}
		/*Submit String as File*/
		$.IGRP.utils.submitStringAsFile = function(p){
			/*
				pParam:{
					pContentType: string ex -> 'plain/text, text/json ...' // tipe de ficheiro,
					pFormat		: string ex -> 'txt, json, xml ...' // formato de ficheiro,
					pArrayFiles : array  ex -> [{name:xxx,value:zzz}] // itens a ser submetido como ficheiro
					pArrayItem 	: array  ex -> [{name:xxx,value:zzz}] // outros itens e ser submetido mas não como ficheiro
				},
				pUrl : url ex ->  https://www.xxxx.com // url de POST,
				pComplete : function operação finalizada devolve resposta,
				pNotify  : boolean ex -> true/false // caso pretende ou nao despoletar notificação por defeito a notificação é despoletada
			*/
			var vRequest 	= new XMLHttpRequest(), 
				vData    	= $.IGRP.utils.getFormData(p.pParam),
				typeNotify 	= 'danger',
				form 		= $.IGRP.utils.getForm(),
				showNotify 	= p.pNotify === false ? false : true,
				response    = null,
				message 	= '';

		    vRequest.open("POST",p.pUrl);
		    vRequest.timeout = 600000; // time in milliseconds
		    
		    vRequest.ontimeout = function (e) {
				$.IGRP.utils.loading.hide();
				$.IGRP.notify({
					message : 'Time out',
					type	: typeNotify
				});
			};

			vRequest.onprogress = function () {
				$.IGRP.utils.loading.show();
			};

		    vRequest.onreadystatechange = function(){
		    	if(vRequest.readyState == 4){ // operação finalizada
		    		typeNotify = vRequest.status == 200 ? 'success' : 'danger';
		    		
		    		$.IGRP.utils.loading.hide();
		    		
		    		if (showNotify){
		    			if(vRequest.status == 200){
			    			try{
			    				response 	= $($.parseXML(vRequest.response)).find('messages message');
			    				typeNotify 	= response.attr('type') && response.attr('type') != undefined ? response.attr('type').toLowerCase() : typeNotify,
			    				message 	= response.text();
			    			}catch(e){
			    				response 	= $.parseJSON(vRequest.response);
			    				typeNotify 	= response.type && response.type != undefined ? response.type.toLowerCase() : typeNotify,
			    				message 	= response.messages;
			    			}
		    			}
		    			
		    			typeNotify = typeNotify === 'error' ? 'danger' : typeNotify;

		    			message = message && message != undefined ? message : 'Request info: Status '+vRequest.status+' '+vRequest.statusText; 

		    			$.IGRP.notify({
							message : $.IGRP.utils.htmlDecode(message),
							type	: typeNotify
						});
					}

		    		if(p.pComplete) 
			    		p.pComplete(vRequest);
		    	}
		    }
		    vRequest.send(vData);
		}

	}else{
		console.log('jQuery or IGRP.js missing!')
	}

}($));




