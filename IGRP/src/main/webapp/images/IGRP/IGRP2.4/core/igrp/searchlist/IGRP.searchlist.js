(function(){


	function Clear(){

	};

	function Search(){

		var input 	         = $(this),

			list  	         = $(input.attr('search-list')),

			searchParent     = input.attr('search-item-parent') || false,

			parents       	 = searchParent ? list.parents(searchParent) : null,

			searchWrapper    = input.attr('search-item-wrapper') || false,

			searchText       = replaceSpecialChars(input.val().toLowerCase()),

			clear 		     = function(){

				list.show();

				if(searchParent){

					list.parents(searchParent).show();

					if(searchWrapper)

						list.parents(searchWrapper).hide();


					//list.parents(searchParent).removeClass(searchParentClss);

				}

					

			};
			
			
		if(list[0]){

			if(searchText.length){

				var searchType   = input.attr('search-attr') ? 'attr' : 'selector',

					searchRef    = input.attr('search-attr') || input.attr('search-selector'),

					results;

				if(searchType == 'attr')

					results = list.filter(function(i){
						
						return (replaceSpecialChars($(this).attr(searchRef).toLowerCase())).indexOf(searchText) >=0;

					});

				else
					results = list.find( searchRef ).filter(function(i){

						return (replaceSpecialChars($(this).text().toLowerCase())).indexOf(searchText) >=0;

					});

				if(results[0]){

					if(parents){

						var resultParents = results.parents(searchParent);

						parents.not(resultParents).hide();

						resultParents.show();
						
					}

					list.not(results).hide();

					results.show();

					if(searchWrapper)
						
						list.parents(searchWrapper).show();

				}else{
					
					list.hide();

					if(parents)

						parents.hide();

				}

			}else{

				clear();

				//Clear();

			}
		}

	}


	$.IGRP.component('searchlist',{

		init:function(){

			$(document).on('keyup','.igrp-search-list',Search);

		}

	},true);

	function replaceSpecialChars( text ) {
                                                      
   		text = text.replace(new RegExp('[ÁÀÂÃ]','gi'), 'a');
    	text = text.replace(new RegExp('[ÉÈÊ]','gi'), 'e');
   		text = text.replace(new RegExp('[ÍÌÎ]','gi'), 'i');
    	text = text.replace(new RegExp('[ÓÒÔÕ]','gi'), 'o');
    	text = text.replace(new RegExp('[ÚÙÛ]','gi'), 'u');
    	text = text.replace(new RegExp('[Ç]','gi'), 'c');

    	return text;     
	}

})();
