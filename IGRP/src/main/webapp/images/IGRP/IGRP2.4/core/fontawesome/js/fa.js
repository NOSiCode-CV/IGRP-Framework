(function(){

	var DB    	 =  firebase.database(),

		faRef 	 = DB.ref("config/fontawesome"),

		order 	 = ['apps','chart','currency','directional','files','form','pay','editor','video','accessibility','brand','gender','hand','medical','spinner','transport'],
		
		searcher = $('#fa-icon-searcher'),

		set   	 = false,

		icons;

	$.IGRP.targets.saveFA = {

		action : function(){

			$.each($('table tbody>tr'),function(i,tr){

				var category  = $(tr).attr('category'),
					iconName  = $(tr).attr('icon-name'),
					iconLabel = $('input[name="p_descricao_fk"]',tr).val();

				icons[category][iconName].label = iconLabel;

			});

			save('',icons);

			return false;
		}
	};

	$.IGRP.targets.exportFA = {

		action : function(p){
			var iconsStr 	 = JSON.stringify(orderIcons()),
				dataStr 	 = "data:text/json;charset=utf-8," + encodeURIComponent(iconsStr),
				dlAnchorElem = document.getElementById('download-json');
				exp 		 = orderIcons();

			dlAnchorElem.setAttribute("href",     dataStr     );
			dlAnchorElem.setAttribute("download", "fa.icons.json");
			dlAnchorElem.click();
			
			return false;
		}
	};

	var save = function(p,v){

		var path  = p || '';

		firebase.database().ref('config/fontawesome'+p).set(v);
	};

	var orderIcons = function(){
		
		var exp = {};

		order.forEach(function(o){
			exp[o] = icons[o];
		});

		return exp;
	};

	var getTR = function(o){
		var tr = '<tr row="'+o.index+'" category="'+o.category+'" icon-name="'+o.name+'">'+
					'<input type="hidden" name="p_formlist_1_id" value="">'+
					'<td align="center" data-row="'+o.index+'" data-title="" class="img" item-name="fa_icon">'+
						'<input type="hidden" name="p_fa-icon_fk_desc" value="">'+
						'<div class="form-group" item-name="fa_icon" item-type="img">'+
							'<i style="font-size:20px;" class="fa '+o.value+'"></i>'+
						'</div>'+
					'</td>'+
					'<td align="" data-row="'+o.index+'" data-title="" class="text" item-name="descricao">'+
						'<input type="hidden" name="p_descricao_fk_desc" value="">'+
						'<div class="form-group" item-name="descricao" item-type="text">'+
							'<input type="text" name="p_descricao_fk" value="" class="text form-control" rel="F_formlist_1">'+
						'</div>'+
					'</td>'+
				'</tr>';

		return tr;
	};

	var getData = function(){

		faRef.once("value", function(res) {

			var index = 0;

			var data = res.val();

		 	icons = data;

		 	if(!set){
		 		
		 		for(var c in orderIcons()){

					var category = icons[c];

					//$('#fa-category-chooser').append('<span class="fa-category-item-wrapper"><input type="checkbox" class="fa-category-item value="'+c+'" checked="true"/><span>'+c+'</span></span>')

					for(var i in category){


						var icon = category[i]

							TR  = $(getTR({
								category : c,
								name     : i,
								label    : icon.label,
								value    : icon.value,
								index    : index
							}));

						$('table tbody').append(TR);

						(function(_c,_i){

							firebase.database().ref('config/fontawesome/'+_c+'/'+_i).on('value',function(v){
								
								var row   		= $( 'tr[category="'+_c+'"][icon-name="'+_i+'"]'),
									
									label 		= v.val().label,

									editing 	= v.val().editing,

									actionClss  = editing ? 'addClass' : 'removeClass';

								row[actionClss]( 'editing' );

								$( 'input[name="p_descricao_fk"]',row ).val( label );

								icons[_c][_i] = v.val();
							
							});

							//firebase.database().ref('config/fontawesome/'+_c+'/'+_i).update({ editing : false })

						})(c,i);

						index++;

					};

				}
		 		set = true;

		 	}else{
		 		
		 		console.log(icons);

				console.log('set')

			}

			$('html').removeClass('loading-data');

		}, function (errorObject) {

		 	console.log("The read failed: " + errorObject.code);

		});

	}();

	var setEvents = function(){

		searcher.on('keyup',function(){

			var search = $(this).val();

			if(search.length >1){

				$('table tbody tr').hide();

				$.each($('[name="p_descricao_fk"]'),function(i,d){

					if($(d).val().indexOf(search)!=-1){
						
						$(d).parents('tr').show();

					}

				});
			}else

				$('table tbody tr').show();


		});

		$(document).on('change','input[name="p_descricao_fk"]',function(){
		
			var tr 		 = $(this).parents('tr'),

				category = tr.attr('category'),

				name 	 = tr.attr('icon-name'),

				value 	 = $(this).val(),

				path 	 = '/'+category+'/'+name+'/label';

				save( path,value );

		});	

		$(document).on('focusin','input[name="p_descricao_fk"]',function(){
			
			var tr 		 = $(this).parents('tr'),

				category = tr.attr('category'),

				name 	 = tr.attr('icon-name'),

				path 	 = '/'+category+'/'+name+'/editing';

			tr.addClass('user-edit');

			save( path,true );

		});	

		$(document).on('focusout blur','input[name="p_descricao_fk"]',function(){
			
			var tr 		 = $(this).parents('tr'),

				category = tr.attr('category'),

				name 	 = tr.attr('icon-name'),

				path 	 = '/'+category+'/'+name+'/editing';

			tr.removeClass('user-edit');

			save( path,false );

		});	

		$(window).unload(function(){
		 	
		 	var tr 		 = $('tr.user-edit');

		 	if(tr[0]){

		 		var category = tr.attr('category'),

					name 	 = tr.attr('icon-name'),

					path 	 = '/'+category+'/'+name+'/editing';

				tr.removeClass('user-edit');

				save( path,false );
		 	}

		});

	}();

	

})();