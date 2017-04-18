(function(){
	if($.IGRP && !$.IGRP.components.contextMenu){
		var __ctxBodyClickSet = false;
		
		var _open = false;

		$('html').on('mouseup',function(e){
			var canClose = !$(e.target).hasClass('ctx-holder')    && 
						   !$(e.target).parents('.ctx-holder')[0] && 
						   !$(e.target).parents('.IGRP_contextmenu tbody tr')[0] && _open;
			if( canClose )
				$.IGRP.components.contextMenu.hide( $('.table-context-menu'));
		});


		$.IGRP.components.contextMenu = {
			set: function(h,p){
				var params = p ? p : {};
				var holder = h ? h : $(".box-table-contents");
				
				if(holder[0] && $('.table-context-menu',holder)[0]){

					var scope       = params.scope ? params.scope : '.IGRP_contextmenu tbody tr';
					var menu        = params.menu  ? params.menu  : '.table-context-menu';
					var setPosition = params.setPosition ? params.setPosition : $.IGRP.components.contextMenu.setPosition;
			
					var settings = $.extend({
						scope     : scope,
						menu      : menu,
						onContext : function(e){
							
							e.preventDefault();

							var row 		= $(e.currentTarget),
								vCtxMenu	= holder.find(settings.menu),
								menus   	= $('>li',vCtxMenu);
								
							$.IGRP.components.contextMenu.setRowMenu({
								row     : row,
								ctxMenu : vCtxMenu
							});

							if(menus.not('.ctx_hidden')[0]){
								
								setTimeout(function(){
									$.IGRP.components.contextMenu.show(vCtxMenu);	
									setPosition(e,{
										ctxMenu : vCtxMenu
									});
								},150)
								
							}
						},
						onItem    : null
					},p);

					holder.on("contextmenu",settings.scope,settings.onContext);

					if(settings.onItem && typeof settings.onItem  == 'function')
						holder.on('click',settings.menu,settings.onItem);

				}
			},
			show:function(vCtxMenu){
				_open = true;
				vCtxMenu.addClass('open');
			},
			hide:function(vCtxMenu){

				var menu = vCtxMenu ? vCtxMenu : $('.table-context-menu');
				
				if(menu[0])
					menu.removeClass('open');
				else
					$('.table-context-menu').removeClass('open');

				_open = false;
			},
			setPosition:function(e,p){
				var row 	   = $(e.currentTarget);
					vTable		= $(row.parents("table")[0]),
					vCtxMenu	= p.ctxMenu,

					vTableHeight= vTable.height(),
					vTableWidth	= vTable.width(),
					vBoxWidth   = 0, 
					vBoxHeight  = 0,
					vTabOffsetL = vTable.offset().left;  
				 	vTop 		= e.currentTarget.offsetTop + parseInt(e.currentTarget.offsetHeight/2),
				 	vLeft       = e.pageX-vTabOffsetL;

				vBoxWidth	= $('.ctx-holder',vCtxMenu).width();
				vBoxHeight	= $('.ctx-holder',vCtxMenu).height();

			 	if(vLeft+vBoxWidth > vTableWidth)
			 		vLeft = vLeft-vBoxWidth

				if(!vTable.attr("data-view") || (vTable.attr("data-view") && vTable.attr("data-view") == "list")){
					vCtxMenu
						.removeClass("active")
						.removeAttr('style')
						.css({left:vLeft,top:vTop})
				}
			},
			setRowMenu:function(p){

				var vTparam = 1*p.row.attr("CTX_PARAM_COUNT")+1,
				 	ctx_hidden = "", 
				 	v_param    = "", 
				 	vArray     = "",
					vParam     = "", 
					vCtxLink   = "", 
					vArrayLink = "";
					
				$("li",p.ctxMenu).removeClass("ctx_hidden");

				for(var i=1;i < vTparam;i++)
				{	
					v_param = p.row.attr("CTX_P"+i);

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

				 $("li",p.ctxMenu).each(function(){
					 var _this = $(this);
					
					if(($.inArray(_this.attr("trel"),vArray)!= -1))
						_this.addClass("ctx_hidden");

					vArrayLink.forEach(function(e,i){
						var vTrel = e.split("|");
						if(_this.attr("trel") == vTrel[0])
							$("a",_this).attr('href',vTrel[1]).removeAttr('fw_href');
					});
				 });

				 $.IGRP.components.contextMenu.setIGRPClick({
				 	ctxMenu:p.ctxMenu,
				 	params :vParam
				 });
			},
			setIGRPClick:function(p){
				p.ctxMenu.find('li').unbind('click').on('click',function(e){
					
					e.preventDefault();
					
					var a          = $("a",this),
						link       = $.IGRP.utils.getUrl( a.attr("fw_href") ? a.attr("fw_href") : a.attr("href") ),
						targetAttr = a.attr('target'),
						trgt 	   = targetAttr && $.IGRP.targets[targetAttr] ? targetAttr : '_blank';

					link+=p.params;

					$.IGRP.targets[trgt]({
						url   :link,
						target:trgt
					});

					return false; 	
				});
			}
		}

		$.IGRP.on('init',function(e){
		    $.IGRP.components.contextMenu.set();
		});
	}
}());

	







