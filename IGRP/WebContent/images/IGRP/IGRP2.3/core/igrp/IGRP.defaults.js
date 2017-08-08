(function(){

	if($ && $.IGRP){

		$.IGRP.defaults = {

			highcharts : {

				types : [
					{
						value:'area',
						label:'\u00c1rea'
					},
					{
						value:'bar',
						label:'Bar'
					},
					{
						value:'column',
						label:'Column'
					},
					{
						value:'funnel',
						label:'Funnel'
					},
					{
						value:'line',
						label:'Line'
					},
					{
						value:'pie',
						label:'Pie'
					},
					{
						value:'semipie',
						label:'Semi Pie'
					},
					{
						value:'pyramid',
						label:'Pyramid'
					},
					{
						value:'heatmap',
						label:'Heat Map'
					},
					/*{
						value:'scatter',
						label:'Scatter'
					},*/
					{
						value:'spline',
						label:'Spline'
					},
					{
						value:'stackedbar',
						label:'Stacked Bar'
					},
					{
						value:'stackedarea',
						label:'Stacked Area'
					},
					{
						value:'stackedcolumn',
						label:'Stacked Column'
					},
					{
						value:'stackedgroupedcolumn',
						label:'Stack Grouped Column'
					},
					{
						value:'stackedpercentarea',
						label:'Stacked Percent Area'
					},
					{
						value:'stackedpercentcolumn',
						label:'Stacked Percent Column'
					},
					{
						value:'treemap',
						label:'Tree Map'
					},
					{
						value:'tablecharts',
						label:'Table Chart'
					}
				]

			},
			buttons : {
				targets : [
					{value:'confirm',label:'Confirm'},
					{value:'changesrc',label:'Change Source'},
					{value:'alert_submit',label:'Alerta Submit'},
					{value:'_close',label:'Fechar'},
					/*{value:'_link',label:'Hyperlink'},*/
					{value:'_self',label:'Mesma Pagina'},
					{value:'_newtab',label:'Novo Tab'},
					{value:'_blank',label:'PopUp'},
					{value:'modal',label:'Modal'},
					{value:'submit_form',label:'Submit Form'},
					{value:'submit',label:'Submit Page'},
					{value:'submit_ajax',label:'Submit Ajax'},
					{value:'submit_popup',label:'Submit Popup'},
					{value:'_back',label:'Voltar'}
				]
			}
		}

	};

})();