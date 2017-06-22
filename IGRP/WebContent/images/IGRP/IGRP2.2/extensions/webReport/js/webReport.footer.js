$(function(){
  try{
    setTimeout(function(){
      var qrc = $('div.footer').clone(!1);
      $('page #footer').each(function(e){
        $(this).html(qrc);
      });

    },9100);
  }catch(e){console.log(e.description);null;}
});