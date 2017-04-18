(function ($) {
	if ($) {
		$.TV 				= {};
		$.TV.linkdata   	= $('#p_link').val() || window.location.href;
		$.TV.rating			= $('.rating');
		$.TV.imgrating		= $('.imgrating');
		$.TV.realizeService = $('.realizeService');
		$.TV.rateService 	= $('.rateService');
		$.TV.timeService	= $('.timeService');
		$.TV.interval 		= $('#p_interval').val()*1 || 30000;
		$.TV.oldData 		= {};

		$.TV.setData = function(o,v){
			o.stop().fadeOut("slow",function(){ 
                o.html(v);
            }).fadeIn("slow");
		};

		$.TV.getData = function(){
			setInterval(function(){
				$.ajax({
					url:$.TV.linkdata
				})
				.done(function(xml){
					if(xml){
						xml = $(xml).find('rows content');

						var rating 			= xml.find('media_classificacao_val value').text();
							imgrating 		= xml.find('hidden[name="p_link_img_media"]').text();
							realizeService 	= xml.find('total_atendimento_val value').text();
							rateService 	= xml.find('total_avaliado_val value').text();
							timeService 	= xml.find('media_tempo_val value').text();

						if (!$.TV.oldData.rating) {
							$.TV.oldData.rating 		= rating;
							$.TV.oldData.imgrating 		= imgrating;
							$.TV.oldData.realizeService = realizeService;
							$.TV.oldData.rateService 	= rateService;
							$.TV.oldData.timeService 	= timeService;

							$.TV.setData($.TV.rating,rating);
							$.TV.setData($.TV.realizeService,realizeService);
							$.TV.setData($.TV.rateService,rateService);
							$.TV.setData($.TV.timeService,timeService);
							$.TV.imgrating.fadeOut("slow").attr("src", imgrating).fadeIn("slow");

						}else{

							if ($.TV.oldData.rating != rating) {
								$.TV.setData($.TV.rating,rating);
								$.TV.oldData.rating = rating;
							}

							if ($.TV.oldData.realizeService != realizeService) {
								$.TV.setData($.TV.realizeService,realizeService);
								$.TV.oldData.realizeService = realizeService;
							}

							if ($.TV.oldData.rateService != rateService) {
								$.TV.setData($.TV.rateService,rateService);
								$.TV.oldData.rateService = rateService;
							}

							if ($.TV.oldData.timeService != timeService) {
								$.TV.setData($.TV.timeService,timeService);
								$.TV.oldData.timeService = timeService;
							}
							
							if ($.TV.oldData.imgrating != imgrating) {
								$.TV.imgrating.fadeOut("slow").attr("src", imgrating).fadeIn("slow");
								$.TV.oldData.imgrating = imgrating;
							}
						}
					}
				});
			},$.TV.interval);
		};

		$.TV.init = function(){
			$('body').click(function(e){
				if($.fullscreen.isNativelySupported()){
					$('html').fullscreen();
				}
			});
			
			$.TV.getData();
		};

		$.TV.init();
	}
}($));