<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="igrp-leaflet-markers-json">
     <xsl:param name="tag"/>
     <xsl:param name="data"/>
     <xsl:if test="$data and $data/table/value/row">
        <xsl:text>[</xsl:text>
          <xsl:for-each select="$data/table/value/row">
            <xsl:variable name="titleTag" select="concat($tag,'_title')"/>
            <xsl:variable name="latTag" select="concat($tag,'_lat')"/>
            <xsl:variable name="lngTag" select="concat($tag,'_lng')"/>
            <xsl:variable name="infoTag" select="concat($tag,'_info')"/>
            <xsl:text>{</xsl:text>
            <xsl:text>"title":</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="*[name() = $titleTag]"/><xsl:text>",</xsl:text>
            <xsl:text>"lat":</xsl:text><xsl:value-of select="*[name() = $latTag]"/><xsl:text>,</xsl:text>
            <xsl:text>"lng":</xsl:text><xsl:value-of select="*[name() = $lngTag]"/><xsl:text>,</xsl:text>
            <xsl:text>"info":</xsl:text><xsl:text>"</xsl:text><xsl:value-of select="*[name() = $infoTag]"/><xsl:text>"</xsl:text>
            <xsl:text>}</xsl:text><xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        <xsl:text>]</xsl:text>
     </xsl:if>
  </xsl:template>

</xsl:stylesheet>