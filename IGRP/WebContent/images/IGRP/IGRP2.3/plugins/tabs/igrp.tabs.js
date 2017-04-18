//switch tab
$(function(){
	if($.IGRP && !$.IGRP.components.tabcontent){
		$.IGRP.components.tabcontent = {
			events:{
				list:['tabActive'],
				tabActive:[]
			},
			on:function(event,callback){
				for(var i = 0; i < $.IGRP.components.tabcontent.events.list.length; i++){
					var declaredEvent = $.IGRP.components.tabcontent.events.list[i];
					if(event == declaredEvent)
						$.IGRP.components.tabcontent.events[event].push(callback);
				}
			},
			execute:function(ev,params){
				$.IGRP.components.tabcontent.events[ev].forEach(function(func){
					try{
						func(params);
					}catch(e){
						console.log(e);
					}
				});
			}
		}
	}

	$('body').on('shown.bs.tab','a[data-toggle="tab"]', function (e) {
	  var target = $(e.target).attr("href") // activated tab
	  $.IGRP.components.tabcontent.execute('tabActive',target);
	});

});
