var wbControl = {
	pageControl : function(){
		$("p.page").remove();

		var ch    = 29.7, cm = 37.8,
			size  = $('div.page:first').attr('size') ? $('div.page:first').attr('size') : 'A4',
      		htr   = $('.head:first',$('div[size="'+size+'"]:first')).height(),
      		cont  = 0,
      		str   = $('<div class="page" size="'+size+'"><div class="head"></div><div class="content"></div><div class="footer"></div></div>');
      	
      	$('table.WR-table tbody tr').each(function(i,e){
      		if(i == 0)
      			htr += $(e).parents('table').prevAll('*').height();

      		htr += $(e).height();

		    var vcm = ((htr/cm).toFixed(1)*1);

		    vcm 	= vcm.toFixed(1)*1;
		    cont 	+= 1;

		    if(vcm >= ch){
		    	if($('tr:eq('+(cont)+')',$(e).parents('table'))[0]){
		    		cont 	 = 0;
        			var html = $(e).nextAll();

        			var obj  = $('<table><thead></thead><tbody></tbody>');
        			obj.addClass('table table-striped WR-table');

        			$('tbody',obj).append(html);

			        if($('thead tr',$(e).parents('table'))[0]){
			        	$('thead',obj).append($('thead tr',$(e).parents('table')).clone(!1));
			        }

			        var page = str,
			        	next = $(e).parents('table').nextAll();

        			if(next[0]){
			          	var page1 = str;
			          	$('#content',page1).append(next);
			          	$(e).parents('div.page[size="'+size+'"]:first').after(page1);
			        }

			        $('.content',page).append(obj);
        			$(e).parents('div.page[size="'+size+'"]:first').after(page);
		    	}
		    	htr = 0;
		    }
      	});

      	$('table.WR-table tbody tr td').each(function(i,f){
    		$(f).html($(f).text());
  		});

  		var qrc 	= $('div.page[size] div.footer .noprint').clone(!1),
		    head 	= $('div.page[size] .head').html();

	    /*$('div.page[size] .footer').each(function(i,e){
	        qrc = $('div.page[size] div.footer .noprint').clone(!1);
	        
	        $(e).html('');
	        $(e).append(qrc);
	        
	      });*/

	    $('div.page[size] .head').each(function(i,e){
	      	head = $('div.page[size] .head').html();
	      	$(e).html(head);
	    });
	},
	qrcode : function(){
		var options = {
	    	'size' : 100,
	    	'color': '#3a3',
	    	'text' : qrcodeResult
	  	}; 

	  	$('div[size="A4"] .footer').each(function(i,e){
    		$(containerQrcode, $(e)).empty().qrcode(options);
  		});
	},
	init : function(){
		wbControl.pageControl();
		wbControl.qrcode();
	}
};

$(function() {
	wbControl.init();
});