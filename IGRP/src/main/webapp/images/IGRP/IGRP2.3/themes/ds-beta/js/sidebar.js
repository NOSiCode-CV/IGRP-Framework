(function(){
    var toggleClss = 'show-sidebar',
        overlay,
        toggler,
        menuWrapper;
        
    
    const show = (e)=>{
        $('body').addClass(toggleClss);
    }
    
    const close = (e)=>{
        $('body').removeClass(toggleClss);
    }

    const setActiveMenu = (e)=>{
        $(e.target).parent().addClass('shadow')
    }

    const unsetActiveMenu = (e)=>{
        $(e.target).parent().removeClass('shadow')
    }

    const checkMenuSticky = (e)=>{
        console.log(  )
        const _$sticky = document.querySelector('.sidebar-collapse-wrapper')
        
        if( window.scrollY > 180 ){
            $(_$sticky).addClass('is-sticky')
        }else{
            $(_$sticky).removeClass('is-sticky')
        }
       /* const _$sticky = document.querySelector('.sidebar-collapse-wrapper')
        var currentOffset = _$sticky.getBoundingClientRect().top
        var stickyOffset = parseInt(getComputedStyle(_$sticky).top.replace('px', ''))
        var isStuck = currentOffset <= stickyOffset

        _$sticky.classList.toggle('js-is-sticky', isStuck)*/
    }


    const init = ()=>{
        checkMenuSticky();
        toggler.on('click', show);
        overlay.on('click', close)
        window.addEventListener('scroll', checkMenuSticky)
      
        //menuWrapper.on('show.bs.collapse', setActiveMenu);
        //menuWrapper.on('hide.bs.collapse', unsetActiveMenu)

        
        
    }

    $.IGRP.on('init', ()=>{
       toggler = $('.igrp-sidebar-collapse');
       overlay = $('.sidebar-overlay');
       menuWrapper = $('.sidebar-menu');
       init();
    })

})();