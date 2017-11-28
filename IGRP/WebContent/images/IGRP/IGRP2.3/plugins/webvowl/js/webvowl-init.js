(function () {
	var com;
	$.IGRP.component('webvowl',{
		init:function(){
			com = this;

			window.onload = webvowl.app().initialize;

			$('.lateralMenu').click(function(){
                var f = 9, t = 12;
                if ($(this).hasClass('active')) {
                    f = 12; t = 9;
                    $(this).removeClass('active');
                }else
                    $(this).addClass('active');
                
                $("#detailsArea").toggleClass('hidden');
                $("#canvasArea").alterClass('col-md-'+f,'col-md-'+t);
            });
		}
	},true);
})();