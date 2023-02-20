(function () {
    let com,
    idSigCaptureWeb     = null,
    imgWidth            = 0,
    imgHeight           = 0,
    base64Img           = null,
    relSigCaptureWeb    = null,
    holderSigCatureWeb  = null,
    canvasObj           = null;

    $.IGRP.component('electronicsignature', {

        startVars : function(){
            
            relSigCaptureWeb = holderSigCatureWeb.attr('rel');
            idSigCaptureWeb  = `${relSigCaptureWeb}cnv`;

            canvasObj = document.getElementById(idSigCaptureWeb);

            canvasObj.getContext('2d').clearRect(0, 0, canvasObj.width, canvasObj.height);

            imgWidth  = canvasObj.width;
            imgHeight = canvasObj.height;
        },

        clearVars : function(){
            imgWidth            = 0;
            imgHeight           = 0;
            base64Img           = null;
            relSigCaptureWeb    = null;
            holderSigCatureWeb  = null;
            idSigCaptureWeb     = null;
            canvasObj           = null;
        },

        sign : {
            start : function(){

                com.startVars();

                const message = JSON.stringify({ "firstName": "", "lastName": "", "eMail": "", "location": "", "imageFormat": 1, "imageX": imgWidth, "imageY": imgHeight, "imageTransparency": false, "imageScaling": false, "maxUpScalePercent": 0.0, "rawDataFormat": "ENC", "minSigPoints": 25 });

                document.addEventListener('SigCaptureWeb_SignResponse', com.signResponse, false);

                const element = document.createElement("SigCaptureWeb_ExtnDataElem");

                element.setAttribute("SigCaptureWeb_MsgAttribute", message);

                document.documentElement.appendChild(element);

                const evt = document.createEvent("Events");

                evt.initEvent("SigCaptureWeb_SignStartEvent", true, false);				
                element.dispatchEvent(evt);	
            },

            cancel : function(){

                $('.control-cancel',holderSigCatureWeb).addClass('hidden');

                $(`input#${relSigCaptureWeb}`, holderSigCatureWeb).val('');

                com.imgSetSrc();
                
            }
        },

        imgSetSrc : function(src){

            const ctx2d = canvasObj.getContext('2d');
            
            if(src){
                const img = new Image();

                img.onload = function (){
                    ctx2d.drawImage(img, 0, 0, imgWidth, imgHeight);
                }
                
                img.src = src;

            }else{

                ctx2d.clearRect(0, 0, imgWidth, imgHeight);

                com.clearVars();
            }
        },

        setValues : function(obj){
            if(idSigCaptureWeb !== null){

                const resp = JSON.parse(JSON.stringify(obj));

                const {errorMsg, isSigned, imageData} = resp;

                if(errorMsg && errorMsg !== undefined){

                    $.IGRP.notify({
                        message : errorMsg,
                        type	: 'info'
                    });

                }else if(isSigned){

                    base64Img = `data:image/png;base64,${imageData}`;

                    com.imgSetSrc(base64Img);

                    const inputSigCaptureWeb = $(`input#${relSigCaptureWeb}`, holderSigCatureWeb);

                    if(inputSigCaptureWeb[0]){

                        if(holderSigCatureWeb.is('[autoupload]')){

                            const autoupload = holderSigCatureWeb.attr('autoupload');

                            if(autoupload === 'true'){

                                let urlAutoUpload = holderSigCatureWeb.attr('url-autoupload');

                                const uploadType = 'image/png';

                                urlAutoUpload = urlAutoUpload !== 'true' ? urlAutoUpload : 'webapps?r=igrp/File/save-image';

                                $.IGRP.utils.submitStringAsFile({
                                    pUrl    : urlAutoUpload,
                                    pNotify : false,
                                    pParam : {
                                        pArrayFiles : [
                                            {
                                                name    : 'p_file_name',
                                                value   : $.IGRP.utils.base64toBlob({
                                                    base64Data  : base64Img,
                                                    sliceSize   : holderSigCatureWeb.attr('width')*1,
                                                    contentType : uploadType
                                                }),
                                                type    : uploadType,
                                                filename: relSigCaptureWeb,
                                                format  : 'png'
                                            }
                                        ],
                                        pArrayItem : [
                                            {
                                                name  : 'dad',
                                                value : $('body').attr('app')
                                            }
                                        ]
                                    },
                                    pComplete   : function(respdata){
                                        try{
                                            var resp = respdata?.response ? $.parseJSON(respdata.response) : null;
                                        
                                            if(resp){
                                                let {id, uuid, msg} = resp;

                                                if(id === -1 && msg){
            
                                                    $.IGRP.notify({
                                                        message : $.IGRP.utils.htmlDecode(msg),
                                                        type    : 'danger'
                                                    });
            
                                                }else{
                                                    
                                                    inputSigCaptureWeb.val(id);

                                                    const uuidField = $(`#${relSigCaptureWeb}_uuid`);

                                                    uuid = uuid || id;
                                                    
                                                    if(uuidField[0]){
                                                        uuidField.val(uuid);
                                                    }else{

                                                        $.IGRP.utils.createHidden({
                                                            name  : relSigCaptureWeb+'_uuid',
                                                            value : uuid,
                                                            class :'submittable'
                                                        });
                                                    }
                                                }
                                            }
                                        }catch(e){
                                            console.log(e);
                                            null;
                                        }
                                        
                                    }
                                });

                            }

                        }else
                            inputSigCaptureWeb.val(base64Img);

                        $('.control-cancel',holderSigCatureWeb).removeClass('hidden');
                    }
                }
            }
        },

        signResponse : function(e){
            const str   = e.target.getAttribute("SigCaptureWeb_msgAttri"),
                obj     = JSON.parse(str);

            com.setValues(obj);
        },

        events : function(){
            $(document).on('click','.control-signature a',function(){

                holderSigCatureWeb = $(this).parents('.holder-signature');

                const rel = $(this).attr('rel');

                com.sign[rel]();

            });

            $('div.holder-signature[signature="true"]').each(function(e){

                holderSigCatureWeb = $(this);

                com.startVars();

                const inputSigCaptureWeb = $(`input#${relSigCaptureWeb}`, holderSigCatureWeb);

                com.imgSetSrc(inputSigCaptureWeb.val());
            });
        },

        init : function () {
            com = this;

            com.events();
        }
    }, true);
})();