$(function(){

	'use strict';

    var searcher = $('#searcher input'),

        lists    = $('.apps-col'),

        procs    = $('a',lists),

        clean    = $('.searcher-clean'),

        appsHolder = $('#igrp-apps-1'),

        searchResults = $('<div id="igrp-apps-1" class="igrp-home-search-res" style="display: none;"></div>').insertAfter(appsHolder);

        console.log( $.IGRP )
    
    var cleanResults = function(){
        
       searchResults.html('').hide();

       appsHolder.show();

    };

    searcher.on('keyup',function(){

      var text = $(this).val();

	    if(text.length >= 2){

	        var results = procs.filter(":contains('"+text+"')");

	        appsHolder.hide();

	        searchResults.html('');

	        results.parent().clone(true).appendTo(searchResults);

	        searchResults.show();

	    }else
	        
	        cleanResults();


    });

    clean.on('click',function(){
      
      cleanResults();

      searcher.val('');

    });

        

})