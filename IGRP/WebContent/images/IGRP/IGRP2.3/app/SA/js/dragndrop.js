(function(){
	var droppedData = {};

	$.each($('#sa-favorites-list .btn-list-item'),function(i,f){
		var id = $(f).attr('data-id');

		var menu = $('#sa-service-list .treeview-menu li[data-id="'+id+'"]');

		menu.addClass('is-favorite');

		droppedData[id] = {
			type    : $(f).attr('data-menu-type'),
			element : f,
			menu    : menu
		};
		
	});

	$.each($('#sa-service-list .treeview-menu'),function(i,m){
		Sortable.create(m, {
			sort: false,
			handle:'.drag-handler',
			scroll:false,
			filter:'.is-favorite',
			group: {
				name: 'service',
				pull: 'clone',
				put: false
			},
			animation: 150,
			dragImage:true
		});
	});
	

	Sortable.create($('#sa-favorites-list')[0], {
		draggable:'.btn-list-item',
		scroll:false,
		group: 'service',
		animation: 150,

		onAdd:function(e){

			var id    = $(e.item).attr('data-id'),
				icon  = $(e.item).attr('data-icon'),
				href  = $('a',e.item).attr('href'),
				title = $('a span.card-text',e.item).text(),
				info  = $('a span.app-info',e.item).text(),
				type  = $(e.item).attr('data-menu-type');

			var html = $(getFavoriteHTML({
				id    : id,
				title : title,
				info  : info,
				href  : href,
				type  : type,
				icon  : icon
			}))[0];

			droppedData[id] = {
				type    : type,
				element : html,
				menu    : e.clone
			};

			$(e.item).replaceWith(html);

			$(e.clone).addClass('is-favorite');

		}

	});

	var countFavItem = function(t){
		var item 	= $('.btn-list-item').length,
			colmd 	= 2;

		item = t == 'add' ? item + 1 : item;

		if(item < 3){
			colmd = 6;
		}else if(item >= 3 && item <= 6){
			colmd = 4;
		}else if(item > 6 && item <= 8){
			colmd = 3;
		}else
			colmd = 2;

		$('.btn-list-item').each(function(){
			$(this).alterClass('col-md-*','col-md-'+colmd);
		});

		return colmd;
	};


	$('#sa-favorites-list').on('click','.sa-remove-favorite',function(){
		var parent = $(this).parent(),
			id     = parent.attr('data-id');

		
		parent.remove();

		$(droppedData[id].menu).removeClass('is-favorite');

		delete droppedData[id];
		countFavItem('remove');
		return false;
	});

	var getFavoriteHTML = function(p){
		var o = $.extend(true, {
			id	  : '',
			type  : '',
			icon  : 'file-o',
			title : 'Service Title',
			href  : '#'
		}, p),
		item = countFavItem('add');

		return '<div class="btn-list-item col-sm-3 col-xs-6 col-md-'+item+'" data-id="'+o.id+'" data-menu-type="'+o.type+'">'+
	 		'<a href="#" class="sa-remove-favorite"><i class="fa fa-times"></i></a>'+
	 		'<div class="card">'+
	 			'<a href="'+o.href+'" class="card-container" data-toggle="tooltip" title="'+o.title+'" target="_blank">'+
	 				'<div class="card-icon" style="background-image:url(\''+o.icon+'\')"></div>'+
					'<span class="card-text txt-ellipsis" bg-color="1"><i class="fa fa-plus-circle plus open-info"/>'+
					'<i class="fa fa-minus-circle minus open-info"/>'+o.title+'</span>'+
					'<span class="app-info" bg-color="1">'+o.info+'</span>'+
				'</a>'+
			'</div>'+	
		'</div>';
	}

	var resizeHeight = function(){
		var bodyP    = 45,
			navbarH  = 45,
			contentP = 35,
			menuH    = 45;

		$('#sa-favorites-list').height( $(window).height() - 190);
	}

	$(window).resize(resizeHeight)

	SA.module('favorites',{
		getData:function(){
			droppedData = {};
			$.each($('#sa-favorites-list .btn-list-item'),function(i,f){
				var id = $(f).attr('data-id');
				var menu = $('#sa-service-list .treeview-menu li[data-id="'+id+'"]');

				droppedData[i] = {
					type    : $(f).attr('data-menu-type'),
					element : f,
					menu    : menu,
					id 		: id
				};
				
			});
			return droppedData;
		}
	});

	resizeHeight();

})();