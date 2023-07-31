//(function(){
//	
//	function ConfigSubmit(){
//		
//		var btn = $('.toolsbar-holder[item-name="toolsbar_1"] a[target="submit"]');
//		
//		btn.on('click',function(e){
//			
//			e.preventDefault();
//			
//			var href   = btn.attr('href'),
//				form   = $.IGRP.utils.getForm(),
//				action = $.IGRP.utils.getSubmitParams(href),
//				params = form.serializeArray();
//		
//			try{
//				$.ajax({
//					method : 'POST',
//					url : action,
//					data : params,
//					dataType: 'json',
//					success:function(e){
//						
//						if(e && e.type == 'success' && e.codigo ){
//							
//							var parentFields = $('[name="formKey"],[name="p_formkey"]',window.parent.document.forms);
//								
//							parentFields.val(e.codigo);
//							
//							parentFields.each(function(i,f){
//								if(f.lookupCallback)
//									f.lookupCallback( $(f) );
//							});
//							
//							parentFields.trigger('change');
//							
//							window.parent.$.IGRP.components.iframeNav.hide();
//							
//						}else
//							$.IGRP.notify({
//								type : 'danger',
//								message : e ? e.message : 'Error!' 
//							});
//					},
//					error:function(){
//						$.IGRP.notify({
//							type : 'danger',
//							message :'Error!' 
//						});
//					}
//				});
//
//			}catch(err){
//				$.IGRP.notify({
//					type : 'danger',
//					message :'Error!' 
//				});
//			}
//				
//			
//			//$.post(action).the
//			
//			return false;
//		});
//		
//	};
//	
//	function SetSortable(){
//		
//		var formlist = $('#formlist_1'),
//		
//			tdCount  = $('tbody>tr:first-child>td',formlist).filter(function(){
//				return $(this).css('display') != 'none';
//			}).length;
//	
//		$('td[item-name="t_descricao_componente"]').each(function(i,td){
//			
//			var sortHandler = $(
//				'<div class="fl-sort-handler" style="position:absolute;right:8px;top:50%;margin-top:-9px;cursor:move"><i class="fa fa-bars"></i></div>'
//			);
//			
//			$(td).css({
//				'padding-right':'30px',
//				'position'     :'relative'
//			}).append(sortHandler);
//			
//		})
//		
//		$('tbody',formlist).sortable({
//	    	items : ">tr",
//	    	containment: "parent",
//	    	handle  : ".fl-sort-handler",
//	        axis: "y",
//	        tolerance: "pointer",
//	        helper: function(){
//	        	return $('<tr/>')
//	        },
//	        start:function(e,ui){
//	        	if(ui.placeholder.find('td').length > tdCount ){
//	        		ui.placeholder.find('td').each(function(i,td){
//	        			if(i >= tdCount)
//	        				$(td).hide();
//	        		});
//	        	}
//	        }
//	    });
//	}
//	
//	$(function(){
//		
//		ConfigSubmit();
//		
//		SetSortable();
//	});
//
//	
//})();