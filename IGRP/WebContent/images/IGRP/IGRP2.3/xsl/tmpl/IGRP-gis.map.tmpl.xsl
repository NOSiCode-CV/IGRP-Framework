<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="gis-map-view" mode="gis-map-view" match="map">
    <xsl:value-of select="./id"/>
    <div class="gis-map-view">
        map
    </div>
  </xsl:template>

  

</xsl:stylesheet>