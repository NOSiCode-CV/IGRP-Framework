(function(){

	var link1   = $('[name="p_set_organica"]').val(),
		link2   = $('[name="p_get_organica"]').val(),
		initBtn = $('#app-init'),
		interval;

	function setOrganicaLink(org){

		clearInterval(interval);
		
		var urlInit = initBtn.attr('href');
		
		initBtn.parent().removeClass('waiting');

		initBtn.attr('href', urlInit+'&p_id_organica='+org);

	}

	function setOrganica(){
		utils.callNsweb({
			"action" : 'getOrganica',
			"url"	 : link1
		});

		getOrganica();
		
	};

	function getOrganica (){
		var max = 10,
			i   = 0,
			org = null,
			msg = '';
		console.log(link2);
		interval = setInterval(function(){
			
			$.ajax({
				url:link2
			})
			.fail(function(e){
				msg = 'Not Found';
				$.IGRP.notify({
					message : msg,
					type	: 'danger'
				});
			})
			.done(function(e){
				
				if(e.p_msg == 'ok'){

					if(e.p_organica && e.p_organica != ''){

						org = e.p_organica;
			
						setOrganicaLink(org);
					}
				}else{
					msg = e.p_msg;
				}
			})
			.always(function(e){
				console.log(org);
			});

			if(i == max){
				clearInterval(interval);
				msg = msg && msg != undefined ? msg : 'Error!';
				$.IGRP.notify({
					message : utils.htmlDecode(msg),
					type	: 'danger'
				});
			}

			i++;

		},2000);
	};


	setOrganica();


})();