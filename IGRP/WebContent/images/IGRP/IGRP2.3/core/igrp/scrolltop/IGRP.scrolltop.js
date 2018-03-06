(function(){

	var scrollFunction = function(){

		if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) 
	        $('#igrp-go-up').show();
	    else 
	    	$('#igrp-go-up').hide(); 

	};

	$.IGRP.targets.scroll_to_top = {

		label : 'Scroll To Top',

		action : function(){
	
        	$('html').animate({"scrollTop": "0px"}, 350);

   			return false;
 		}
	};

	$(window).on('scroll',function(){
		scrollFunction();
	});

	$.IGRP.on('init',scrollFunction);


})();