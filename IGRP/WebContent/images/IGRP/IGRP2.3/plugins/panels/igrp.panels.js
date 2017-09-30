(function(){

	$('.collapse').on('hidden.bs.collapse',function(){
		
		var style = $(this).attr('style');

		if(style){
			console.log(style);
		}

		$(this).removeAttr('style');

	});

})();