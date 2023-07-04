var WRControl = {
	blobToBase64 : function(blob){
	    var reader = new FileReader();
	    reader.readAsDataURL(blob); 
	    reader.onloadend = function() {
	        var iframe = $('<iframe/>');
	        iframe.attr('src',reader.result);

	        $('body').addClass('readypdf').html(iframe);
	    }
	},
	generatorPdf : function() {

	    var $divs   = $('div[size]'),  
	        total   = $divs.length,
	        obj 	= $($divs[0]),
	        width   = obj.width(),
	        height  = obj.height()+12,
	        layout  = obj.attr('layout');
	        current = 0;

	        total   = total -1;

	    var pdf     = new jsPDF(layout, "pt",[width,height]),
	        canvas  = pdf.canvas;

	    canvas.width  = width;
	    canvas.height = height;

	    var options = {
	        canvas:canvas,
	        allowTaint: true
	    };

	    function recursiveHtmlToPdf(current, total){
	        if(current < total){
	            current ++;

	            pdf.addPage([width,height]);

	            html2canvas($divs[current], options)
	                .then(function(canvas) {
	                   $($divs[current]).hide();
	                    recursiveHtmlToPdf(current, total);
	            });
	        }else
	            WRControl.blobToBase64(pdf.output("blob"));
	    }

	    html2canvas($divs[current], options)
	        .then(function(canvas) {
	            $($divs[current]).hide();
	            recursiveHtmlToPdf(current, total);
	    });
	},
	nl2br : function(el) {
	    var str = $(el).text().split(/\n/);
	    $(el).empty();
	    for (var i = 0 ; i < str.length ; i++) {
	        if(str[i] != '' && str[i] != null){
	            $(el).append('<span class="brl">'+str[i]+'</span>');
	        }
	    }
	    
	    return el;
	},
	recorsiveElement : function(cobj){
		$('>*:not(style)',cobj).each(function(i,e){
	    	var tagName = $(e).prop('tagName');
	        if(tagName != 'TABLE' || tagName != 'STYLE' || tagName != 'SPAN'){
	            if (!$('>*',e)[0])
	                $(e).html(WRControl.nl2br($(e)).html());
	            else{
	                WRControl.recorsiveElement($(e));
	            }
	        }
	    });
	},
	getHeight : function(el){
	    var vh = 0;
	    $(el).each(function(i,e){
	        if($(e).prop('tagName') != 'TABLE'){
	            vh += $(e).height();
	        }else{
	            $('tbody tr',$(e)).each(function(idx,tr){
	                if (idx == 0) 
	                    vh += $('thead tr',$(e)).height();

	                vh += $(tr).height();
	            });
	        }
	    });

	    return vh;
	},
	setHtml : function(page,html,htrx){
	    $('#content .holder',page).html(html);
	    $('div[size]:last').after(page);
	    
	    WRControl.recorsiveHtml($('#content .holder',page),htrx);
	},
	recorsiveHtml : function(obj,htrx){
	    var ch    = obj.parents('[size]').attr('height')*1, 
	    	cm 	  = 0.2645833333,
	        htr   = htrx,
	        cont  = 0;
	    
	    $('>*',obj).each(function(i,e){
	        var el  = $(e),
	            vcm = 0;

	        htr += WRControl.getHeight(el);
	        vcm  = Math.ceil(htr * cm);
	        
	        if(vcm >= ch){
	        	
	            var page    = $('div[size]:first').clone(!0),
	                prevAll = el.prevAll(),
	                nextAll = el.nextAll();

	            if (nextAll[0]) {

	                var vhax = htrx;
	                nextAll.each(function(i,elx){
	                    vhax += WRControl.getHeight($(elx));
	                });

	                if(Math.ceil(vhax * cm) >= ch){
	                    WRControl.setHtml(page,nextAll,htrx);
	                }
	                else{
	                	
	                	el.parents('#content .holder').append(nextAll);
	                }
	                	  
	            }

	            htr = htrx;
	        }
	    });
	},
	tableControl : function(htr){
		var obj   = $('div.page:first'),  
			ch    = obj.attr('height')*1, 
			cm 	  = 0.2645833333,
			size  = obj.attr('size') ? obj.attr('size') : 'A4',
      		htrx  = htr
      		cont  = 0,
      		str   = $('<div class="page" size="'+size+'" height="'+ch+'"><div id="header"></div><div id="content"><div class="holder"></div></div><footer></footer><div id="footer"></div></div>');
      	
      	$('#content .holder > table > tbody > tr').each(function(i,e){
      		if(i == 0){
                $(e).parents('table').prevAll('*').each(function(i,el){
                    htr += $(el).height();
                });  
            }

            cont +=1; 

            htr += $(e).height();

		    if(Math.ceil(htr * cm) >= ch){
		    	
		    	if($('tr:eq('+(cont)+')',$(e).parents('table'))[0]){
		    		cont 	 = 0;

        			var html = $(e).nextAll(),
        				vobj = $('<table><thead></thead><tbody></tbody>');

        			vobj.addClass('table table-striped WR-table');

        			if(html[0]){
        				$('> tbody',vobj).append(html);

        				if($('> thead > tr',$(e).parents('table'))[0]){
			        		$('> thead',vobj).append($('> thead > tr',$(e).parents('table')).clone(!1));
			        	}

			        	var page = $('<div class="page" size="'+size+'" height="'+ch+'"><div id="header"></div><div id="content"><div class="holder"></div></div><footer></footer><div id="footer"></div></div>'),
			        		next = $(e).parents('table').nextAll();

			        	$('#content .holder',page).append(vobj);
                        $(e).parents('div[size="'+size+'"]:first').after(page);

	        			if(next[0]){

                            var vhax = htrx;
                            next.each(function(i,el){
                                vhax += $(el).height();
                            });

                            if(Math.ceil(vhax * cm) >= ch){
                                var page1 = $('<div class="page" size="'+size+'" height="'+ch+'"><div id="header"></div><div id="content"><div class="holder"></div></div><footer></footer><div id="footer"></div></div>');
                                $('#content .holder',page1).append(next);
                                $(e).parents('div[size="'+size+'"]:first').after(page1);
                            }else
                                $('div[size="'+size+'"]:last #content .holder').append(next);
                        }

	        			htr = htrx;
        			}
		    	}
		    }
      	});

      	/*$('table.WR-table tbody tr td').each(function(i,f){
    		$(f).html($(f).text());
  		});*/
	},
	pageControl : function(){
		$("p.page").remove();

		var isIE    = window.navigator.msSaveOrOpenBlob,
			oFirst  = $('div[size]:first'),
        	content = $('#content .holder',oFirst),
        	htrx  	= $('#header',oFirst).height() + ( ($('#footer',oFirst).height() +30) *2);

        if(!isIE){
//        	$('body').addClass('isNotIE');
	        WRControl.recorsiveElement(content);

	        content.each(function(i,e){
	            WRControl.recorsiveHtml($(this),htrx);
	        });
        
			WRControl.tableControl(htrx);

			var head = $('div.page[size]:first #header').html();

		    $('div.page[size]:not(:first)').each(function(i,e){
		    	var qrc  = $('div.page[size]:first div#footer >*').clone(!1);	        
		        $('#footer',e).html(qrc);
		    });

		    $('div.page[size]').each(function(i,e){
		      	$('#header',e).html(head);
		    });

		    /*setTimeout(function() {
            	WRControl.generatorPdf();
        	}, 10);*/
	    }
	},
	qrcode : function(){
		$('div[size]').each(function(i,e){
			$(containerQrcode, $(e)).each(function(){
				
				var url     = $(this).attr('url'),
					options = {
						'size' : $(this).width(),
						'color': '#3a3',
						'text' : url ? url : qrcodeResult
					};

				$(this).empty().qrcode(options);

			});
  		});
	},
	init : function(){
		WRControl.pageControl();
		WRControl.qrcode();
	}
};

$(function() {
	WRControl.init();
});