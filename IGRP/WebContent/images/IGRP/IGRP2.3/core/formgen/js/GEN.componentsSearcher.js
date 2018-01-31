(function(){

	'use strict';

	var searchWrapper  = $('.gen-searcher-wrapper'),

		searcher 	   = $('.gen-types-search'),

		resultsWrapper = $('.gen-searcher-contents'),

		clearer 	   = $('.gen-type-search-clear'),

		contents	   = {

			components : {

				items : '#gen-list-components>ul>li',

				attr : 'name'

			},	

			fields     : {

				items : '#gen-list-fields>ul>li',

				attr : 'name'

			}	

		},

		delay = 250,

		delayTimer;

	function DrawResults(results){

		resultsWrapper.html('');

		var html = $('<div/>');

		results.forEach(function(r){

			var ul = $('<ul class="treeview-menu menu-open" style="display:block"/>');

			html.append('<h5>'+r.name+'</h5>');

			ul.append( r.items.clone(true) );

			html.append( ul );

		});

		resultsWrapper.html(html);

		ShowResults();

	}

	function ShowResults(){

		searchWrapper.parent().addClass('no-scroll');

		searchWrapper.addClass('searching');

		resultsWrapper.addClass('active');

		SetResultsWrapperHeight();

	};

	function Search(text){

		clearTimeout(delayTimer);

		if(text.length >= 1){

			delayTimer = setTimeout(function() {

				var results = [];
		      
		      	for(var c in contents){

					var content = contents[c],

						items   = $(content.items).filter(function(){

							return $(this).attr(content.attr).toLowerCase().indexOf( text.toLowerCase() ) > -1;

						});

					if(items[0])

						results.push({

							name : capitalizeFirstLetter( c ),

							items: items

						});

				}

				//if(results[0])
					
				DrawResults(results)

		    }, delay);

		}

		if(text.length == 0)
			
			ClearSearch();

	};	

	function ClearSearch(){

		searchWrapper.parent().removeClass('no-scroll');

		searchWrapper.removeClass('searching');

		resultsWrapper.removeClass('active').height(0);

		searcher.val('');

		resultsWrapper.html('');
	
	};

	function SetResultsWrapperHeight(){

		var wHeight = $(window).height();

		//55 - height of the fixed navbar
		//34 - height of the search input

		resultsWrapper.height( wHeight- (55+34) );

	};

	function SetEvents(){
		
		searcher.on('keyup',function(e,i){
			
			var val = $(this).val();

			Search(val);

		});

		clearer.on('click', ClearSearch);

		$.IGRP.on('windowResize',function(){

			console.log()

			if(resultsWrapper.hasClass('active'))

				SetResultsWrapperHeight();

		});

	};

	function Init(){

		SetEvents();

		console.log(  $.browser)

	};

	Init();

})();
