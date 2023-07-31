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
						value:'polar',
						label:'Polar'
					},
					{
						value:'semipie',
						label:'Semi Pie'
					},
					{
						value : 'spiderweb',
						label : 'Spider web'
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

				targets : function(){
					
					//$.IGRP.on('init',function(){
					
						var r = [];
						
						for(var t in $.IGRP.targets){

							var targ = $.IGRP.targets[t];
							
							if(targ.selectable != false){

								r.push({
									value : t,
									label : targ.label
								});

							}
							
						}
						
						
						return r.sort(function(a,b){
							 return ((a.label < b.label) ? -1 : ((a.label > b.label) ? 1 : 0));
						});
						
					
				},

				submitTargets : function(){
					
					var r = [];
					
					for(var t in $.IGRP.targets){

						var targ = $.IGRP.targets[t];
						
						if(targ?.type === 'submit'){

							r.push(t);

						}
						
					}

					return r;
						
				},

				sharpadbclient: [
					{
						value: '',
						label: ''
					},
					{
						value: 'start',
						label: 'Start'
					},
					{
						value: 'stop',
						label: 'Stop'
					},
					{
						value: 'pause',
						label: 'Pause'
					},
					{
						value: 'install',
						label: 'Install'
					},
					{
						value: 'uninstall',
						label: 'Uninstall'
					},
					{
						value: 'sync',
						label: 'Synchronize'
					},
					{
						value: 'config',
						label: 'Config'
					}
				]
				
			}
		}

	};

})();