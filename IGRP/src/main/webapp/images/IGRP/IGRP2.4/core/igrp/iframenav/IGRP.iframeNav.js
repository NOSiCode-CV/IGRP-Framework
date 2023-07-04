(function($){
	if($ && $.IGRP && !$.IGRP.components.iframeNav){
		
		$.IGRP.components.iframeNav = {

			modal:'#igrp-iframe-nav',

			set  :function(p){

				var modal  = $($.IGRP.components.iframeNav.modal);

				var iframe = $('iframe',modal);
				
				if(p.url){

					modal.addClass('loadingmodal');
					
					if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close') == 'refresh')
						
						modal.attr('close','refresh');
	
					var n_iframe = iframe.clone();

					n_iframe.attr('src',p.url);

					n_iframe.bind('load',function(e){
				
						modal.removeClass('loadingmodal');

						var contents = n_iframe.contents();
						
						if(p.params)
							
							contents[0].IGRPParams = p.params;

						if(p.beforeLoad)
							
							p.beforeLoad(contents);

						if(p.complete){

							contents.ready(function(){ //wait till page is ready;
								
								if($('body',contents)[0]){//hack - page is ready now!
									try{
										p.complete(contents);
									}catch(e){
										console.log(e);
									}
									//modal.removeClass('loading');
								}
							});

						}
					});

					iframe.replaceWith(n_iframe);
				}

				modal.modal('show');
			},
			hide:function(){
		
				$($.IGRP.components.iframeNav.modal).modal('hide');

			},

			onHide : function(){
				
				var modal  = $($.IGRP.components.iframeNav.modal),

					iframe = $('iframe',modal);

				iframe.attr('src','');
				
				if (modal.attr('close') && modal.attr('close') == 'refresh')
					$.IGRP.targets.closerefresh.action();

			},

			events:function(){
				
				$( $.IGRP.components.iframeNav.modal ).on('click','.iframe-nav-close',$.IGRP.components.iframeNav.hide);
				
				$( $.IGRP.components.iframeNav.modal ).on('hide.bs.modal',$.IGRP.components.iframeNav.onHide);

			}
		} 
		
		$.IGRP.on('init',$.IGRP.components.iframeNav.events);
	}
}($));
