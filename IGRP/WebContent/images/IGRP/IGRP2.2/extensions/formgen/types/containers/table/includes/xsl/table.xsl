<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="operation-table" mode="operation-table" match="context-menu">
    <xsl:param name="ContextMenuRow" select="'context-menu'"/>
    <xsl:variable name="ctx_hidden" select="$ContextMenuRow/param[contains(text(), 'ctx_hidden')]"/>
    <xsl:variable name="ctx_param">
      <xsl:for-each select="$ContextMenuRow/param[not(contains(., 'ctx_hidden'))]">
        <xsl:text>&amp;</xsl:text>
        <xsl:value-of select="."/>
      </xsl:for-each>
    </xsl:variable>
    <ul class="contentOperationTable">
      <xsl:variable name="substringAfter" select="substring-after($ctx_hidden,'=')"/>
      <xsl:variable name="ctxHidden">
        <xsl:call-template name="allCtxHidden">
          <xsl:with-param name="text" select="$ctx_hidden"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:for-each select="item">
        <xsl:variable name="vText">
          <xsl:call-template name="split">
            <xsl:with-param name="vText" select="$substringAfter"/>
            <xsl:with-param name="ctx" select="title"/>
            <xsl:with-param name="item" select="string-length($ctxHidden)"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="img and img!=''">
          <li class="operationTable">
            <a target="{target}" title="{title}">
              <xsl:choose>
                <xsl:when test="$vText != title">
                  <xsl:attribute name="class">bClick</xsl:attribute>
                  <xsl:call-template name="page-nav">
                    <xsl:with-param name="action" select="link"/>
                    <xsl:with-param name="page" select="page"/>
                    <xsl:with-param name="app" select="app"/>
                    <xsl:with-param name="linkextra" select="concat(parameter,$ctx_param)"/>
                  </xsl:call-template>
                  <img title="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="class">notVisibility</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </a>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>