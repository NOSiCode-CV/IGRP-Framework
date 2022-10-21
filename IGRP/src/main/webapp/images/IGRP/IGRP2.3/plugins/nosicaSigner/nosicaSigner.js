(function () {

    let com,
        availableTokens = [],
        availableCertes = [],
        pinToken = null,
        idToken  = null,
        idCert   = null;

    const baseUrl = 'https://nosica-signer.gov.cv:4444/api/Sign';

    $.IGRP.component('nosicaSigner', {

        request : function(p){
			
			var options = $.extend(true, {
				data        : {},
				headers	    : {
                    'Accept'      : 'application/json',
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin' : '*'
                },
                method      : 'POST',
				success     : function(){},
				fail        : function(){},
				complete    : function(){}
			}, p),
				req 	= null;
			
			if(options.url)
				req = $.ajax({
					url      : options.url,
					data     : options.data,
					headers	 : options.headers,
					method	 : options.method
				})
				.done(options.success)
				.fail(options.fail)
				.always(options.complete);

			return req;
			
		},

        nosicasignerModal : function (p) {

            $.IGRP.components.globalModal.set({
                rel    : 'confirm-target',
                title  : p.title,
                content: p.content,
                buttons: [
                    {
                        class :'danger',
                        icon  :'times',
                        text  :'Cancelar',
                        attr  :{ "data-dismiss":"modal" }
                    },
                    {
                        class   :'success',
                        icon    :'check',
                        text    :'OK',
                        onClick :function(e){
                            pinToken = $('#pin_token').val();
                            if(pinToken){

                                try{ 

                                    p.onConfirm({
                                        pin    : pinToken,
                                        tonken : p.tonken
                                    });

                                }catch(err){ 
                                    console.log(err); 
                                }

                                $.IGRP.components.globalModal.hide();
                                
                            }else{
                                $.IGRP.notify({
                                    message: 'PIN é obrigatorio',
                                    type   : 'info'
                                });
                            }

                            return false;
                        }
                    }
                ]
            });

        },

        onFeadAsDataURL : function (p) {

            p.target.removeClass('hidden');
					
            if(p.field.is('[nosicasigner-control]')){

                const idControll = p.field.attr('nosicasigner-control');

                if($(`#${idControll}`)[0]){

                    const $textarea = $('<textarea></textarea>');

                    $textarea.addClass('hidden').attr('id',idControll).val(p.result);

                    p.field.parents('.holder-nosicasigner').append($textarea);

                }else{
                    $(`#${idControll}`).val(p.result);
                }

                com.GetAvailableTokens();
            }
        },

        resetNosicasigner : function(){
            const holderSelect = $('.holder_select');
                holderSelect.addClass('hidden');

            $('#nosicasigner_base64').val('');

            pinToken = null;
            idToken  = null;
            idCert   = null;
            
            availableCertes = [];
            availableTokens = [];

            $.IGRP.components.select2.setOptions({
                select : $('.select2',holderSelect),
                options: []
            });
        },

        GetAvailableTokens : function(p) {

            const holderSelect = $('#holder_nosicasigner_available_tokens');
                holderSelect.removeClass('hidden');

            com.request({
                url    : `${baseUrl}/GetAvailableTokens`,
                method : 'GET'

            }).done(function(resp){
                const holderSelect = $('#holder_nosicasigner_available_tokens');
                holderSelect.removeClass('hidden');


                /**if(resp){
                    

                    resp.map((o, i) => {
                        
                        const {tokenId, tokenManufacturer, tokenDescription} = o;

                        idToken = tokenId;

                        availableTokens[i] = {
                            text   : tokenDescription,
                            value  : tokenId,
                            tokenManufacturer
                        }
                    });

                    $.IGRP.components.select2.setOptions({
                        select: $('.select2',holderSelect),
                        options: availableTokens
                    });

                    select.removeClass('hidden');

                }else{

                    $.IGRP.notify({
                        message: 'Não há token(s) disponívei(s)',
                        type   : 'danger'
                    });
                }*/

            }).fail(function(e){

                console.log("error : ",e);
            });

        },

        GetAvailableCertificates : function(p){
            const data = {
                "tokenId"       : p.token,
                "allowedIssuer" : "",
                "pin"           : p.pin
            };

            const holderSelect = $('#holder_nosicasigner_available_certificates');
                holderSelect.removeClass('hidden');

            com.request({
                url  : `${baseUrl}/GetAvailableCertificates`,
                data : JSON.stringify(data)

            }).done(function(s){

                const holderSelect = $('#holder_nosicasigner_available_certificates');
                holderSelect.removeClass('hidden');

                /**if(resp){
                    

                    resp.map((o, i) => {
                        
                        const {serialNumber, label, subject, issuerName} = o;

                        availableCertes[i] = {
                            text   : label,
                            value  : serialNumber,
                            subject,
                            issuerName
                        }
                    });

                    $.IGRP.components.select2.setOptions({
                        select: $('.select2',holderSelect),
                        options: availableCertes
                    });

                    select.removeClass('hidden');

                }else{

                    $.IGRP.notify({
                        message: 'Não há token(s) disponívei(s)',
                        type   : 'danger'
                    });
                }*/

            }).fail(function(e){

                console.log("error : ",e);
            });

        },

        Sign : function (p) {
            com.request({
                url  : `${baseUrl}/Sign`,
                data : JSON.stringify(p.data)

            }).done(function(s){

                console.log("success",s);

            }).fail(function(e){

                console.log("error : ",e);
            });
        },

        SignPdf : function (p) {
            const pdfBase64 = $('#nosicasigner_base64').val();

            if(pdfBase64){

                const data = {
                    "tokenId"                : p.token,
                    "certificateSerialNumber": p.certSerNum,
                    "pin"                    : p.pin,
                    "data"                   : pdfBase64
                };

                com.request({
                    url  : `${baseUrl}/SignPdf`,
                    data : JSON.stringify(data)

                }).done(function(s){

                    console.log("success",s);

                    //$('#id-nosicasigner_iframe').attr('src',result)

                    com.resetNosicasigner();

                }).fail(function(e){

                    console.log("error : ",e);
                });

            }else{

                $.IGRP.notify({
                    message: 'Ocorreu um erro inesperado.! Por favor recarregue o seu ecrã e tenta novamente.',
                    type   : 'danger'
                });
            }
        },

        events : function() {

           $('body').on('change','#nosicasigner_available_tokens',function(){

                const tonken = $(this).val();

                if(tonken){

                    com.nosicasignerModal({
                        title     : 'Recolha PIN do Token',
                        content   : `
                        <div class="form-group col-sm-12">
                            <label>Inserir Pin</label>
                            <input type="password" class="form-control" id="pin_token"/>
                        </div>`,
                        tonken    : tonken,
                        onConfirm : function (p) {
                            com.GetAvailableCertificates(p)
                        }
                    });
                }
           });

           $('body').on('change','#nosicasigner_available_certificates',function(){

                certId = $(this).val();

                if(certId){
                    $('#nosicasigner_btn').removeClass('hidden');
                }
            });

            $('body').on('click','#nosicasigner_btn',function(e){
                e.preventDefault();

                com.SignPdf({
                    tokenId     : idToken,
                    certSerNum  : idCert,
                    pin         : pinToken,
                });

                return false;
                
            });

        },

        init : function () {
            com = this;
            com.events();
        }
    }, true);

    $(document).on('document:file2base64', function (i, p) {
		$.IGRP.components.nosicaSigner.onFeadAsDataURL(p)
	});

})();