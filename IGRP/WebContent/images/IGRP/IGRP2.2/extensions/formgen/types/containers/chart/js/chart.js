var GENCHART = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();
	var container = this;

	container.fields = false;

	container.xml.type = 'graphic';

	//container.includes = ['graph'];

	container.includes = {
		xsl : ['graph']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}

	container.ready = function(){

		container.unsetProprieties(['hasTitle']);

		container.setPropriety({
			name: 'height',
			value:{
				value       : 250,
				changeEvent : 'blur'
			},
			transform:true
		});

		container.setPropriety({
			name: 'title',
			value:{
				value       : name,
				changeEvent : 'blur'
			},
			transform:true
		});

		container.setPropriety({
			name:'chart_type',
			value:{
				value  : 'line',
				options:[
					{
						value:'stackedgroupedcolumn',
						label:'Stack Grouped Column'
					},
					{
						value:'pie',
						label:'Pie'
					},
					{
						value:'tablecharts',
						label:'Table Chart'
					},
					{
						value:'area',
						label:'\u00c1rea'
					},
					{
						value:'scatter',
						label:'Scatter'
					},
					{
						value:'column',
						label:'Column'
					},
					{
						value:'line',
						label:'Line'
					},
					{
						value:'bar',
						label:'Bar'
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
						value:'stackedpercentarea',
						label:'Stacked Percent Area'
					},
					{
						value:'stackedpercentcolumn',
						label:'Stacked Percent Column'
					}
				]
			},
			transform:true
		});
	}

	container.onDrawEnd = GEN.resizeView;
	
}

this[VARS.name].declareContainer({
	name:'chart',
	container:GENCHART
});