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
			name:'filter_type',
			label:'Filter Type',
			value:{
				value   : '',
				options :$.IGRP.defaults.highcharts.types,
				multiple:true
			},
			onEditionStart : function(o){
				if(container.GET.filter && container.GET.filter())
					o.input.show();
				else
					o.input.hide();
			}
		});


		container.setPropriety({
			name 	 :'filter',
			label 	 : 'Filter',
			value 	 : false,
			xslValue : function(){
				var rtn = '<xsl:with-param name="filter" select="\'true\'"/>';

				if(container.GET.filter_type && container.GET.filter_type())
					rtn += '<xsl:with-param name="filter_type" select="\''+container.GET.filter_type()+'\'"/>';
				
				if(container.GET.remote_filter && container.GET.remote_filter())
					rtn += '<xsl:with-param name="remote_filter" select="\''+container.GET.remote_filter()+'\'"/>';

				return rtn;
			}, //XSL VALUE WHEN PROPRIETY IS TRUE
			onEditionStart:function(v){
				$('input',v.input).on('change',function(){
					var action  = $(this).val() ? 'show' : 'hide'; 
					$('.gen-properties-setts-holder div[rel="filter_type"]')[action]();
					$('.gen-properties-setts-holder div[rel="remote_filter"]')[action]();
				});
			}
		});

		container.setPropriety({
			name 	 :'remote_filter',
			label 	 : 'Remote Filter ',
			value 	 : false,
			onEditionStart:function(o){
				if(container.GET.filter && container.GET.filter())
					o.input.show();
				else
					o.input.hide();
			}
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