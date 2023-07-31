var igrpChartjs = {

    pieDoughnut: function (p) {
        const { chartCategories, chartColors, chartData, chartType } = p;

        let data = [];

        chartCategories.forEach(function (e, i) {
            data.push(chartData[0][i]);
        });

        return {
            type: chartType,
            data: {
                labels: chartCategories,
                datasets: [
                    {
                        data: data,
                        backgroundColor: chartColors,
                        hoverBackgroundColor: chartColors,
                        hoverBorderColor: "#fff"
                    }
                ]
            }
        }
    },

    typeCharts: {
        COMMONSTR: function (p) {
            const { chartCategories, chartColors, chartData, chartDatasets, chartType } = p;

            let datasets = [];

            chartDatasets.forEach((d, i) => {

                const color = chartColors[i],
                    rgba = igrpChartsUtils.hexToRgba(color);

                datasets.push({
                    label: d,
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 1,
                    hoverBackgroundColor: rgba,
                    hoverBorderColor: rgba,
                    data: chartData[i]
                });
            });

            return {
                type: chartType,
                data: {
                    labels: chartCategories,
                    datasets: datasets
                }
            };

        },
        PIE: function (p) {
            return igrpChartjs.pieDoughnut(p);
        },
        DOUGHNUT: function (p) {
            return igrpChartjs.pieDoughnut(p);
        },
        POLARAREA : function(p){

            const { chartCategories, chartColors, chartData, chartType } = p;

            let data = [];

            chartCategories.forEach(function (e, i) {
                data.push(chartData[0][i]);
            });

            return {
                type: chartType,
                data: {
                    labels: chartCategories,
                    datasets: [{
                        data: data,
                        backgroundColor: chartColors,
                        label: 'My dataset', // for legend
                        hoverBorderColor: "#fff"
                    }]
                }
            }
        },

        RADAR : function(p){

            const { chartCategories, chartColors, chartData, chartDatasets, chartType } = p;

            let datasets = [];

            chartDatasets.forEach((d, i) => {

                const color = chartColors[i],
                    rgba = igrpChartsUtils.hexToRgba(color);

                datasets.push({
                    label: d,
                    backgroundColor: rgba,
                    borderColor: color,
                    pointBackgroundColor: color,
                    pointBorderColor: "#fff",
                    pointHoverBackgroundColor: "#fff",
                    pointHoverBorderColor: color,
                    data: chartData[i]
                });
            });

            return {
                type: chartType,
                data: {
                    labels: chartCategories,
                    datasets: datasets
                }
            }
        }
    },

    renderCharts: function (chart) {

        const getAttributes = igrpChartsUtils.getAllAttributes(chart);

        const { chartdata } = getAttributes;

        if (chartdata) {

            const { chartCategories, chartColors, chartData, chartDatasets, chartType, chartStrByType, chartId } = igrpChartsUtils.handlerChartsData(getAttributes);

            const elementChart = document.querySelector(`#${chartId}`),
                chartStr = igrpChartjs.typeCharts[chartStrByType]({
                    chartCategories,
                    chartColors,
                    chartData,
                    chartDatasets,
                    chartType
                })
            ;

            new Chart(elementChart, chartStr);
        }
    },

    render: function (element) {

        const charts = element ? [element] : document.querySelectorAll('.IGRP-charts-chartjs');

        console.log(charts)

        charts.forEach((c, i) => {
            c.setAttribute("width", c.parentElement.offsetWidth);

            igrpChartjs.renderCharts(c);
        });
    }
};

//

$.IGRP.component('chartjs', igrpChartjs, false);

igrpChartjs.render();