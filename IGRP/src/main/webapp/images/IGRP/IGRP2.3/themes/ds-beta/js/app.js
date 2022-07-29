(function () {

  const preserveSidebar = function () {
    $('body').removeClass('sidebar-off');
  }
  
  const setTime = ()=>{
    const option = {
      year: 'numeric',
      month: ('long'),
      day: 'numeric'
    };
    const locale = 'pt';
    const time = new Date().toLocaleDateString( locale, option);
    console.log(time);
    $('.igrp-welcome .time').text(time);
  }
  const removeUseNamerPrefix = ()=>{
    $('.app-username').each( function(){
      const text = $(this).text();

      if(text.indexOf(' - ') >=0 )
        $(this).text( text.split(' - ')[1] );
    } )
  
    
  }
  
  $.IGRP.on('init', function () {
    setTime();
    removeUseNamerPrefix();
    preserveSidebar();  

  });
  
  $.IGRP.onLoad = ()=>{
    console.log('igrp window load');
  }

})();

