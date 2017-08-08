(function(){

	var com = $.IGRP.component('tableCtrl',{

		init:function(){
			//IGRP_checkall
			$(document).on('change', 'table .IGRP_checkall', function() {
				var table    = $(this).parents('.table').first(),
					checkrel = $(this).attr('check-rel'),
					checkers = $('[check-rel="'+checkrel+'"]:not(.IGRP_checkall)',table),
					checkAll = $(this).is(':checked');

				checkers.prop('checked',checkAll).attr('checked',checkAll);
			});

		}

	},true);


})();
