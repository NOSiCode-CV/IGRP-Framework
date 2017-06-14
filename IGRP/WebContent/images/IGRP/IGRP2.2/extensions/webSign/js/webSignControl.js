$(function(){
   $("ul.control-signature li").click(function(){
        try{
            var rel     = $(this).parent('ul').attr('rel'),
                thisRel = $(this).attr('rel');
            if(thisRel == 'edit'){
                $("div[rel='"+rel+"']").attr('style','');
                $("#"+rel).val('');
                apagar_assinatura(rel+'obj');
                $("div[rel='"+rel+"']").attr('signature','false');
                iniciar_assinatura(rel+'obj');
            }
            else{
                var base64 = getImageStr(rel+'obj');
                if(base64){
                    $("div[rel='"+rel+"']").attr('style','background-image:url(data:png;BASE64,'+base64+')').attr('signature','true');
                    $("#"+rel).val(base64);
                    terminar_assinatura(rel+'obj');
                    apagar_assinatura(rel+'obj');
                }
            }
        }catch(e){console.log(e.description);null;}
   });
});