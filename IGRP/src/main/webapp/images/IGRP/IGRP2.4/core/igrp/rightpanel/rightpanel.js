(function(){
	
	var modal;

	$.IGRP.component('rightPanel',{

		set : function(p){
			
			//var modal 	 = $('#igrp-right-panel'),

			var iframe   = $('iframe',modal),

				n_iframe = iframe.clone(),
				
				close     = p.clicked && p.clicked.attr('close'),

				refParent = close && close.indexOf('refresh') >= 0;

			if (close && close.indexOf('refresh') >= 0)

				modal.attr('close', close);

			modal.addClass('loading');

			n_iframe.attr('src',p.url);

			n_iframe.bind('load',function(e){
		
				var contents = n_iframe.contents();

				contents.ready(function(){
					
					if($('body',contents)[0]){
						$('.iframe-nav-close',$(window.parent.document)).addClass('hidden');
						modal.removeClass('loading');
					}

						
	
				});

			});

			iframe.replaceWith(n_iframe);

			if(refParent)
				
				modal.attr('refresh-parent');
			

			modal.modal("show");

		},

		onHide : function(){
      			
  			var iframe = $('iframe',modal);

			//iframe.attr('src','');

			if (modal.attr('close') && modal.attr('close').indexOf('refresh') >= 0)

				$.IGRP.targets.closerefresh.action({
					
					type : modal.attr('close')
				
				})

			$('.iframe-nav-close',$(window.parent.document)).removeClass('hidden');

		},

		init: function(){

			modal = $('#igrp-right-panel');

			modal.on('hide.bs.modal', this.onHide);
		}

	},true);
  /*$.IGRP.on('init',function(){

    


  })*/

})();