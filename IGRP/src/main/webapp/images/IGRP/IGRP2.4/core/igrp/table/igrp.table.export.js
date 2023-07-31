$(function(){
	
	$(document).on('click','.table-export-options a',function(){
		var parent = $(this).parents('.table-box'),
			rel    = $(this).attr('rel');

		$('.dt-buttons a.dt-button.buttons-'+rel,parent).click();

		return false;
	});

	$.IGRP.component('tableExport',{
		
		init:function(t){

			var table 		= t ? t : $('table[exports]').not('[exports=""]'),

				exp   		= table.attr('exports') && table.attr('exports') != 'null' ? table.attr('exports').split(',') : [],
				
				fileTitle 	= $('.box-title',table.parents('.box'))[0] ? $('.box-title',table.parents('.box')).text() :
							  
							  $('.content .content-header')[0] ? $('.content .content-header:first').text() : $('title').text(),
				
				buttonsExp  = [];


			if (exp.length > 0) {

				exp.forEach(function(e){
					buttonsExp.push({extend : e, title : fileTitle});
				});
				
			}

			try{ table.destroy(); }catch(e){}

			try{
				table.DataTable({
				 	destroy: true,
					searching: false,
		            dom: 'Bfrtip',
		            ordering:false,
		            paging:false,
		            info:false,
		            buttons: buttonsExp
				});
			}catch(e){
				console.log(e)
			}
			
			
		}

	},true);


});

