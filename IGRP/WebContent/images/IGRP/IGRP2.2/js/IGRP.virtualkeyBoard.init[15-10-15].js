// JavaScript Document
//NOSi 2014 - Edson Tavares

/* VKB*/
function IGRP_setKeyBval(alpha,id){
	var array 	= new Array();
	var qtd	= alpha.length;
	while (array.length < qtd) {
		var temp = alpha[Math.floor(Math.random()*qtd)];
		if ($.inArray(temp, array) == -1){
			array.push(temp);
		}
	}
	for (i = 1; i <= qtd; i++) {
		var btn = $("#btn"+array[i-1]+"."+id);
		btn.val(array[qtd-i]);
	}
}

function IGRP_listKeyBval(div,alpha,id){
	$(div).html("");
	for(var i = 0; i < alpha.length; i++){
		$(div).prepend("<input id='btn"+alpha[i]+"' type='button' class='VKB_button "+id+"' rel='"+id+"'/>");
	}
	IGRP_setKeyBval(alpha,id);
}

function IGRP_setInputVal(){
	$("body").on('click',"input.VKB_button",function(){
		var id = $(this).attr('rel');
		var input = $("#INP_"+id);
		input.val(input.val() + $(this).val());
	});
}

function IGRP_shiftChange(vkb_az,vkb_AZ){
	$("body").on("click",".SHIFT_but",function(){
		var id = $(this).attr('rel');
		if(!$(this).hasClass("active")){
			$(this).addClass("active");
			IGRP_listKeyBval("#VKBaz_"+id+"",vkb_AZ,id);
			$(this).val('abc');
		}
		else{
			$(this).removeClass("active");
			IGRP_listKeyBval("#VKBaz_"+id+"",vkb_az,id);
			$(this).val('ABC');
		}
	});
}

function IGRP_toggleVkb(id,vkb_num,vkb_az,v_type){
	$(".VKB_main").not("#VKB_"+id).hide();
	
	if(v_type == 'vkb_aznum'){
		IGRP_listKeyBval("#VKBnum_"+id+"",vkb_num,id);
		IGRP_listKeyBval("#VKBaz_"+id+"",vkb_az,id);
	}else if(v_type == 'vkb_az'){
		IGRP_listKeyBval("#VKBaz_"+id+"",vkb_az,id);
	}
	else{
		IGRP_listKeyBval("#VKBnum_"+id+"",vkb_num,id);
	}
	
	$("#VKB_"+id).toggle();
	
	$("#VKBOK_"+id).click(function(){
		$(".SHIFT_but").removeClass("active");
		$("#VKB_"+id).hide();
	});
	
	$("body").on("click","#VKBCAL_"+id,function(){
		$("#INP_"+id).val('');
	});
}


function IGRP_h_VirtualKeyBoard(){
	try{
		var vkb_az	= Array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
		var vkb_AZ 	= Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		var vkb_num = Array('0','1','2','3','4','5','6','7','8','9');
		$(".VKB_input").keypress(function(){
			var id = $(this).attr('rel');
			var v_type = $(this).attr('post');
			IGRP_toggleVkb(id,vkb_num,vkb_az,v_type);
		});
		
		$("body").on("click",".VKB",function(){
			var id = $(this).attr('rel');
			var v_type = $(this).attr('type');
			IGRP_toggleVkb(id,vkb_num,vkb_az,v_type);
		});
		
		IGRP_shiftChange(vkb_az,vkb_AZ);
		IGRP_setInputVal();
		
	}catch(e){null;}
}

$(function(){
	$("body").on("click",function(e){
		if(!$(e.target).hasClass("VKB") && !$(e.target).hasClass("VKB_img") && !$(e.target).hasClass("but") && !$(e.target).hasClass("VKB_button"))
			$(".VKB_main").hide();
	});
	IGRP_h_VirtualKeyBoard();
	
});