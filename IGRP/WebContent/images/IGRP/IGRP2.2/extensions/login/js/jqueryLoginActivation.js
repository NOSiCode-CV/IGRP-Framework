$(function(){
	$('.carousel').carousel({
		interval: 5000 //changes the speed
	});

	$("body").on("click",".IGRP_notClose",function(){
		$(this).parents(".notification:first").remove();
	});

    try{
        Local_isTokenPresent({
            pSelectOptionText:'Escolher Token',
            pRel:'vkball',
            pType:'vkb_all',
            pInputName:'p_sam_password',
            pTextOk:'OK',
            pTextReset:'Limpar',
            pTextCancel:'Cancelar'
        },$('.vkbsam'));
    }catch(e){null;}

    $("#activartoken").click(function(){
        if($('.notification')[0])
            $('.notification').remove();
        $('.vkbsam').toggleClass('active');
        $('.loginarea').toggleClass('active');
    });
    
    $(".vkbsam .VKB_geral").IGRP_vkboard({
        vkbonload:true,
        beforecancel:function(e,rel){
            $("#INP_"+rel).val('');
        },
        oncancel:function(e,rel){
            $(".vkbsam").removeClass('active');
            $('.loginarea').toggleClass('active');
        },
        onok:function(e,rel){
            var vPin        = $("#INP_"+rel).val(),
                vToken      = $('#terminal').val(),
                vMessage    = $('#samMessage').val();
            if(vPin != '' && vPin != null)
                Local_Login({
                    pPin:vPin,
                    pToken:vToken,
                    pMessage:vMessage
                });
        }
    });
});