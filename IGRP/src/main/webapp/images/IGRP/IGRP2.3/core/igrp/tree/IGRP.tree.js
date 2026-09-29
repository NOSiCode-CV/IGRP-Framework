(function(){

	if($.IGRP && !$.IGRP.components.tree){
		
		$.IGRP.components.tree = function (menu,o) {
			var _this = this;

			var options = $.extend(true, {
				animationSpeed: 600
			}, o);
			
			$(document).on('click', menu + ' li a', function (e) {
			  //Get the clicked link and the next element
			  var $this = $(this);
			  var checkElement = $this.next();
			  //Check if the next element is a menu and is visible
			  if ((checkElement.is('.treeview-menu')) && (checkElement.is(':visible'))) {
			    //Close the menu
			    checkElement.slideUp(options.animationSpeed, function () {
			      checkElement.removeClass('menu-open');
			    });
			    checkElement.parent("li").removeClass("active");
			  }
			  //If the menu is not visible
			  else if ((checkElement.is('.treeview-menu')) && (!checkElement.is(':visible'))) {
			    //Get the parent menu
			    var parent = $this.parents('ul').first();
			    //Close all open menus within the parent
			    var ul = parent.find('ul:visible').slideUp(options.animationSpeed);
			    //Remove the menu-open class from the parent
			    ul.removeClass('menu-open');
			    //Get the parent li
			    var parent_li = $this.parent("li");
			    //Open the target menu and add the menu-open class
			    parent_li.addClass('active');
			    checkElement.slideDown(options.animationSpeed, function () {
			      //Add the class active to the parent li
			      checkElement.addClass('menu-open');
			      parent.find('li.active').not(parent_li).removeClass('active');
			      
			    });
			  }
			  //if this isn't a link, prevent the page from being redirected
			  if (checkElement.is('.treeview-menu')) {
			    e.preventDefault();
			  }
			});		
			
			$(document).on('click', menu + ' ul li a', function(){

				var parent = $(this).parents('.treeview-menu').parent().attr('parent-id'),
					item   = $(this).attr('item-id');
				

				if(parent)
					$.IGRP.store.set({
						name  : 'igrp-sidebar-menu-parent',
						value : parent
					});
				
				if(item)
					$.IGRP.store.set({
						name  : 'igrp-sidebar-menu-item',
						value : item
					});

				return true;

			});	
		};

		var activateMenu = function(){

			var currentUrl = window.location.href.split('#')[0];
			var item = $('#igrp-sidebar .nav-sidebar a[item-id]').filter(function(){
				return this.href.split('#')[0] === currentUrl;
			}).first();

			if(item.length){
				item.addClass('active').attr('aria-current', 'page');
				var parent = item.closest('.nav-sidebar > li');
				var submenu = item.closest('.treeview-menu');
				parent.addClass('active');
				if(submenu.length){
					$('#igrp-sidebar').stop().animate({
						scrollTop : parent.offset().top
					}, '150', 'swing');
					if(!submenu.is(':visible')){
						parent.children('a').click();
						submenu.promise('fx').done(function(){
							item.addClass('active');
						});
					}
				}
			}

			$.IGRP.store.unset('igrp-sidebar-menu-parent');
			$.IGRP.store.unset('igrp-sidebar-menu-item');

		}

		$.IGRP.on('init',function(){

			$.IGRP.components.tree('.tree-list');

			activateMenu();

		});

	}

})($)
