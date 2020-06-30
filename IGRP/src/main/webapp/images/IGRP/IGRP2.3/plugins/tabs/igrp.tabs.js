//switch tab
(function(){
	
	var com;

	$.fn.Tab = function(action,options) {

		if(this[0] && this.hasClass('gen-tab-holder')){

			var tab   	 = this;

				name     = tab.attr('item-name'),

				ul 		 = tab.find('>ul.nav-tabs'),

				contents = tab.find('>.tab-content');

			var actions = {

				'get-active' : function(){

					var li 	 = ul.find('>li.active'),

						pane = contents.find('>.tab-pane.active');

					return {
						
						li   : li,

						pane : pane

					}

				},

				'activate' : function(id){

					$('a[href="#'+id+'"]').click();

				},

				'add-item' : function(o){

					var id = o.id || name+'_tabitem_'+new Date().getTime();

					if( $('a[href="#'+id+'"]')[0] ){

						actions.activate(id);

					}else{

						var tt = o.title || 'Tab',

							nm = o.name  ? ' item-name="'+o.name+'"' : '',

							nd = o.ident ? ' item-id="'+o.ident+'"' : '',

							ct = o.content ? typeof o.content == 'function' ? o.content() : o.content : '';

							li = $('<li '+nm+' '+nd+'><a data-toggle="tab" href="#'+id+'" data-toggle="tooltip" data-placement="bottom" title="'+tt+'">'+tt+'</a></li>'),

							bd = $('<div id="'+id+'" class="tab-pane"></div>');

						if(o.content){

							var content = typeof o.content === 'function' ? o.content() : o.content;

							bd.append(content);

						}

						if(o.attrs)

							li.attr( o.attrs );

						ul.append(li);

						contents.append(bd);
						
						if(o.active || $('li',ul).length == 1)

							actions.activate(id);

						if(o.callback)

							o.callback({

								li 	 : li,

								body : bd
								
							});

					}

				}

			};

			if(action && actions[action])

				return actions[action](options);

		};

	
    	
	};

	$('.gen-tab-holder>ul>li').on('igrp.rules.hide',function(){

		var rel 	  = $(this).attr('rel'),

			tabHolder = $(this).parents('.gen-tab-holder'),

			content   = $('.tab-pane[rel="'+rel+'"]',tabHolder);

		if(content.hasClass('active')){

			content.removeClass('active');

			$('>ul>li',tabHolder).filter(':visible').first().find('a').click();
		}

	});

	$.IGRP.component('tabcontent',{

		tabs : {

			list : {},

			set : function(el){
				
				var name = el.attr('item-name');

				com.tabs.list[name] = el;

			},

			get:function(name){
				
				return com.tabs.list[name];

			}

		},
		
		activeTabHasFieldsError : function(obj){
			
			var tab = obj.parents('.panel-collapse, .tab-pane');
			
			if(tab[0]){
				var pre   = tab.hasClass('panel-collapse') ? 'pnl-' : '',
					click = true;

					if(pre == 'pnl-'){
						if(tab.hasClass('in'))
							click = false;
					}

					if(click)
						$('[rel="'+pre+tab.attr('id')+'"] a[data-toggle]:first').click();
			}
		},

		storeActive:function(){

			$('.gen-tab-holder:not(.auto-control)').each(function(i,t){

				var activeBtn = $(t).find('>ul>li.active>a'),

					target     = activeBtn.attr("href"),

			 		item       = activeBtn.parent(),

			 		name       = item.attr('item-name'),

			 		tabcontent = $(t),

			 		tabname    = tabcontent.attr('item-name');

		 		$.IGRP.store.set({

		 			name  : $.IGRP.getPageInfo()+':'+tabname+':active',

		 			value : name

		 		});

			});

		},

		navbar:function(){

			$.each($('.gen-tab-holder[tab-template="navbar"]'),function(i,t){

				var btns = $('.nav-tabs a');

				$.each(btns,function(x,b){

					var rel    = $(b).attr('href'),
						
						tabRel = $(rel,t),

						childs  = $('.btns-holder>a',tabRel);

					if(childs.length>1)

						$(b).append('<i class="fa fa-caret-down"></i>');
					
				});	

			});
			
			$(document).on('click','.gen-tab-holder[tab-template="navbar"] .nav-tabs a',function(){
				
				var btn    	   = $(this),

					rel 	   = btn.attr('href'),

					t 	  	   = $(btn.parents('.gen-tab-holder[tab-template="navbar"]')[0]),

					clickable  = !t.hasClass('dont-click'),
						
					tabcontent = $('>.tab-content',t),

					reltab 	   = $(rel),

					_left 	   = btn.parent().position().left,

					childs 	   = $('.btns-holder>a',rel);

				tabcontent.hide();

				$('.nav-tabs a',t).not(btn).removeClass('open');

				if(clickable && childs.length == 1)

					$(childs).trigger('click');

				else{

					if(!btn.hasClass('open')){

						tabcontent.css('left',_left).show();

						btn.addClass('open')

					}else

						btn.removeClass('open')
					
				}

			});

			$(document).on('click',function(e){
				
				/*
				var target = $(e.target),

					isUl   = target.is('.gen-tab-holder[template="navbar"] ul'),

					isLi   =  target.is('.gen-tab-holder[template="navbar"] ul li a');

				console.log(isUl);

				console.log(isLi)
				*/
				 
			});

		},
		
		init:function(){

			com = this;

			com.events.declare(['tabActive']);

			com.on = com.events.on;

			$('body').on('shown.bs.tab','a[data-toggle="tab"]', function (e) {

				var target     = $( e.target ).attr("href"),

			 		item       = $( e.target ).parent();/*,

			 		name       = item.attr('item-name'),

			 		tabcontent = item.parents('.gen-tab-holder').first(),

			 		tabname    = tabcontent.attr('item-name'),

			 		autoctrl   = tabcontent.hasClass('auto-control');

			 	if(!autoctrl){	

			 		$.IGRP.store.set({

			 			name  : $.IGRP.getPageInfo()+':'+tabname+':active',

			 			value : name

			 		});

			 	}*/


			 	if(item.parents('.gen-tab-holder:first').hasClass('setpagetitle')){
					if($('.content-header h2')[0]){
						$('.content-header:first h2').text(item.text());
					}
				}

				$.IGRP.utils.createHidden({
					name:'p_fwl_'+item.parents('.gen-tab-holder').attr('item-name'),
					value: item.attr('item-name') ,
					class:'submittable menuCtrl'
				});

			 	com.events.execute( 'tabActive',target );

			});

			$.each($('.gen-tab-holder >.nav-tabs'),function(i,tab){
				
				var parent   = $(tab).parent(),

					parentName = parent.attr('item-name'),

					autoctrl = parent.hasClass('auto-control');

				if(!autoctrl){

					var activeName = $('[name="p_fwl_'+parentName+'"]').val() || $.IGRP.store.get($.IGRP.getPageInfo()+':'+parentName+':active'),

						activeTab  = activeName ? $('[item-name="'+activeName+'"]>a',tab) : $('li:first-child>a',tab);

					if(activeTab.is(':visible'))
						activeTab.click();

					else
						$(activeTab.parents('ul').first().find('li').filter(':visible')[0]).find('a').click();


					$.IGRP.store.unset($.IGRP.getPageInfo()+':'+parentName+':active');

					//$('[name="p_fwl_'+parentName+'"]').remove();

				}else{

					if( !$('li.active',tab)[0] )

						$('li:first-child>a',tab).click();
				}

			});

			$.IGRP.on('before-change',function(o){

				com.storeActive();
				
				return false;
			});

			$.IGRP.on('submit',function(o){

				if(!o.valid)
		
					$.IGRP.components.form.hasFieldsError();

				/*else{

					$('.gen-tab-holder:not(.auto-control)').each(function(i,t){

						var itemName = $(t).attr('item-name');

						$.IGRP.utils.createHidden({
							name:'p_fwl_'+itemName ,
							value: $('>ul>li.active',t).attr('item-name') ,
							class:'submittable'
						});

					});

				}*/
		
			});

			com.navbar();

		}

	},true);

})();
