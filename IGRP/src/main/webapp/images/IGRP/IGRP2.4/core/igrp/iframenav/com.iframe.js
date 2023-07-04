(function(){
	
	var com;

	$.IGRP.component('iframes',{

		setHeight:function(holder){

			var iframe = holder.find('iframe');

			//setTimeout(function(){

				var height = $('body',iframe.contents()).height() + 50;

//				console.log(height);

				iframe.height( height );


			//},150);
		},

		setEvents:function(holder){
			
			var iframe = $('iframe',holder);

			iframe.bind('load',function(e){
	
				try{
					
					var contents = $(iframe).contents();

					$('body',contents).addClass('iframe-nav-holder');

					contents.ready(function(){

						setTimeout(function(){

							var height = $('body',contents).height() + 50;

							iframe.height( height );

							com.showContents( $(holder) );

						},150);
						

					});

				}catch(ex){

					com.showContents( $(holder) );
					
					null;
				}

				iframe[0].contentWindow.onbeforeunload = function () {
					$.IGRP.utils.loading.show( $(holder) );
				};
		
			});
		},

		showContents:function(holder){

			setTimeout(function(){

				$.IGRP.utils.loading.hide( holder );

			},300);

		},

		init:function(parent){
			
			com = this;

			var igrpIframes = parent && parent.hasClass('igrp-iframe') ? parent : $('.igrp-iframe',parent);

			$.each( igrpIframes ,function(i,holder){
	
				com.setEvents( holder );
				
				if (!$('body').attr('view'))
					$.IGRP.utils.loading.show( $(holder) );

				$(window).resize(function(){
					com.setHeight($(holder))
				});
			});

			if($.IGRP.components.tabcontent)
				$.IGRP.components.tabcontent.on('tabActive',function(id){
					var target = $(id);
					com.setHeight(target);
				});


		}

	},true);

})();