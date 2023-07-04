(function($){

	if($ && $.IGRP){
		
		var contents    = $('#gen-form-contents>.box-body>[role="form"]'),

			unboxeds    = $('>*:not(input,.gen-container-item,.self-boxed-item)',contents);

		var setGroup = function(arr){
			
			var first = $( arr[0] ),

				idx   = $(arr[0]).index(),

				box   = $(
					'<div class="box igrp-forms gen-container-item " item-name="">'+
			            '<div class="box-body">'+
			            	'<div role="form"></div>'+
			            '</div>'+
			        '</div>'
				);

			if(first.hasClass('box-head subtitle')){
				
				box.prepend('<div class="box-header"><h3 class="box-title" text-color="primary">'+first.text()+'</h3></div>')
				
				first.addClass('hidden')
				 
			}	

			arr.forEach(function(a){

				$(a).appendTo( $('.box-body [role="form"]',box) );

			});

			if( box.find('.box-body [role="form"]>*').length == 1 && box.find('.box-body [role="form"]>*').first().hasClass('hidden'))
				box.addClass('hidden');
			

			contents.insertAt(idx,box);
		};

		var configUnboxeds = function(){

			var elements = [];

			console.log(unboxeds.length)

			$.each( unboxeds , function(i,e) {
				
				elements.push( e );

				if( $(e).next().is('.gen-container-item') || $(e).next().is('.self-boxed-item') ) {

					setGroup(elements);

					elements = [];

				}

				if(i == unboxeds.length-1 && elements[0]){
					
					setGroup(elements);

					elements = [];
				
				}

				
			
			});

		};

		$.IGRP.on('init',function(){

			configUnboxeds();

			//$.IGRP.targets._self.action = $.IGRP.targets.submit.action;
		});
	}
}($));
