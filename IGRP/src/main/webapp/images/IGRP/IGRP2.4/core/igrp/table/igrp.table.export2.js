(function(){

	var com = $.IGRP.component('tableExport2',{

		export : {

			excel : function(table,title,name){

				var tab_text = '\uFEFF',
					tit      = title || '';

			    tab_text = tab_text + '<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">';
			    tab_text = tab_text + '<head>';
			    tab_text = tab_text + '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
			    tab_text = tab_text + '<meta name="ProgId" content="Excel.Sheet" />';
			    tab_text = tab_text + '<meta name="Generator" content="Microsoft Excel 11" />';
			    tab_text = tab_text + '<title>'+tit+'</title>';
			    tab_text = tab_text +'<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
			    tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
			    tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
			    tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook>';
			    tab_text = tab_text + '</xml><![endif]--></head><body style="font-family:verdana">';
			   
			    tab_text = tab_text + '<h3 style="font-family:verdana;font-size:24px; font-weight:bold;text-align:left">'+tit+'</h3>';
			    
			    tab_text = tab_text + '<table border="1px"><tr>';

			    var exportTable = $(table).clone();

			    exportTable.find('*').css('font-family','verdana');
			    
			    exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
			    
			    for (j = 0; j < exportTable[0].rows.length; j++){

					tab_text += exportTable[0].rows[j].innerHTML + "</tr>";
					
			    }
			    
			    tab_text = tab_text + '</table></body></html>';

			    var fileName = name + '_' + parseInt(Math.random() * 10000000000) + '.xlsx';
			    
			    var blob = new Blob([tab_text], { type: "application/vnd.ms-excel" });

			    window.saveAs(blob, fileName);
			},

			pdf:function(table,title,name){
				console.log(table)
				console.log(title)
				console.log(name)
			},

			pdf2:function(table,title,name){

				var orientation = 'l',

					pdf = new jsPDF(orientation,'pt', 'a4', true),

					body = $(table).parent('.box-body').clone(true),

					tb  = body.find('>table'),

					width = orientation == 'l' ? '842px' : '595px';

					holder = $('<div class="invisibles" style="padding: 30px 15px;position:fixed;width:'+width+';left:0;top:0;z-index:100000;"></div>');		

					tb.attr('id','gen-pdf-export-tst')
					
					//$('html').removeClass('ready');

				var data     = [], 
					fontSize = 12, 
					height   = 0, 
					doc;

				pdf = new jsPDF('p', 'pt', 'a4', true);
				pdf.setFont("times", "normal");
				pdf.setFontSize(fontSize);
				pdf.text(20, 20, "hi table");
				data = [];

				setTimeout(function(){
					
					$('body').append(holder);

					body.find('>*:not(table,.box-table-legend)').remove();

					$('tr',tb).not(':visible').show();

					$('>thead input, tr td input',tb).remove();

					holder.append(body);

					data = pdf.tableToJson('gen-pdf-export-tst');

					console.log(data);

					height = pdf.drawTable(data, {
						xstart : 10,
						ystart : 10,
						tablestart : 40,
						marginleft : 10,
						xOffset : 10,
						yOffset : 15
					});

					//pdf.text(50, height + 20, 'hi world');
					pdf.save("some-file.pdf");


				},400)
				

				/*setTimeout(function(){

					$('body').append(holder);

					body.find('>*:not(table,.box-table-legend)').remove();

					$('tr',tb).not(':visible').show();

					$('>thead input, tr td input',tb).remove();

					holder.append(body);


		            html2pdf(holder[0], pdf, function(pdf) {
		            	
		            	pdf.setProperties({
						    title: title
						});

			        	pdf.save(name+'.pdf');

			        	holder.remove();

			        	$('html').addClass('ready');

			        });

				},400)*/
				
				return false;
			}
		},

		init:function(contents){

			var contents = contents || $('.box-table-contents');

			$.each(contents,function(i,t){
				
				var title =  $('>.box-header .box-title',t).text() || $('igrp-page-title').text(),

					name  = $(t).attr('item-name') || 'igrp_table_export',

					table = $('.table-box-inner>table',t)[0];

				$(t).on('click','.table-export-options a.btn',function(){
					
					var rel = $(this).attr('rel');
					
					if(com.export[rel])

						com.export[rel]( table, title, name )
					
					return false;
				});

			});

		}

	},true);

})();
