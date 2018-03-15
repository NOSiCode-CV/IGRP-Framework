<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="gis-map-view" >

  	<xsl:param name="id" select="'map_os'"/>

    <xsl:param name="type" select="'leaflet'"/>

    <xsl:param name="dataJSON"/>

    <xsl:param name="dataXML"/>

    <div class="igrp-gis-map" id="{$id}" map-type="{$type}" >

      <xsl:if test="$dataJSON">

        <xsl:attribute name="map-data-url"><xsl:value-of select="$dataJSON"/></xsl:attribute>

      </xsl:if>

      <xsl:if test="$dataXML">

        <xsl:attribute name="map-data-xml"><xsl:value-of select="$dataXML"/></xsl:attribute>

      </xsl:if>

    </div>

  </xsl:template>

</xsl:stylesheet>