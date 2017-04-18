$(function(){
	
	var defaults = {
		nomeReq : 'p_nome',
		docReq  : 'p_numero_documento',
		nascReq : 'p_data_nascimento'
	};

	var nomeReq    = $('#'+defaults.nomeReq),
		docReq     = $('#'+defaults.docReq),
		nascReq    = $('#'+defaults.nascReq),
		

		searchModal= $('#app-info-modal'),
		searchBtn  = $('#app-search-req-btn'),

		bottomConts= $('#app-bottom-contents'),
		statsBtn   = $('.info-statistics'),
		saCharts   = $('.sacharts'),
		transCharts= $('#sacharts'),

		//params
		searchHref = $('#p_link_pesquisa').val(),
		confirmURL = $('#link_confirmar').val(),
		cancelURL  = $('#link_cancelar').val(),
		chartURL   = $('#p_env_frm_url').val(),

		nomeTarget = nomeReq.attr('name'),
		docTarget  = docReq.attr('name'),

		minChars   = 2,
		searchReq  = null,
		started    = false; 

	var tableHtml = '<table class="table table-striped gen-data-table"><tbody></tbody></table>';

	var drawTable = function(o){
		var xTable = typeof o == 'string' ? $.parseJSON(o) : o;
		var table  = $(tableHtml);

		if(xTable){
			try{
				var data = xTable.rows && xTable.rows.row && xTable.rows.row.lista && xTable.rows.row.lista.row  ? [xTable.rows.row.lista.row] : xTable.rows.row.lista;
				
				data.forEach(function(d){
					$(table).find('tbody').append(
						'<tr class="app-result" nome_completo="'+d.nome_completo+'" numero_bi="'+d.numero_bi+'" data_nascimento="'+d.data_nascimento+'">'+
							'<td>'+
								'<div><strong>'+d.nome_completo+'</strong></div>'+
								'<span>'+d.data_nascimento+'</span>'+
							'</td>'+
							'<td align="right"><a href="#" class="btn btn-xs btn-link app-confirm"><i class="fa fa-check"/></a></td>'+
						'</tr>'
					)
				});

			}catch(err){
				console.log(err);
			}
		}

		$('#app-search-result').html(table);
	};

	var clearTable = function(){
		$('#app-search-result').html('');
	};

	var start = function(){
		started = true;
	};

	var reset = function(){
		clearTable();
		nomeReq.val('');
		nascReq.val('');
		docReq.val(null);
		started = false;
	};

	var search = function(){
		
		if(!searchModal.hasClass('searching')){
			
			var vNome          = nomeReq.val(),
				vdocReq    	   = docReq.val(),
				data           = {};

			if(vNome.length >= minChars || vdocReq.length >= minChars){
				
				data[nomeTarget] = vNome;
				data[docTarget]  = vdocReq;
			
				clearTable();

				searchModal.addClass('searching');

				if(searchReq != null ) {
					searchReq.abort();
					searchReq = null;
				}

				searchReq = $.ajax({
					url: searchHref, 
					data: data,
				})

				.done(drawTable)

				.fail(console.log)
				
				.always(function() {
					searchModal.removeClass('searching');
				});
			}
			

			
		}
	};

	var select = function(e){

		var row = $(e.currentTarget);

		nomeReq.val( row.attr('nome_completo') )
		nascReq.val( row.attr('data_nascimento') );
		docReq.val( row.attr('numero_bi') );
		
		$.IGRP.targets._self({ url: $.IGRP.utils.getFormUrl(confirmURL) })
	
		return false;
	};

	var viewStats = function(e){
		e.preventDefault();
		bottomConts.toggleClass('active');
		return false;
	};

	var chartsTransform = function(){
		$.ajax({
			url:$.IGRP.utils.getUrl(chartURL)+'p_type='+$(this).attr('type')
		}).done(function(data){
			var $div 		= $('<div/>').addClass('loading loader'),
				$content 	= $('#app-bottom-contents');

			$div.appendTo($content);
			$content.addClass('active');

			transCharts.XMLTransform({
				xsl 			: path+'/xsl/tmpl/IGRP-charts.tmpl.xsl',
				xml 			: $(data).find('rows content atendimento').getXMLDocument(),
				xslParams 		: {pheight:250},
				complete		: function(c){
					$div.remove();
					$content.removeClass('active');
				},
				error		 	: function(c){
					$div.remove();
					$content.removeClass('active');
				}
			});
		});
	};

	//transform chart
	saCharts.on('click', chartsTransform);
	//statistics
	statsBtn.on('click', viewStats);
	//start event
	searchModal.on('shown.bs.modal', start);
	//reset event
	searchModal.on('hidden.bs.modal', reset);
	//click confirm event
	searchModal.on('click','.app-result',select);
	//click search event
	searchBtn.on('click',search);
	//enter search event
	$(document).keypress(function(e) {
	    if(e.which == 13 && started) 
	        search()
	});

});