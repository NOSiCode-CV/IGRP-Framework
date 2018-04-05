(function(){
	
	function SetSortable(){
		
		var formlist = $('#formlist_1'),
		
			tdCount  = $('tbody>tr:first-child>td',formlist).filter(function(){
				return $(this).css('display') != 'none';
			}).length;
		
		$('td[item-name="t_descricao_componente"]').each(function(i,td){
			
			var sortHandler = $(
				'<div class="fl-sort-handler" style="position:absolute;right:8px;top:50%;margin-top:-9px;cursor:move"><i class="fa fa-bars"></i></div>'
			);
			
			$(td).css({
				'padding-right':'30px',
				'position'     :'relative'
			}).append(sortHandler);
			
		})
		
		$('tbody',formlist).sortable({
	    	items : ">tr",
	    	containment: "parent",
	    	handle  : ".fl-sort-handler",
	        axis: "y",
	        tolerance: "pointer",
	        helper: function(){
	        	return $('<tr/>')
	        },
	        start:function(e,ui){
	        	if(ui.placeholder.find('td').length > tdCount ){
	        		ui.placeholder.find('td').each(function(i,td){
	        			if(i >= tdCount)
	        				$(td).hide();
	        		});
	        	}
	        }
	    });
	}
	
	$.IGRP.on('init',function(){
		
		SetSortable();
	    
	    
	});
	
})();