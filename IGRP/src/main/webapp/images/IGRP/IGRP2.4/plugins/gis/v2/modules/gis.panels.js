(function(){

	GIS.module('Panels', function(dom){

		var id     = $(dom).attr('id');

		$('.gis-panel', dom).on('click','.btn[rel]', function(){

			var btn     = $(this),

				rel 	= btn.attr('rel'),

				panel   = btn.parents('.gis-panel').first();

			panel.toggleClass('open');

			btn.toggleClass('active');

			$.IGRP.store.set({

				name : 'GIS.PANELS:'+id+':'+rel,

				value : btn.is('.active')

			});

		});

		$('.gis-panel .btn[rel]', dom).each(function(){

			var rel = $(this).attr('rel'),

				active =  $.IGRP.store.get('GIS.PANELS:'+id+':'+rel) == 'true';

			//$(this).click();

		});

	});

})();