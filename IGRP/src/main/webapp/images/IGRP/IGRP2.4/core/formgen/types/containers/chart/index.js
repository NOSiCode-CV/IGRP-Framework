var GenChartComponent = ( type )=>{

    return function(name,params){
        CONTAINER.call(this,name,params);
        
        var GEN = VARS.getGen();
        
        var container = this;
    
        container.fields = false;
    
        container.xml.type = 'chart';
        
        container.includes = {
            xsl : ['parts.charts'],
            js : [
                { path:'/plugins/charts/igrp.charts.utils.js' },
                { path:'/plugins/charts/chartjs/chartjs.min.js' },
                { path:'/plugins/charts/chartjs/igrp.chartjs.js' },
                { path:'/plugins/charts/apexcharts2/apexcharts.min.js' },
                { path:'/plugins/charts/apexcharts2/igrp.apexcharts.js' }
    
            ]
    
        }

        container.GET.type = ()=>'chart';
    
        container.onDrawEnd = function(){

            switch(container.GET.chart_lib()){
                case 'chartjs':
                    $.IGRP.components.chartjs.render( container.holder.find('.IGRP-charts-component')[0] );
                break;
    
                case 'apexcharts':
                    $.IGRP.components.apexcharts.render( container.holder.find('.IGRP-charts-component')[0] );
                break;
                
            }

            GEN.resizeView();
        }
    
        container.ready = function(){
    
            container.SET.hasTitle(true);
    
            container.setPropriety({
                name: 'height',
                label : 'Altura',
                value:250
            });
    
            container.setPropriety({
                name:'chart_type',
                label:'Tipo de Gráfico',
                value:{
                    value  : type || 'line',
                    options:$.IGRP.defaults.highcharts.types
                },
                editable : type ? false : true
                
                //,
                //transform:true
            });
    
            container.setPropriety({
                name:'chart_lib',
                label:'Biblioteca de gráfico',
                value:{
                    value   : 'apexcharts',
                    options : [
                        {label:'Chart.js', value:'chartjs'},
                        {label:'Apexchart', value:'apexcharts'}
                    ]
                }
            });
    
            /*
    
            container.setPropriety({
                name:'filter_type',
                label:'Filter Type',
                value:{
                    value   : '',
                    options :$.IGRP.defaults.highcharts.types,
                    multiple:true
                },
                onEditionStart : function(o){
                    if(container.GET.filter && container.GET.filter())
                        o.input.show();
                    else
                        o.input.hide();
                }
            });
    
    
            container.setPropriety({
                name 	 :'filter',
                label 	 : 'Filter',
                value 	 : false,
                xslValue : function(){
                    var rtn = '<xsl:with-param name="filter" select="\'true\'"/>';
    
                    if(container.GET.filter_type && container.GET.filter_type())
                        rtn += '<xsl:with-param name="filter_type" select="\''+container.GET.filter_type()+'\'"/>';
                    
                    if(container.GET.remote_filter && container.GET.remote_filter())
                        rtn += '<xsl:with-param name="remote_filter" select="\''+container.GET.remote_filter()+'\'"/>';
    
                    return rtn;
                }, //XSL VALUE WHEN PROPRIETY IS TRUE
                onEditionStart:function(v){
                    $('input',v.input).on('change',function(){
                        var action  = $(this).val() ? 'show' : 'hide'; 
                        $('.gen-properties-setts-holder div[rel="filter_type"]')[action]();
                        $('.gen-properties-setts-holder div[rel="remote_filter"]')[action]();
                    });
                }
            });
    
            container.setPropriety({
                name 	 :'remote_filter',
                label 	 : 'Remote Filter ',
                value 	 : false,
                onEditionStart:function(o){
                    if(container.GET.filter && container.GET.filter())
                        o.input.show();
                    else
                        o.input.hide();
                }
            });
    
            container.setPropriety({
                name 	 :'datalabels',
                label 	 : 'Data Labels',
                value 	 : false,
                xslValue : function(){
                    return '<xsl:with-param name="datalabels" select="\''+container.GET.datalabels()+'\'"/>';
                }
            });
            
            container.setPropriety({
                name: 'view3d',
                label: 'View 3D',
                value: false,
                xslValue: function () {
                    return '<xsl:with-param name="view3d" select="\'' + container.GET.view3d() + '\'"/>';
                }
            });*/
        }
        
    }
}



