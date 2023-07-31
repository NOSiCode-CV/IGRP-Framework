(function(){

	$.IGRP.on('init',function(){

		//get stored	
		var pageInfo = $.IGRP.getPageInfo(),

			panels 	 = $('.panel-group.gen-container-item');

		$(panels.find('>.panel>.collapse.in')).removeClass('in');

		if( panels[0] )

			panels.each(function(i,p){

				var name   = $(p).attr('item-name'),

					stored = $.IGRP.store.get(pageInfo+'::'+name);

				if(stored)

					$(p).find('.panel>.collapse#'+stored).addClass('in');	

			});

		//store when clicked
		$('.panel-group.gen-container-item>.panel>.collapse').on('shown.bs.collapse',function(){
		
			var panel 	   = $(this).parents('.panel-group.gen-container-item').first(),

				panelName  = panel.attr('item-name'),

				activeItem = $(this).attr('id');

			$.IGRP.store.set({

				name  : pageInfo+'::'+panelName,

				value : activeItem

			});

		});

		//remove stored when collapse
		$('.panel-group.gen-container-item>.panel>.collapse').on('hide.bs.collapse',function(){
			
			var panel 	   = $(this).parents('.panel-group.gen-container-item').first(),

				panelName  = panel.attr('item-name'),

				activeItem = $(this).attr('id');

			$.IGRP.store.unset( pageInfo+'::'+panelName );

		});
		
		$.IGRP.on('submit',function(o){

			if(!o.valid)
	
				$.IGRP.components.form.hasFieldsError();
		});

	})

	

})();