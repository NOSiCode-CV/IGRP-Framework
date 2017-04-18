var GENCHART = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();
	
	var container = this;

	container.fields = false;

	container.xml.type = 'graphic';

	container.includes = {
		xsl : ['charts'],
		css : [ { path : '/plugins/highcharts/igrp.charts.css' } ], 
		js  : [ 
			{ path : '/plugins/highcharts/highcharts.js' },
			{ path : '/plugins/highcharts/highcharts-more.js' },
			{ path : '/plugins/highcharts/exporting.js' },
			{ path : '/plugins/highcharts/funnel.js' },
			{ path : '/plugins/highcharts/igrp.charts.js' },
		]
	}

	container.ready = function(){

		container.SET.hasTitle(true);

		container.setPropriety({
			name: 'height',
			value:250
		});

		container.setPropriety({
			name:'chart_type',
			label:'Chart Type',
			value:{
				value  : 'line',
				options:[
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
						value:'pyramid',
						label:'Pyramid'
					},
					{
						value:'scatter',
						label:'Scatter'
					},
					{
						value:'spline',
						label:'Spline'
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
						value:'tablecharts',
						label:'Table Chart'
					}
				]
			}//,
			//transform:true
		});
	}

	container.onDrawEnd = GEN.resizeView;
	
}

this[VARS.name].declareContainer({
	name:'chart',
	container:GENCHART
});