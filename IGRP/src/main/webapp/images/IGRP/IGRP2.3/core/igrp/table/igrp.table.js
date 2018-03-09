(function(){

	var com;

	var lang = document.cookie.split(';');
	$.IGRP.component('tableCtrl',{

		dataTable : function(options){

			var o = $.extend({

				selector 		: '.igrp-data-table',
				language 		: getCookie("igrp_lang")

			}, options);

			var tables = $(o.selector);

			if(tables[0] && $.fn.DataTable){

				tables.each(function(i,t){
					
					var legendBox = $(t).prev('.box-table-legend');
				
					$(t).DataTable({						
						language: {
				            url: path+'/core/igrp/table/datatable/language/'+o.language+'.json'				        
				        },
				        "order"  		: [],
						"columnDefs"	: [{
					      	"targets" 	: 'no-sort',
					      	"orderable" : false
					    }],
					    "lengthMenu": [[20, 50, -1], [20, 50, "All"]],
				        initComplete:function(){				        	
				        	if(legendBox[0])
				        		legendBox.prependTo($(t).parent());
				        
				        }

					});
					
				});

			}

		},

		setEvents : function(){

			//CheckAll
			$(document).on('change', 'table .IGRP_checkall', function() {
				var table    = $(this).parents('.table').first(),
					checkrel = $(this).attr('check-rel'),
					checkers = $('[check-rel="'+checkrel+'"]:not(.IGRP_checkall)',table),
					checkAll = $(this).is(':checked');

				checkers.prop('checked',checkAll).attr('checked',checkAll);
			});

		},

		init:function(){
			
			com = this;

			com.dataTable();
			
			com.setEvents();
			
		}

	},true);

	function getCookie(cname) {
	    var name = cname + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }	    
	    return "en_US";
	}
})();
