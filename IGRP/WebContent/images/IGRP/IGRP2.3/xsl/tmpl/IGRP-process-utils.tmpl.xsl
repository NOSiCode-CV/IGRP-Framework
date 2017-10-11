<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:variable name="wiz-max-item" select="6"/>
  
  <xsl:template name="process-flow" mode="process-flow" match="table">
    
    <xsl:call-template name="process-flow-loop"/>

    <!-- <xsl:variable name="justifyClss">

      <xsl:if test="count(value/row) &gt; 3">btn-group-justified</xsl:if>

    </xsl:variable>

    <div class="process flat {$justifyClss} gen-container-item">
    
      <xsl:for-each select="value/row">

        <xsl:variable name="itemClss">
          <xsl:choose>
            <xsl:when test="type = 'curent'">active</xsl:when>
            <xsl:otherwise><xsl:value-of select="type"/></xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <a href="{link}" class="btn {$itemClss}" active-bg-color="primary" style-listener="true">

          <span class="process-w-counter"><xsl:value-of select="position()"/></span>

          <span class="process-w-title txt-ellipsis"><xsl:value-of select="title"/></span>

          <span class="process-w-arrow" active-bg-color="primary"></span>

        </a>

      </xsl:for-each>

    </div> -->

  </xsl:template>

  <xsl:template name="process-flow-loop">
   
    <xsl:param name="start" select="1"/>

    <xsl:param name="end" select="$wiz-max-item"/>

    <xsl:if test="value/row[position() = $start]">
      
      <xsl:variable name="rows" select="value/row[position() &gt;= $start and position() &lt;= $end]"/>
      
      <xsl:variable name="justifyClss">
        <xsl:if test="count($rows) &gt;= 4">col-sm-2 col-xs-12</xsl:if>
      </xsl:variable>

      <div class="process flat  gen-container-item">
    
        <xsl:for-each select="$rows">

          <xsl:variable name="itemClss">
            <xsl:choose>
              <xsl:when test="type = 'curent'">active</xsl:when>
              <xsl:otherwise><xsl:value-of select="type"/></xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <a href="{link}" class="btn {$itemClss} col-sm-2 col-xs-12" active-bg-color="primary" style-listener="true">

            <span class="process-w-counter"><xsl:value-of select="position() - 1 + $start"/></span>

            <span class="process-w-title txt-ellipsis"><xsl:value-of select="title"/></span>

            <span class="process-w-arrow" active-bg-color="primary"></span>

          </a>

        </xsl:for-each>

      </div>

      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="start" select="$start + $wiz-max-item"/>
        <xsl:with-param name="end" select="$end + $wiz-max-item"/>
      </xsl:call-template>

    </xsl:if>

    



  </xsl:template>
  
</xsl:stylesheet>