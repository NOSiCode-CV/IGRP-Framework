(function(){

	var scrollFunction = function(){
		
		try{

			var _scrollTop = document.body &&  document.body.scrollTop ? document.body.scrollTop : document.documentElement.scrollTop || 0;

			if (_scrollTop > 300) 

		        $('#igrp-go-up').show();

		    else 

		    	$('#igrp-go-up').hide(); 

		}catch(err){

			return;

		}	
			

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