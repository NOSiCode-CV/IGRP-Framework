<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="process-flow" mode="process-flow" match="table">
    
    <xsl:variable name="totalRow" select="count(value/row)"/>
    
    <xsl:variable name="max">
      <xsl:choose>
        <xsl:when test="$totalRow &gt;= 12">12</xsl:when>
        <xsl:otherwise>6</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="itemSize">
      <xsl:choose>
        <xsl:when test="$totalRow &gt;= 12">col-sm-1</xsl:when>
        <xsl:otherwise>col-sm-2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <div class="gen-container-item">
      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="wiz-max-item" select="$max"/>
        <xsl:with-param name="itemSize" select="$itemSize"/>
      </xsl:call-template>
    </div>

  </xsl:template>

  <xsl:template name="process-flow-loop">
    
    <xsl:param name="wiz-max-item" select="12"/>

    <xsl:param name="start" select="1"/>

    <xsl:param name="end" select="$wiz-max-item"/>

    <xsl:param name="itemSize" select="'col-sm-1'"/>

    <xsl:if test="value/row[position() = $start]">
      
      <xsl:variable name="rows" select="value/row[position() &gt;= $start and position() &lt;= $end]"/>

      <div class="f1">
        <div class="f1-steps clearfix">
          <div class="f1-progress">
            <div class="f1-progress-line" data-now-value="100" data-number-of-steps="5" style="width: 100%;"></div>
          </div>

          <xsl:for-each select="$rows">

          <xsl:variable name="itemClss">
            <xsl:choose>
              <xsl:when test="type = 'curent'">active</xsl:when>
              <xsl:otherwise><xsl:value-of select="type"/></xsl:otherwise>
            </xsl:choose>
          </xsl:variable>


          <a href="{link}" class="f1-step {$itemClss} {$itemSize} col-xs-12 wiz-step" style-listener="true">
            <div class="f1-step-icon" active-bg-color="primary">
              <span><xsl:value-of select="position() - 1 + $start"/></span>
            </div>
            <p active-text-color="primary" class="txt-ellipsis"><xsl:value-of select="title"/></p>
          </a>

        </xsl:for-each>

        </div>
      </div>

      <!-- <div class="process flat  gen-container-item">
    
        <xsl:for-each select="$rows">

          <xsl:variable name="itemClss">
            <xsl:choose>
              <xsl:when test="type = 'curent'">active</xsl:when>
              <xsl:otherwise><xsl:value-of select="type"/></xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <a href="{link}" class="wiz-step btn {$itemClss} col-sm-2 col-xs-12" active-bg-color="primary" style-listener="true">

            <span class="process-w-counter"><xsl:value-of select="position() - 1 + $start"/></span>

            <span class="process-w-title txt-ellipsis"><xsl:value-of select="title"/></span>

            <span class="process-w-arrow" active-bg-color="primary"></span>

          </a>

        </xsl:for-each>

      </div> -->

      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="wiz-max-item" select="$wiz-max-item"/>
        <xsl:with-param name="itemSize" select="$itemSize"/>
        <xsl:with-param name="start" select="$start + $wiz-max-item"/>
        <xsl:with-param name="end" select="$end + $wiz-max-item"/>
      </xsl:call-template>

    </xsl:if>

    



  </xsl:template>
  
</xsl:stylesheet>