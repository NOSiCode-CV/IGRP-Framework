(function () {

    let com,
        availableTokens = [],
        availableCertes = [],
        pinToken        = null,
        idToken         = null,
        idCert          = null,
        typeSigner      = 'SignPdf',
        objclicked         = null,
        defaultError    = 'Ocorreu um erro inesperado! Por favor recarregue o seu ecrã e tenta novamente.';

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
					method	 : options.method,
                    timeout  : 0
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
                                        pin   : pinToken,
                                        token : p.token
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
                <div class="col-sm-12 form-group holder_select mb-5" id="holder_modal_signer_available_tokens" item-name="modal_signer_available_tokens" item-type="select">
                    <label>Tokens Disponíveis</label>
                    <select class="form-control select2" id="modal_signer_available_tokens"></select>
                    <span class="desc_label text-muted">Escolher uns dos tokens para poder assinar.</span>
                </div>

                <div class="col-sm-12 mb-5 form-group holder_select hidden nosicasigner_available_certificates" id="holder_modal_signer_available_certificates" item-name="modal_signer_available_certificates" item-type="select">
                    <label>Certificados Disponíveis</label>
                    <select class="form-control select2" id="modal_signer_available_certificates"></select>
                    <span class="desc_label text-muted">Escolher uns dos certificates para poder assinar.</span>
                </div>

                <div class="form-group mb-5 col-sm-12 hidden" id="holder_modal_signer_pin_token">
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
            $('#nosicasigner_btn').addClass('hidden');

            $('#nosicasigner_base64').remove();

            pinToken = null;
            idToken  = null;
            idCert   = null;
            
            availableCertes = [];
            availableTokens = [];

            typeSigner  = 'SignPdf',
            objclicked     = null;

            $.IGRP.components.select2.setOptions({
                select : $('.select2',holderSelect),
                options: []
            });

            $.IGRP.utils.loading.hide();
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

                    if(objclicked !== null){

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
                                                message: defaultError,
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
            console.log(p);

            const data = {
                "tokenId"       : ((p.token*1) -1),
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

                    let holderTokens = objclicked !== null ? 'holder_modal_signer' : 'holder_nosicasigner';

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
            console.log(p, objclicked);

            if(objclicked !== null){ 

                if(typeSigner === 'SignPdf'){ //signerBeforeDownload

                    const a = document.createElement('a');
                    
                    a.setAttribute('href', `data:application/pdf;base64,${p.result}`);
                    a.setAttribute('download', 'signerfiledownload');

                    const download = $(a);

                    download.appendTo('body');
                    download[0].click();
                    download.remove();

                }else{ // signerBeforeSubmit

                    const _clicked = objclicked;

                    if(objclicked?.url){
                        const xmlSignerResult = `<?xml version="1.0" encoding="UTF-8"?>
                            <content><signerdata>${p.result}</signerdata><signerkey>${p.verify}</signerkey>`;

                        let arrayFiles 	= $.IGRP.utils.submitPage2File.getFiles();

                        arrayFiles.push({name : 'p_fwl_sinedresult', value : xmlSignerResult});

                        $.IGRP.utils.submitStringAsFile({
                            pParam 		: {
                                pArrayFiles : arrayFiles,
                                pArrayItem 	: $.IGRP.utils.submitPage2File.getUrlParam(objclicked.url),
                                pContentType: 'plain/xml',
                                pFormat     : 'xml',
                            },
                            pUrl   		: objclicked.url,
                            pNotify 	: false,
                            pComplete 	: function(resp){

                                try{
                                    const xml = resp.responseXML || $($.parseXML(resp.response));
                                    
                                    $.IGRP.utils.afterSubmitAjax({
                                        xml 	: xml,
                                        clicked : _clicked.clicked,
                                        sform   : $.IGRP.utils.getForm()
                                    });
                                    

                                    if(_clicked.clicked[0].events){

                                        _clicked.clicked[0].events.execute('success-signer_before_submit',{
                                            xml : xml
                                        });
                                    }

                                }catch(e){ console.log(e)}
                            }
                        })
                    }
                }

            }else if(typeSigner === 'SignPdf'){ //signer PDF

                const pdf = `data:application/pdf;base64,${p.result}`;

                $('#id-nosicasigner_iframe').attr('src',pdf)
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

                com.request({
                    url  : `${baseUrl}/${typeSigner}`,
                    data : JSON.stringify(data)

                }).done(function(resp){

                    if(resp){
                        com.responseToSign(resp);
                    }
                    else{
                        $.IGRP.notify({
                            message: 'Não foi possível obter resposta.',
                            type   : 'danger'
                        });
                    }

                }).fail(function(e){
                    
                    console.log("error : ",e);

                    $.IGRP.notify({
                        message: defaultError,
                        type   : 'danger'
                    });

                }).always(function(){
                    com.resetNosicasigner();
                });

            }else{

                $.IGRP.notify({
                    message: defaultError,
                    type   : 'danger'
                });
            }
        },

        signerBeforeSubmit : function(p) {
            typeSigner     = 'Sign';
            objclicked        = p;
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
            objclicked = p;


            fetch(p.url).then( response => response.blob() )
            .then( blob =>{

                var reader = new FileReader() ;

                reader.onload = function(){ 
        
                    com.setBase64Result({
                        id    : 'nosicasigner_base64',
                        data  : this.result
                    });

                    com.getAvailableTokens();

                };

                reader.readAsDataURL(blob) ;
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
                        token     : idToken,
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
                        token : idToken
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

                const obj = objclicked !== null ? $('.modal_signer_ok') : $('#nosicasigner_btn');

                console.log(idCert, obj);

                if(idCert){
                    obj.removeClass('hidden');

                }else{
                    obj.addClass('hidden');
                }
            });

            $('body').on('click','#nosicasigner_btn',function(e){
                e.preventDefault();

                $.IGRP.utils.loading.show();

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