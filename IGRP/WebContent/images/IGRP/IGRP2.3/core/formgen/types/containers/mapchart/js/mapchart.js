var GENMAPCHART = function(name,tparams){
	CONTAINER.call(this,name,tparams);
	
	var GEN       = __GEN;

	var container = this;

	container.xml.structure = 'form';

	container.includes = {
		css:[
			{path: '/plugins/highcharts/highmaps/highmap.css'}
		],
		js:[
			{ path: '/plugins/highcharts/highcharts.js' },
			{ path: '/plugins/highcharts/highcharts-more.js' },
	
			{ path: '/plugins/highcharts/highmaps/map.js' },
			{ path: '/plugins/highcharts/highmaps/data.js' },
			{ path: '/plugins/highcharts/highmaps/drilldown.js' },
			
		
			{ path: '/plugins/highcharts/highmaps/highmap.controller.js' },
			{ path: '/plugins/highcharts/igrp.charts.js' }
		],
		xsl:[]
	};
	

	container.ready = function(){
		
		container.setProperty({
			name    :'height',
			value   : 350
		});

		container.setProperty({
			label   :'Basemap',
			name    :'basemap',
			value   : path+'/utils/geo/basemap/caboverde/json.geojson',
			isField :true
		});

		container.setProperty({
			label   : 'Data',
			name    : 'data',
			value   :  path+'/utils/geo/data/data.json',
			isField : true
		});

		container.setProperty({
			label   : 'Configuration',
			name    : 'config',
			value   :  path+'/utils/geo/config/config2.json',
			isField : true
		});

	};

	container.onDrawEnd = function(){

		var id = 'highmap-'+container.GET.tag();	

		$.IGRP.components.highmap.init();

	};


}

this[VARS.name].declareContainer({
	name:'mapchart',
	container:GENMAPCHART
});