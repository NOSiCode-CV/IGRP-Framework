(function () {

    function MapChart(id,o){
        
        var map    = this,
            height = o.height || 350,
            joinBy = o.joinBy || ['ID','id'];

        map.events  = new $.EVENTS(['basemap-config','basemap-add','map-set']);

        map.id      = id;

        map.title   = o.title,

        map.chart   = null; 
        map.basemap = null;
        map.config  = null;
        map.data    = null;

        map.html    = $('#'+id);

        map.defaults = o.defaults || {};

        Highcharts.setOptions({
            lang: {
                drillUpText: 'Voltar'
            }
        });

        map.setBasemap = function(basemapURL){
            
            $.IGRP.request(basemapURL,{
                
                dataType:'json',
                
                complete:function(json){

                    json =  setDrillDown( Highcharts.geojson( json ) );

                    Highcharts.maps["custom/igrp"] = json;

                    map.basemap  = json;

                    if(o.data)

                        $.IGRP.request(o.data,{
                
                            dataType:'json',
                            
                            complete:function(json){

                                var series =[];

                                 json.legend.forEach(function(l){
                            
                                    var S = {
                                        name : l.legend,
                                        color : l.color,
                                        data : json.series.filter(function(s){
                                            return s.color == l.color
                                        })
                                    };

                                    series.push(S);

                                });

                                map.chart = Highcharts.mapChart(id, {
               
                                    chart: {

                                        map: 'custom/igrp',

                                        spacingBottom: 20,

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
                                                     
                                                                var mapData       = setDrillDown( Highcharts.geojson( json ) ),

                                                                    dataLabelAttr = o.dataLabels;
                                                                
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
                                                                                    
                                                                                    var prop = dataLabelAttr != 'name' && this.point.properties ? this.point.properties[dataLabelAttr] : this.point.name;

                                                                                    return prop;
                                                                                }
                                                                            }
                                                                        });

                                                                        if(data.legend)
                                                                            setLegend(data.legend);

                                                                        chart.hideLoading();

                                                                        map.html.removeClass('is-home');

                                                                        map.breadcrumb.removeClass('is-home');

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
                                                    map.breadcrumb.addClass('is-home');
                                                    setLegend(map.data.legend);
                                                }
                                            }
                                        },

                                        style:{

                                            fontFamily :'Roboto,sans-serif,Arial',

                                            fontWeight : '300'

                                        }
                                    },

                                    height : height,



                                    title: {
                                        text: map.title
                                    },

                                    legend: {
                                        enabled: true
                                    },

                                    mapNavigation: {
                                        enabled: true,
                                        buttons:true
                                    },

                                    plotOptions: {

                                        map: {
                                            allAreas: true,
                                             nullColor: 'rgba(0,0,0,0)',
                                            joinBy: joinBy,
                                            dataLabels: {
                                                enabled: true,
                                                formatter: function(e){

                                                    var prop = o.dataLabels != 'name' && this.point.properties ? this.point.properties[dataLabelAttr] : this.point.name;

                                                    return prop;
                                                }
                                            },
                                            tooltip: map.defaults.tooltip ? $.extend(true, {

                                                headerFormat:''

                                            }, map.defaults.tooltip) : false
                                        }
                                    },

                                    series: series

                                 
                                });

                            }
                        });


                    /*var basemap  = setDrillDown( Highcharts.geojson( json ) ),

                        dataLabelAttr = o.dataLabels,

                        _options = {
                            mapData : basemap,
                            joinBy  : joinBy,
                            dataLabels: {
                                enabled: true,
                                formatter: function(e){

                                    var prop = dataLabelAttr != 'name' && this.point.properties ? this.point.properties[dataLabelAttr] : this.point.name;

                                    return prop;
                                }
                            }
                        };

                        options  = $.extend(true, _options, map.events.execute('basemap-config', _options ))

                    map.chart.addSeries( options );

                    map.events.execute('basemap-add', {} );*/

                }

            });                        
        };

        map.setData = function(dataURL){
            
            map.dataURL = dataURL;

            //map.html.addClass('is-home');

            //map.breadcrumb.addClass('is-home');

            $.IGRP.request(dataURL,{
                
                dataType:'json',
                
                complete:function(json){

                    var series = [];
                    
                    map.data = json;

                    var onBasemapAdd = function(){

                        json.legend.forEach(function(l){
                            
                            var S = {
                                name : l.legend,
                                data : json.series.filter(function(s){
                                    return s.color == l.color
                                })
                            };

                            series.push(S);

                        });


                        map.chart.addSeries( series );

                        //map.chart.series[0].setData(series)
                        /*json.series.forEach(function(s){
                            if(! ('value' in s) )
                                s.value = "";
                        });*/

                        /*json.series.forEach(function(s){
                            if(! ('value' in s) )
                                s.value = "";
                        });

                        map.chart.series[0].update({
                            data : json.series
                        },true);

                        if(json.legend)
                            setLegend(json.legend);*/
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
            console.log(o);
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

        var setHtml = function(){

            var pos           = o.defaults.legendPosition;

            var size          = o.defaults.legendSize*1;

            var body          = map.html.parents('.box-body').first();

            map.legendWrapper = $('<div class="mc-legend-wrapper clearfix"/>');

            map.breadcrumb    = $('<div class="mc-breadcrumb"><span class="mc-bc-item" text-color="1"><i class="fa fa-arrow-left"></i></span></div>');

            if(o.defaults.exporting.enabled){

                var position = o.defaults.exporting.buttons.contextButton.align || 'right';

                map.exportMenu = $(
                    '<div class="mapchart-export-menu '+position+'">'+
                        '<div class="dropdown">'+
                          '<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">'+
                           '<i class="glyphicon glyphicon-menu-hamburger"></i>'+
                          '</button>'+
                          '<ul class="dropdown-menu">'+
                            //'<li type="pdf"><a href="#">PDF</a></li>'+
                            '<li type="png"><a href="#">PNG</a></li>'+
                            '<li type="jpg"><a href="#">JPG</a></li>'+
                          '</ul>'+
                        '</div>'+
                    '</div>'
                );

                body.append(map.exportMenu);
   

            }

            if(o.defaults.legendPosition){
                
                switch( o.defaults.legendPosition ){

                    case 'bottom':

                        map.html.parent().append( map.legendWrapper );

                    break;

                    case 'top':

                        map.html.parent().prepend( map.legendWrapper );

                    break;

                     case 'right':

                        map.html.addClass('col-sm-'+(12-size));

                        map.legendWrapper.addClass('col-sm-'+size+' block');

                        map.html.parent().append( map.legendWrapper );
                        
                    break;

                    case 'left':
                        
                        map.html.addClass('col-sm-'+(12-size));
                        
                        map.legendWrapper.addClass('col-sm-'+size+' block');
                        
                        map.html.parent().prepend( map.legendWrapper );
                        
                    break;

                }

            }else{

                map.html.parent().append( map.legendWrapper );

            }

            map.html.parent().prepend(map.breadcrumb);

        };

        var setChart = function(){

            

           /* map.chart         = Highcharts.mapChart(id, {
                
                title : null,

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
                                 
                                            var mapData       = setDrillDown( Highcharts.geojson( json ) ),

                                                dataLabelAttr = o.dataLabels;
                                            
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
                                                                
                                                                var prop = dataLabelAttr != 'name' && this.point.properties ? this.point.properties[dataLabelAttr] : this.point.name;

                                                                return prop;
                                                            }
                                                        }
                                                    });

                                                    if(data.legend)
                                                        setLegend(data.legend);

                                                    chart.hideLoading();

                                                    map.html.removeClass('is-home');

                                                    map.breadcrumb.removeClass('is-home');

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
                                map.breadcrumb.addClass('is-home');
                                setLegend(map.data.legend);
                            }
                        }
                    },

                    style:{

                        fontFamily :'Roboto,sans-serif,Arial',

                        fontWeight : '300'

                    }

                },                

                mapNavigation: {
                    enabled: true,
                    buttons:true
                },
  
                tooltip: map.defaults.tooltip ? $.extend(true, {

                    headerFormat:''

                }, map.defaults.tooltip) : false, 

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

                exporting: false,

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
                    
            });*/

            //setHtml();

            //map.chart.reflow();                       
        };

        var setDrillDown = function(json){
            
            $.each(json, function (i) {
                this.drilldown = this.properties['ID'];
                this.name      = this.name || this.properties['NOME'];
                //this.value     = i;
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

            /*map.legendWrapper.on('click','.mc-legend-item',function(){
                var color   = $(this).attr('color');
                var visible = $(this).attr('visible') == 'true' ? true : false;

                toggleSeries(color,visible);

                $(this).attr('visible',!visible);

            }); 

            map.breadcrumb.on('click','.mc-bc-item',function(){
                map.chart.drillUp();
            });

            if(map.exportMenu)
                
                map.exportMenu.on('click','li[type]',function(){
                   
                    if( !!new Blob ){

                        var type = $(this).attr('type'),

                            div  = map.html.parents('.gen-container-item')[0]

                       $(div).addClass('map-exporting');


                        domtoimage.toBlob( div ).then(function (blob) {
                           
                            var name = map.title || $.IGRP.info.app+'_'+$.IGRP.info.page;

                            window.saveAs( blob, name+'.'+type );

                            $(div).removeClass('map-exporting');

                        })
                        .catch(function (error) {

                            console.log(error);

                            console.error('oops, something went wrong!', error);

                            $(div).removeClass('map-exporting');

                        });

                    }else{

                        $.IGRP.notify({

                            message : 'Para esta funcionalidade recomendamos que utilize outro Browser( Google Chrome / Firefox / IE 10+ )',

                            type    : 'warning'

                        })  


                    }
                    
                    return false;

                });*/

        };   

        var init = function(){

            map.events.execute('map-set', {} );

            setChart(); 

            if(o.basemap)
                map.setBasemap( o.basemap );

            if(o.data)
                map.setData( o.data );

            if(o.config)
                map.setConfig( o.config );

            //setEvents();
        };

        init();

        return map;

    };

    

    $.IGRP.component('highmap',{

        maps : {},

        events: new $.EVENTS(['init','map-init']),

        set:function(id,o){

            $.IGRP.components.highmap.maps[id] = new MapChart(id,o);

        },

        init:function(){
           
            $.each($('.igrp-highmaps'),function(i,m){
                
                console.log(m);

                if(!$(m).hasClass('map-set')){
                    var id      = $(m).attr('id'),
                        bm      = $(m).attr('basemap'),
                        dt      = $(m).attr('data'),
                        cf      = $(m).attr('config'),
                        dl      = $(m).attr('data-labels'),
                        ht      = $(m).attr('map-height') || 400,
                        tit      = $('>.box-header>.box-title',$(m).parents('.gen-container-item')[0]).text() || null,
                        lp      = $(m).attr('legend-position') || 'bottom',
                        ls      = $(m).attr('legend-size') || 2,
                        tt      = $(m).attr('tooltip') == 'true',
                        ttf     = $('tooltip-format',m).html(),
                        ex      = $(m).attr('export') == 'true',
                        btnPos  = $(m).attr('export-button-position'),

                        tooltip = tt ? {
                        
                            useHTML : true,

                            pointFormat : '<div class="igrp-hm-tooltip">'+ttf+'</div>' || '{name}: {value}'
                        
                        } : false,
                        
                        defaults = {
                            legendPosition : lp,
                            legendSize     : ls,
                            tooltip        : tooltip,
                            exporting      : {
                                enabled : ex,
                                buttons : {
                                    contextButton : {
                                        align : btnPos || 'right'
                                    }
                                }
                            }
                        },

                        geoIdx = bm.indexOf('/utils/geo/'),

                        options  =  {
                            title      : tit,
                            id         : id,
                            basemap    : geoIdx >= 0 ? path+bm.substring(geoIdx) : bm,
                            config     : geoIdx >= 0 ? path+cf.substring(geoIdx) : cf,
                            dataLabels : dl || 'name',
                            data       : dt,
                            height     : ht,
                            defaults   : defaults
                        };
                        
                    $.IGRP.components.highmap.set(id,options);

                    $(m).addClass('map-set');

                    $.IGRP.components.highmap.events.execute('map-init',options);


                };

            });

        }
    },true);

})();