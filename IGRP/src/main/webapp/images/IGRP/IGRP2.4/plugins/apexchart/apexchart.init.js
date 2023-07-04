// get colors array from the string
function getChartColorsArray(chart) {
    if ( chart) {
        var colors = chart.getAttribute("data-colors");
        if (colors) {
            colors = JSON.parse(colors);
            return colors.map(function (value) {
                var newValue = value.replace(" ", "");
                if (newValue.indexOf(",") === -1) {
                    var color = getComputedStyle(document.documentElement).getPropertyValue(
                        newValue
                    );
                    if (color) return color;
                    else return newValue;
                } else {
                    var val = value.split(",");
                    if (val.length == 2) {
                        var rgbaColor = getComputedStyle(
                            document.documentElement
                        ).getPropertyValue(val[0]);
                        rgbaColor = "rgba(" + rgbaColor + "," + val[1] + ")";
                        return rgbaColor;
                    } else {
                        return newValue;
                    }
                }
            });
        } else {
            console.warn('data-colors atributes not found on chart');
        }
    }
}

(function(){
    const CircleStatsCharts = document.querySelectorAll(".igrp-circle-stat-box .apex-charts");
    if(CircleStatsCharts[0]){
        CircleStatsCharts.forEach( (c,i)=>{
            var series  = c.getAttribute('data-series');
            var color   = getChartColorsArray(c);
            var options = {
                series: [series],
                chart: {
                    type: 'radialBar',
                    width: 105,
                    sparkline: {
                        enabled: true
                    }
                },
                dataLabels: {
                    enabled: false
                },
                plotOptions: {
                    radialBar: {
                        hollow: {
                            margin: 0,
                            size: '70%'
                        },
                        track: {
                            margin: 1
                        },
                        dataLabels: {
                            show: true,
                            name: {
                                show: false
                            },
                            value: {
                                show: true,
                                fontSize: '16px',
                                fontWeight: 600,
                                offsetY: 8,
                            }
                        }
                    }
                },
                colors: color
            };
            var chart = new ApexCharts( c , options);
            chart.render();
        })
    }

})();
