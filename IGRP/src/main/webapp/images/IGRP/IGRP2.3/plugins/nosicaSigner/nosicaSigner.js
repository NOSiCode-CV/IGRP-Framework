(function () {

    let com,
        availableTokens = [],
        availableCertes = [],
        pinToken        = null,
        idToken         = null,
        idCert          = null,
        typeSigner      = 'SignPdf',
        process         = 'onload';

    //const baseUrl = 'https://nosica-signer.gov.cv:4444/api/Signer';

    const baseUrl = 'http://nosica-signer.gov.cv:5000/api/Signer';

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

        htmlFields : function(){
            return `<div class="box-modal-signer row">
                <div class="col-sm-12 form-group holder_select mb-3" id="holder_modal_signer_available_tokens" item-name="modal_signer_available_tokens" item-type="select">
                    <label>Tokens Disponíveis</label>
                    <select class="form-control select2" id="modal_signer_available_tokens"></select>
                    <span class="desc_label text-muted">Escolher uns dos tokens para poder assinar.</span>
                </div>

                <div class="col-sm-12 mb-3 form-group holder_select hidden nosicasigner_available_certificates" id="holder_modal_signer_available_certificates" item-name="modal_signer_available_certificates" item-type="select">
                    <label>Certificados Disponíveis</label>
                    <select class="form-control select2" id="modal_signer_available_certificates"></select>
                    <span class="desc_label text-muted">Escolher uns dos certificates para poder assinar.</span>
                </div>

                <div class="form-group mb-3 col-sm-12 hidden" id="holder_modal_signer_pin_token">
                    <div class="input-group">
                        <label>Inserir Pin</label>
                        <input type="password" class="form-control" id="modal_signer_pin_token"/>
                        <span class="input-group-btn" style="padding-top: 23px;"><a class="btn btn-primary">OK</a></span>
                    </div>
                </div>
            </div>`;
        },

        setBase64Result : function(p){
            const obj = $(`#${p.id}`),
                regex = 'data:application/pdf;base64,';
            let data  = p.data;
                
            data = data.indexOf(regex) !== -1 ? data.split(regex)[1] : data;

            if(!obj[0]){

                const $textarea = $('<textarea></textarea>');

                $textarea.addClass('hidden').attr('id',p.id).val(data);

                $('form').append($textarea);

            }else{
                obj.val(data);
            }
        },

        setSelectOptions : function (p) {
            const holderSelect  = $(`#${p.holder}`),
                    select      = $('.select2',holderSelect);

            holderSelect.removeClass('hidden');

            $.IGRP.components.select2.setOptions({
                select: select,
                options: p.options
            });

            select.removeClass('hidden');
        },

        onReadAsDataURL : function (p) {

            p.target.removeClass('hidden');
					
            if(p.field.is('[nosicasigner-control]')){

                com.setBase64Result({
                    id    : p.field.attr('nosicasigner-control'),
                    data  : p.result
                });

                com.getAvailableTokens();
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

            typeSigner  = 'SignPdf',
            process     = 'onload';

            $.IGRP.components.select2.setOptions({
                select : $('.select2',holderSelect),
                options: []
            });
        },

        getAvailableTokens : function(p) {

            com.request({
                url    : `${baseUrl}/GetAvailableTokens`,
                method : 'GET'

            }).done(function(resp){

                console.log("availabletokens", resp);

                if(resp[0]){

                    let holderTokens = 'holder_nosicasigner';

                    availableTokens[0] = {
                        text              : '---Escolher---',
                        value             : '',
                        tokenManufacturer : ''
                    }
                
                    resp.map((o, i) => {
                        
                        const {tokenId, tokenManufacturer, tokenDescription} = o;

                        idToken = ((tokenId * 1) +1);

                        availableTokens[(i+1)] = {
                            text   : tokenDescription,
                            value  : ((tokenId * 1) +1),
                            tokenManufacturer
                        }
                    });

                    if(process === 'onclik'){

                        holderTokens = 'holder_modal_signer';

                        $.IGRP.components.globalModal.set({
                            rel    : 'holder_modal_signer',
                            title  : 'Assinatura',
                            content: com.htmlFields(),
                            buttons: [
                                {
                                    class :'danger',
                                    icon  :'times',
                                    text  :'Cancelar',
                                    attr  :{ "data-dismiss":"modal" }
                                },
                                {
                                    class   :'success hidden modal_signer_ok',
                                    icon    :'check',
                                    text    :'OK',
                                    onClick :function(e){
                                        
                                        console.log(idToken);

                                        if(idToken){

                                            com.toSign({
                                                tokenId     : idToken,
                                                certSerNum  : idCert,
                                                pin         : pinToken,
                                            });

                                            $.IGRP.components.globalModal.hide();
                                    
                                        }else{
                                            $.IGRP.notify({
                                                message: 'Ocorreu um erro inesperado.! Por favor recarregue o seu ecrã e tenta novamente.',
                                                type   : 'danger'
                                            });
                                        }
        
            
                                        return false;
                                    }
                                }
                            ]
                        });

                    }

                    com.setSelectOptions({
                        holder  : `${holderTokens}_available_tokens`,
                        options : availableTokens
                    });

                }else{

                    $.IGRP.notify({
                        message: 'Não há token(s) disponívei(s)',
                        type   : 'danger'
                    });
                }

            }).fail(function(e){

                console.log("error : ",e);
            });

        },

        getAvailableCertificates : function(p){
            const data = {
                "tokenId"       : p.token,
                "allowedIssuer" : "",
                "pin"           : p.pin
            };

            com.request({
                url  : `${baseUrl}/GetAvailableCertificates`,
                data : JSON.stringify(data)

            }).done(function(resp){

                console.log('cert :: ',resp);

                if(resp){

                    availableCertes[0] = {
                        text        : '---Escolher---',
                        value       : '',
                        subject     : '',
                        issuerName  : ''
                    }

                    resp.map((o, i) => {
                        
                        const {serialNumber, label, subject, issuerName} = o;

                        availableCertes[(i+1)] = {
                            text   : issuerName,
                            value  : serialNumber,
                            subject,
                            issuerName
                        }
                    });

                    let holderTokens = process === 'onclik' ? 'holder_modal_signer' : 'holder_nosicasigner';

                    com.setSelectOptions({
                        holder  : `${holderTokens}_available_certificates`,
                        options : availableCertes
                    });

                }else{

                    $.IGRP.notify({
                        message: 'Não há token(s) disponívei(s)',
                        type   : 'danger'
                    });
                }

            }).fail(function(e){

                console.log("error : ",e);
            });

        },

        responseToSign : function(p){

            if(process === 'click'){

                if(typeSigner === 'SignPdf'){

                    console.log('Download file');

                }else{

                    console.log('create field and submit page');
                }

            }else if(typeSigner === 'SignPdf'){
                $('#id-nosicasigner_iframe').attr('src',result)
                com.resetNosicasigner();
            }
        },

        toSign : function (p) {
            const base64 = $('#nosicasigner_base64').val();

            if(base64){

                const data = {
                    "tokenId"                : ((p.tokenId*1) -1),
                    "certificateSerialNumber": p.certSerNum,
                    "pin"                    : p.pin,
                    "data"                   : base64
                };

                console.log(data);

                com.request({
                    url  : `${baseUrl}/${typeSigner}`,
                    data : JSON.stringify(data)

                }).done(function(s){

                    com.responseToSign(s);

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

        signerBeforeSubmit : function(p) {
            typeSigner     = 'Sign';
            process        = 'onclik';
            const form     = $.IGRP.utils.getForm(),
            serializeArray = form.find('*').not(".notForm").serializeArray();

            let xmlPage    = $.IGRP.utils.submitPage2File.json2xml(serializeArray);

            xmlPage = `<?xml version="1.0" encoding="UTF-8"?><content>${xmlPage}</content>`;

            console.log("xmlPage :: ",xmlPage);

            xmlPage = $.IGRP.utils.str2base64(xmlPage);

            if(xmlPage){

                com.setBase64Result({
                    id    : 'nosicasigner_base64',
                    data  : xmlPage
                });

                com.getAvailableTokens();

            }

            console.log("base64 :: ",xmlPage);
        },

        signerBeforeDownload : function(p) {
            process = 'onclik';
            com.request({
                url    : p.url,
                method : 'GET'

            }).done(function(resp){


                /**if(resp){
                 * 
                    com.getAvailableTokens();

                    com.setBase64Result({
                        id    : 'nosicasigner_base64',
                        data  : resp
                    });

                
                }*/

            }).fail(function(e){

                console.log("error : ",e);
            });
        },

        events : function() {

           $('body').on('change','#nosicasigner_available_tokens',function(){

                idToken = $(this).val();

                if(idToken){

                    com.nosicasignerModal({
                        title     : 'Recolha PIN do Token',
                        content   : `
                        <div class="form-group col-sm-12">
                            <label>Inserir Pin</label>
                            <input type="password" class="form-control" id="pin_token"/>
                        </div>`,
                        tonken    : tonken,
                        onConfirm : function (p) {
                            com.getAvailableCertificates(p)
                        }
                    });
                }
           });

           $('body').on('change','#modal_signer_available_tokens',function(){

                idToken = $(this).val();

                if(idToken){
                    $('#holder_modal_signer_pin_token').removeClass('hidden');
                }
           });

           $('body').on('click','#holder_modal_signer_pin_token a',function(e){
                e.preventDefault();

                pinToken = $('#modal_signer_pin_token').val();

                if(pinToken){

                    $('#holder_modal_signer_pin_token').addClass('hidden');

                    com.getAvailableCertificates({
                        pin    : pinToken,
                        tonken : idToken
                    });

                }else{
                    
                    $.IGRP.notify({
                        message: 'PIN é obrigatorio',
                        type   : 'info'
                    });
                }

                return false;
           })

           $('body').on('change','.nosicasigner_available_certificates select',function(){

                idCert = $(this).val();

                const obj = process === 'onclik' ? $('.modal_signer_ok') : $('#nosicasigner_btn');

                console.log(idCert, obj);

                if(idCert){
                    obj.removeClass('hidden');

                }else{
                    obj.addClass('hidden');
                }
            });

            $('body').on('click','#nosicasigner_btn',function(e){
                e.preventDefault();

                console.log(idToken);

                com.toSign({
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
		$.IGRP.components.nosicaSigner.onReadAsDataURL(p)
	});

})();