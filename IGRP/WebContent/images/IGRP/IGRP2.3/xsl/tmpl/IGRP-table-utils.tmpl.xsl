<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- TABLE TYPES -->
  <!-- TD COLOR -->
  <xsl:template mode="table.buttonlist" name="table.buttonlist" match="*">
    <div class="tb-btn-list-holder">
      <xsl:for-each select="value/row">
        <xsl:value-of select="nome"/><br/>
      </xsl:for-each>
    </div>
  </xsl:template>
  <!-- TD COLOR -->
  <xsl:template name="tdcolor">
    <xsl:param name="color" select="''"/>
    <xsl:for-each select="$color">
      <xsl:if test="(. != 0 or . != '') and . &lt; 10">
        <xsl:attribute name="class">
          <xsl:text>tdcolor</xsl:text>
        </xsl:attribute>
        <span class="color{.} tdcolor-item"></span>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <!--TEMPLATE FOR TABLE EXPORT OPTIONS-->
  <xsl:template name="table-export-options" >
    <xsl:param name="pdf" select="false()"/>
    <xsl:param name="excel" select="false()"/>
    
    <div class="table-export-options clearfix">
      <div class="btn-group pull-right">
        <xsl:if test="$pdf">
          <a class="btn btn-danger btn-xs" href="#" rel="pdf"><i class="fa fa-file-pdf-o"></i><span>PDF</span></a>
        </xsl:if>
        <xsl:if test="$excel">
          <a class="btn btn-success btn-xs" href="#" rel="excel"><i class="fa fa-file-excel-o"></i><span>Excel</span></a>
        </xsl:if>
        
        <!-- <button type="button" class="btn btn-sm btn-warning" data-toggle="dropdown"><i class="fa fa-cloud-download"></i></button>
       
        <ul class="dropdown-menu" role="menu">
          <li>
            <xsl:if test="$pdf">
              <a href="#"><i class="fa fa-file-pdf-o"/><span>PDF</span></a>
            </xsl:if>
          </li>
          <li>
            <xsl:if test="$excel">
              <a href="#"><i class="fa fa-file-excel-o"/><span>EXCEL</span></a>
            </xsl:if>
          </li>
        </ul>  -->
      </div>
    </div>

  </xsl:template>
  <!--TEMPLATE FOR TABLE LEGEND-->
  <xsl:template mode="table-legend" name="table-legend" match="legend_color">
    <div class="box-table-legend">
      <xsl:for-each select="item">
        <div class="legend-holder">
          <p class="legend-lbl">
            <xsl:if test="string-length(label) &gt; 17">
              <xsl:attribute name="title">
                <xsl:value-of select="label"/>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="label"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="label"/>
          </p>
          <div class="legend-item color{value}"></div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
  <!-- CONTEXT MENU -->
  <xsl:template name="table-context-menu" mode="table-context-menu" match="context-menu">
   
    <xsl:param name="use-fa" select="'true'"/>

    <div class="list-group table-context-menu clearfix table-ctx-holder" use-fa="{$use-fa}" >
        <xsl:for-each select="item">
          <li id="CTX_ID_{position()}" class="operationTable " trel="{title}">
            <xsl:call-template name="table-ctx-item">
              <xsl:with-param name="use-fa" select="$use-fa"/>
              <xsl:with-param name="class" select="'list-group-item'"/>
            </xsl:call-template>
          </li>
        </xsl:for-each>
    </div>
  </xsl:template>
  <!-- CONTEXT MENU INLINE -->
  <xsl:template name="table-context-inline" mode="table-context-inline" match="context-menu">
    <xsl:param name="row-params" select="../value/row/context-menu"/>
    <xsl:param name="use-fa" select="'true'"/>

    <xsl:variable name="ctx_hidden" select="$row-params/param[contains(text(), 'ctx_hidden')]"/>
    
    <xsl:variable name="ctx_param">
      <xsl:for-each select="$row-params/param[not(contains(., 'ctx_hidden'))]">
          <xsl:text>&amp;</xsl:text><xsl:value-of select="."/>
      </xsl:for-each>     
    </xsl:variable>

    <xsl:variable name="ctxHiddenContent" select="substring-after($ctx_hidden,'=')"/>

    <xsl:variable name="ctxHiddenTotal">
      <xsl:call-template name="countCtxHidden">
        <xsl:with-param name="text" select="$ctx_hidden"/>
      </xsl:call-template>
    </xsl:variable>

    <ul class="clearfix table-ctx-holder">
      <xsl:for-each select="item">
        <xsl:variable name="rowCtxHiddenTitle">
          <xsl:call-template name="ctxHiddenTitle">
            <xsl:with-param name="vText" select="$ctxHiddenContent"/>
            <xsl:with-param name="ctx" select="title"/>
            <xsl:with-param name="item" select="string-length($ctxHiddenTotal)"/>
          </xsl:call-template>
        </xsl:variable>

        <li id="CTX_ID_{position()}" class="operationTable " trel="{title}" title="{title}">
          <xsl:choose>
            <xsl:when test="$rowCtxHiddenTitle != title">
                <xsl:call-template name="table-ctx-item">
                  <xsl:with-param name="use-fa" select="$use-fa"/>
                  <xsl:with-param name="size" select="'xs'"/>
                  <xsl:with-param name="ctx-params" select="$ctx_param"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="invisible">true</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </li>

      </xsl:for-each>
    </ul>
  </xsl:template>
  <!-- TABLE CTX ITEMS -->
  <xsl:template name="table-ctx-item">
    
    <xsl:param name="use-fa" select="'true'"/>
    <xsl:param name="size" select="'normal'"/>
    <xsl:param name="class" select="'btn'"/>
    <xsl:param name="ctx-params" select="''"/>

    <a class="{$class}" target="{target}">
      
      <xsl:call-template name="page-nav">
        <xsl:with-param name="action" select="link"/>
        <xsl:with-param name="page" select="page"/>
        <xsl:with-param name="app" select="app"/>
        <xsl:with-param name="linkextra" select="concat(parameter,$ctx-params)"/>
      </xsl:call-template>
      
      <xsl:if test="img">
        <xsl:call-template name="get-icon-item-with-color">
          <xsl:with-param name="list" select="img"/>
          <xsl:with-param name="use-fa" select="$use-fa"/>
          <xsl:with-param name="img-folder" select="'tools-bar'"/>
          <xsl:with-param name="size" select="$size"/>
          <xsl:with-param name="btnClass" select="$class"/>
        </xsl:call-template>
      </xsl:if>


      <span class="ctx-title">
        <xsl:value-of select="title"/>
      </span>
      
    </a>
  </xsl:template>
  <!-- CONTEXT MENU PARAM -->
  <xsl:template name="context-param" mode="context-param" match="context-menu">
    <xsl:attribute name="CTX_PARAM_COUNT">
      <xsl:value-of select="count(param)" />
    </xsl:attribute>
    <xsl:attribute name="CTX_FORM">
      <xsl:value-of select="ctx_form" />
    </xsl:attribute>
    <xsl:attribute name="CTX_FORM_IDX">
      <xsl:value-of select="ctx_form_idx" />
    </xsl:attribute>
    <xsl:for-each select="param">
      <xsl:attribute name="CTX_P{position()}">
        <xsl:value-of select="." />
      </xsl:attribute>
    </xsl:for-each>
  </xsl:template>
  <!--HIDDEN CTX COUNT-->
  <xsl:template name="countCtxHidden">
      <xsl:param name="text"/>
      <xsl:param name="separator" select="','"/>
      <xsl:param name="cont" select="0"/>
      <xsl:choose>
          <xsl:when test="not(contains($text, $separator))">
          </xsl:when>
          <xsl:otherwise>
              <xsl:call-template name="countCtxHidden">
                <xsl:with-param name="cont" select="$cont + 1"/>
                  <xsl:with-param name="text" select="substring-after($text, $separator)"/>
              </xsl:call-template>
          </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="$cont"/>
  </xsl:template>
  <!-- CTX HIDDEN TITLE -->
  <xsl:template name="ctxHiddenTitle">
    <xsl:param name="vText"/>
    <xsl:param name="ctx"/>
    <xsl:param name="item"/>
    <xsl:param name="pos" select="0"/>
    <xsl:param name="separator" select="','"/>
    <xsl:if test="$vText != ''">
        <xsl:choose>
            <xsl:when test="contains($vText, $separator)">
                <xsl:variable name="ctxAfter" select="substring-after($vText, $separator)"/>
                <xsl:variable name="ctxBefore" select="substring-before($vText, $separator)"/>
                <xsl:if test="$pos &lt; $item">
                    <xsl:choose>
                      <xsl:when test="$ctx = $ctxBefore"><xsl:value-of select="$ctx"/></xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="ctxHiddenTitle">
                                <xsl:with-param name="vText" select="$ctxAfter"/>
                                <xsl:with-param name="ctx" select="$ctx"/>
                                <xsl:with-param name="item" select="$item"/>
                                <xsl:with-param name="pos" select="$pos + 1"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$vText"/></xsl:otherwise>
        </xsl:choose>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>