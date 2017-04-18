// JavaScript Document
// NOSi 2014 - Edson Tavares UPDATE 15/10/2015

/* vkboard*/
(function($){
	$.fn.IGRP_vkboard = function(options){

		var defaults = {
			vkbonload		: false,
			onok			: null,
			beforeok		: null,
          	afterok			: null,
			oncancel		: null,
			beforecancel	: null,
          	aftercancel		: null,
          	vkbaz			: ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'],
			vkbAZ 			: ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'],
			vkbnum 			: ['0','1','2','3','4','5','6','7','8','9'],
			vkbNUM 			: ['=','!','@','#','$','%','&','/','(',')'],
			vkball			: ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',',','.','-','º','~','+','´','<','{','}','[',']','«','\\'],
			vkbALL 			: ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',';',':','_','ª','^','*','`','>','"','£','§','»',"'",'|'],
			vkbothers		: []
		};

		var _this 		= this;
        var settings	= $.extend( {}, defaults, options);
        var VKB			= $(this);
        var vRel 		= VKB.attr('rel');
        var vKbtype		= VKB.attr('vkbtype');


        _this.destroy = function(){
        	_this.remove();
        }
        
        function IGRP_setKeyBval(alpha,vRel,div){
			var array 	= new Array();
			var qtd	= alpha.length;
			while (array.length < qtd) {
				var temp = alpha[Math.floor(Math.random()*qtd)];
				if ($.inArray(temp, array) == -1){
					array.push(temp);
				}
			}

			$('.VKB_button',div).each(function(i,e){
				i+=1;
				$(e).val(array[qtd-i]);
			});

			/*for (i = 1; i <= qtd; i++) {
				var btn = $("#btn"+array[i-1]+"."+vRel);
				btn.val(array[qtd-i]);
			}*/
		}

		function IGRP_listKeyBval(div,alpha){
			$(div).html("");
			for(var i = 0; i < alpha.length; i++){
				$(div).prepend("<input id='btn"+alpha[i]+"' type='button' class='VKB_button "+vRel+"' rel='"+vRel+"'/>");
			}
			IGRP_setKeyBval(alpha,vRel,$(div));
		}

		function IGRP_setInputVal(){
			VKB.unbind("click").on('click',"input.VKB_button",function(){
				var input = $("#INP_"+vRel);
				input.val(input.val() + $(this).val());
			});
		}

		function IGRP_shiftChange(vkb_az,vkb_AZ){
			$(".SHIFT_but",VKB).click(function(){
				var vType = $(this).parents('div.VKB_geral').attr('vkbtype');
				if(!$(this).hasClass("active")){
					$(this).addClass("active");
					if(vType == 'vkb_all')
						IGRP_listKeyBval("#VKBaz_"+vRel,settings.vkbALL,vRel);
					else
						IGRP_listKeyBval("#VKBaz_"+vRel,vkb_AZ,vRel);

					IGRP_listKeyBval("#VKBnum_"+vRel,settings.vkbNUM,vRel);
					$(this).val('shift');
				}
				else{
					$(this).removeClass("active");
					if(vType == 'vkb_all')
						IGRP_listKeyBval("#VKBaz_"+vRel,settings.vkball,vRel);
					else
						IGRP_listKeyBval("#VKBaz_"+vRel,vkb_az,vRel);
					IGRP_listKeyBval("#VKBnum_"+vRel,settings.vkbnum,vRel);
					$(this).val('SHIFT');
				}
			});
		}

		function IGRP_showAlpha(){
			if(vKbtype == 'vkb_aznum'){
				IGRP_listKeyBval("#VKBnum_"+vRel,settings.vkbnum);
				IGRP_listKeyBval("#VKBaz_"+vRel,settings.vkbaz);
			}else if(vKbtype == 'vkb_az'){
				IGRP_listKeyBval("#VKBaz_"+vRel,settings.vkbaz);
			}
			else if(vKbtype == 'vkb_num'){
				IGRP_listKeyBval("#VKBnum_"+vRel,settings.vkbnum);
			}else if(vKbtype == 'vkb_all'){
				IGRP_listKeyBval("#VKBnum_"+vRel,settings.vkbnum);
				IGRP_listKeyBval("#VKBaz_"+vRel,settings.vkball);
			}
		}

		function IGRP_toggleVkb(type){

			$(".VKB_main",VKB).not("#VKB_"+vRel).hide();

			IGRP_showAlpha();

			$("#VKB_"+vRel,VKB).toggle();
			
		}

		function IGRP_vkbReset(){
			$(".VKBLP_but",VKB).on("click",function(){
				$("#INP_"+vRel).val('');
			});
		}

        this.each(function(i,e){
        	var onInit = function(){
        		if (settings.oncancel) {
        			$('#VKBCAN_'+vRel,VKB).removeClass("hideItem");
        		}

        		if (settings.vkbonload){
        			IGRP_showAlpha();
        		}else{
        			$(".VKB_input",VKB).keypress(function(inp){
        				vRel = $(this).attr('rel');
        				vKbtype = $(this).parents('.VKB_geral').attr('vKbtype');
        				IGRP_toggleVkb();
        			});

        			$(".VKB_ctrl",VKB).on("click",function(vkb){

        				vRel = $(this).attr('rel');
        				vKbtype = $(this).parents('.VKB_geral').attr('vKbtype');

						IGRP_toggleVkb();
					});
        		}
        	};

        	var onok = function(){
        		if (settings.beforeok) {
        			settings.beforeok(e,vRel);
        		}

        		if (settings.onok) {
        			settings.onok(e,vRel);
        		}else{
        			$(".SHIFT_but",VKB).removeClass("active");
					$("#VKB_"+vRel,VKB).hide();
        		}

        		if (settings.afterok) {
        			settings.afterok(e,vRel);
        		}
        	};

        	var onCancel = function(){
        		if(settings.beforecancel){
        			settings.beforecancel(e,vRel);
        		}

        		if (settings.oncancel){
        			settings.oncancel(e,vRel);
        		}

        		if (settings.aftercancel){
        			settings.aftercancel(e,vRel);
        		}
        	};

        	$("#VKBOK_"+vRel,VKB).click(function(){
				onok();
			});

			$("#VKBCAN_"+vRel,VKB).click(function(){
				onCancel();
			});

        	$("html").on("click",function(evkb){
        		var vTarget = $(evkb.target);
				if( !vTarget.parents('.VKB_geral')[0] && !settings.vkbonload )
					$(".VKB_main",VKB).hide();
			});

        	onInit();
        	
        });


		IGRP_setInputVal();
		IGRP_shiftChange(settings.vkbaz,settings.vkbAZ);
        IGRP_vkbReset();
        return _this;
	};
})(jQuery);