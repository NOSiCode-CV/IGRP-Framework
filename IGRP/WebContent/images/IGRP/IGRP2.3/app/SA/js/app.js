

var SA = {
	modules:{},

	module:function(name,o){
		
		SA.modules[name] = o;

		if(o.init) o.init();
	}
};

//SEARCH SERVICES
(function(){
	
	var searcher = $('#sa-service-searcher');
	var list     = $('#sa-service-list');

	SA.module('searchService',{
		init:function(){

			searcher.on('keyup',function(){
				var text = $(this).val();
				if(text.length > 1){
					var results = list.find("a:contains('"+text+"')");
					
					$('>.treeview',list).removeClass('active').hide();
					$('>.treeview a',list).hide();

					$.each(results,function(i,r){
						
						$(r).parent().show();

						$(r).show();

						if($(r).parents('.treeview-menu')[0]){
							$(r).parents('.treeview-menu').parent().show();
							$(r).parents('.treeview-menu').parent().find('>a').show();
							$(r).parents('.treeview-menu').show();
						}else{
							$(r).parent().find('.treeview-menu a').show();
							$(r).parent().find('.treeview-menu').show();
						}
					});

				}else{
					$('>.treeview',list).removeClass('active').show();
					$('.treeview-menu',list).hide();
					$('>.treeview a',list).show();
				}
				
			});

		}
	});

})();

//TIME tracker
(function(){
	var time = {
        h: 0,
        m: 0,
        s: 0
    };

    var tracker = null;

	SA.module('timeTracker',{
		init:function(){
			tracker = setInterval(function(){
		        // seconds
		        time.s++;
		        if(time.s >= 60)
		        {
		            time.s = 0;
		            time.m++;
		        }      
		        // minutes
		        if(time.m >= 60)
		        {
		            time.m = 0;
		            time.h++;
		        };

		        $("#hour").text(time.h < 10 ? '0' + time.h : time.h);
		        $("#minute").text(time.m < 10 ? '0' + time.m : time.m);
		        $("#second").text(time.s < 10 ? '0' + time.s : time.s);

		    }, 1000);
		}
	});
	
})();


//SAVE FAVORITES
(function(){
	
	var saveBtn    = $('#sa-save-favs')
		idOrganica = $('#p_id_organica').val(),
		idUser     = $('#p_user_id').val();
	
	saveBtn.on('click',function(e){
		e.preventDefault();
		if(!$(this).hasClass('savin')){
			var saveLink = $(this).attr('href'),	
				data     = SA.modules.favorites.getData(),
				params   = '?p_id_organica='+idOrganica+'&p_user_id='+idUser
				msg      = '';
			
			for(var id in data){
				var item = data[id];

				params+='&p_id_servico='+item.id+'&p_tipo_menu='+item.type;
			}

			$(this).addClass('savin');
			$.ajax({
				url: saveLink+params
			})
			.fail(function(e) {
				msg = 'Error!'
			})
			.always(function(e) {
				msg = e.msg;
				$.IGRP.notify({
					message : utils.htmlDecode(msg),
					type	: e.type
				});
				saveBtn.removeClass('savin')
			});
		}
		return false;
	});
})();


//PAUSE / FINISH ATENDIMENTO
(function(){
	$('.btn-toolbar').on('click',function(e){
		e.preventDefault();
		action 	= $(this).attr('action'),
		link 	= $(this).attr('href'),
		msg 	= '',
		type	= '';

		action  = action && action != undefined ? action.toLowerCase() : '';

		if(action != ''){
			link = link && link != undefined ? link : '';
			if(action == 'pause'){
				$.ajax({
					url:link
				})
				.fail(function(e){
					msg  = 'Not Found';
					type = 'danger';
				})
				.done(function(e){
					msg  = e.msg;
					type = e.type;
					if(type == 'success'){
						utils.callNsweb({
							"action" 	: 'stop',
							"p_iduser" 	: $('#p_user_id').val()
						});
						window.location.replace($('#p_voltar_inicio').val());
					}
				})
				.always(function(e){
					msg  = msg && msg != undefined ? msg : 'Error!';
					type = type && type != undefined ? type : 'danger';
					$.IGRP.notify({
						message : $.IGRP.utils.htmlDecode(msg),
						type	: type
					});
				});
			}else{
				/*utils.callNsweb({
					"action" 		: 'next',
					"p_iduser" 		: $('#p_user_id').val(),
					"p_attendance"	: $('#p_id_atendimento').val()
				});*/
				link = $.IGRP.utils.getUrl(link)+'p_action='+action;
				window.location.replace(link);
			}
		}
		return false;
	});
})();

//CLICK SERVICES ITEM
(function(){
	$('body').on('click','.btn-services',function(e){
		e.preventDefault();
		if(!$(e.target).hasClass('open-info')){
			var link  		= $(this).attr('href'),
				$parent 	= $(this).parents('.parent-services'),
				dataId 		= $parent.attr('data-id'),
				dataType 	= $parent.attr('data-menu-type'),
				urlFinish 	= $('#p_terminar_servico').val(),
				idAtend 	= $('#p_id_atendimento')[0]?$('#p_id_atendimento').val():null;

			if(idAtend && idAtend != undefined){
				urlFinish = urlFinish && urlFinish != undefined ? $.IGRP.utils.getUrl(urlFinish)+'p_id_servico='+dataId+'&p_tipo='+dataType:'';
				$.ajax({
					url:urlFinish
				})
				.fail(function(e){
					$.IGRP.notify({
						message : 'Not Found',
						type	: 'danger'
					});
				})
				.done(function(e){
					var type = e.type && e.type != undefined ? e.type : 'danger';
					if(type.toLowerCase() == 'success'){
						$.IGRP.components.iframeNav.set({url:link});
					}else{
						$.IGRP.notify({
							message : $.IGRP.utils.htmlDecode(e.msg),
							type	: type
						});
					}
				});
			}
		}
		return false;
	});

	$('body').on('click','.open-info',function(e){
		e.preventDefault();
		if($(e.target).hasClass('open-info')){
			//$('.btn-list-item .card .card-container span').removeClass('active');
			var $parent = $(this).parents('a'),
				h 		= $('.app-info',$parent).height() + 9;
			$('.app-info',$parent).css({bottom:- h});
			$('span',$parent).toggleClass('active');
		}
		return false;
	});
})();

//CALL NSWEB
(function(){
	if($('input[name="p_id_atendimento"]')[0]){
		var idAtend = $('#p_id_atendimento').val(),
			idUser 	= $('#p_user_id').val();

		if(idAtend && idAtend != undefined){
			utils.callNsweb({
				"action" 		: 'init',
				"p_iduser" 		: idUser, 
				"p_attendance"	: idAtend
			});
		}
	
		/*window.onunload = function(e) {
			e.preventDefault();
			$.ajax({
				url:$('#p_finish').val()
			});
			return;
		};	*/
	}
})();