(function(){
	
	var modal;

	$.IGRP.component('rightPanel',{

		set : function(p){

			var iframe   = $('iframe',modal),

				n_iframe = iframe.clone(),

				refParent = p.clicked.attr('close') == 'refresh';

			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close') == 'refresh')

				modal.attr('close','refresh');

			modal.addClass('loading');

			n_iframe.attr('src',p.url);

			n_iframe.bind('load',function(e){
		
				var contents = n_iframe.contents();

				contents.ready(function(){
					
					if($('body',contents)[0])

						modal.removeClass('loading');
	
				});

			});

			iframe.replaceWith(n_iframe);

			if(refParent)
				
				modal.attr('refresh-parent');
			

			modal.modal("show");

		},

		onHide : function(){
      			
  			var iframe = $('iframe',modal);

			iframe.attr('src','');

			if (modal.attr('close') && modal.attr('close') == 'refresh')

				$.IGRP.targets.closerefresh.action();

		},

		init: function(){

			modal = $('#igrp-right-panel');

			modal.on('hide.bs.modal', this.onHide);
		}

	},true);


})();