<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template mode="top-menu" name="top-menu" match="top_menu">
    <xsl:for-each select="button">
        <li alt="{title}" title="{title}">
        	<a href="{link}"><img src="{$path_tmpl}/img/icon/{img}"/></a>
    	</li> 
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>