(function(){

	let com;

	const lang = document.cookie.split(';');

	const stripHtml = function (html) {
		const tmp = document.createElement("DIV");
		tmp.innerHTML = html;
		const str = tmp.textContent || tmp.innerText || "";

		return $.trim(str);
	};

	const exportOptionsFormat = function (data, node) {
		return $('.table-info-group-main', $(node))[0] ? $('.table-info-group-main', $(node)).text() : stripHtml(data);
	};

	const exportOptions = {

		pdf: {
			extend: 'pdfHtml5',
			text: '<i class="fa fa-file-pdf-o"></i> PDF',
			titleAttr: 'Exportar para PDF',
			className: 'btn btn-danger btn-xs',
			exportOptions: {
				columns: ':not(.igrp-table-ctx-th)',
				format: {
					body: function (data, row, column, node) {
						return exportOptionsFormat(data, node);
					}
				}
			},
			customize: function (doc) {
				const tcontent = doc.content[1] || doc.content[0];

				if (tcontent && tcontent.table)
					tcontent.table.widths = Array(tcontent.table.body[0].length + 1).join('*').split('');
			}
		},

		excel: {
			extend: 'excelHtml5',
			text: '<i class="fa fa-file-excel-o"></i> Excel',
			titleAttr: 'Exportar para Excel',
			className: 'btn btn-success btn-xs',
			exportOptions: {
				columns: ':not(.igrp-table-ctx-th)',
				format: {
					body: function (data, row, column, node) {
						return exportOptionsFormat(data, node);
					}
				}
			}
		}

	};

	$.IGRP.component('tableCtrl',{
		ordertable : function(selector){

			selector = selector || '.ordertable';

			if ($(selector)[0] && $.fn.sortable) {

				const form = $.IGRP.utils.getForm();

				$(selector+' tbody').sortable({
					containment 	: "parent",
					scroll :false,
					forceHelperSize : true,
					distance 		: 5,
		            stop  			: function(e){

						const id = $(e.target).parents('table').attr('id'),

							name = 'p_fwl_' + id + '_order';

						$('input[name="'+name+'"]').remove();

		              	$('tr',$(e.target)).each(function(){

							let obj = $('input[name="p_' + id + '_id"]', $(this));

							obj = obj[0] ? obj : $('input[name="p_'+id+'_id_fk"]',$(this));

		              		if (obj.val()) 
		              			form.append('<input type="hidden" class="submittable" name="'+name+'" value="'+obj.val()+'"/>');
		              	});
		            }
	           });
			}
		},
		
		configGroups : function(op){

			const o = $.extend({
				thSelector: 'th[group-in != ""]',
				parent: 'body'
			}, op);

			const rows = $('table.table[id] tbody tr', o.parent);

			if(!rows[0] && $('table.table[id] thead tr th[group-in]', o.parent)[0]){
				
				$('table.table[id] thead tr th[group-in]', o.parent).each(function(i, th){

					const thFoot = $('tfoot td[td-name="' + $(this).attr('td-name') + '"]', $(this).parents('table'));

					$(th).remove();
					
					if(thFoot[0])
						thFoot.remove();
					
				});
			}
			else{
				
				rows.each(function(trIndex, tr){

					const table = $(tr).parents('table');

					let tdContent;

					$(o.thSelector, table).each(function(i, th){

						const thName = $(this).attr('td-name'),

							groupName = $(this).attr('group-in'),

							tdHolder = $('td[item-name="' + groupName + '"]', tr),

							tdInfo = $('td[item-name="' + thName + '"]', tr);

						if(tdHolder[0] && tdInfo[0]){
							
							$(th).removeClass('is-grouped');

							const infoHolder = $('<div class="table-info-holder" item-name="' + thName + '">' +
								'<div class="table-info-th ' + $(th).attr('class') + '">' + $(th).html() + '</div>' +
								'<div class="table-info-td ' + tdInfo.attr('class') + '">' + tdInfo.html() + '</div>' +
								'</div>');
							let tdMainHolder;


							if(!tdHolder.find('.table-info-group-main')[0]){
								
								tdMainHolder = $('<div class="table-info-group-main"></div>');
								
								tdHolder.append( tdMainHolder );
								
								tdHolder.find('>*').appendTo( tdMainHolder );
							}
							
					
							tdHolder.append( infoHolder );
							
							$(th).addClass('is-grouped');
							
							tdInfo.addClass('is-grouped');

							$('tfoot td[td-name="'+thName+'"]',table).addClass('is-grouped');
							
							/*var thFoot = $('tfoot td[td-name="'+thName+'"]',table);
							
							if(thFoot[0])
								thFoot.remove();*/
							
						}
	
					});			
					
				});
				
				//rows.parents('table').find('.is-grouped').remove();
			}
		},

		dataTable : function(op){
			const o = $.extend({
				selector: '.igrp-data-table',
				language: getCookie("igrp_lang"),
				parent: 'body'
			}, op);

			const tables = o.obj && o.obj[0] ? o.obj : $(o.selector, o.parent);

			if(tables[0] && $.fn.DataTable){

				const PageInfo = $.IGRP.info;

				tables.each(function(i, t){

					// ── GUARD: se já tem listeners registados, não re-inicializa ──────
					// Evita listeners duplicados de element-transform que causam
					// "Cannot read properties of null (reading 'parentNode')"
					if ($(t).data('igrp-datatable-init')) {
						return;
					}
					$(t).data('igrp-datatable-init', true);
					// ──────────────────────────────────────────────────────────────────

					const headerContents = $(t).parents('.box-table-contents').first().find('.table-contents-head'),
						tableTitle = $(t).parents('.box').first().find('.box-title').text() || $('#gen-page-title').text(),
						exprts = $(t).attr('exports'),

						getInfo = function (instance) {
							return 'IGRP-datatable-' + instance + '-' + PageInfo.app + '-' + PageInfo.page;
						},

						options = {
							dom: 'lfrtip',
							language: {
								url: path + '/core/igrp/table/datatable/language/' + o.language + '.json'
							},
							stateSave: true,
							stateSaveCallback: function (settings, data) {
								localStorage.setItem(getInfo(settings.sInstance), JSON.stringify(data));
							},
							stateLoadCallback: function (settings) {
								return JSON.parse(localStorage.getItem(getInfo(settings.sInstance)));
							},
							order: [],
							columnDefs: [{
								targets: 'no-sort',
								orderable: false
							}],
							lengthMenu: [[20, 50, -1], [20, 50, "All"]],
							initComplete: function () {
							}
						};

					if(exprts){
						const expArr = exprts.split(',');
						options.buttons = [];
						expArr.forEach(function(e){
							const eOpts = exportOptions[e];
							if(eOpts){
								eOpts.title = tableTitle;
								options.buttons.push(eOpts);
							}
						});
						options.dom = 'lfBrtip';
					}

					if (!$.fn.DataTable.isDataTable(t))
						var datatable = $(t).DataTable(options);

					// ── Função de destruição segura ────────────────────────────────────
					const safeDestroy = function () {
						if (!$.fn.DataTable.isDataTable(t)) return;
						if (!$.contains(document.documentElement, t)) return;

						// Último recurso: verificar o nó interno que DataTables usa
						try {
							const dtSettings = $(t).DataTable().settings()[0];
							if (!dtSettings || !dtSettings.nTable || !dtSettings.nTable.parentNode) return;
							datatable.destroy();
						} catch (e) {
							// Silencioso — já foi destruído ou nó inválido
						}
					};
					// ──────────────────────────────────────────────────────────────────

					$.IGRP.on('submit', function(o){
						if(o.valid && o.target.includes('submit'))
							safeDestroy();
					});

					$.IGRP.events.on('iframe-modal-hide', function(o){
						if (!$.fn.DataTable.isDataTable(t))
							datatable = $(t).DataTable(options);
					});

					$.IGRP.events.on('submit-ajax', function(o){
						if(o.valid && $.fn.DataTable.isDataTable( t ))
							safeDestroy();
					});

					$.IGRP.events.on('before-element-transform', function(p){
						if($(t).parents('.gen-container-item').first().attr('item-name') === p.itemName){
							safeDestroy();
							$(t).removeData('igrp-datatable-init');
						}
					});

					$.IGRP.events.on('element-transform', function(p){
						const table = $('.table:not(.IGRP_formlist)', p.content);
						if(table[0] && table.hasClass('igrp-data-table') && table.attr('id') === $(t).attr('id')){
							$(t).removeData('igrp-datatable-init');
						}
					});

				});
			}
		},
		
		setTableStyle : function(wrapper){
			
			wrapper = wrapper || $('.box-table-contents');
			
			wrapper.each(function(i,t){

				const legend = $(t).find('.box-table-legend');

				if(legend[0]){

					const itemName = $(t).attr('item-name');
					let style = '<style id="' + itemName + '">';

					legend.find('.legend-holder').each(function(i,l){

						const color = $(l).attr('legend-color'),

							value = $(l).val;

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
			
		checkdControl : function(p){

			const inp = $('input[type="hidden"].' + p.rel, p.o),
				table = p.o.parents('table'),
				hidden = '<input type="hidden" class="' + p.rel + '" value="' + p.value + '" name="p_' + p.rel + '_fk"/>',
				inpcheck = p.o.find('.' + p.rel + '_check');

			if(p.check){
	
				inpcheck.val( p.value );
	
	            if (inp[0])
	                inp.remove();
	        }
	        else{
	
	        	inpcheck.val( '' );
	
	        	if (!inp[0])
	                p.o.append(hidden);
	        }
	
	        if(p.type === 'radio'){
	    		$('tbody tr td input[check-rel="'+p.rel+'"]',table).each(function(){
					const td = $(this).parents('td:first');

					if(!$('input[type="hidden"].'+p.rel,td)[0] && !$(this).is(':checked')){
	    				td.append(hidden);
	    				td.find( '.'+p.rel+'_check').val('');
	    			}
	    		});
	    	}
			
		},
		
		contextTHWidth : function(){

			$('th.igrp-table-ctx-th').each(function(i,th){

				const table = $(th).parents('table').first(),

					tds = table.find('tbody>tr').first().find('td.igrp-table-ctx-td'),

					buttons = tds.find('.table-ctx-holder>li'),

					mr = 4;//margin-right

				if(buttons.length>=3)

					$(th).css('width',128 );//.css('min-width',128)

				else

					$(th).width( (buttons.width()+mr) * buttons.length + 2)

			});

		},
		
		exportRow : function(row, attrs){

			const response = {};

			if(row[0]){
				
				if(attrs){
					
					attrs = typeof attrs === 'string' ? attrs.split(',') : attrs;

					if(attrs[0]){
						
						attrs.forEach(function(a){

							const label = row.find('td[item-name="' + a + '"]').attr('data-title') || a,

								value = row.find('td[item-name="' + a + '"]>span').text() || row.find('input[name="p_' + a + '"]').val();

							response[label] = value;
							
						})
						
					}
					
				}
				
			}
			
			return response;
			
		},
		
		resetTableConfigurations : function(contents){
			
			contents.each(function(i,tholder){

				const tableHolder = $(tholder);

				if($('.table:not(.IGRP_formlist)',tableHolder)[0]){


					const table = tableHolder.find('table'),

						id = table.attr('id');

					if($.IGRP.components.contextMenu)

						$.IGRP.components.contextMenu.set( tableHolder );

					
					com.configGroups({
						
						parent : tableHolder
						
					});
					
					if(table.hasClass('igrp-data-table')){

						$.IGRP.components.tableCtrl.dataTable({

							selector : 'table#'+id+'.igrp-data-table'

						});
					}

					if ($.IGRP.components.tableCtrl.pagination)
						$.IGRP.components.tableCtrl.pagination('ul[filter-name="p_'+id+'_filter"]');
		        }
				
			})
			
			
		},
		
		setEvents : function(){

			const _self = this;

			//CheckAll
			$(document).on('change', 'table .IGRP_checkall', function() {
				let table    = $(this).parents('.table').first(),
					checkrel = $(this).attr('check-rel'),
					checkAll = $(this).is(':checked');

				/*table.trigger('checkall', [{
					isChecked: checkAll,
					tableId  : table.attr('id'),
				}]);*/

				const checkers = $('[check-rel="' + checkrel + '"]:not(.IGRP_checkall):not([disabled])', table);
				
				
				checkers.each(function(i,e){
					const parent = $(e).parents('div[item-name="' + checkrel + '"]')[0] ? $(e).parents('div[item-name="' + checkrel + '"]') : $(e).parents('td');

					com.checkdControl({
						rel 	: checkrel,
						o   	: parent,
						check 	: checkAll,
						value   : $(e).val(),
						name    : $(e).attr('name')
					});
				});

				checkers.prop('checked', checkAll).attr('checked', checkAll);

				//com.dataTable({ obj: table });
			});

			$(document).on('change','table [item-type="checkbox"] input[type="checkbox"][name], table .checkdcontrol',function(e){

				const o = $(this),
					rel = o.attr('check-rel'),
					obj = $('td[item-name="' + rel + '"]', o.parents('tr:first'));

				com.checkdControl({
                    rel     : rel,
                    o       : obj,
                    check   : o.is(':checked'),
                    value   : o.val(),
                    name    : o.attr('name'),
                    type  	: o.attr('type')
                });
            });
			
			$.IGRP.on('windowResize',function(){

            	com.contextTHWidth();

            });
			
			/*$.IGRP.events.on('element-transform',function(p){
				
				_self.resetTableConfigurations(p.content);
				
		    });*/
			
			$.IGRP.events.on('submit-complete',function(p){

				const content = p && p.item && p.item[0] ? p.item : $('.gen-container-item.box-table-contents');

				_self.resetTableConfigurations(content);
				
			})

		},
		
		operation : {
			isNum : function(v){
                return isNaN(v) ? 0 : v*1;
            },
			sum : {
	            allrow : function(p){
	                p.obj.each(function(i,tr){

						let total = 0;

						$(p.field,tr).each(function(io,o){
	                        total += com.operation.isNum($(o).val());
						});

						if($(p.result,tr)[0]){

							total = $.IGRP.utils.numberFormat({
								obj : p.result,
								val : total
							});

							$(p.result,tr).val(val);
						}
						
	                });
	            },

	            row : function(p){

					let total = 0;

					$(p.field,p.obj).each(function(io,o){
	                    total += com.operation.isNum($(o).val());
					});
					
	                if ($(p.result,p.obj)[0]){
						
						total = $.IGRP.utils.numberFormat({
							obj: $(p.result, p.obj).filter('[numberformat]'),
							val : total
						});

						$(p.result,p.obj).val(total).trigger('change');
					}

	                return total;
	            },
	            col : function(p){
					let total = 0,
						obj = null;

					p.obj.each(function(i,tr){
						if(i === 0)
							obj = $(p.field,$(tr));

	                    total += com.operation.isNum($(p.field,$(tr)).val());
					});
					
	                if (p.result[0]){

						total = $.IGRP.utils.numberFormat({
							obj : obj,
							val : total
						});

						$(':input',p.result).val(total);
	                    $('p',p.result).html(total);
	                    $('input[name="p_'+p.result.attr('id')+'"]').change();
	                }

	                return total;
	            },
	            allcol : function(p){

					const total = {};

					p.obj.each(function(i,tr){
	                    total[i] = com.operation.sum.col({
	                        obj     : p.obj,
	                        field   : $(p.field,'td:eq('+i+')'),
	                        result  : p.result
	                    });
	                });

	                return total;
	            }
			}
		},

		init:function(){
			
			com = this;

			com.configGroups();
			
			com.dataTable();
			
			com.setEvents();

			com.ordertable();

			com.setTableStyle();
			
			com.contextTHWidth();
			
		}

	},true);

	function getCookie(cname) {
		const name = cname + "=";
		const decodedCookie = decodeURIComponent(document.cookie);
		const ca = decodedCookie.split(';');
		for(let i = 0; i <ca.length; i++) {
			let c = ca[i];
			while (c.charAt(0) === ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) === 0) {
	            return c.substring(name.length, c.length);
	        }
	    }	    
	    return "pt_PT";
	}
	
	$.extend({
	    replaceTag: function (currentElem, newTagObj, keepProps) {
			const $currentElem = $(currentElem);
			let i;
			const $newTag = $(newTagObj).clone();
			if (keepProps) {//{{{
	            newTag = $newTag[0];
	            newTag.className = currentElem.className;
	            $.extend(newTag.classList, currentElem.classList);
	            $.extend(newTag.attributes, currentElem.attributes);
	        }//}}}
	        $currentElem.wrapAll($newTag);
	        $currentElem.contents().unwrap();
	        // return node; (Error spotted by Frank van Luijn)
	        return this; // Suggested by ColeLawrence
	    }
	});

	$.fn.extend({
	    replaceTag: function (newTagObj, keepProps) {
	        // "return" suggested by ColeLawrence
	        return this.each(function() {
	            jQuery.replaceTag(this, newTagObj, keepProps);
	        });
	    }
	});
	
})();



