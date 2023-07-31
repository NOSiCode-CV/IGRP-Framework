(function(){

	var processMenu = $('#IGRP-process .process'),

		contents    = $('#IGRP-process-contents'),

		unboxeds    = $('>*:not(input,.gen-container-item)',contents);

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

		$.each( unboxeds , function(i,e) {

			elements.push( e );

			if( $(e).next().is('.gen-container-item') ) {

				setGroup(elements);

				elements = [];

			}
		
		});

		if(elements[0]){
			
			setGroup(elements);

			elements = [];
		}

	}();

	var checkEllipsis = function(){
		
		$.each($('.wiz-step'),function(){
			
			var $element = $(this);

				$c 		 = $element
			           		.clone()
			           		.css({display: 'inline', width: 'auto', visibility: 'hidden'})
			           		.appendTo('body');


			if( $c.width() > $element.width() && ($c.width() - $element.width()) > 3 ) {

			    var text = $('.txt-ellipsis',$element).text();

				$element.attr('data-title',text).attr('data-toggle','tooltip');

				$element.tooltip();

			}else
				$element.removeAttr('data-toggle').removeAttr('title');
			
			$c.remove();
			
		});
	};

	var configTab = function(){
		
		$('li[tab-process]').each(function(i,e){
			var rel 	= $(e).attr('rel'),
				panel 	= $('div.tab-process:eq('+i+')');

			panel.attr('id',rel).attr('rel',rel);

			if (i == 0)
				panel.addClass('active');  
		});

		if ($('#start-content')[0]) {
			var start = $('#start-content').clone(true);
			$('#start-content').remove();
			$('#IGRP-process-contents').prepend(start);
		}
	};

	var setEvents = function(){

		$.IGRP.on('windowResize',function(){
			checkEllipsis();
		});

		setTimeout(function(){
			checkEllipsis();
		},250)

	}();

	$.IGRP.on('init',function(){
		configTab();
		//configUnboxeds();
	});


})();
