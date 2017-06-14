<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="vpath"/>
  <xsl:template match="*">
    <xsl:call-template name="reports">
      <xsl:with-param name="vpath" select="$vpath"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name='reports'>
    <xsl:param name="vpath" select="''"/>
    <ul class="listTree">
      <xsl:for-each select="//rows/content/table/value/row">
       <li>
        <a rel="{link}" id="{id}" class="linkReports" info="{descricao}" codigo="{link_desc}">
          <xsl:value-of select="title"/>
          <div class="tree-menu-options">
            <div class="btn infoReport">
              <img src="{$vpath}/img/icon/tools-bar/ctx_info.png" class="img"/>
            </div>
            <div class="btn editReport">
              <img src="{$vpath}/img/icon/tools-bar/edit.png" class="img"/>
            </div>
          </div>
        </a>
      </li>
      </xsl:for-each>
    </ul>
    <div class="info">
    </div>
  </xsl:template>
</xsl:stylesheet>