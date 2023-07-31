(function(){

	function SetTheme(color, text){

		var style = '#igrp-sidebar{ background: '+color+'!important }'+
					'[active-text-color].active, .active>[active-text-color]{ color : '+color+'!important }';
		
		if( !$('html>head>#igrp-custom-theme-css')[0] )

			$('html>head').append('<style id="igrp-custom-theme-css"/>')

		$('#igrp-custom-theme-css').html(style);
	}

	$.IGRP.component('themes',{
		
		init : function(){

			$('.igrp-theme-color').on('click',function(e){
				e.preventDefault();

				var theme = $(this),

					color = theme.attr('color'),

					text  = theme.attr('text-color');

				SetTheme( color, text );

				e.stopPropagation();

				return false;

			})

		}

	},true);


})()