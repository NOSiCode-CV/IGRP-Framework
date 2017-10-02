//switch tab
(function(){
	
	var com ;

	$.IGRP.component('tabcontent',{

		navbar:function(){

			$.each($('.gen-tab-holder[tab-template="navbar"]'),function(i,t){

				var btns = $('.nav-tabs a');

				$.each(btns,function(x,b){

					var rel    = $(b).attr('href'),
						
						tabRel = $(rel,t),

						childs  = $('.btns-holder>a',tabRel);

					if(childs.length>1)

						$(b).append('<i class="fa fa-caret-down"></i>');
					
				});
				

			});
			
			$(document).on('click','.gen-tab-holder[tab-template="navbar"] .nav-tabs a',function(){
				
				var btn    	   = $(this),

					rel 	   = btn.attr('href'),

					t 	  	   = $(btn.parents('.gen-tab-holder[tab-template="navbar"]')[0]),

					clickable = !t.hasClass('dont-click'),
						
					tabcontent = $('>.tab-content',t),

					reltab 	   = $(rel),

					_left 	   = btn.parent().position().left,

					childs 	   = $('.btns-holder>a',rel);

				tabcontent.hide();

				$('.nav-tabs a',t).not(btn).removeClass('open');

				if(clickable && childs.length == 1)

					$(childs).trigger('click');

				else{

					if(!btn.hasClass('open')){

						tabcontent.css('left',_left).show();

						btn.addClass('open')

					}else
						btn.removeClass('open')
					
				}

			});

		},


		init:function(){

			com = this;

			com.events.declare(['tabActive']);

			com.on = com.events.on;

			$('body').on('shown.bs.tab','a[data-toggle="tab"]', function (e) {

				var target     = $( e.target ).attr("href"),

			 		item       = $( e.target ).parent(),

			 		name       = item.attr('item-name'),

			 		tabcontent = item.parents('.gen-tab-holder').first(),

			 		tabname    = tabcontent.attr('item-name'),

			 		autoctrl   = tabcontent.hasClass('auto-control');

			 	if(!autoctrl){	

			 		$.IGRP.store.set({

			 			name  : $.IGRP.getPageInfo()+':'+tabname+':active',

			 			value : name

			 		});

			 	}

			 	com.events.execute( 'tabActive',target );

			});

			$.each($('.gen-tab-holder >.nav-tabs'),function(i,tab){
				
				var parent   = $(tab).parent(),

					autoctrl = parent.hasClass('auto-control');

				if(!autoctrl){
					
					var parentName = parent.attr('item-name'),

						activeName = $.IGRP.store.get($.IGRP.getPageInfo()+':'+parentName+':active'),

						activeTab  = activeName ? $('[item-name="'+activeName+'"]>a',tab) : $('li:first-child>a',tab);

						activeTab.click();
				}else{
					if( !$('li.active',tab)[0] )
						$('li:first-child>a',tab).click();
				}

			});

			com.navbar();

		}

	},true);

})();
