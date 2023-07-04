var igrpChartsUtils = {
    colors: {

        default: ["#2b908f", "#f45b5b", "#91e8e1", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#7cb5ec", "#434348"],

        random: function () {
            return ('#' + '0123456789abcdef'.split('').map(function (v, i, a) {

                return i > 5 ? null : a[Math.floor(Math.random() * 16)]

            }).join(''));
        },

        idx: -1,

        generateColors: function (size) {

            let color = igrpChartsUtils.colors.default[0];

            if (size > igrpChartsUtils.colors.default.length) {
                color = igrpChartsUtils.colors.random();

            } else {

                igrpChartsUtils.colors.idx = igrpChartsUtils.colors.idx + 1;
                color = igrpChartsUtils.colors.default[igrpChartsUtils.colors.idx]
            }

            return color;
        },

        setted: {},

        get: function (size) {

            var arr = [];

            for (var i = 0; i < size; i++) {

                arr.push(igrpChartsUtils.colors.unique(i));
            }

            igrpChartsUtils.colors.setted = {};

            igrpChartsUtils.colors.idx = -1;

            return arr;

        },

        unique: function (size) {

            var color = igrpChartsUtils.colors.generateColors(size);

            if (!igrpChartsUtils.colors.setted[color]) {

                igrpChartsUtils.colors.setted[color] = true;

                return color;

            } else {

                return igrpChartsUtils.colors.unique(size);

            }

        }

    },

    hexToRgba: function (hex, opacity = 0.5) {
        hex = hex.replace('#', '');

        const r = parseInt(hex.substring(0, 2), 16),
            g = parseInt(hex.substring(2, 4), 16),
            b = parseInt(hex.substring(4, 6), 16);

        return `rgba(${r},${g},${b},${opacity})`;
    },

    getAllAttributes: function (element) {
        const attributes = element.attributes;
        let result = {};

        for (let i = 0; i < attributes.length; i++) {
            const { name, value } = attributes[i];
            result[name.replaceAll('-', '')] = value;
        }

        return result;
    },

    getStructureType: function (type) {

        type = type.toUpperCase();

        let auxType = 'COMMONSTR';
        const commonStrType = ['LINE', 'AREA', 'COLUMN', 'SPLINE', 'BAR', 'STACKEDBAR', 'STACKEDAREA', 'STACKEDPERCENTAREA', 'STACKEDCOLUMN', 'STACKEDGROUPEDCOLUMN', 'STACKEDPERCENTCOLUMN'];

        if (type == 'FUNNEL' || type == 'PYRAMID')
            auxType = 'PYFU';

        else if (!commonStrType.includes(type))
            auxType = type;

        return auxType;
    },

    getChartAxis : function(type){
        const chart2DAxis = ['pie','donut','doughnut','funnel','pyramid'];

        return chart2DAxis.includes(type);
    },

    getChartData: function (data) {
        let result = [];

        data.forEach(function (e) {

            let d = [];

            e.split('!').forEach(function (v) {
                d.push(v * 1);
            });

            result.push(d);
        });

        return result;
    },

    handlerColors : function(colors, data){
        
        return colors ? colors.split('|') : igrpChartsUtils.colors.get(data.length);
    },

    handlerChartsData : function(p){
        const {chartcategories, chartcolors, chartdata, chartdatasets, charttype, chartid} = p;

        let dataColorSize = chartdata;

        if(igrpChartsUtils.getChartAxis(charttype))
            dataColorSize = chartcategories;

        return {
            chartType       : charttype,
            chartId         : chartid,
            chartStrByType  : igrpChartsUtils.getStructureType(charttype),
            chartCategories : chartcategories.split('|'),
            chartData       : igrpChartsUtils.getChartData(chartdata.split('|')),
            chartDatasets   : chartdatasets.split('|'),
            chartColors     : igrpChartsUtils.handlerColors(chartcolors,dataColorSize)
        }
    }
}