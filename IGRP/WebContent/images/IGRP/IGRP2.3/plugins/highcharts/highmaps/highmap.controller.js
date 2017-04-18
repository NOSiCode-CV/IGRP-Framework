(function () {

    function MapChart(id,o){
        
        var map    = this,
            height = o.height || 350,
            joinBy = o.joinBy || ['ID','id'];

        map.events  = new $.EVENTS(['basemap-add'])

        map.chart   = null; 
        map.basemap = null;
        map.config  = null;
        map.data    = null;

        map.setBasemap = function(basemapURL){
            
            $.IGRP.request(basemapURL,{
                
                dataType:'json',
                
                complete:function(json){

                    map.basemap = json;

                    var basemap = setDrillDown( Highcharts.geojson( json ) );

                    map.chart.addSeries({
                       
                        mapData : basemap,
                        joinBy  : joinBy,
                        dataLabels: {
                            enabled: true,
                            formatter: function(e){
                                return this.point.name;
                            }
                        }
                    });

                    map.events.execute('basemap-add', {} );

                }
            });            
        };

        map.setData = function(dataURL){
            
            map.dataURL = dataURL;

            map.html.addClass('is-home');

            $.IGRP.request(dataURL,{
                
                dataType:'json',
                
                complete:function(json){

                    map.data = json;

                    var onBasemapAdd = function(){
                        map.chart.series[0].update({
                            data : json.series
                        },true);

                        if(json.legend)
                            setLegend(json.legend);
                    }

                    if(map.basemap)
                        onBasemapAdd();
                    else
                        map.events.on('basemap-add',onBasemapAdd);

                }
            });
        };

        map.setConfig = function(configURL){
            
            $.IGRP.request(configURL,{
                dataType:'json',
                complete:function(json){
                    map.config = json;
                }
            });
        };

        var setLegend = function(legends){
            
            var arr = [];

            legends.forEach(function(l){
                var legend = $('<div class="mc-legend-item" color="'+l.color+'" visible="true">'+
                                    '<span class="mc-legend-color" style="background-color:'+l.color+'"></span>'+
                                    '<span class="mc-legend-desc">'+l.legend+'</span>'+
                               '</div>');
                arr.push(legend)
            });

            map.legendWrapper.html(arr);
        };

        var setBreadcrumb = function(o){
            console.log(o)
        };

        var failCallBack = function(mapKey){
            
            fail = setTimeout(function () {

                map.chart.showLoading('<span/>');
                //map.chart.showLoading('<i class="fa fa-frown-o"></i> Failed loading ' + mapKey);

                fail = setTimeout(function () {

                    map.chart.hideLoading();

                }, 3000);

            }, 1000);
            
        };

        var setChart = function(){

            map.html          = $('#'+id);

            map.chart         = Highcharts.mapChart(id, {
                
                title : false,

                chart:{

                    height: height,

                    events:{
                       
                        drilldown: function (e) {

                            if (!e.seriesOptions) {
                                var chart  = this,
                                    mapKey = e.point.drilldown,
                                    name   = e.point.name;
         
                                    
                                chart.showLoading('<i class="icon-spinner icon-spin icon-3x"></i>'); // Font Awesome spinner

                                if(map.config[mapKey]){

                                    $.IGRP.request( map.config[mapKey], {

                                        dataType : 'json',

                                        success : function (json) {
                                 
                                            var mapData = setDrillDown( Highcharts.geojson( json ) );
                                            
                                            $.IGRP.request( map.dataURL, {
                                                params   : { p_id : mapKey },
                                                dataType : 'json',
                                                success:function(data){

                                                    chart.addSeriesAsDrilldown(e.point, {
                                                        name       : e.point.name,
                                                        mapData    : mapData,
                                                        joinBy     : joinBy,
                                                        data       : data.series,
                                                        dataLabels : {
                                                            enabled: true,
                                                            formatter: function(e){
                                                                return this.point.name;
                                                            }
                                                        }
                                                    });

                                                    if(data.legend)
                                                        setLegend(data.legend);

                                                    chart.hideLoading();

                                                    map.html.removeClass('is-home');

                                                }
                                                
                                            });

                                        },

                                        fail:function(e){

                                            failCallBack(mapKey);

                                        }

                                    });
                                    
                                }else{
                                    failCallBack(mapKey);
                                }
                               
                            }

                        },
                        drillup: function (e) {
                            if(e.seriesOptions._levelNumber == 0 && map.data && map.data.legend){
                                map.html.addClass('is-home');
                                setLegend(map.data.legend);
                            }
                        }
                    }

                },

                mapNavigation: {
                    enabled: false,
                    buttons:true
                },
                /*colorAxis: {
                    min: 0
                },*/
                tooltip: false,
                xAxis: {
                    minRange: -100 // <- prevent zooming in too much
                },
                plotOptions: {
                    series: {
                        animation: true,
                        events: {
                            click:function(e){
                                
                            }    
                        }
                    }
                },
                exporting:false,

                legend:{
                     enabled: false
                },

                series: [],

                drilldown: {
                    activeDataLabelStyle: {
                        color: '#FFFFFF',
                        textDecoration: 'none',
                        textOutline: '1px #000000'
                    },
                    drillUpButton: {
                        relativeTo: 'spacingBox',
                        position: {
                            x: 0,
                            y: 60
                        }
                    }
                }
                    
            });

            map.legendWrapper = $('<div class="mc-legend-wrapper clearfix"/>');

            map.breadcrumb    = $('<div class="mc-breadcrumb"><span class="mc-bc-item" text-color="1"><i class="fa fa-chevron-left"></i></span></div>');

            map.html.append(map.legendWrapper);

            map.html.prepend(map.breadcrumb);
        };

        var setDrillDown = function(json){
            
            $.each(json, function (i) {
                this.drilldown = this.properties['ID'];
                this.name      = this.name || this.properties['NOME'];
                this.value     = i;
            });

            return json;
        };

        var toggleSeries = function(color,visible){
            if(map.chart.series)
                map.chart.series.forEach(function(s){
                    if(s.data)
                        s.data.forEach(function(d){
                            if(d.color == color)
                                d.setVisible(!visible);
                        });
                });
        };

        var setEvents = function(){

            map.legendWrapper.on('click','.mc-legend-item',function(){
                var color   = $(this).attr('color');
                var visible = $(this).attr('visible') == 'true' ? true : false;

                toggleSeries(color,visible);

                $(this).attr('visible',!visible);

            }); 

            $('.mc-bc-item').on('click',function(){
                map.chart.drillUp();
            });


        };   

        var init = function(){

            setChart(); 

            if(o.basemap)
                map.setBasemap( o.basemap );

            if(o.data)
                map.setData( o.data );

            if(o.config)
                map.setConfig( o.config );

            setEvents();
        };

        init();

    };

    Highcharts.setOptions({
        lang: {
            drillUpText: 'Voltar'
        }
    });

    $.IGRP.component('highmap',{

        maps : {},

        set:function(id,o){

            $.IGRP.components.highmap.maps[id] = new MapChart(id,o);

        },

        init:function(){
            
            $.each($('.igrp-highmaps'),function(i,m){
               
                if(!$(m).hasClass('map-set')){
                    var id = $(m).attr('id'),
                        bm = $(m).attr('basemap'),
                        dt = $(m).attr('data'),
                        cf = $(m).attr('config'),
                        ht = $(m).attr('map-height');
                
                    $.IGRP.components.highmap.set(id,{
                        basemap : bm,
                        data    : dt,
                        config  : cf,
                        height  : ht
                    });

                    $(m).addClass('map-set');

                };

            });

        }
    },true);

})();