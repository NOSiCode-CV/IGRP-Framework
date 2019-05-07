$(function(){

	$.IGRP.components.lookup = {
		
		setEvents:function(){
			//lookup popup open
			$('body').on('click','.IGRP_lookupPopup',function(e){
				e.preventDefault();
				var rel   = $(this).attr('input-rel');
				var ctxP  = $(this).attr("ctx_param");
				var href  = $(this).attr('href');
				var input = $('#'+rel);

				var lookupTarget = input.attr('lookup-target') ? input.attr('lookup-target') : false;
				
				var row = $(this).parents('tr')[0] || false;
				

				var iframeUrl = $.IGRP.components.lookup.getLookupUrl({
					url      : href,
					ctxParam : ctxP,
					lookUp   : $(this),
					target   : lookupTarget
				});
				
				if(row){
					
					iframeUrl+='&p_table_lookup_row='+$(row).index();
					
					$($.IGRP.components.iframeNav.modal).attr('formlist-lookup-row', $(row).index() );
					
				}

				$.IGRP.components.iframeNav.set({
					url       :iframeUrl,
					clicked   :$(this),
					beforeLoad:function(c){},
					complete  :function(){}
				});

				return false;
			});
			//parse value
			
		},
		getLookupUrl:function(p){
			try{
				var vParent = p.lookUp.parents('td:first').prop('tagName');
				var vParentId = p.lookUp.parents('tr:first').index();
			}catch(e){
				null;
			}
			
			var vNewLink = p.url;
			var v_fwl_search_copy = $.IGRP.utils.getParam(vNewLink, "p_fwl_search_copy");
		
			if(v_fwl_search_copy=="" || v_fwl_search_copy==null)
				v_fwl_search_copy = p.ctxParam;

			var vObj 	= (vParent == "TD") ? $("input[name='"+v_fwl_search_copy+"']",p.lookUp.parents('tr:first')):$("input[name='"+v_fwl_search_copy+"']");
			var vParam 	= $.IGRP.utils.sanitize( vObj.val() ) ;	

			vNewLink 	= (vParam != undefined) ? $.IGRP.utils.getUrl(vNewLink)+"p_fwl_search="+vParam:vNewLink;

			if(p.target)
				vNewLink = vNewLink+'&'+p.target+'='+vParam;

			var vNparam = "";
			
			try{
				vNparam = $.IGRP.utils.getParam(vNewLink, "p_fwl_copy_id");
				vNparam = (vNparam!=null && vNparam!="XXX") ? "p_id="+$("*[name='"+vNparam+"']").val():"";
			}
			catch(e) {
				console.log(e);
				null;
			}

			vNewLink = (vNparam != "") ? $.IGRP.utils.getUrl(vNewLink)+vNparam:vNewLink;
			
			try{
				vNewLink = (vParent == "TD") ? $.IGRP.utils.getUrl(vNewLink)+"p_fwl_form_idx="+vParentId:vNewLink;
			}catch(e){
				null;
			}

			return vNewLink;
		},
		lookupEraser : function(){
			$('body').on('click','.lookup-eraser',function(){
				var lookup = $('.IGRP_lookupPopup',$(this).parents('.input-group:first')),
					lclass = 'eraser-'+lookup.attr('input-rel');
				try{
					
					var param = $.IGRP.utils.url.getParam('jsonLookup',lookup.attr('href'));
					
					if(param){
						param = JSON.parse(decodeURIComponent(param));
						
						for(var name in param){
							$('[name="'+name+'"]').addClass(lclass);
						}

						$.IGRP.utils.resetFieldsSelector($("."+lclass)).each(function(){
							$(this).trigger('change');
						});
						
					}

				}catch(e){
					console.log(e);
					null;
				}
			});
		},
		init:function(){
			$.IGRP.components.lookup.setEvents();
			$.IGRP.components.lookup.lookupEraser();
		}
	}

	$.IGRP.components.lookup.init();
	//config click event
	
});