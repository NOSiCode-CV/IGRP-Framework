function tst(){
	alert('')
}
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

				var iframeUrl = $.IGRP.components.lookup.getLookupUrl({
					url      : href,
					ctxParam : ctxP,
					lookUp   : $(this),
					target   : lookupTarget
				});

				$.IGRP.components.iframeNav.set({
					url:iframeUrl,
					beforeLoad:function(c){},
					complete:function(){}
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
		init:function(){
			$.IGRP.components.lookup.setEvents();
		}
	}

	$.IGRP.components.lookup.init();
	//config click event
	
});