<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:param name="pheight"/>
  
  <xsl:template match="*">
    
    <xsl:variable name="nheight">
      <xsl:choose>
        <xsl:when test="$pheight and $pheight != ''"><xsl:value-of select="$pheight"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="./height"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="graphed">
      <xsl:with-param name="grafico" select="."/>
      <xsl:with-param name="tipo" select="./chart_type"/>
      <xsl:with-param name="height" select="$nheight"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="highcharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="tipo" select="'line'"/>
    <xsl:param name="subtipo" select="''"/>
    <xsl:param name="stacking" select="'normal'"/>
    <xsl:param name="grouped" select="'false'"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <!--pegar o nome do NO da xml para o ID do grafico-->
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    
    <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>
   
    <script type="text/javascript">
      $(function () {
        var id = "<xsl:value-of select='$graph-id'/>"; 
        var _type = "<xsl:value-of select='$tipo'/>";
        var vX = '', vY = '';
        
        $('#id-'+id).highcharts({
          chart:{type: _type},
          title:{text: '', x: -20},
          subtitle:{text: '', x: -20},
          xAxis: {
            categories: [<xsl:for-each select="$grafico/label/col[position()!=1]">'<xsl:value-of select="."/>'<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
          <xsl:if test="$subtipo != '' and $subtipo = 'area'">
            tickmarkPlacement: 'on'
          </xsl:if>
          },
          <xsl:if test="$grafico/colors">
          colors: [<xsl:for-each select="$grafico/colors/col">'<xsl:value-of select="."/>'<xsl:if test="position() != last()">,</xsl:if></xsl:for-each>],
          </xsl:if>
          yAxis: {
            title: {text: ''},
            plotLines: [{value: 0,width: 1,color: '#808080'}]
          },
          tooltip: {
            valueSuffix: '',
            formatter:function(){
              vX = this.x; 
              vY = this.y;
              return '<span style="color:'+this.point.color+'">\u25CF</span><b>'+ vX + '</b><br/><b>' +this.series.name + ':</b>' +vY<xsl:if test="$stacking = 'percent'">+ ' - ('+ this.percentage.toFixed(1)+' %)'</xsl:if><xsl:if test="$subtipo != '' and $subtipo = 'column' and $grouped = 'false'">+'<br/><b>Total:</b>' + this.point.stackTotal</xsl:if>;          
            }
          },
          legend: {
            layout:'horizontal',
            align:'center',
            verticalAlign:'bottom',
            borderWidth: 0
          },
          plotOptions:{ 
            series:{
              cursor:'pointer',
              events:{
                click:function(e){
                  var vZ = this.name;
                  $.IGRP.utils.openChartURL({
                    pUrl:"<xsl:value-of select='$url'/>",
                    pX:vX,
                    pY:vY,
                    pZ:vZ
                  });
                }
              }
          }<xsl:if test="$subtipo != '' and $subtipo = 'column'">,
            column: {
              stacking:"<xsl:value-of select='$stacking'/>",
              dataLabels: {
                enabled: true,
                color: (Highcharts.theme &amp;&amp; Highcharts.theme.dataLabelsColor) || 'white',
                style: {
                  textShadow: '0 0 3px black'
                }<xsl:if test="$stacking = 'percent'">,
                format:'{point.percentage:.1f}%'
                </xsl:if>
              }
            }</xsl:if><xsl:if test="$subtipo != '' and $subtipo = 'area'">,
            area: {
              stacking:"<xsl:value-of select='$stacking'/>",
              lineColor: '#666666',
              lineWidth: 1,
              marker: {
                lineWidth: 1,
                lineColor: '#666666'
              }
            }</xsl:if>
          },
          series: [
          <xsl:for-each select="$grafico/value/row">
            {
              name:'<xsl:value-of select="col[position() = 1]"/>',
              data:[<xsl:for-each select="col[position() &gt; 1]"><xsl:value-of select="."/><xsl:if test="position() != last()">,</xsl:if></xsl:for-each>]
              <xsl:if test="$grouped = 'true'">
                <xsl:variable name="pos">
                <xsl:choose>
                    <xsl:when test="(position()+1) mod 2 = 0">1</xsl:when>
                    <xsl:otherwise>2</xsl:otherwise>
                </xsl:choose>
                </xsl:variable>,
              stack:'<xsl:value-of select="$grafico/value/row[position() = $pos]/col[position() = 1]"/>'
              </xsl:if>}<xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>]

        });
        
      });
    </script>
  </xsl:template>
  
 
  <xsl:template name="fixedcolumns-highcharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <!--pegar o nome do NO da xml para o ID do grafico-->
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    
    <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>
    <script type="text/javascript">
     $(function () {
        var id = "<xsl:value-of select='$graph-id'/>";
        var vX = '', vY = '';
        
        $('#id-'+id).highcharts({
          chart: {type:'column'},
          title: {text:' '},
          xAxis: {categories: [<xsl:for-each select="$grafico/label/col[position()!=1]">
          '<xsl:value-of select="."/>'
          <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>]
          },yAxis: [{min: 0,title: {text: ' '}}, {title: {text: ' '},opposite: true}],
          legend: {shadow: false,borderWidth:0},
          tooltip: {shared: true,formatter:function(){
              vX = this.x; vY = this.y; 
              var s = '<b>' + this.x + '</b>';
              $.each(this.points, function () {
                s += '<br/> <span style="color:'+this.point.color+'">\u25CF</span> ' + this.series.name + ': ' +this.y;
              });
              return s;
            }
          },
          plotOptions: {column: {grouping: false,shadow: false, borderWidth: 0},
            series:{cursor:'pointer',
            events:{
              click:function(e){
                var vZ = this.name;
                $.IGRP.utils.openChartURL({pUrl:"<xsl:value-of select='$url'/>",pX:vX,pY:vY,pZ:vZ});
                }
              }
            }
          },
          series: [
        <xsl:for-each select="$grafico/value/row">
        <xsl:variable name="pos" select="position()"/>
        <xsl:variable name="vpos" select="(position()+1) mod 2"/>
        {
          name: '<xsl:value-of select="col[position()=1]"/>',
          color: '<xsl:value-of select="$grafico/colors/col[position()=$pos]"/>',
          data:[<xsl:for-each select="col[position() &gt; 1]">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>],
          <xsl:choose>
            <xsl:when test="$vpos != 0">
              pointPadding: 0.4,
              pointPlacement: -0.2,
            </xsl:when>
            <xsl:otherwise>
              pointPadding: 0.3,
              pointPlacement: -0.2,
            </xsl:otherwise>
          </xsl:choose>
          yAxis: 1
        }<xsl:if test="position() != last()">,</xsl:if>
      </xsl:for-each>
      ]
      });
    });
    </script>
  </xsl:template>
  
  
  <xsl:template name="pie-highcharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <!--pegar o nome do NO da xml para o ID do grafico-->
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    
     <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>
     <script type="text/javascript">
        $(function () {
          var id = "<xsl:value-of select='$graph-id'/>";
          var vX = '', vY = '';
          $('#id-'+id).highcharts({
            chart: {plotBackgroundColor: null,plotBorderWidth: null,plotShadow: false},
            title: {text: ''},

            tooltip: {pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
              formatter: function(){
                vX = this.key;
                vY = this.y;
                return '<span style="color:'+this.point.color+'">\u25CF</span> '+vX+'<br/>'+this.series.name+': <b>'+this.percentage.toFixed(1)+' % ('+vY+')</b>';
              }
            }, 

            plotOptions: {pie: {allowPointSelect: true,cursor: 'pointer',dataLabels:{enabled: true,formatter: function(){return this.percentage.toFixed(1)+' % ('+this.y+')';}},
            style: {color: (Highcharts.theme &amp;&amp; Highcharts.theme.contrastTextColor) || 'black'},
            connectorColor: 'silver',
            showInLegend: true},
              series:{
                cursor:'poiter',
                events:{
                click:function(e){
                  var vZ = this.name;
                  $.IGRP.utils.openChartURL({pUrl:"<xsl:value-of select='$url'/>",pX:vX,pY:vY,pZ:vZ});
                  }
                }
              }
            },
            legend: {layout:'horizontal',align:'center',verticalAlign:'bottom',borderWidth: 0},
            <xsl:if test="$grafico/colors">
              colors: [<xsl:for-each select="$grafico/colors/col">
                '<xsl:value-of select="."/>'
                <xsl:if test="position() != last()">,</xsl:if>
             </xsl:for-each>],
            </xsl:if>
            series:[{
             type:'pie',
             name:'<xsl:value-of select="$grafico/value/row/col[position()=1]"/>',
             data:[<xsl:for-each select="$grafico/label/col[position()!=1]">
                <xsl:variable name="pos" select="position()+ 1"/>
                

                <xsl:choose>
                  <xsl:when test="position()= 2">
                    <xsl:variable name="value">
                      <xsl:choose>
                        <xsl:when test="$grafico/value/row[position()=1]/col[position()=$pos] != ''">
                          <xsl:value-of select="$grafico/value/row[position()=1]/col[position()=$pos]"/>
                        </xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    {
                    name:'<xsl:value-of select="."/>',    
                    y:<xsl:value-of select="$value"/>,
                    sliced:true,
                    selected: true
                  },</xsl:when>
                  <xsl:when test="position() = last()">
                    <xsl:variable name="value">
                      <xsl:choose>
                        <xsl:when test="$grafico/value/row[position()=1]/col[position()=$pos] != ''">
                          <xsl:value-of select="$grafico/value/row[position()=1]/col[position()=$pos]"/>
                        </xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    ['<xsl:value-of select="."/>',
                      <xsl:value-of select="$value"/>]
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:variable name="value">
                      <xsl:choose>
                        <xsl:when test="$grafico/value/row[position()=1]/col[position()=$pos] != ''">
                          <xsl:value-of select="$grafico/value/row[position()=1]/col[position()=$pos]"/>
                        </xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                      </xsl:choose>
                    </xsl:variable>
                    ['<xsl:value-of select="."/>',
                    <xsl:value-of select="$value"/>],
                  </xsl:otherwise>
                </xsl:choose> 
              </xsl:for-each>]
            }]
            });
        });
    </script>
  </xsl:template>
  
  <xsl:template name="funnel-highcharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <!--pegar o nome do NO da xml para o ID do grafico-->
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    
    <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>

    <script type="text/javascript">
      $(function () {
        var id = "<xsl:value-of select='$graph-id'/>";
        var vX = '', vY = '';
      //({point.y:,.0f})
        $('#id-'+id).highcharts({
          chart: {type: 'funnel', marginRight:50},
          title: {text: '',x: -50},
          tooltip: {
            formatter: function(){
              vX = this.key; vY = this.y;
              return '<span style="color:'+this.point.color+'">\u25CF</span> '+vX+'<br/>'+this.series.name+': <b>'+this.percentage.toFixed(1)+' %</b> ('+vY+')';
            }
          },
          plotOptions:{series:{dataLabels:{enabled:true,formatter:function(){
              return '<b>'+this.percentage.toFixed(1)+' %</b> ('+this.y+')';
            },
            color:(Highcharts.theme &amp;&amp; Highcharts.theme.contrastTextColor) || 'black',softConnector:true},showInLegend:true,
              cursor:'poiter',
              events:{
              click:function(e){
                var vZ = this.name;
                $.IGRP.utils.openChartURL({pUrl:"<xsl:value-of select='$url'/>",pX:vX,pY:vY,pZ:vZ});
                }
              }
            }
          },
          legend: {layout:'horizontal',align:'center',verticalAlign:'bottom',borderWidth: 0},
          navigation: {buttonOptions: {align: 'left',x:-10}},
        <xsl:if test="$grafico/colors">
        colors: [<xsl:for-each select="$grafico/colors/col">
            '<xsl:value-of select="."/>'
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>],
        </xsl:if>
        series: [{
          name: '<xsl:value-of select="$grafico/value/row/col[position()=1]"/>',
                data: [<xsl:for-each select="$grafico/label/col[position()!=1]">
              <xsl:variable name="pos" select="position()+ 1"/>
              ['<xsl:value-of select="."/>',<xsl:value-of select="$grafico/value/row[position()=1]/col[position()=$pos]"/>]
              <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
                  ]
              }]
          });
      });
    </script>
  </xsl:template>
  
  
   <xsl:template name="pyramid-highcharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <!--pegar o nome do NO da xml para o ID do grafico-->
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    
    <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>
    <script type="text/javascript">
      $(function () {
        var id = "<xsl:value-of select='$graph-id'/>";
        var vX = '', vY = '';
      //({point.y:,.0f})
        $('#id-'+id).highcharts({
            chart: {type: 'pyramid', marginRight:50},
            title: {text: '',x: -50},
            tooltip: {
              formatter: function(){
                vX = this.key; vY = this.y;
                return '<span style="color:'+this.point.color+'">\u25CF</span> '+vX+'<br/>'+this.series.name+': <b>'+this.percentage.toFixed(1)+' %</b> ('+vY+')';
              }
            },
            plotOptions:{series:{dataLabels:{enabled: true,formatter:function(){
              return '<b>'+this.percentage.toFixed(1)+' %</b> ('+this.y+')';
            },
            color: (Highcharts.theme &amp;&amp; Highcharts.theme.contrastTextColor) || 'black',softConnector: true},showInLegend: true,
              cursor:'poiter',
              events:{
              click:function(e){
                var vZ = this.name;
                $.IGRP.utils.openChartURL({pUrl:"<xsl:value-of select='$url'/>",pX:vX,pY:vY,pZ:vZ});
                }
              }
            }
          },
          legend: {layout:'horizontal',align:'center',verticalAlign:'bottom',borderWidth: 0},
        <xsl:if test="$grafico/colors">
        colors: [<xsl:for-each select="$grafico/colors/col">
            '<xsl:value-of select="."/>'
              <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>],
        </xsl:if>
            series: [{
          name: '<xsl:value-of select="$grafico/value/row/col[position()=1]"/>',
                data: [<xsl:for-each select="$grafico/label/col[position()!=1]">
              <xsl:variable name="pos" select="position()+ 1"/>
              ['<xsl:value-of select="."/>',<xsl:value-of select="$grafico/value/row[position()=1]/col[position()=$pos]"/>]
              <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
                  ]
               }]
          });
      });
    </script>
  </xsl:template>  
  
  
    <xsl:template name="columnStacked-highcharts">
        <xsl:param name="grafico" select="''"/>
        <xsl:param name="height" select="'250'"/>
        <xsl:param name="url" select="''"/>
        <!--pegar o nome do NO da xml para o ID do grafico-->
        <xsl:variable name="graph-id" select="local-name($grafico)"/>
        
        <div id="id-{$graph-id}" class="IGRP_graph" style="height:{$height}px;"></div>
        <script type="text/javascript">
          $(function(){
            var id = "<xsl:value-of select='$graph-id'/>";
            var vX = '', vY = '';
            $('#id-'+id).highcharts({
              chart: {type: 'column'},
              title: {text: ''},
              xAxis: {categories: [<xsl:for-each select="$grafico/label/col[position()!=1]">
                  '<xsl:value-of select="."/>'
                  <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>]
              },
              yAxis: {min: 0,title: {text: ''},
                stackLabels: {enabled: true,style: {fontWeight: 'bold',
                  color: (Highcharts.theme &amp;&amp; Highcharts.theme.textColor) || 'gray'}
                }
              },
              legend: {layout:'horizontal',align:'center',verticalAlign:'bottom',borderWidth: 0},
              tooltip: {formatter: function () {
                  return '<b>' + this.x + '</b><br/>' +
                  this.series.name + ': ' + this.y + '<br/>' +
                  'Total: ' + this.point.stackTotal;
                }
              },
              plotOptions: {column: {stacking: 'normal',
                  /*dataLabels: {enabled: true,
                    color: (Highcharts.theme &amp;&amp; Highcharts.theme.dataLabelsColor) || 'white',
                    style: {textShadow: '0 0 3px black'}
                  }*/
                }
              },
              series: [<xsl:for-each select="$grafico/value/row">{
                  name:'<xsl:value-of select="col[position() = 1]"/>',
                  data:[<xsl:for-each select="col[position() &gt; 1]">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">,</xsl:if>
                  </xsl:for-each>]
                }<xsl:if test="position() != last()">,</xsl:if>
              </xsl:for-each>]
            });
          });
        </script>
    </xsl:template>

  <xsl:template name="tableCharts">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="width" select="'100'"/>
    <xsl:param name="url" select="''"/>
    <xsl:variable name="graph-id" select="local-name($grafico)"/>
    <xsl:variable name="nodegraphe">
    <xsl:if test="$url != ''">
      <xsl:text>nodegraphe</xsl:text>
    </xsl:if>
    </xsl:variable>
    <style type="text/css">
    .nodegraphe{cursor:pointer;}
  </style>
    
    <div class="table_graph">
      <table style="width:{$width}%;" class="table table-striped" id="{$graph-id}">
        <thead>
          <tr>
            <xsl:for-each select="$grafico/label/col">
              <xsl:choose>
                <xsl:when test="position()=1">
                  <th><xsl:value-of select="."/></th>
                </xsl:when>
                <xsl:otherwise>
                  <th class="nod_{position()}"><xsl:value-of select="."/></th>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$grafico/value/row">
            <xsl:variable name="pos" select="(position()+1) mod 2" />
            <xsl:variable name="nod" select="position()"/>
            <tr>
              <xsl:for-each select="col">
                <xsl:choose>
                  <xsl:when test="position()=1">
                    <td><span y="{.}" class="{$nodegraphe}_{$nod}"><xsl:value-of select="."/></span></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td class="{$graph-id}" pos="{$nod}">
                      <span class=" clickable {$nodegraphe}" rel="{$url}" x="{.}"> <xsl:value-of select="."/> </span>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  
  <xsl:template name="graphed">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="tipo" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <xsl:variable name="vtipo">
      <xsl:choose>
          <xsl:when test="$tipo = 'barchart' or $tipo = 'BarChart'">
              <xsl:text>bar</xsl:text>
            </xsl:when>
            <xsl:when test="$tipo = 'piechart' or $tipo = 'PieChart'">
              <xsl:text>pie</xsl:text>
            </xsl:when>
            <xsl:when test="$tipo = 'linechart' or $tipo = 'LineChart'">
              <xsl:text>line</xsl:text>
            </xsl:when>
            <xsl:when test="$tipo = 'columnchart' or $tipo = 'ColumnChart'">
              <xsl:text>column</xsl:text>
            </xsl:when>
            <xsl:when test="$tipo = 'areachart' or $tipo = 'AreaChart'">
              <xsl:text>area</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$tipo"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$vtipo = 'pie'">
        <xsl:call-template name="pie-highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="tipo" select="$vtipo"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$vtipo = 'tablecharts'">
        <xsl:call-template name="tableCharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$vtipo = 'funnel'">
        <xsl:call-template name="funnel-highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$vtipo = 'pyramid'">
        <xsl:call-template name="pyramid-highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$vtipo = 'fixedcolumns'">
        <xsl:call-template name="fixedcolumns-highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$vtipo = 'stackedcolumn' or $vtipo = 'stackedarea' or $vtipo = 'stackedpercentcolumn' or $vtipo = 'stackedpercentarea' or $vtipo = 'stackedgroupedcolumn'">
        <xsl:variable name="nTipo">
          <xsl:choose>
            <xsl:when test="$vtipo = 'stackedcolumn' or $vtipo = 'stackedpercentcolumn' or $vtipo = 'stackedgroupedcolumn'">column</xsl:when>
            <xsl:otherwise>area</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="nstacking">
            <xsl:choose>
                <xsl:when test="$vtipo = 'stackedpercentcolumn' or $vtipo = 'stackedpercentarea'">percent</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="grouped">
          <xsl:choose>
                <xsl:when test="$vtipo = 'stackedgroupedcolumn'">true</xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="tipo" select="$nTipo"/>
          <xsl:with-param name="subtipo" select="$nTipo"/>
          <xsl:with-param name="stacking" select="$nstacking"/>
          <xsl:with-param name="grouped" select="$grouped"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="highcharts">
          <xsl:with-param name="grafico" select="$grafico"/>
          <xsl:with-param name="tipo" select="$vtipo"/>
          <xsl:with-param name="height" select="$height"/>
          <xsl:with-param name="url" select="$url"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="igrp-graph">
    <xsl:param name="table" select="''" />
    <xsl:param name="chart_type" select="'bar'" />
    <xsl:param name="height" select="'250'" />
    <xsl:param name="url" select="''"/>
    <xsl:param name="title" select="'Grafico'"/>
    
    <xsl:variable name="vheight" select="$height+20"/>
    
    <div class="col graph">
      <xsl:call-template name="graphed">
        <xsl:with-param name="grafico" select="$table"/>
        <xsl:with-param name="tipo" select="$chart_type"/>
        <xsl:with-param name="height" select="$vheight"/>
        <xsl:with-param name="url" select="$url"/>
      </xsl:call-template>
      <div class="_clear"/>
   </div>
  </xsl:template>
</xsl:stylesheet>