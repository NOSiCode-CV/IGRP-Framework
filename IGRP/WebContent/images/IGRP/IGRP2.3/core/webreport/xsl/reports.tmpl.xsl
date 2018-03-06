<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*">
    <xsl:call-template name="reports"/>
  </xsl:template>

  <xsl:template name='reports'>
    <ul class="nav nav-sidebar" id="list-reports">
      <xsl:for-each select="//rows/content/gen_table/table/value/row">
       <li class="treeview" id="{id}" rel="{link}" code="{link_desc}"  info="{descricao}">
        <a class="linkReports">
          <i class="fa fa-angle-right"/>
          <span><xsl:value-of select="title"/></span>
        </a>
        <div class="tree-menu-options">
          <a class="btn icon infoReport">
            <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="left"/>
          </a>
          <a class="btn icon editReport" title="Edit">
            <i class="fa fa-pencil-square-o"/>
          </a>
        </div>
      </li>
      </xsl:for-each>
    </ul>
    <div class="info"></div>
  </xsl:template>
</xsl:stylesheet>