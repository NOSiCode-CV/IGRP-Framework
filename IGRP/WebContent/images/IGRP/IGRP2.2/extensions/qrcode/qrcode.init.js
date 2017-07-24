$(function() {
  $(".page").remove();
  var ch    = 29.7, cm = 37.8,
      htr   = $('#header',$('div[size="A4"]:first')).height(),
      cont  = 0;
  
  $('table.IGRP_table tbody tr').each(function(i,e){
    if(i == 0){
      htr += $(e).parents('table').prevAll('*').height();
    }

    htr += $(e).height();
    var vcm = ((htr/cm).toFixed(1)*1);
    vcm = vcm.toFixed(1)*1;
    cont +=1; 
    //vcm = vcm+1 >= 30 ? vcm + 10 : vcm;
    
    if(vcm >= ch){
     
      if($('tr:eq('+(cont)+')',$(e).parents('table'))[0]){
        
        cont = 0;
        var html = $(e).nextAll();
        //$(e).nextAll().remove();
        var obj = $('<table><thead></thead><tbody></tbody>');
        obj.addClass('IGRP_table default-table');
        $('tbody',obj).append(html);
        if($('thead tr',$(e).parents('table'))[0]){
          $('thead',obj).append($('thead tr',$(e).parents('table')).clone(!1));
        }

        var page = $('<div size="A4"><div id="header"></div><div id="content"></div><div id="footer"></div></div>');
        var pNext = $(e).parents('table').nextAll();
        if(pNext[0]){
          var page1 = $('<div size="A4"><div id="header"></div><div id="content"></div><div id="footer"></div></div>');
          $('#content',page1).append(pNext);
          $(e).parents('div[size="A4"]:first').after(page1);
        }
        $('#content',page).append(obj);
        $(e).parents('div[size="A4"]:first').after(page);
      }
      htr = 0;
    }
  });

  $('table.IGRP_table tbody tr td').each(function(i,f){
    $(f).html($(f).text());
  });

    //console.log(vh);
  var qrc = $('body > div.footer').clone(!1),
    vHead = $('div[size="A4"] #header').html();
      $('div[size="A4"] #footer').each(function(i,e){
        qrc = $('body > div.footer').clone(!1);
        $(e).html('');
        $(e).append(qrc);
      });
    $('body > div.footer').remove();

    $('div[size="A4"] #header').each(function(i,e){
      vHead = $('div[size="A4"] #header').html();
      $(e).html(vHead);
    });
    
  var options = {
    'size':100,
    'color':'#3a3',
    'text':qrcodeResult
  }; 

  $('div[size="A4"] #footer').each(function(i,e){
    $(containerQrcode, $(e)).empty().qrcode(options);
  });
  
});