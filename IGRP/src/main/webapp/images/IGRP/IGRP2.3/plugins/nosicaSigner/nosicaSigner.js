(function () {

    let com,
        availableTokens = [],
        availableCertes = [],
        pinToken        = null,
        idToken         = null,
        idCert          = null,
        typeSigner      = 'SignPdf',
        signerbeforsave = false,
        objclicked      = null,
        successProcesso = false,
        defaultError    = 'Ocorreu um erro inesperado! Por favor recarregue o seu ecrã e tenta novamente.',
        defaultSuccess  = 'Opera&ccedil;&atilde;o finalizada com sucesso.';;

    const baseUrl = 'https://nosica-signer.gov.cv:4444/api/Signer';

    const objModal = $('#igrp-global-modal-asigner');

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

        html : {

            virtualkeyboard : function(id){
                return `
                <div class="vkb_geral input-group IGRP-${id}" id="${id}" vkbonload="true" rel="${id}" vkbtype="vkb_aznum">
                    <input type="password" name="${id}" class="vkb_input form-control " id="inp_${id}" readonly="readonly" rel="${id}" post="vkb_aznum"/>
                    <span class="input-group-addon vkb_ctrl" rel="${id}"><i class="fa fa-keyboard-o"></i></span>
                </div>`
            },

            submitsigner : function(){
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

                    <div class="col-sm-12 mb-5 hidden" id="holder_vkb_pin_token_signer">
                        <label>Inserir Pin</label>
                        ${com.html.virtualkeyboard('vkb_pin_token_signer')}
                    </div>
                </div>`;
            },

            filesigner : function(){
                return `<div class="row mb-5" id="holder-fields-nosicasigner">
                    <div class="form-group col-sm-3" id="nosicasigner_file" item-name="nosicasigner_file" item-type="file">
                        <label for="p_nosicasigner_file">Documento</label>
                        <div class="input-group">
                            <input type="text" class="form-control not-form" readonly="readonly"/>
                            <span class="input-group-btn">
                                <span class="btn btn-primary file-btn-holder">
                                <i class="fa fa-upload"></i>
                                    <input id="p_nosicasigner_file" nosicasigner-control="nosicasigner_base64" value="" class="transparent file2base64" target-rend="nosicasigner_iframe" type="file" accept="application/pdf" maxlength="250">
                                </span>
                            </span>
                        </div>
                        <span class="desc_label text-muted">Carregue o documento que pretende assinar</span>
                    </div>
                    <div class="col-sm-3 form-group holder_select nosicasigner_available_tokens hidden" id="holder_nosicasigner_available_tokens" item-name="nosicasigner_available_tokens" item-type="select">
                        <label for="p_nosicasigner_available_tokens">Tokens Disponíveis</label>
                        <select class="form-control select2" id="nosicasigner_available_tokens"></select>
                        <span class="desc_label text-muted">Escolher uns dos tokens para poder assinar o documento</span>
                    </div>
                    <div class="col-sm-3 form-group holder_select nosicasigner_available_certificates hidden" id="holder_nosicasigner_available_certificates" item-name="nosicasigner_available_certificates" item-type="select">
                        <label for="p_nosicasigner_available_certificates">Certificados Disponíveis</label>
                        <select class="form-control select2" id="nosicasigner_available_certificates"></select>
                        <span class="desc_label text-muted">Escolher uns dos certificates para poder assinar o documento</span>
                    </div>
                    <div class="form-group col-sm-2 hidden btn_nosica" id="btn_nosica_signer" item-name="btn_nosica_signer" item-type="link">
                        <a href="#" class="link btn btn-primary form-link">
                            <i class="fa fa-pencil"></i><span>Assinar</span>
                        </a>
                    </div>
                    <div class="form-group col-sm-2 hidden btn_nosica" id="btn_nosica_save" item-name="btn_nosica_save" item-type="link">
                        <a href="?r=igrp/DigitalSignature/saveSignature" class="link btn btn-success form-link">
                            <i class="fa fa-send"></i><span>Enviar</span>
                        </a>
                    </div>
                </div>
                <div class="igrp-iframe nosicasigner_iframe gen-container-item hidden" gen-class="" item-name="nosicasigner_iframe">  
                    <div class="box-body">
                      <iframe id="id-nosicasigner_iframe" style="min-height:650px" src=""/>
                    </div>
                </div>`;
            }
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
            $('.btn_nosica').addClass('hidden');

            $('#nosicasigner_file').removeClass('hidden');

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

            successProcesso = false;

            signerbeforsave = false;

            $.IGRP.utils.loading.hide();
        },

        nosicasignerModal : function (p) {

            $.IGRP.components.globalModal.set({
                rel    : 'confirm-target',
                title  : p.title,
                content: p.content,
                afterShow : function(){
                    if($.fn.IGRP_vkboard && pinToken === null){

                        $('.IGRP-vkb_pin_token').IGRP_vkboard({
                            onOk : function(val, vkb){

                                if(val){
        
                                    pinToken = val;
        
                                    try{ 
        
                                        p.onConfirm({
                                            pin   : pinToken,
                                            token : p.token
                                        });

                                        $('.vkb_input', vkb).val('');
        
                                    }catch(err){ 
                                        console.log(err); 
                                    }
                                    
                                }else{
                                    $.IGRP.notify({
                                        message: 'PIN é obrigatorio',
                                        type   : 'info'
                                    });
                                }
                            }
                        });
                    }
                }
            });

        },
        
        modalSignerBeforeSubmitOrDownload : function(){
            $.IGRP.components.globalModal.set({
                rel    : 'holder_modal_signer',
                title  : 'Assinatura',
                content: com.html.submitsigner(),
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
                ],

                afterShow : function(){

                    if($.fn.IGRP_vkboard && pinToken === null){

                        $('.IGRP-vkb_pin_token_signer').IGRP_vkboard({
                            onOk : function(val, vkb){
                                
                                if(val){
        
                                    pinToken = val;
        
                                    try{ 
        
                                        com.getAvailableCertificates({
                                            pin    : pinToken,
                                            token : idToken
                                        });

                                        $('.vkb_input', vkb).val('');
        
                                    }catch(err){ 
                                        console.log(err); 
                                    }
                                    
                                }else{
                                    $.IGRP.notify({
                                        message: 'PIN é obrigatorio',
                                        type   : 'info'
                                    });
                                }
                            }
                        });
                    }
                }
            });
        },

        getAvailableTokens : function(p) {

            com.request({
                url    : `${baseUrl}/GetAvailableTokens`,
                method : 'GET'

            }).done(function(resp){
                
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

                        com.modalSignerBeforeSubmitOrDownload()
                    }

                    com.setSelectOptions({
                        holder  : `${holderTokens}_available_tokens`,
                        options : availableTokens
                    });

                }else{

                    $.IGRP.notify({
                        message: 'Não há token(s) disponívei(s).',
                        type   : 'danger'
                    });
                }

            }).fail(function(e){

                console.log("error : ",e);

                $.IGRP.notify({
                    message: 'Não foi possível identificar token.',
                    type   : 'danger'
                });
            });

        },

        getAvailableCertificates : function(p){

            const data = {
                "tokenId"       : ((p.token*1) -1),
                "allowedIssuer" : "",
                "pin"           : p.pin
            };

            com.request({
                url  : `${baseUrl}/GetAvailableCertificates`,
                data : JSON.stringify(data)

            }).done(function(resp){

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

                    if(objclicked === null)
                        $.IGRP.components.globalModal.hide();
                    else
                        $('#holder_vkb_pin_token_signer').addClass('hidden');

                }else{

                    $.IGRP.notify({
                        message: 'Não há certificados(s) disponívei(s)',
                        type   : 'danger'
                    });
                }

            }).fail(function(e){

                $.IGRP.notify({
                    message: 'PIN errado.',
                    type   : 'danger'
                });

                console.log("error : ",e);
            });

        },

        subimtData : function(p){

            const xmlSignerResult = `<?xml version="1.0" encoding="UTF-8"?>
            <content>
                <signerdata>${p.result}</signerdata>
                <signerkey>${p.verify}</signerkey>
                <content_type>${p.contentType}</content_type>
                <content_name>${p.contentName}</content_name>
            </content>`;

            let arrayFiles 	= [];

            if(p?.getFiles)
                arrayFiles = $.IGRP.utils.submitPage2File.getFiles();

            arrayFiles.push({name : 'p_fwl_signedresult', value : xmlSignerResult});

            $.IGRP.utils.submitStringAsFile({
                pParam 		: {
                    pArrayFiles : arrayFiles,
                    pArrayItem 	: $.IGRP.utils.submitPage2File.getUrlParam(p.url),
                    pContentType: 'plain/xml',
                    pFormat     : 'xml',
                },
                pUrl   		: p.url,
                pNotify 	: false,
                pComplete 	: function(resp){

                    try{
                        const xml = resp.responseXML || $($.parseXML(resp.response));

                        if(p.transform){

                            $.IGRP.utils.afterSubmitAjax({
                                xml 	: xml,
                                clicked : p.clicked,
                                sform   : $.IGRP.utils.getForm()
                            });
                        }

                        if(typeof p?.complete === 'function'){
                            p.complete(xml);
                        }

                        if(p.clicked[0].events){

                            p.clicked[0].events.execute('success-signer_before_submit',{
                                xml : xml
                            });
                        }

                        com.resetNosicasigner();

                        $.IGRP.utils.loading.hide();

                    }catch(e){ console.log(e)}
                }
            });
        },

        signerPdfSave : function(p){

            $('#btn_nosica_signer').addClass('hidden');
            $('#btn_nosica_save').removeClass('hidden');

            $('body').on('click','#btn_nosica_save a', function(e){
                e.preventDefault();

                const url = $(this).attr('href');

                if(url){

                    $.IGRP.utils.loading.show();

                    const contentName = objModal.is('[input-rel]') ? objModal.attr('input-rel') : 'signedresult';

                    com.subimtData({
                        getFiles    : false,
                        transform   : false,
                        url         : url,
                        clicked     : $(this),
                        result      : p.result,
                        verify      : p.verify,
                        contentName : contentName,
                        contentType : 'application/pdf',
                        complete : function(xml){
                            
                            if(objModal.is('[input-rel]')){

                                let objholder   =  $('body');

                                if(objModal.is('[idtabel]')){
                                    const parentTable = $(`table#${objModal.attr('idtabel')}`);

                                    if(parentTable[0]){

                                        const trIdx = objModal.attr('tridx') * 1;

                                        objholder = $(`tbody tr:eq(${trIdx})`, parentTable);
                                    }
                                }
                            
                                let objInput    = $(`#${objModal.attr('input-rel')}`,objholder),
                                    objUuid     = $(xml).find('signedUuid');

                                if(objInput[0] && objUuid[0]){
                                    
                                    const val = objUuid.text();

                                    objInput.val(val).attr('value',val);

                                    $.IGRP.notify({
                                        message: defaultSuccess,
                                        type   : 'success'
                                    });

                                }else{

                                    $.IGRP.notify({
                                        message: defaultError,
                                        type   : 'danger'
                                    });
                                }
                                
                                objModal.modal('hide');
                            }
                        }
                    });

                }else{

                    $.IGRP.notify({
                        message: 'URL não definido.',
                        type   : 'danger'
                    });
                }

                return false;
            });
        },

        responseToSign : function(p){

            if(objclicked !== null){ 

                if(typeSigner === 'SignPdf'){ //signerBeforeDownload

                    const a = document.createElement('a');
                    
                    a.setAttribute('href', `data:application/pdf;base64,${p.result}`);
                    a.setAttribute('download', 'signerfiledownload');

                    const download = $(a);

                    download.appendTo('body');
                    download[0].click();
                    download.remove();

                    $.IGRP.utils.loading.hide();

                    com.resetNosicasigner();

                }else{ // signerBeforeSubmit

                    const _clicked = objclicked;

                    if(objclicked?.url){

                        com.subimtData({
                            getFiles : true,
                            transform: true,
                            url      : objclicked.url,
                            clicked  : _clicked.clicked,
                            result   : p.result,
                            verify   : p.verify,
                            contentName : 'signedresult',
                            contentType : 'plain/xml',
                        });
                    }
                }

            }else if(typeSigner === 'SignPdf'){ //signer PDF

                const pdf = `data:application/pdf;base64,${p.result}`;

                $('#id-nosicasigner_iframe').attr('src',pdf);

                $.IGRP.utils.loading.hide();

                successProcesso = true;

                com.signerPdfSave(p);
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

                $.IGRP.utils.loading.show();

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

                    $.IGRP.utils.loading.hide();

                    if(signerbeforsave)
                        objModal.modal('hide');

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
            objclicked     = p;
            const form     = $.IGRP.utils.getForm(),
            serializeArray = form.find('*').not(".notForm").serializeArray();

            let xmlPage    = $.IGRP.utils.submitPage2File.json2xml(serializeArray);

            xmlPage = `<?xml version="1.0" encoding="UTF-8"?><content>${xmlPage}</content>`;

            xmlPage = $.IGRP.utils.str2base64(xmlPage);

            if(xmlPage){

                com.setBase64Result({
                    id    : 'nosicasigner_base64',
                    data  : xmlPage
                });

                com.getAvailableTokens();

            }
        },

        fetchFileToBlod : function(p){

            fetch(p.url).then( response => response.blob() )
            .then( blob =>{

                var reader = new FileReader();

                const message = 'Certifique que o url é de um ficheiro formato PDF.';

                reader.onload = function(){ 

                    const result = this.result;

                    if(result.indexOf('data:text/html;base64') === -1){
                    
                        com.setBase64Result({
                            id    : 'nosicasigner_base64',
                            data  : this.result
                        });

                        if(typeof p.complete === 'function')
                            p.complete();

                        else
                            com.getAvailableTokens();

                    }else{
                        $.IGRP.notify({
                            message: message,
                            type   : 'danger'
                        });
                    }
                };

                reader.onerror = function (error) {
					$.IGRP.notify({
                        message: message,
                        type   : 'danger'
                    });
				};

                reader.readAsDataURL(blob) ;
            });

        },

        signerBeforeDownload : function(p) {
            objclicked = p;

            com.fetchFileToBlod(p);
        },

        signerFileBeforSave : function(p){
            $('#nosicasigner_file').addClass('hidden');

            if(p.url){

                com.fetchFileToBlod({
                    url      : p.url,
                    clicked  : p.clicked,
                    complete : function(){
                        const iframeSigner = $('.nosicasigner_iframe');

                        iframeSigner.removeClass('hidden');

                        $('iframe',iframeSigner).attr('src',p.url);

                        com.controllModalAsigner(p.clicked);

                        com.getAvailableTokens();
                    }
                });
                
            }
        },

        controllModalAsigner : function(obj){

            const trParent = obj.parents('tr:first');

            objModal.attr('input-rel',obj.attr('rel'));

            if(trParent[0]){
                const idTabel = trParent.parents('table').attr('id');
                objModal.attr('tridx',(trParent[0].rowIndex -1)).attr('idtable',idTabel);
            }

            objModal.modal('show');
        },

        events : function() {

            $(document).on('click','.btn-filesigner', function(e){
                e.preventDefault();

                com.resetNosicasigner();

                $('.modal-body',objModal).html(com.html.filesigner());

                signerbeforsave = $(this).hasClass('signerbeforsave');

                if(signerbeforsave){

                    const href = $(this).attr('href');

                    if(href){
                        com.signerFileBeforSave({
                            url     : href,
                            clicked : $(this)
                        });

                    }else{
                        $.IGRP.notify({
                            message: 'URL n&atilde;o definido.',
                            type   : 'danger'
                        });
                    }

                }else
                    com.controllModalAsigner($(this));


                return false;
            });

           $('body').on('change','#nosicasigner_available_tokens',function(){

                idToken = $(this).val();

                if(idToken){

                    com.nosicasignerModal({
                        title     : 'Recolha PIN do Token',
                        content   : com.html.virtualkeyboard('vkb_pin_token'),
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
                    $('#holder_vkb_pin_token_signer').removeClass('hidden');
                }
           });

           $('body').on('change','.nosicasigner_available_certificates select',function(){

                idCert = $(this).val();

                const obj = objclicked !== null ? $('.modal_signer_ok') : $('#btn_nosica_signer');

                if(idCert){
                    obj.removeClass('hidden');

                }else{
                    obj.addClass('hidden');
                }
            });

            $('body').on('click','#btn_nosica_signer a',function(e){
                e.preventDefault();

                $.IGRP.utils.loading.show();

                com.toSign({
                    tokenId     : idToken,
                    certSerNum  : idCert,
                    pin         : pinToken,
                });

                return false;
                
            });

            $('.close',objModal).on("click", function(){

                if(successProcesso){

                    $.IGRP.components.globalModal.set({
                        rel    : 'confirm-target',
                        title  : 'Atenção',
                        content: 'Tens processo de assinatura iniciada, deseja continuar com essa ação?',
                        buttons: [
                            {
                                class :'danger',
                                icon  :'times',
                                text  :'Não',
                                attr  :{ "data-dismiss":"modal" }
                            },
                            {
                                class   :'success',
                                icon    :'check',
                                text    :'Sim',
                                onClick :function(e){

                                    com.resetNosicasigner();

                                    objModal.modal('hide');

                                    $.IGRP.components.globalModal.hide();

                                    return false;
                                }
                            }
                        ] 
                    });

                }else{   
                    com.resetNosicasigner();
                    objModal.modal('hide');
                }
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