<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="process-flow" mode="process-flow" match="*">
    
    <xsl:variable name="totalRow" select="count(table/value/row)"/>
    
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

    <xsl:if test="table/value/row[position() = $start]">
      
      <xsl:variable name="rows" select="table/value/row[position() &gt;= $start and position() &lt;= $end]"/>

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

      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="wiz-max-item" select="$wiz-max-item"/>
        <xsl:with-param name="itemSize" select="$itemSize"/>
        <xsl:with-param name="start" select="$start + $wiz-max-item"/>
        <xsl:with-param name="end" select="$end + $wiz-max-item"/>
      </xsl:call-template>

    </xsl:if>
  </xsl:template>

    <!-- d = DYNAMIC  t = TMPL s = start -->
    <xsl:template name="dynamic-tmpl-start">

        <xsl:if test="rows/content/*[@type='workflow']">
            <div class="row">
                <div class="col-md-12">
                    <xsl:apply-templates mode="process-flow" select="rows/content/*[@type='workflow']" />
                </div>
            </div>
        </xsl:if>

        <xsl:if test="rows/content/toolsbar and count(rows/content/toolsbar/item) &gt; 0">
            <div class="row">
                <div class="col-md-12">
                    <div class="toolsbar-holder boxed gen-container-item" item-name="toolsbar">
                        <div class="btns-holder  pull-right" role="group">
                            <xsl:apply-templates select="rows/content/toolsbar" mode="gen-buttons">
                                <xsl:with-param name="vertical" select="'true'"/>
                                <xsl:with-param name="outline" select="'false'"/>
                            </xsl:apply-templates>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:if>

        <xsl:if test="rows/content/*[@type='workflow_taskview'] and count(rows/content/*[@type='workflow_taskview']/fields/*) &gt; 0">
            <div class="row">
                <div class="col-md-12">
                    <xsl:for-each select="rows/content/*[@type='workflow_taskview']">
                        <xsl:call-template name="GEN-view"/>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>

    </xsl:template>
  
  <!-- d = DYNAMIC  t = TMPL e = END -->
  <xsl:template name="dynamic-tmpl-end">
    <xsl:if test="rows/content/*[@type='workflow_document'] and count(rows/content/*[@type='workflow_document']/fields/*)  &gt; 0">
        <div class="row">
            <div class="col-md-12">
                <xsl:for-each select="rows/content/*[@type='workflow_document']">
                    <xsl:call-template name="GEN-formlist"/>
                </xsl:for-each>
            </div>
        </div>
    </xsl:if>
  </xsl:template>

  <xsl:include href="components/2.3/GEN-others.tmpl.xsl?v=1"/>
  <xsl:include href="components/2.3/GEN-formfields.tmpl.xsl?v=4"/>
  <xsl:include href="components/2.3/GEN-formlist.tmpl.xsl?v=4"/>
  
</xsl:stylesheet>