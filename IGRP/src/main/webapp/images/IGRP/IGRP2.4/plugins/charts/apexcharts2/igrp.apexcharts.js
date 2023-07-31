var igrpApexCharts = {

    pieDonut : function (p) {
        const { chartCategories, chartColors, chartData, chartType } = p;

        let data = [];

        chartCategories.forEach(function (e, i) {
            data.push(chartData[0][i]);
        });

        return {
            series: data,
            chart: {
                height: 300,
                type: chartType,
            },
            labels: chartCategories,
            legend: {
                position: 'bottom'
            },
            dataLabels: {
                dropShadow: {
                    enabled: false,
                }
            },
            colors: chartColors
        }
    },

    typeCharts : {
        COMMONSTR: function (p) {
            const { chartCategories, chartColors, chartData, chartDatasets, chartType } = p;

            let datasets = [];

            const auxType = chartType === 'column' ? 'bar' : chartType;

            chartDatasets.forEach((d, i) => {

                datasets.push({
                    name: d,
                    data: chartData[i]
                });
            });

            let Options = {
                series: datasets,
                chart: {
                    height: 350,
                    type: auxType,
                    toolbar: {
                        show: false
                    }
                },
                markers: {
                    size: 4,
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'straight'
                },
                colors: chartColors,
        
                xaxis: {
                    categories: chartCategories,
                }
            };

            if(chartType === 'column'){
                Object.assign(Options,{
                    plotOptions: {
                        bar: {
                            horizontal: false,
                            columnWidth: '45%',
                            endingShape: 'rounded'
                        }
                    }
                });
            }

            if(chartType === 'bar'){
                Object.assign(Options,{
                    plotOptions: {
                        bar: {
                            horizontal: true,
                        }
                    }
                });
            }

            return Options;

        },
        PIE: function (p) {
            return igrpApexCharts.pieDonut(p);
        },
        DONUT: function (p) {
            return igrpApexCharts.pieDonut(p);
        }
    },

    renderCharts: function (chart) {

        const getAttributes = igrpChartsUtils.getAllAttributes(chart);

        const { chartdata } = getAttributes;

        if (chartdata) {

            const { chartCategories, chartColors, chartData, chartDatasets, chartType, chartStrByType, chartId } = igrpChartsUtils.handlerChartsData(getAttributes);

            const elementChart = document.querySelector(`#${chartId}`),
                chartStr = igrpApexCharts.typeCharts[chartStrByType]({
                    chartCategories,
                    chartColors,
                    chartData,
                    chartDatasets,
                    chartType
                })
            ;

            const chart = new ApexCharts(elementChart, chartStr);
            chart.render();
        }
    },

    render: function (element) {

        const charts = element ? [element] : document.querySelectorAll('.IGRP-charts-apexcharts');

        charts.forEach((c, i) => {
            c.setAttribute("width", c.parentElement.offsetWidth);

            igrpApexCharts.renderCharts(c);
        });
    }
};

$.IGRP.component('apexcharts', igrpApexCharts, false);


igrpApexCharts.render();