<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:template match="searchresults">
    <xsl:variable name="layersId" select="result/layerid[not(.=preceding::*)]"/>
    <xsl:choose>
      <xsl:when test="result">
        <div class="pesquisa-results-menu active">
          <ul>
            <xsl:for-each select="$layersId">
              <xsl:variable name="layerid" select="."/>
              <xsl:variable name="active-class">
              <xsl:choose>
                <xsl:when test="position() = 1">
                  <xsl:text>active</xsl:text>
                </xsl:when>
              </xsl:choose>
              </xsl:variable>
              <li data-type="collapser" data-rel="pesq_bd_{$layerid}" class="layer-title {$active-class}"> <span><xsl:value-of select="//result[layerid=$layerid]/layername"/></span> </li>
            </xsl:for-each>
          </ul>
        </div>
        <div class="pesquisa-results-holder active">
          <xsl:for-each select="$layersId">
            <xsl:variable name="layid" select="."/>
            <xsl:variable name="item-active-class">
            <xsl:choose>
              <xsl:when test="position() = 1">
                <xsl:text>active</xsl:text>
              </xsl:when>
            </xsl:choose>
            </xsl:variable>
            <div data-type="collapse-content" data-rel="pesq_bd_{$layid}" class="search-result {$item-active-class}" id="{$layid}">
              <xsl:for-each select="//result[layerid=$layid]">
                <div class="search-result-item" layer="{$layid}" id="{objectid}"> <span class="result-lbl"><xsl:value-of select="field"/></span> <span class="result-val"><xsl:value-of select="value"/></span> </div>
              </xsl:for-each>
            </div>
          </xsl:for-each>
        </div>
      </xsl:when>
      <xsl:otherwise>
     	<div class="pesquisa-no-results">No data found</div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>