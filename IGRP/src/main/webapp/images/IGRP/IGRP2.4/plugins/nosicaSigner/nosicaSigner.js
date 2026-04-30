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
        defaultSuccess  = 'Opera&ccedil;&atilde;o finalizada com sucesso.';

    const baseUrl = 'https://nosica-signer.gov.cv:4444/api/Signer';

    const objModal = $('#igrp-global-modal-asigner');

    $.IGRP.component('nosicaSigner', {

        request : function(p){

            let options = $.extend(true, {
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

            virtualkeyboard: function(id) {
                return `
                <div class="vkb_geral input-group IGRP-${id}" id="${id}" vkbonload="true" rel="${id}" vkbtype="vkb_aznum">
                    <input type="password" name="${id}" class="vkb_input form-control" id="inp_${id}" readonly="readonly" rel="${id}" post="vkb_aznum" />
                    <span class="input-group-addon vkb_toggle_password" rel="${id}" title="Mostrar/Ocultar PIN">
                            <i class="fa fa-eye"></i>
                        </span>
         
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

            filesigner: function() {
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
                                <span class="desc_label text-muted">Escolha um token 1º</span>
                            </div>
                            <div class="col-sm-3 form-group holder_select nosicasigner_available_certificates hidden" id="holder_nosicasigner_available_certificates" item-name="nosicasigner_available_certificates" item-type="select">
                                <label for="p_nosicasigner_available_certificates">Certificados Disponíveis</label>
                                <select class="form-control select2" id="nosicasigner_available_certificates"></select>
                                <span class="desc_label text-muted">Escolha para assinar o documento</span>
                            </div>
                            <div class="form-group col-sm-2 hidden btn_nosica" id="btn_nosica_signer" item-name="btn_nosica_signer" item-type="link">
                                <a href="#" class="link btn btn-primary form-link">
                                    <i class="fa fa-pencil"></i><span>Assinar</span>
                                </a>
                                 <span class="desc_label text-muted">Para ativar, escolha onde assinar</span>
                            </div>
                            <div class="form-group col-sm-2 hidden btn_nosica" id="btn_nosica_save" item-name="btn_nosica_save" item-type="link">
                                <a href="?r=igrp/DigitalSignature/saveSignature" class="link btn btn-success form-link">
                                    <i class="fa fa-send"></i><span>Enviar</span>
                                </a>
                            </div>
                        </div>
                        <div class="igrp-iframe nosicasigner_iframe gen-container-item hidden" gen-class="" item-name="nosicasigner_iframe">  
                            <div class="box-body" style="justify-self: center;">
                                <div style="justify-self: center; margin-bottom: 10px;">
                             <div style="display: flex; align-items: center; justify-content: center; gap: 16px; background: #f8f9fa; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); font-family: 'Roboto', sans-serif;">
    <!-- Previous Button -->
    <button id="prevPage" style="display: flex; align-items: center; gap: 8px; padding: 10px 20px; background-color: #1f59c3; color: white; border: none; border-radius: 8px; font-weight: 500; transition: all 0.2s ease; box-shadow: 0 2px 4px rgba(31, 89, 195, 0.2); font-size: 14px; cursor: pointer;">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
        Previous
    </button>

    <!-- Page Indicator -->
    <span style="display: inline-block; font-weight: 600; color: #495057; font-size: 15px; min-width: 100px; text-align: center; background: white; padding: 8px 16px; border-radius: 20px; border: 1px solid #dee2e6;">
        Page: <span id="currentPage">1</span> / <span id="totalPages">1</span>
    </span>

    <!-- Next Button -->
    <button id="nextPage" style="display: flex; align-items: center; gap: 8px; padding: 10px 20px; background-color: #1f59c3; color: white; border: none; border-radius: 8px; font-weight: 500; transition: all 0.2s ease; box-shadow: 0 2px 4px rgba(31, 89, 195, 0.2); font-size: 14px; cursor: pointer;">
        Next
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
    </button>
</div>         </div>
                                
                                <div class="controls" style="position: relative; display: inline-block;">
                                    <canvas id="canvas_frame" class="pdfCanvas" style="border:1px solid black;height:750px;width:600px;"></canvas>
                                <!-- signature_holder estilizado conforme a imagem fornecida -->
                                <div id="signature_holder" style="display:none; position: absolute; width: 160px; height: 60px; background: rgba(255,255,255,0.1); border: 1px solid #111; color: #111; font-family: Arial, Helvetica, sans-serif; font-size: 0.55rem; line-height: 1.05; z-index: 100; cursor: move; box-sizing: border-box; padding: 4px 6px; overflow: hidden;">
                                        <div style="display: flex; height: 100%; gap: 6px;">
                                        <div style="flex: 0 0 36%; font-size: 1.5rem; line-height: 0.95; letter-spacing: -0.5px; word-break: break-word; display: flex; align-items: center; justify-content: center; text-align: center;">
                                                ESPÉCI<br/>MEN-<br/>Teste
                                            </div>
                                            <div style="flex: 1; display: flex; flex-direction: column; justify-content: center;">
                                                <div style="font-weight: 700; font-size: 0.58rem; line-height: 1.0; margin-bottom: 1px;">Digitally signed by</div>
                                                <div style="font-weight: 700; font-size: 0.62rem; line-height: 1.0;">ESPECIMEN-Teste</div>
                                                <div style="font-size: 0.58rem; line-height: 1.0;">Date: <span id="signature_today_date"></span></div>
                                                <div style="font-size: 0.58rem; line-height: 1.0;"><span id="signature_today_time"></span></div>
                                                <div style="font-size: 0.58rem; line-height: 1.0;">Concordo com o conteúdo do documento</div>
                                                <div style="font-size: 0.58rem; line-height: 1.0;">Location</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <style>
                        /* Estilos adicionais para a signature_holder */
                            #signature_holder {
                                transition: box-shadow 0.2s ease;
                            }
                            #signature_holder.dragging {
                                opacity: 0.8;
                                cursor: grabbing;
                                box-shadow: 0 4px 12px rgba(0,0,0,0.3);
                            }
                            #signature_holder:hover {
                                box-shadow: 0 2px 10px rgba(0,0,0,0.25);
                                cursor: grab;
                            }
                            #signature_holder:active {
                                cursor: grabbing;
                            }
                        /* Ajuste para o container dos controles permitir posicionamento absoluto */
                            .controls {
                                position: relative;
                                display: inline-block;
                            }
                        /* Garantir que o canvas e a assinatura fiquem alinhados corretamente */
                            #canvas_frame {
                                display: block;
                            }
                            
                                #btn_nosica_signer a.disabled,
                                #btn_nosica_signer a[aria-disabled="true"] {
                                    opacity: 0.55;
                                    cursor: not-allowed !important;
                                    pointer-events: none !important;
                                    box-shadow: none !important;
                                }
                        </style>
                        <script>
                            (function() {

                        /* --- Step 1: load pdf.js dynamically, then init --- */
                            function loadScript(src, onload) {
                                if (window.pdfjsLib) { onload(); return; }
                                const script = document.createElement('script');
                                script.src = src;
                                script.onload = onload;
                                document.head.appendChild(script);
                            }

                            function init() {
                                if (!Promise.allSettled) {
                                    Promise.allSettled = function(promises) {
                                        return Promise.all(promises.map(p =>
                                            Promise.resolve(p).then(
                                                value  => ({ status: 'fulfilled', value }),
                                                reason => ({ status: 'rejected', reason })
                                            )
                                        ));
                                    };
                                }

                                pdfjsLib.GlobalWorkerOptions.workerSrc =
                                    'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

                            /* --- Step 2: canvas and signature positioning code ---*/
                                const fileInput = document.getElementById('p_nosicasigner_file');
                                let canvas      = document.getElementById('canvas_frame');
                                const context   = canvas.getContext('2d');
                                const nextBtn   = document.getElementById('nextPage');
                                const prevBtn   = document.getElementById('prevPage');
                                let currentPage = 1;
                                let pdfDoc      = null;
                                let totalPages  = 1;
                                let signatureHolder = document.getElementById('signature_holder');
                                let signaturePosition = { x: null, y: null };
                                let isDragging = false;
                                let dragStartX = 0, dragStartY = 0;

                                function base64ToArrayBuffer(base64) {
                                    const binaryString = atob(base64);
                                    const bytes = new Uint8Array(binaryString.length);
                                    for (let i = 0; i < binaryString.length; i++) {
                                        bytes[i] = binaryString.charCodeAt(i);
                                    }
                                    return bytes.buffer;
                                }

                                function setTodayDateTime() {
                                    const todayDateEl = document.getElementById('signature_today_date');
                                    const todayTimeEl = document.getElementById('signature_today_time');
                                    const now = new Date();

                                    if (todayDateEl) {
                                        const yyyy = now.getFullYear();
                                        const mm = String(now.getMonth() + 1).padStart(2, '0');
                                        const dd = String(now.getDate()).padStart(2, '0');
                                        todayDateEl.textContent = yyyy + '.' + mm + '.' + dd;
                                    }

                                    if (todayTimeEl) {
                                        const hh = String(now.getHours()).padStart(2, '0');
                                        const min = String(now.getMinutes()).padStart(2, '0');
                                        const ss = String(now.getSeconds()).padStart(2, '0');
                                        const offsetMinutes = -now.getTimezoneOffset();
                                        const sign = offsetMinutes >= 0 ? '+' : '-';
                                        const tzH = String(Math.floor(Math.abs(offsetMinutes) / 60)).padStart(2, '0');
                                        const tzM = String(Math.abs(offsetMinutes) % 60).padStart(2, '0');
                                        todayTimeEl.textContent = hh + ':' + min + ':' + ss + ' ' + sign + tzH + ':' + tzM;
                                    }
                                }

                                function renderPage(pageNum) {
                                    console.log("---------renderPage---------");
                                    pdfDoc.getPage(pageNum).then(page => {
                                        const viewport = page.getViewport({ scale: 1.5 });

                                        canvas.width = viewport.width;
                                        canvas.height = viewport.height;

                                        canvas.dataset.pdfWidth = page.view[2];
                                        canvas.dataset.pdfHeight = page.view[3];

                                        const isLandscape = viewport.width > viewport.height;
                                        if (isLandscape) {
                                            canvas.style.width = '750px';
                                            canvas.style.height = '600px';
                                        } else {
                                            canvas.style.width = '600px';
                                            canvas.style.height = '750px';
                                        }

                                        page.render({ canvasContext: context, viewport });
                                        setTodayDateTime();

                                        setTimeout(() => {
                                            if (signaturePosition.x !== null && signaturePosition.y !== null) {
                                                signatureHolder.style.left = signaturePosition.x + 'px';
                                                signatureHolder.style.top = signaturePosition.y + 'px';
                                                signatureHolder.style.right = 'auto';
                                                signatureHolder.style.bottom = 'auto';
                                            }
                                        }, 50);
                                    });
                                    document.getElementById('currentPage').textContent = pageNum;
                                }

                                function loadPDF(arrayBuffer, pageToKeep) {
                                    console.log("---------loadPDF---------");
                                    pdfjsLib.getDocument(arrayBuffer).promise.then(pdf => {
                                        pdfDoc     = pdf;
                                        totalPages = pdf.numPages;

                                        if (pageToKeep && pageToKeep >= 1 && pageToKeep <= totalPages) {
                                            currentPage = pageToKeep;
                                        } else if (currentPage < 1 || currentPage > totalPages) {
                                            currentPage = 1;
                                        }
                                        
                                        /* Always reset signing state whenever a PDF is loaded/reloaded*/
                                        canvas.dataset.signX = '';
                                        canvas.dataset.signY = '';
                                        if (window.setSignButtonEnabled) {
                                            window.setSignButtonEnabled(false);
                                        }
                                        document.getElementById('totalPages').textContent = totalPages;
                                        renderPage(currentPage);
                                    }).catch(error => {
                                        console.error('Erro ao carregar o PDF: ', error);
                                    });
                                }

                                function loadSignedPDF(base64Pdf) {
                                    console.log('--------loadSignedPDF ---------');

                                    const pageToKeep = Number.parseInt(
                                        document.getElementById('currentPage')?.textContent,
                                        10
                                    ) || 1;

                                    loadPDF(base64ToArrayBuffer(base64Pdf), pageToKeep);
                                }

                                fileInput.addEventListener('change', function(event) {
                                    const file = event.target.files[0];
                                    if (file && file.type === 'application/pdf') {
                                        const reader = new FileReader();
                                        reader.onload = e => loadPDF(e.target.result);
                                        reader.readAsArrayBuffer(file);

                                        if (signatureHolder) {
                                            signatureHolder.style.display = 'block';
                                            signaturePosition = { x: null, y: null };
                                            signatureHolder.style.right = 'auto';
                                            signatureHolder.style.bottom = 'auto';
                                            signatureHolder.style.left = 'auto';
                                            signatureHolder.style.top = 'auto';
                                        }
                                    } else {
                                        alert('Por favor, selecione um arquivo PDF.');
                                    }
                                });

                                prevBtn.addEventListener('click', function(event) {
                                    event.preventDefault();
                                    if (currentPage <= 1) return;
                                    currentPage--;
                                    renderPage(currentPage);
                                });

                                nextBtn.addEventListener('click', function(event) {
                                    event.preventDefault();
                                    if (currentPage >= totalPages) return;
                                    currentPage++;
                                    renderPage(currentPage);
                                    
                                });

                            /* Drag and Drop for signature*/
                                function initDragAndDrop() {
                                    if (!signatureHolder) return;
                               
                                    signatureHolder.addEventListener('mousedown', function(e) {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        isDragging = true;
                                      
                                        const rect = signatureHolder.getBoundingClientRect();
                                        dragStartX = e.clientX - rect.left;
                                        dragStartY = e.clientY - rect.top;
                               
                                        signatureHolder.style.cursor = 'grabbing';
                                        signatureHolder.classList.add('dragging');
                                    });

                                    document.addEventListener('mousemove', function(e) {
                                        if (!isDragging) return;
                                        e.preventDefault();

                                        const parentRect = signatureHolder.parentElement.getBoundingClientRect();
                                        let newLeft = e.clientX - parentRect.left - dragStartX;
                                        let newTop = e.clientY - parentRect.top - dragStartY;

                                        const holderRect = signatureHolder.getBoundingClientRect();
                                        const maxLeft = parentRect.width - holderRect.width;
                                        const maxTop = parentRect.height - holderRect.height;

                                        newLeft = Math.max(0, Math.min(newLeft, maxLeft));
                                        newTop = Math.max(0, Math.min(newTop, maxTop));

                                        signatureHolder.style.left = newLeft + 'px';
                                        signatureHolder.style.top = newTop + 'px';
                                        signatureHolder.style.right = 'auto';
                                        signatureHolder.style.bottom = 'auto';
                                        signaturePosition = { x: newLeft, y: newTop };

                                        const canvasRect = canvas.getBoundingClientRect();
                                        const controlsRect = signatureHolder.parentElement.getBoundingClientRect();
                                        const canvasInControlsLeft = canvasRect.left - controlsRect.left;
                                        const canvasInControlsTop = canvasRect.top - controlsRect.top;

                                        const posX = newLeft - canvasInControlsLeft;
                                        const posY = newTop - canvasInControlsTop;
                                        canvas.dataset.signX = posX.toString();
                                        canvas.dataset.signY = posY.toString();
                                    });

                                    document.addEventListener('mouseup', function() {
                                        if (isDragging) {
                                               
                                            isDragging = false;
                                            signatureHolder.style.cursor = 'grab';
                                            signatureHolder.classList.remove('dragging');
                                        }
                                    });
                                }

                                setTimeout(initDragAndDrop, 100);

                                window.loadSignedPDF = loadSignedPDF;
                                window.showSignature = function() {
                                    if (signatureHolder) signatureHolder.style.display = 'block';
                                };
                                window.hideSignature = function() {
                                    if (signatureHolder) signatureHolder.style.display = 'none';
                                };
                                window.resetSignaturePosition = function() {
                                    if (signatureHolder) {
                                        signaturePosition = { x: null, y: null };
                                        signatureHolder.style.right = 'auto';
                                        signatureHolder.style.bottom = 'auto';
                                        signatureHolder.style.left = 'auto';
                                        signatureHolder.style.top = 'auto';
                                    }
                                };
                            }

                          function setSignButtonEnabled(enabled) {
                                        const holder = $('#btn_nosica_signer');
                                        const link = $('#btn_nosica_signer a');
                                        const canvas = document.getElementById('canvas_frame');

                                        if (!holder[0] || !link[0] || !canvas) return;

                                        const selectedCertificate = document.getElementById('nosicasigner_available_certificates')?.value;
                                        const hasCertificate = !!selectedCertificate;

                                        if (!hasCertificate) {
                                            holder.addClass('hidden');
                                   
                                            link.css('pointer-events', 'none');
                                            link.attr('aria-disabled', 'true');
                                            return;
                                        }

                                        holder.removeClass('hidden');

                                        const hasSignaturePosition =
                                            canvas.dataset.signX !== undefined &&
                                            canvas.dataset.signY !== undefined &&
                                            canvas.dataset.signX !== null &&
                                            canvas.dataset.signY !== null &&
                                            canvas.dataset.signX !== '' &&
                                            canvas.dataset.signY !== '';

                                        const isDisabled = !enabled && !hasSignaturePosition;

                                        link.toggleClass('disabled', isDisabled);
                                        link.css('pointer-events', isDisabled ? 'none' : 'auto');
                                        link.attr('aria-disabled', isDisabled ? 'true' : 'false');
                                    }

                            window.setSignButtonEnabled = setSignButtonEnabled;

                            loadScript(
                                'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js',
                                init
                            );

                            })();
                        </script>
                        `;
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

            typeSigner  = 'SignPdf';
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
                        setSignButtonEnabled(false);
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
                const dad = $('body').attr('app');
                const url = $(this).attr('href')+'&dad=' + encodeURIComponent(dad);

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


            const signatureHolder = document.getElementById('signature_holder');

            if (signatureHolder) {
                signatureHolder.style.display = 'none';
            }

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
                if (window.setSignButtonEnabled) {
                    window.setSignButtonEnabled(false);
                }
                com.signerPdfSave(p);
            }
        },

        toSign : function(p) {
            const base64    = $('#nosicasigner_base64').val();
            const canvas    = document.getElementById('canvas_frame');
            const signature = document.getElementById('signature_holder');

            if (!canvas || !signature) {
                $.IGRP.notify({
                    message: defaultError,
                    type   : 'danger'
                });
                return;
            }

            const currentPage = Number.parseInt(
                document.getElementById('currentPage')?.textContent,
                10
            ) || 1;

            const rect = canvas.getBoundingClientRect();

            const signX = Number.parseFloat(canvas.dataset.signX);
            const signY = Number.parseFloat(canvas.dataset.signY);

            if (Number.isNaN(signX) || Number.isNaN(signY)) {
                $.IGRP.utils.loading.hide();
                $.IGRP.notify({
                    message: 'Defina a posição da assinatura antes de assinar.',
                    type   : 'info'
                });
                return;
            }

            const pageWidth  = Number.parseFloat(canvas.dataset.pdfWidth)  || canvas.width;
            const pageHeight = Number.parseFloat(canvas.dataset.pdfHeight) || canvas.height;

            // Optional small correction in CSS pixels.
            // Use this only if you still see the signature a few px too high.
            const yCalibrationPx = Number.parseFloat(canvas.dataset.signYCalibration) || 0;

            const signatureRect = signature.getBoundingClientRect();

            const cssToPdfX = pageWidth / rect.width;
            const cssToPdfY = pageHeight / rect.height;

            // Convert the top-left of the signature holder from CSS space to PDF space
            let pdfX = signX * cssToPdfX;

            // PDF origin is bottom-left, so convert from top-left CSS coordinates
            // and keep the full visible height of the signature holder.
            let pdfY = (rect.height - signY - signatureRect.height + yCalibrationPx) * cssToPdfY;

            // If the signature is at the bottom edge, keep it aligned to the bottom.
            // This also prevents the "slightly above" effect caused by rounding / border differences.
            pdfX = Math.max(0, Math.round(pdfX * 1000) / 1000);
            pdfY = Math.max(0, Math.round(pdfY * 1000) / 1000);


            if (!base64) {
                $.IGRP.notify({
                    message: defaultError,
                    type   : 'danger'
                });
                return;
            }
            pdfX = pdfX || 1;
            pdfY = pdfY || 1;
            const data = {
                tokenId                 : ((p.tokenId * 1) - 1),
                certificateSerialNumber : p.certSerNum,
                pin                     : p.pin,
                data                    : base64,
                pageNumberToSign        : currentPage,
                xPosition               : pdfX,
                yPosition               : pdfY
            };

            $.IGRP.utils.loading.show();

            com.request({
                url  : `${baseUrl}/${typeSigner}`,
                data : JSON.stringify(data)

            }).done(function(resp){

                if (resp) {
                    com.responseToSign(resp);
                    console.log("resp.result", resp.result);
                    loadSignedPDF(resp.result);
                } else {
                    $.IGRP.notify({
                        message: 'Não foi possível obter resposta.',
                        type   : 'danger'
                    });
                    $.IGRP.utils.loading.hide();
                }

            }).fail(function(e){

                console.log("error : ", e);

                $.IGRP.notify({
                    message: defaultError,
                    type   : 'danger'
                });

                $.IGRP.utils.loading.hide();

                if (signerbeforsave) {
                    objModal.modal('hide');
                }

                com.resetNosicasigner();
            });
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

                        const base64Data = $('#nosicasigner_base64').val();

                        // Poll until pdf.js finishes loading and exposes loadSignedPDF
                        function tryLoad(attempts) {
                            if (typeof window.loadSignedPDF === 'function') {
                                window.loadSignedPDF(base64Data);
                            } else if (attempts > 0) {
                                setTimeout(() => tryLoad(attempts - 1), 100);
                            } else {
                                console.error('loadSignedPDF not available after timeout');
                            }
                        }
                        tryLoad(20); // retries every 100ms, up to 2 seconds

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

            $('body').on('click', '.vkb_toggle_password', function(e) {
                e.preventDefault();

                const rel = $(this).attr('rel');
                const input = $(`#inp_${rel}`);
                const icon = $('i', this);

                if (input.attr('type') === 'password') {
                    input.attr('type', 'text');
                    icon.removeClass('fa-eye').addClass('fa-eye-slash');
                } else {
                    input.attr('type', 'password');
                    icon.removeClass('fa-eye-slash').addClass('fa-eye');
                }
            });

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
                    if (objclicked === null) {
                        setSignButtonEnabled(false);
                    }
                }else{
                    obj.addClass('hidden');
                    if (objclicked === null) {
                        setSignButtonEnabled(false);
                    }
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