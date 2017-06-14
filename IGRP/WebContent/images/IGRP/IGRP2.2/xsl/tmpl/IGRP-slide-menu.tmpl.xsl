<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="slide-menu" mode="slide-menu" match="menus">
    <div class="slideMenu">
      <ul class="menu">
        <xsl:for-each select="menu">
          <xsl:variable name="pos" select="position()"/>
          <li pos="smenu-{$pos}">
            <div class="liMenu"><xsl:value-of select="title" disable-output-escaping="yes"/></div>
            <ul class="submenu">
              <xsl:for-each select="submenu">
                <li pos="smenu-{$pos}{position()}">
                	<a href="{link}" class="bClick">
                    <xsl:if test="target != ''">
                      <xsl:attribute name="target">
                        <xsl:value-of select="target"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="title" disable-output-escaping="yes"/>
                  </a>
              	  <span class="star" rel="{id}">
                  	<xsl:if test="status = 1">
                  		<xsl:attribute name="class">
                     			<xsl:text>star active</xsl:text>
                      	</xsl:attribute>
                      </xsl:if>
                  </span>
                </li>
              </xsl:for-each>
            </ul>
          </li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>


</xsl:stylesheet>