(function(){
   
    const sidebar = $('.app-menu');
    const searcher = $('.igrp-menu-search',sidebar);

    const Search = ()=>{
        const text = searcher.val();

        if(text.length > 1){
            //sidebar.find('.menu-wrapper').hide();
            //sidebar.find('.submenu-wrapper .nav-link').hide()
            const items = sidebar.find('.submenu-wrapper .nav-link').filter(':contains("'+text+'")');
            items.each( (i,item)=>{
                /*$(item).parents('.menu-wrapper').show();
                new bootstrap.Collapse($(item).parents('.menu-dropdown')[0], {
                    toggle: true
                });
                $(item).show();*/
            });
        }else{

        }

    }

    $.IGRP.component('sidebarComponent', {
        init : ()=>{
            searcher.on('keyup', Search)
        }
    }, true)

})();