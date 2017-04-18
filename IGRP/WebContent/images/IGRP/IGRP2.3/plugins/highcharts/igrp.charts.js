$(function(){
	//resize charts when sidebar toggle
	function resizeChart(chart){
		try{ chart.reflow() }catch(e){ console.log(e)}
	}

	function resizeAllCharts(parent){
		$.each(getAllCharts(parent),function(){
            resizeChart( $(this).highcharts() );
        });
	}

	function getAllCharts(parent){
		return parent && parent[0] ? $('[data-highcharts-chart]',parent) : $('[data-highcharts-chart]');
	}

	$.IGRP.on('sideBarToggle, windowResize',function(){
		resizeAllCharts();
	});

	if($.IGRP.components.tabcontent)
		$.IGRP.components.tabcontent.on('tabActive',function(target){
			resizeAllCharts( $(target) ); 
		});

});