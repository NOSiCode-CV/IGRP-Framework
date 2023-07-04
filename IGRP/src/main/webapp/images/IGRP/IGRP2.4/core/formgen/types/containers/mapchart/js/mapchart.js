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

			{ path: '/plugins/canvg.js/rgbcolor.js' },
			{ path: '/plugins/canvg.js/StackBlur.js' },
			{ path: '/plugins/canvg.js/canvg.js' },
			{ path: '/plugins/canvas2blob/canvas-to-blob.min.js' },

			{ path: '/plugins/html2canvas/html2canvas.min.js' },
			
			{ path: '/plugins/html2canvas/html2canvas.svg.js' },
			
			{ path: '/plugins/filesaver/FileSaver.min.js' },

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
			value   : 420
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

		container.setProperty({
			label   : 'Basemap Label',
			name    : 'dt_label',
			value   : 'name',
			isField : true,
			valuePersist : true
		});

		container.setProperty({
			label   : 'Legend Position',
			name    : 'legendPosition',
			value   :  {
				value : 'bottom',
				options : [
					{ value : 'top'   ,label : 'Top'},
					{ value : 'bottom',label : 'Bottom'},
					{ value : 'left'  ,label : 'Left'},
					{ value : 'right' ,label : 'Right'}
				]
			},
			onEditionStart:function(o){
				$('select',o.input).on('change',checkLegend);
			}
		});

		container.setProperty({
			label          : 'Legend Size',
			name           : 'legendSize',
			value          : {
				value   : 2,
			  	options : GEN.getFieldSize(6)
			},
			onEditionStart : checkLegend
		});


		container.setProperty({
			name : 'tooltipFormat',
			label: 'Tooltip Format',
			value: '{point.name}: {point.value}',
			size : 12,
			inputType : 'textarea',
			onEditionStart:function(o){
				var action = container.GET.tooltip && container.GET.tooltip() ? 'show' : 'hide';
				o.input[action]();
			}
		});

		container.setProperty({
			name    : 'tooltip',
			value   :  true,

			onEditionStart:function(o){
				var f = o.input,
					i = f.find('input');

				i.on('change',function(){
					var checked = $(this).is(':checked'),
						tformat = $('.gen-properties-setts-holder div[rel="tooltipFormat"]'),
						action  = checked ? 'show' : 'hide';
					
					tformat[action]();

				});

			},
			onChange:function(v){
				if(!v)
					container.SET.tooltipFormat('{point.name}: {point.value}');
			}
		});

		container.setProperty({
			label : 'Export',
			name  : 'export',
			value :  true,
			//xslValue : ' export="true"'
		});

	};

	container.onDrawEnd = function(){

		var id = 'highmap-'+container.GET.tag();	

		$.IGRP.components.highmap.init();

	};

	var checkLegend = function(){

		var pos   = $('.gen-properties-setts-holder>[rel="legendPosition"] select').val(),

			lsize =  $('.gen-properties-setts-holder>[rel="legendSize"]');

		if(pos == 'bottom' || pos == 'top')

			lsize.hide()

		else

			lsize.show();
	}


}

this[VARS.name].declareContainer({
	name:'mapchart',
	container:GENMAPCHART
});