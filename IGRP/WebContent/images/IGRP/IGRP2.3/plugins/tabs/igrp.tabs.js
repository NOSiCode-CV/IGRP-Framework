//switch tab
(function(){
	
	var com ;

	$.IGRP.component('tabcontent',{

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

		}

	},true);

})();
