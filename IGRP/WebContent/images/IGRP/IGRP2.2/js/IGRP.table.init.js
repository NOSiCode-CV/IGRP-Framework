// JavaScript Document dataTable init @NOSi 2014
var vWidth = '', vResTable = 780;
function IGRP_hideContexMenu(){
	$(".box-table table tbody tr.IGRP_contextMenu").removeClass("active");
	$(".contextMenu").removeClass("active");
}

/*Functions Checkall*/
function IGRP_h_checkall(){
	var table = '', name = '', celPos = '';
	$("body").on("click",".IGRP_checkall",function(){
		table 	= $(this).parents("table:first");
		name	= $(this).attr('name');
		celPos	= $(this).parent().index()*1;
		
		$("tbody tr",table).each(function(i, e){
            $(this).children("td:eq("+celPos+")").children("input[type='checkbox']").addClass(name);
        });
		$('input.'+name).not(this).prop('checked', this.checked).attr("checked",this.checked);
	});
}

function IGRP_ctxMenuClick(pObj){
	 pObj.pObjt.unbind("click").on("click","li",function(e) {
		e.preventDefault();
		var vObjA = $("a",$(this)),
			vNewLink = IGRP_getUrl(vObjA.attr("fw_href")?vObjA.attr("fw_href"):vObjA.attr("href"));
		vNewLink+=pObj.pParam;
		IGRP_clickControllers({pUrl:vNewLink,pTarget:vObjA.attr("target")});
		
		IGRP_hideContexMenu();
		return false;
    });
}

function IGRP_h_contextMenu(pObj){
	var vTparam = 1*pObj.pTr.attr("CTX_PARAM_COUNT")+1,
	 	ctx_hidden = "", v_param = "", vArray = "",
		vParam = "", vCtxLink = "", vArrayLink = "";
		
	$("ul#"+pObj.pObjt+" li").removeClass("ctx_hidden");
	
	for(var i=1;i < vTparam;i++)
	{
		v_param = pObj.pTr.attr("CTX_P"+i);
		if(v_param.match(/ctx_hidden/i)){
			ctx_hidden = v_param;
		}else{
			if (v_param.match(/ctx_link/i)) {
				vCtxLink = v_param;
			}
			else{
				if(i>1)
					vParam+="&";
						
				vParam+=v_param;
			}
		}
	 }
	 vArray 	= (ctx_hidden.substring(ctx_hidden.indexOf("=")+1)).split(",");

	 vArrayLink = (vCtxLink.substring(vCtxLink.indexOf("=")+1)).split(",");
	 

	 $("ul#"+pObj.pObjt+" li").each(function(){
		 var _this = $(this);
		if(($.inArray(_this.attr("trel"),vArray)!= -1))
			_this.addClass("ctx_hidden");

		vArrayLink.forEach(function(e,i){
			var vTrel = e.split("|");
			if(_this.attr("trel") == vTrel[0])
				$("a",_this).attr('href',vTrel[1]).removeAttr('fw_href');
		});
	 });
	 
	IGRP_ctxMenuClick({pObjt:$("ul#"+pObj.pObjt),pParam:vParam});
}

function IGRP_contexMenu(){
	$("body").on("click",function(e){!$(e.target).hasClass('ctxmenu')?IGRP_hideContexMenu():'';});
	
	$("table").on("contextmenu",".IGRP_contextMenu",function(e){
		e.preventDefault();
		IGRP_hideContexMenu();
		var vLeft 		= e.pageX,
			tr          = $(e.currentTarget),
		 	vTop 		= e.currentTarget.offsetTop + parseInt(e.currentTarget.offsetHeight/2),
			vTable		= $(e.currentTarget).parents("table");
			vObj		= vTable.attr("data-control"),
			vHeightDiv	= $(e.delegateTarget).height(),
			vWidthDiv	= $(e.delegateTarget).width(),vBoxWidth = 0, vBoxHeight = 0;
		
		IGRP_h_contextMenu({pTr:$(e.currentTarget),pObjt:vObj});
		
		vBoxWidth	= $("#"+vObj).width();
		vBoxHeight	= $("#"+vObj).height();
		vLeft		-= $(".divLeft")[0]?($(".divLeft").width()+10):5;
		vTop		= (vTop + vBoxHeight) >= vHeightDiv?(vTop - vBoxHeight):vTop;
		vLeft		= (vLeft + (vBoxWidth * 2)) > vWidthDiv?(vLeft - vBoxWidth):vLeft;
		
		if(vBoxHeight > 5){
			if(!vTable.attr("data-view") || (vTable.attr("data-view") && vTable.attr("data-view") == "list")){
				
				/*var dialog = vTable.parent().find('.contextMenu');
				var tableTop = vTable.offset().top;
				$("#"+vObj).removeClass("active").removeAttr('style').css({
					left:e.screenX-vTable.offset().left,
					top:tr.position().top + tr.height()/2
				}).addClass("active");*/

				$("#"+vObj).removeClass("active").removeAttr('style').css({left:vLeft,top:vTop}).addClass("active");
				$(e.currentTarget).addClass("active");
			}
		}
		else
			IGRP_hideContexMenu();
	});
}

function IGRP_h_controlTable(){
	$("table").on("click","tr td:first-child",function(e){
		var vObj = $(this).parents("tr:first"), vRole = vObj.attr('row'), vTag = $(e.target).prop('tagName');
		if(!$(e.target).hasClass("ctxmenu")){
			if(!$("td[data-row='"+vRole+"']",vObj).hasClass("active")){
				$("td",$(this).parents("table")).removeClass("active");
				$("td[data-row='"+vRole+"']",vObj).addClass("active");
			}else{
				if(vTag == "TD")
					$("td[data-row='"+vRole+"']",vObj).removeClass("active");
			}
		}
	});

	$(".table-container").on("click",".ctxmenu",function(e){
		var vTr 		= $(this).parents("*:first"), 
			vPar 		= (vTr.prop('tagName') == 'TD')?"table":'ul',
			vTable 		= $(this).parents(vPar), 
			vTableId 	= vTable.attr("data-control"),
			vTop 		= 0, 
			vHtable 	= vTable.height(), vBoxHeight = 0, 
			vBoxWidth 	= 0, vLft = 0, vCss = {}, vNtop = 0,
			vCelemente  = (vTr.prop('tagName') == 'TD')?vTr.parents('tr:first'):vTr.parents('li:first');

		IGRP_h_contextMenu({pTr:vCelemente,pObjt:vTableId});
		
		vBoxHeight	= $("#"+vTableId).height();
		vBoxWidth	= $("#"+vTableId).width()
		vTop		= e.currentTarget.offsetParent.offsetTop;
		vNtop		= vTop + e.currentTarget.clientHeight;

		vTop		= (vTop + vBoxHeight+10) >= vHtable?(vTop - vBoxHeight):vNtop;
		vCss		= {right:30,top:vTop};
		
		if(vTable.attr("data-view") && vTable.attr("data-view") != "list"){
			vLft = (vBoxWidth <= 148)?e.currentTarget.offsetParent.offsetLeft+vBoxWidth:
				e.currentTarget.offsetParent.offsetLeft+30;
			if(vTable.attr("data-view") == "slide"){

				vLft 	= e.currentTarget.offsetLeft+vBoxWidth;
				var _row = vTr.parents('li:first').attr('row')*1,
					trow = $('tbody tr',"table[data-control='"+vTableId+"']").length;
					
				if(_row == 1)
					vLft = e.currentTarget.offsetLeft - vBoxWidth;
				else if(_row == 2)
					vLft += (vBoxWidth/6);
				else if((trow - 1) == _row)
					vLft += vBoxWidth*2.9;
				else if(trow == _row)
					vLft += +((vBoxWidth*5)-(vBoxWidth/6));
				else
					vLft += vBoxWidth + (vBoxWidth/2.5);

				vNtop 	= vNtop + (vTr.height()-8);
			}
			if(vWidth > 500)
				vCss = {left:vLft,top:vNtop};
			else
				vCss = {right:30,top:vNtop};
		} 

		$("#"+vTableId).removeClass("active").removeAttr('style').css(vCss).addClass("active");
	});
	
	IGRP_contexMenu();
	IGRP_h_checkall();
	return false;
}


function IGRP_sly(p){
	var vObj = p.pObj.clone(!1);
	p.pObj.addClass('hideItem');
	if(!$('ul[data-control="'+p.pControl+'"]')[0]){
		var ul = $("<ul>"), 
			vSdiv = $('<div>').addClass('wrap').append('<div class="scrollbar"><div class="handle"><div class="mousearea"></div></div></div>'),
			vDiv = $('<div>').addClass('frame').attr('id','centered');

	    $("tbody tr",vObj).each(function(){
	        var li = $("<li>");
	        $.each($(this).prop("attributes"),function(){
	        	li.attr(this.name,this.value);
	        });
	        $("td", this).each(function(){
	            var div = $("<div>").html(this.innerHTML);
	            $.each($(this).prop("attributes"),function(){
	        		div.attr(this.name,this.value);
	        	});
	            li.append(div);
	        });
	        ul.append(li);
	    });
	    $.each(vObj.prop("attributes"),function(){
			ul.attr(this.name,this.value);
		});
		vObj.replaceWith(ul);
		vDiv.append(ul.addClass('slidee'));
	    vSdiv.append(vDiv).append('<div class="controls center">'+
				'<button class="btn prev"><</button>'+
				'<button class="btn next">></button></div>');
	    p.pObj.before(vSdiv);
	   
    }else
    	$('ul[data-control="'+p.pControl+'"]').parents('div.wrap:first').removeClass('hideItem');

   	var vVal = 250,
   		vMax = IGRP_maxHeightElement({pVal:vVal,pObj:$('ul[data-control="'+p.pControl+'"] > li')});
    if(vMax > vVal)
    	vDiv.height(vMax);

   IGRP_h_sly(p.pControl);
}

function IGRP_tableView(){
	$('table').each(function(e){
		if($(this).attr("data-view") && $(this).attr("data-view") == "slide")
			IGRP_sly({pObj:$(this),pControl:$(this).attr("data-control")});
		/*if($(this).attr("data-view") && $(this).attr("data-view") == "block"){
			hTableMasonry();
		}*/
	});
}

function IGRP_h_tableView(){
	$("body").on("click",".table-view .icon",function(){
		var vRel = $(this).attr("rel"), vDataControl = $(this).parents("div:first").attr("rel"),
			vObj = $("table[data-control='"+vDataControl+"']");
		$('.contextMenu').removeClass('active');
		$(".table-view .icon").removeClass("active");
		$(this).addClass("active");
		vObj.attr("data-view",vRel);

		/*if(vRel != 'block')
			tableMasonry.masonry('destroy');
		else 
			hTableMasonry();*/

		if(vRel == 'slide'){
			IGRP_sly({pObj:vObj,pControl:vDataControl});
		}
		else{
			if($('ul[data-control="'+vDataControl+'"]')[0])
				$('ul[data-control="'+vDataControl+'"]').parents('div.wrap:first').addClass('hideItem');

			vObj.removeClass('hideItem');
		}	
	});
}

function IGRP_h_sly(id){
	var frame = $("#centered");
	var wrap  = frame.parent('div.wrap:first');

	// Call Sly on frame
	frame.sly({
		horizontal: 1,
		itemNav:"centered",
		smart: 1,
		activateMiddle: 1,
		activateOn: 'click',
		mouseDragging: 1,
		touchDragging: 1,
		releaseSwing: 1,
		startAt:0,
		scrollBar: wrap.find('.scrollbar'),
		scrollBy: 1,
		speed: 300,
		elasticBounds: 1,
		easing: 'easeOutExpo',
		dragHandle: 1,
		dynamicHandle: 1,
		clickBar: 1,

		// Buttons
		prev: wrap.find('.prev'),
		next: wrap.find('.next')
	});
	/*frame.sly('on','load move',function(e){
		$("#"+id).removeClass("active").removeAttr('style');
	});*/
}
var tableMasonry = '';

function hTableMasonry(){
	var script = document.createElement('script');
	$(script).attr('src',path+'/js/masonry.pkgd.min.js');
	$("head").append(script);
	tableMasonry = $('table[data-view="block"] tbody').masonry();
}

$(function(){
	vWidth = $(window).width();
	$(window).resize(function(e) {
		vWidth = $(window).width();
		IGRP_tableView();
	});
	IGRP_h_tableView();
	IGRP_h_controlTable();
	IGRP_tableView();
});