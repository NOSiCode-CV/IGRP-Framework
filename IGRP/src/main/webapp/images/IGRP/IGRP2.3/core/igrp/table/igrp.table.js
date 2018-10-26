(function(){

	var com;

	var lang = document.cookie.split(';');
	
	var exportOptions = {

			pdf : {
	           extend          : 'pdfHtml5',
	           text            : '<i class="fa fa-file-pdf-o"></i> PDF',
	           titleAttr       : 'Exportar para PDF',
	           className 	   : 'btn btn-danger btn-xs',
	           exportOptions   : {
	               columns     : ':not(.igrp-table-ctx-th)'
	           },
	           customize: function (doc) {
	        	   console.log(doc)
	        	    doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
	           }
	       },

	       excel : {
	           extend          : 'excelHtml5',
	           text            : '<i class="fa fa-file-excel-o"></i> Excel',
	           titleAttr       : 'Exportar para Excel',
	           className 	   : 'btn btn-success btn-xs',
	           exportOptions   : {
	               columns     : ':not(.igrp-table-ctx-th)'
	           }
	       }

		};
	
	$.IGRP.component('tableCtrl',{

		dataTable : function(options){

			var o = $.extend({

				selector 		: '.igrp-data-table',
				language 		: getCookie("igrp_lang")

			}, options);

			var tables = $(o.selector);

			if(tables[0] && $.fn.DataTable){

				tables.each(function(i,t){
					
					var headerContents = $(t).parents('.box-table-contents').first().find('.table-contents-head'),

						tableTitle 	   = $(t).parents('.box').first().find('.box-title').text() || $('#gen-page-title').text(),

						exprts 		   = $(t).attr('exports'),

						options 	   = {

							dom: 'lfrtip',

							language: {

					            url: path+'/core/igrp/table/datatable/language/'+o.language+'.json'	

					        },
					        stateSave   : true,

					        order  		: [],

							columnDefs	: [{

						      	targets   : 'no-sort',

						      	orderable : false

						    }],

					        initComplete:function(){}

						};

					if(exprts){

						var expArr = exprts.split(',');

						options.buttons = [];

						expArr.forEach(function(e){

							var eOpts = exportOptions[e];

							if(eOpts){
								
								eOpts.title = tableTitle;

								options.buttons.push( eOpts );

							}
							
						});

						options.dom = 'lfBrtip';

					};

					var datatable = $(t).DataTable(options)

					$.IGRP.on('submit',function(o){

						datatable.destroy();

	            	});
					
				});

			}

		},
		
		setTableStyle : function(wrapper){
			
			wrapper = wrapper || $('.box-table-contents');
			
			wrapper.each(function(i,t){
				
				var legend = $(t).find('.box-table-legend');
				
				if(legend[0]){
					
					var itemName = $(t).attr('item-name'),
						
						style= '<style id="'+itemName+'">';
						
					legend.find('.legend-holder').each(function(i,l){
						
						var color = $(l).attr('legend-color'),
						
							value = $(l).attr('value');
						
						style+='[item-name="'+itemName+'"] table td.tdcolor span.tdcolor-item[value="'+value+'"] { background-color: '+color+' }'
						
					});
					
					style+='</style>';
					
					if(!$('html>head #'+itemName)[0])
						
						$('html>head').append(style);
					else
						$('html>head #'+itemName).html(style);
						
				
				}

			});
			
		},
		
		contextTHWidth : function(){

			$('th.igrp-table-ctx-th').each(function(i,th){

				var table   = $(th).parents('table').first(),

					tds     = table.find('tbody>tr').first().find('td.igrp-table-ctx-td'),

					buttons = tds.find('.table-ctx-holder>li'),

					mr 		= 4;//margin-right

				if(buttons.length>=3)

					$(th).css('width',128 );//.css('min-width',128)

				else

					$(th).width( (buttons.width()+mr) * buttons.length + 2)

			});

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
			
			$.IGRP.on('windowResize',function(){

            	com.contextTHWidth();

            });

		},

		init:function(){
			
			com = this;

			com.dataTable();
			
			com.setEvents();

		//	com.ordertable();

			com.setTableStyle();
			
			com.contextTHWidth();
			
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



