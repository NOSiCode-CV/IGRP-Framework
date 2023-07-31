<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:param name="pheight"/>
  <xsl:param name="filter"/>
  <xsl:param name="filter_type"/>
  <xsl:param name="remote_filter"/>
  <xsl:param name="datalabels"/>
  <xsl:param name="view3d"/>
  
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
      <xsl:with-param name="filter" select="$filter"/>
      <xsl:with-param name="filter_type" select="$filter_type"/>
      <xsl:with-param name="remote_filter" select="$remote_filter"/>
      <xsl:with-param name="datalabels" select="$datalabels"/>
      <xsl:with-param name="view3d" select="$view3d"/>
    </xsl:call-template>
  </xsl:template>  
  
  <xsl:template name="graphed">
    <xsl:param name="grafico" select="''"/>
    <xsl:param name="tipo" select="''"/>
    <xsl:param name="height" select="'250'"/>
    <xsl:param name="url" select="''"/>
    <xsl:param name="filter" select="'false'"/>
    <xsl:param name="filter_type"/>
    <xsl:param name="remote_filter"/>
    <xsl:param name="datalabels"/>
    <xsl:param name="view3d"/>
    
    <xsl:variable name="vtipo">
      <xsl:choose>
        <xsl:when test="$tipo = 'barchart' or $tipo = 'BarChart'">bar</xsl:when>
        <xsl:when test="$tipo = 'piechart' or $tipo = 'PieChart'">pie</xsl:when>
        <xsl:when test="$tipo = 'linechart' or $tipo = 'LineChart'">line</xsl:when>
        <xsl:when test="$tipo = 'columnchart' or $tipo = 'ColumnChart'">column</xsl:when>
        <xsl:when test="$tipo = 'areachart' or $tipo = 'AreaChart'">area</xsl:when>
        <xsl:otherwise><xsl:value-of select="$tipo"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="graph-id" select="local-name($grafico)"/>

    <xsl:variable name="categories">
      <xsl:for-each select="$grafico/label/col[position()!=1]"><xsl:value-of select="."/><xsl:if test="position() != last()">|</xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="desc-label" select="$grafico/label/col[position()=1]"/>

    <xsl:variable name="labels">
      <xsl:for-each select="$grafico/value/row"><xsl:value-of select="col[position() = 1]"/><xsl:if test="position() != last()">|</xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="data">
      <xsl:for-each select="$grafico/value/row"><xsl:for-each select="col[position() &gt; 1]">
        <xsl:choose><xsl:when test=". != ''"><xsl:value-of select="."/></xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose><xsl:if test="position() != last()">!</xsl:if></xsl:for-each><xsl:if test="position() != last()">|</xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="xmlcolors">
      <xsl:for-each select="$grafico/colors/col"><xsl:value-of select="."/><xsl:if test="position() != last()">|</xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="colorsname" select="concat('p_fwl_',$graph-id,'_color')"/>

    <xsl:variable name="colors">
      <xsl:choose>
        <xsl:when test="//rows/content/*/fields/hidden[@name=$colorsname]"><xsl:value-of select="//rows/content/*/fields/hidden[@name=$colorsname]"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$xmlcolors"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <div class="IGRP-highcharts" item-name="{$graph-id}" chart-categories="{$categories}" chart-id="id-{$graph-id}" chart-type="{$vtipo}" chart-desc-label="{$desc-label}" chart-labels="{$labels}" chart-colors="{$colors}" chart-data="{$data}" chart-url="{$url}">

      <xsl:if test="$datalabels = 'true'">
        <xsl:attribute name="chart-datalabels">
          <xsl:value-of select="$datalabels"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="$view3d = 'true'">
        <xsl:attribute name="chart-3d">
          <xsl:value-of select="$view3d"/>
        </xsl:attribute>
      </xsl:if>
      
      <xsl:if test="$filter = 'true'">
        <xsl:if test="$filter_type != ''">
          <xsl:attribute name="filter-type">
            <xsl:value-of select="$filter_type"/>
          </xsl:attribute>
        </xsl:if>

        <xsl:if test="$remote_filter != ''">
          <xsl:attribute name="remote-filter">
            <xsl:value-of select="$remote_filter"/>
          </xsl:attribute>
        </xsl:if>

        <div class="toggleChart btn-group dropdown">
          <button type="button" class="active-chart btn btn-default dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          </button>
          <div class="dropdown-menu">
          </div>
        </div>
      </xsl:if>

      <div id="id-{$graph-id}" class="IGRP_graph">
        <xsl:if test="$tipo != 'tablecharts'">
          <xsl:attribute name="style">
            <xsl:value-of select="concat('height:',$height,'px;overflow: scroll;')"/>
          </xsl:attribute>   
        </xsl:if>
      </div>
    </div>
  </xsl:template>
  
  <xsl:template name="igrp-graph">
    <xsl:param name="table" select="''" />
    <xsl:param name="chart_type" select="'bar'" />
    <xsl:param name="height" select="'250'" />
    <xsl:param name="url" select="''"/>
    <xsl:param name="title" select="'Grafico'"/>
    <xsl:param name="filter" select="'false'"/>
    <xsl:param name="filter_type"/>
    <xsl:param name="remote_filter"/>
    <xsl:param name="datalabels"/>
    <xsl:param name="view3d"/>
    
    <xsl:variable name="vheight" select="$height+50"/>
    
    <div class="col graph">
      <xsl:call-template name="graphed">
        <xsl:with-param name="grafico" select="$table"/>
        <xsl:with-param name="tipo" select="$chart_type"/>
        <xsl:with-param name="height" select="$vheight"/>
        <xsl:with-param name="url" select="$url"/>
        <xsl:with-param name="filter" select="$filter"/>
        <xsl:with-param name="filter_type" select="$filter_type"/>
        <xsl:with-param name="remote_filter" select="$remote_filter"/>
        <xsl:with-param name="datalabels" select="$datalabels"/>
        <xsl:with-param name="view3d" select="$view3d"/>
      </xsl:call-template>
      <div class="_clear"/>
   </div>
  </xsl:template>
</xsl:stylesheet>