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
			{ path : '/plugins/highcharts/heatmap.js' },
			{ path : '/plugins/highcharts/treemap.js' },
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
				options:$.IGRP.defaults.highcharts.types
			}//,
			//transform:true
		});

		container.setPropriety({
			name 	 :'filter',
			label 	 : 'Filter Type',
			value 	 : false,
			xslValue : '<xsl:with-param name="filter" select="\'true\'"/>' //XSL VALUE WHEN PROPRIETY IS TRUE
		});
	}

	container.onDrawEnd = function(){
		GEN.resizeView;
		$.IGRP.components.charts.renderCharts({
			chart : $('.IGRP-highcharts',$('#'+container.id))
		});
	}
	
}

this[VARS.name].declareContainer({
	name:'chart',
	container:GENCHART
});