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

			var menuParent = $.IGRP.store.get('igrp-sidebar-menu-parent') || false,

				menuItem   = $.IGRP.store.get('igrp-sidebar-menu-item') || false,

				item       = $('#igrp-sidebar [item-id="'+menuItem+'"]'),
				
				parent = $('#igrp-sidebar [parent-id="'+menuParent+'"]>a');
			
			if(item[0])
				item.addClass('active');
			
//			console.log(item)

			if(parent[0]){

				$('#igrp-sidebar').stop().animate({

					scrollTop : parent.parent().offset().top

				}, '150', 'swing');

				parent.click();

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