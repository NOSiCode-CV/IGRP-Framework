(function(IGRP){

	var offClass   = 'sidebar-off',
		initState  = $.IGRP.store.get('igrp-sidebar') === 'true',
		sClass     = !initState ? offClass :'';
		
	$(function(){
		if(  !$('body').hasClass('fixed-sidebar')  )
			$('body').removeClass(offClass).addClass(sClass);
	});

	var sideBar = new IGRP.component('sideBar', {

		options : { },

		hide :function(){
			
			$('body').addClass(IGRP.components.sideBar.options.toggleClass);
			
			IGRP.events.execute('sideBarToggle', !$('body').hasClass(IGRP.components.sideBar.options.toggleClass));

			$(window).trigger('resize');

		},
		
		show :function(){

			$('body').removeClass(IGRP.components.sideBar.options.toggleClass);

			IGRP.events.execute('sideBarToggle', !$('body').hasClass(IGRP.components.sideBar.options.toggleClass));

			$(window).trigger('resize');

		},
		
		toggle : function(e){
	
			$('body').toggleClass(IGRP.components.sideBar.options.toggleClass);

			$.IGRP.store.set({
				name  : 'igrp-sidebar',
				value : !$('body').hasClass(IGRP.components.sideBar.options.toggleClass)
			});
			
			IGRP.events.execute('sideBarToggle', !$('body').hasClass(IGRP.components.sideBar.options.toggleClass));

			$(window).trigger('resize');

		},
		
		init:function(options){

			IGRP.events.declare(['sideBarToggle']);
			
			IGRP.components.sideBar.options = $.extend({

				controllerId : 'side-bar-ctrl',

				toggleClass  : offClass,

			},options);

			$('#'+IGRP.components.sideBar.options.controllerId+', .side-bar-ctrl').on('click',IGRP.components.sideBar.toggle);

		}

	},true);

})($.IGRP)