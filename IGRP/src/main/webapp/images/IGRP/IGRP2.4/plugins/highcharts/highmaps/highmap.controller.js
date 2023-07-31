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

                    map.basemap  = json;

                    var basemap  = setDrillDown( Highcharts.geojson( json ) ),

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

                        options  = $.extend(true, _options,map.events.execute('basemap-config', _options ))

                    map.chart.addSeries( options );

                    map.events.execute('basemap-add', {} );

                }

            });                        
        };

        map.setData = function(dataURL){
            
             map.dataURL = dataURL;

            if($('.treemenu')[0]){
                var name = 'p_fwl_'+$('.treemenu').attr('item-name')+'_tmid';

                if ($('#'+name)[0])
                    dataURL = $.IGRP.utils.getUrl(dataURL)+'p_id='+$('#'+name).val();
            }
            
            map.html.addClass('is-home');

            map.breadcrumb.addClass('is-home');

            $.IGRP.request(dataURL,{
                
                dataType:'json',
                
                complete:function(json){

                    map.data = json;

                    var onBasemapAdd = function(){
                        
                        json.series.forEach(function(s){
                            if(! ('value' in s) )
                                s.value = "";
                        });

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

            map.chart         = Highcharts.mapChart(id, {
                
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
                    
            });

            setHtml();

            map.chart.reflow();                       
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

            map.legendWrapper.on('click','.mc-legend-item',function(){
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

                        	mainDiv = map.html.parents('.gen-container-item'),

                            div  = mainDiv.clone(true)[0],

                            xprOptions = {

	                       		allowTaint: true,

								logging: false,

								timeout: 0

	                       	};

	                       	$(div).css({

	                       		position: 'fixed',

	                       		top: '-500%'

	                       	}).width( mainDiv.width() ).height( mainDiv.height() );

	                       	$('body').prepend(div);

                       	$(div).addClass('map-exporting');

                       	mainDiv.addClass('waiting');

                        try{

                            if (navigator.msSaveBlob) {

                                var svgElements = $(div).find('svg');

                                svgElements.each(function() {

                                    var canvas, xml;

                                    $.each($(this).find('[style*=em]'), function(index, el) {

                                        $(this).css('font-size', getStyle(el, 'font-size'));

                                    });

                                    canvas = document.createElement("canvas");

                                    canvas.className = "screenShotTempCanvas";

                                    xml = (new XMLSerializer()).serializeToString(this);

                                    xml = xml.replace(/xmlns=\"http:\/\/www\.w3\.org\/2000\/svg\"/, '');

                                    canvg(canvas, xml);

                                    $(canvas).insertAfter(this);

                                    $(this).attr('class', 'tempHide');

                                    $(this).hide();

                                });
                                
                            }

                            html2canvas( div, xprOptions ).then(function(c){

                                c.toBlob(function(blob) {

                                    var name = map.title || $.IGRP.info.app+'_'+$.IGRP.info.page;

                                    saveAs(blob, name+'.'+type);

                                    $(div).remove();

                                    mainDiv.removeClass('waiting');

                                }, "image/"+type);

                            });

                        }catch(error){

                            $(div).remove();

                            mainDiv.removeClass('waiting');

                            console.log(error);

                        }

                    }else{

                        $.IGRP.notify({

                            message : 'Para esta funcionalidade recomendamos que utilize outro Browser( Google Chrome / Firefox / IE 10+ )',

                            type    : 'warning'

                        })  


                    }
                    
                    return false;

                });

        };   

        var nativeExport = function(){

        }

        var init = function(){

            map.events.execute('map-set', {} );

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
                
//                console.log(m);

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

//                    console.log(btnPos)

                    $.IGRP.components.highmap.events.execute('map-init',options);


                };

            });

        }
    },true);

})();
function getStyle(el, styleProp) {
  var camelize = function(str) {
    return str.replace(/\-(\w)/g, function(str, letter) {
      return letter.toUpperCase();
    });
  };

  if (el.currentStyle) {
    return el.currentStyle[camelize(styleProp)];
  } else if (document.defaultView && document.defaultView.getComputedStyle) {
    return document.defaultView.getComputedStyle(el, null)
      .getPropertyValue(styleProp);
  } else {
    return el.style[camelize(styleProp)];
  }
}

/**
  * Highcharts exportation functions
  * @author Our Code World
  */
 (function(window){
    
    function ExportInitializator(){
        var exp = {};
        
 
        var EXPORT_WIDTH = 1000;  // Exportation width
        
		
		/**
		 * This method requires the highcharts_export.js file 
		 */
        exp.highchartsSVGtoImage = function(chart,callback) {
            var svg = chart.highcharts().getSVG();
            var canvas = document.createElement('canvas');
            canvas.width = chart.width();
            canvas.height = chart.height();
            var ctx = canvas.getContext('2d');

            var img = document.createElement('img');

            img.onload = function() {
                ctx.drawImage(img, 0, 0);
                callback(canvas.toDataURL('image/png'));
            };

            img.setAttribute('src', 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(svg))));
        };
        
        /**
		 * This method requires the highcharts_export.js file 
		 */
        exp.highchartsCustomSVGtoImage = function(chart,callback){
            if(!chart){
                console.error("No chart given ");
            }
            var render_width = EXPORT_WIDTH;
            var render_height = render_width * chart.chartHeight / chart.chartWidth;

            var svg = chart.getSVG({
                exporting: {
                    sourceWidth: chart.chartWidth,
                    sourceHeight: chart.chartHeight
                }
            });
            
 
            
            var canvas = document.createElement('canvas');
            canvas.height = render_height;
            canvas.width = render_width;
            var image = new Image();
            image.src = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(svg)));
//            console.log(image);
            image.addEventListener('load', function() {
//                console.log(chart);
                canvas.getContext('2d').drawImage(this, 0, 0, render_width, render_height);
                callback(canvas.toDataURL('image/png'));
            }, false);

            image.src = 'data:image/svg+xml;base64,' + window.btoa(svg);
        };
         
		
		/**
		 * This method requires the highcharts_export.js file 
		 */
        exp.nativeSVGtoImage = function(DOMObject,callback,format){
         
            if(!DOMObject.nodeName){
                throw new error("Se requiere un objeto DOM de tipo SVG. Obtener con document.getElementById o un selector de jQuery $(contenedor).find('svg')[0]");
            }

            var svgData = new XMLSerializer().serializeToString(DOMObject);

            var canvas = document.createElement("canvas");

            canvas.width = $(DOMObject).width();

            canvas.height = $(DOMObject).height();

            var ctx = canvas.getContext( "2d" );

            var img = document.createElement("img");

            img.setAttribute( "src", "data:image/svg+xml;base64," + btoa(unescape(encodeURIComponent(svgData))) );
           
           	img.onload = function() {

                ctx.drawImage( img, 0, 0 );
                
                if(format === "jpeg" || format === "jpg"){
                    callback( canvas.toDataURL("image/jpeg") );
                }else{
                    callback( canvas.toDataURL("image/png") );
                }
            }; 
            return true;
        };
        
        return exp;
    }
    
    if(typeof(highchartsExport) === 'undefined'){
        window.highchartsExport = new ExportInitializator();
    }
})(window);