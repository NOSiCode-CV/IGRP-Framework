(function($){
	if($ && $.IGRP && !$.IGRP.components.iframeNav){
		
		$.IGRP.components.iframeNav = {

			modal:'#igrp-iframe-nav',

			set  :function(p){

				var modal  = $($.IGRP.components.iframeNav.modal);

				var iframe = $('iframe',modal);
				
				if(p.url){

					modal.addClass('loadingmodal');
	
					var n_iframe = iframe.clone();

					n_iframe.attr('src',p.url);

					n_iframe.bind('load',function(e){
				
						modal.removeClass('loadingmodal');

						var contents = n_iframe.contents();
						
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
				var modal  = $($.IGRP.components.iframeNav.modal),
					iframe = $('iframe',modal);
				
				modal.modal('hide');
				iframe.attr('src','');

			},
			events:function(){
				$( $.IGRP.components.iframeNav.modal ).on('click','.iframe-nav-close',$.IGRP.components.iframeNav.hide);
			}
		} 
		
		$.IGRP.on('init',$.IGRP.components.iframeNav.events);
	}
}($));
