//switch tab
$(function(){
	$('body').on('click','.gen-tab-menu-h li',function(){
		var rel         = $(this).attr('rel');
		var holder      = $($(this).parents('.gen-tab-holder')[0]);
		var contentItem = $('> .gen-tab-contents-h > .gen-tab-c-item[rel="'+rel+'"]',holder);

		$('> .gen-tab-menu-h > li',holder).removeClass('active');
		$('> .gen-tab-contents-h > .gen-tab-c-item',holder).removeClass('active');

		$(this).addClass('active');
		contentItem.addClass('active');
	});
});
