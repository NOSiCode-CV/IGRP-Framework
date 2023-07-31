// JavaScript Document
// NOSi 2014 - Edson Tavares UPDATE 11/11/2022

/* vkboard*/
(function($){
	$.fn.IGRP_vkboard = function(options){

		var defaults = {
			vkbonload		: false,
			onOk			: null,
			beforeOk		: null,
          	afterOk			: null,
			onCancel		: null,
			beforeCancel	: null,
          	afterCancel		: null,
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


        this.destroy = function(){
			$(document).unbind('click',`#vkbOk_${vRel}`);
			$(document).unbind('click',`#vkbCan_${vRel}`);
        }

		function IGRP_setVkb_main(type,rel){

			return `<div class="vkb_main ${type}" id="vkb_${rel}">
				<div class="vkb_num" id="vkbnum_${rel}">
					<div class="_clear"/>
				</div>
				<div class="vkb_az" id="vkbaz_${rel}">
					<div class="_clear"/>
				</div>
				<div class="_clear"/>
				<div class="vkb_btn">
					<input type="button" id="vkbOk_${rel}" class="vkbOk_btn btn-sm btn-success" value="OK"/>
					<input type="button" id="shift_${rel}" class="shift_btn btn-sm btn-primary" value="SHIFT" rel="${rel}"/>
					<input type="button" id="vkbCan_${rel}" class="vkbCan_btn btn-sm hidden" value="Cancelar"/>
					<input type="button" id="vkbLp_${rel}" class="vkbLp_btn btn-sm btn-danger" value="Limpar"/>
				<div class="_cliar"/>
				</div>
			</div>`
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

			$('.vkb_button',div).each(function(i,e){
				i+=1;
				$(e).val(array[qtd-i]);
			});
		}

		function IGRP_listKeyBval(div,alpha){
			$(div).html("");
			for(var i = 0; i < alpha.length; i++){
				$(div).prepend("<input id='btn"+alpha[i]+"' type='button' class='vkb_button "+vRel+" btn-sm' rel='"+vRel+"'/>");
			}
			IGRP_setKeyBval(alpha,vRel,$(div));
		}

		function IGRP_setInputVal(){
			VKB.unbind("click").on('click',"input.vkb_button",function(){
				var input = $("#inp_"+vRel);
				input.val(input.val() + $(this).val());
			});
		}

		function IGRP_shiftChange(vkb_az,vkb_AZ){
			$(".shift_btn",VKB).click(function(){

				var vType = $(this).parents('div.vkb_geral').attr('vkbtype');

				if(!$(this).hasClass("active")){
					$(this).addClass("active");

					if(vType == 'vkb_all')
						IGRP_listKeyBval("#vkbaz_"+vRel,settings.vkbALL,vRel);
					else
						IGRP_listKeyBval("#vkbaz_"+vRel,vkb_AZ,vRel);

					IGRP_listKeyBval("#vkbnum_"+vRel,settings.vkbNUM,vRel);
					$(this).val('shift');
				}
				else{
					$(this).removeClass("active");
					if(vType == 'vkb_all')
						IGRP_listKeyBval("#vkbaz_"+vRel,settings.vkball,vRel);
					else
						IGRP_listKeyBval("#vkbaz_"+vRel,vkb_az,vRel);
					IGRP_listKeyBval("#vkbnum_"+vRel,settings.vkbnum,vRel);
					$(this).val('SHIFT');
				}
			});
		}

		function IGRP_showAlpha(){
			if(vKbtype == 'vkb_aznum'){
				IGRP_listKeyBval("#vkbnum_"+vRel,settings.vkbnum);
				IGRP_listKeyBval("#vkbaz_"+vRel,settings.vkbaz);
			}else if(vKbtype == 'vkb_az'){
				IGRP_listKeyBval("#vkbaz_"+vRel,settings.vkbaz);
			}
			else if(vKbtype == 'vkb_num'){
				IGRP_listKeyBval("#vkbnum_"+vRel,settings.vkbnum);
			}else if(vKbtype == 'vkb_all'){
				IGRP_listKeyBval("#vkbnum_"+vRel,settings.vkbnum);
				IGRP_listKeyBval("#vkbaz_"+vRel,settings.vkball);
			}
		}

		function IGRP_toggleVkb(type){

			$(".vkb_main",VKB).not("#vkb_"+vRel).hide();

			IGRP_showAlpha();

			$("#vkb_"+vRel,VKB).toggle();
			
		}

		function IGRP_vkbOnOk(){

			const value = $("#inp_"+vRel).val();

			$(document).trigger('vkb:beforeOk', [{
				vkb : VKB
			}]);

			if (typeof settings.beforeOk === 'function') {
				settings.beforeok(value, VKB, vRel);
			}

			if (typeof settings.onOk === 'function') {
				settings.onOk(value, VKB, vRel);
			}else{

				$(".shift_btn",VKB).trigger('click');

				const vkbonload = VKB.is('[vkbonload]') && VKB.attr('vkbonload') === 'true' ? true  : settings.vkbonload;

				if(!vkbonload)
					$("#vkb_"+vRel,VKB).hide();
				else
					$("#inp_"+vRel).val('');
			}

			if (typeof settings.afterOk === 'function') {
				settings.afterok(value, VKB, vRel);
			}

			$(document).trigger('vkb:afterOk', [{
				vkb  : VKB,
				value: value
			}]);
		}


		function IGRP_vkbOnCancel(){
			if(typeof settings.beforeCancel === 'function'){
				settings.beforecancel(VKB,vRel);
			}

			if (typeof settings.onCancel === 'function'){
				settings.oncancel(VKB,vRel);
			}

			if (typeof settings.afterCancel === 'function'){
				settings.aftercancel(VKB,vRel);
			}
		}


		function IGRP_vkbReset(){
			$(".vkbLp_btn",VKB).on("click",function(){
				const val = $("#inp_"+vRel).val();

				$("#inp_"+vRel).val('');

				$(document).trigger('vkb:afterReset', [{
					vkb   : VKB,
					value : val
				}]);
			});
		}


		function IGRP_vkbEvents(){

			$(`#vkbOk_${vRel}`).on('click',function(){
				console.log('click')

				IGRP_vkbOnOk();
			});

			$(`#vkbCan_${vRel}`).on('click',function(){
				IGRP_vkbOnCancel()
			});

			$("html").on("click",function(evkb){
        		const vTarget = $(evkb.target).parents('.vkb_geral');
				
				if( !vTarget[0]){

					const vkbonload = VKB.is('[vkbonload]') && VKB.attr('vkbonload') === 'true' ? true  : settings.vkbonload;

					if(!vkbonload)
						$(".vkb_main",VKB).hide();
				}
			});
		}

        this.each(function(i,e){
			VKB 	= $(e);
			_this 	= e;
        	vRel 	= VKB.attr('rel');
        	vKbtype	= VKB.attr('vkbtype');

			VKB.addClass('init');
			
        	var onInit = function(){

				$(document).trigger('vkb:beforeInit', [{
					vkb : VKB
				}]);
				
				if(!$('.vkb_main',VKB)[0]){
					VKB.append(IGRP_setVkb_main(vKbtype,vRel));
				}

        		if (settings.oncancel) {
        			$('#vkbCan_'+vRel,VKB).removeClass("hidden");
        		}

				const vkbonload = VKB.is('[vkbonload]') && VKB.attr('vkbonload') === 'true' ? true  : settings.vkbonload;

        		if (vkbonload){
					
        			IGRP_showAlpha();

					VKB.addClass('show_vbk_onloadd');

        		}else{

        			$(".vkb_input",VKB).keypress(function(inp){
        				vRel = $(this).attr('rel');
        				vKbtype = $(this).parents('.vkb_geral').attr('vKbtype');
        				IGRP_toggleVkb();
        			});

        			$(".vkb_ctrl",VKB).on("click",function(vkb){

        				vRel = $(this).attr('rel');
        				vKbtype = $(this).parents('.vkb_geral').attr('vKbtype');

						IGRP_toggleVkb();
					});
        		}

				$(document).trigger('vkb:afterInit', [{
					vkb : VKB
				}]);
        	};

        	onInit();
        	
        });


		IGRP_setInputVal();
		IGRP_shiftChange(settings.vkbaz,settings.vkbAZ);
        IGRP_vkbReset();
		IGRP_vkbEvents();
        return _this;
	};
})(jQuery);

$(function(){
	$('.IGRP-vkb').IGRP_vkboard();
});