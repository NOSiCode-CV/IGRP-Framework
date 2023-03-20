(function(){

    let darkMode;

    const enableDarkMode = ()=>{

        darkMode.prop('checked', true).trigger('change');

    }

    const toggle = ()=>{

        var checked = darkMode.is(':checked');

        $('body').removeClass('dark-mode');

        if(checked)
            $('body').addClass('dark-mode');

        localStorage.setItem('igrp-dark-mode', checked);
    }

    const checkLoadingDelay = ()=>{
        setTimeout(()=>{
            if( $('body').hasClass('loading') || !$('html').hasClass('ready') ){
                $('.loading-wrapper .refresh-page').removeClass('d-none');
            }
           
        }, 12000)
    }

    const init = ()=>{

        checkLoadingDelay();

        darkMode.on('change', toggle );

        if(localStorage.getItem('igrp-dark-mode') === 'true')
            enableDarkMode();
    };
    
    $.IGRP.on('init', ()=>{

        darkMode = $('.dark-mode-toggle');

        init();
    })

})();