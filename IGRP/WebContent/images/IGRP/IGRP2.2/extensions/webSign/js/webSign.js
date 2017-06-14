function iniciar_assinatura(obj_nome) {
    var obj = document.getElementById(obj_nome);
    if (!obj) {
        alert("Não foi possível identificar o objecto: " + obj_nome);
        return;
    }
    try{
       if(obj.ConnectedDevice != ''){
            obj.StartSign(3, 0);
       }else{
            alert('no device connected');
       }
        
    }catch(e){
        console.log(e);
    }
}

    function start_sign(obj_nome) {
        var obj = document.getElementById(obj_nome);
        try {
            if (!obj) {
                alert("Não foi possível identificar o objecto: " + obj_nome);
                return;
            }
            if (obj.IsSigned) {
                obj.ClearSign();
                obj.StartSign(3, 0);
            } else {
                obj.StartSign(3, 0);
            }

            obj.SignCompleteStatus = function(e){
                console.log(e);
            }
        } catch (e) {
            alert("Erro ao iniciar o PAD de assinatura. Fecha a janela e tenta de novo! ");
        }
    }

    function getImageStr (obj_nome){
        var obj = document.getElementById(obj_nome);

        if(!obj) return;

        var signData = obj.GetSignData();

        if (signData != "") {
            imgStr = obj.GetImageData(200, 75, 1, 0);
            return imgStr;
        }
    }

    function capturar_assinatura(obj_nome, input_hidden, img_nome) {
        var imgStr;
        var signPic;
        var obj = document.getElementById(obj_nome);
        var hidden = document.getElementById(input_hidden);
        console.log(obj)
        if (!obj) {
            alert("Não foi possível identificar o objecto: " + obj_nome);
            return;
        }
        try {
            if (!hidden) {
                alert("Não foi possível identificar o input hidden: " + input_hidden);
                return;
            }
            var signData = obj.GetSignData();
            if (signData != "") {
                //    get signature image in required format
                imgStr = obj.GetImageData(200, 75, 1, 0);
                console.log(imgStr)
                hidden.value = imgStr;
                //get the signature data from the database and display it on the picture box
                signPic = "\\\\nosiodb01.gov.cv\\images\\rni\\" + img_nome + ".JPEG";
                obj.GenerateImageFromBase64(imgStr, signPic);
                document.frm_inserir.p_ficheiro.defaultValue = "\\\\nosiodb01.gov.cv\\images\\rni\\" + img_nome + ".JPEG";
            }

        } catch (e) {
            obj.CloseConnection();
        }
    }

    function apagar_assinatura(obj_nome) {
        var obj = document.getElementById(obj_nome);
        if (!obj) {
            alert("Não foi possível identificar o objecto: " + obj_nome);
            return;
        }
        obj.ClearSign();
    }

    function terminar_assinatura(obj_nome) {
        var obj = document.getElementById(obj_nome);
        if (!obj) {
            alert("Não foi possível identificar o objecto: " + obj_nome);
            return;
        }
        obj.CloseConnection();
    }

    function setImage(pUrl) {
        null;
    }

    function limparCaptura() {
        apagar_assinatura('p_obj_19032015162459');
    }

    function guardarCaptura() {
        capturar_assinatura('p_obj_19032015162459', 'p_assinatura', 'ass_19032015162459');
        terminar_assinatura('p_obj_19032015162459');
        setImage('https://nosiappsdev.gov.cv/images/rni/ass_19032015162459.JPEG');
    }
    function test(){
      guardarCaptura();
    }