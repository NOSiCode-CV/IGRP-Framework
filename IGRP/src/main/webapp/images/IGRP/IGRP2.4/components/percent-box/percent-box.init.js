(function(){

    $.IGRP.component('percent-box', {
        init : (parent)=>{
            parent = parent || document;
            const stats = $('.igrp-percent-box', parent);
            if(stats[0]){

                stats.each( (i, stat)=>{
                    const chart = $('.apex-charts', stat)[0];
                    const pct = $(chart).data('pct');
            
                    new ApexCharts(
                        chart,
                        options = {
                            series: [pct],
                            chart: { type: "radialBar", width: 105, sparkline: { enabled: !0 } },
                            dataLabels: { enabled: !1 },
                            plotOptions: {
                                radialBar: {
                                    hollow: { margin: 0, size: "70%" },
                                    track: { margin: 1 },
                                    dataLabels: {
                                    show: !0,
                                    name: { show: !1 },
                                    value: { show: !0, fontSize: "16px", fontWeight: 600, offsetY: 8 },
                                    },
                                },
                            },
                            colors:  getChartColorsArray(chart),
                        }
                    ).render();
                })

            }
        }
    },true);

})();
