<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <div class="layers-topo-validation" shadow="true">
      <!-- <h3 class="title" alpha="template"><span><xsl:value-of select="topology/title"/></span></h3> -->
      <!-- <h3 class="title" alpha="template"><span>Topologia</span></h3> -->
       <div class="topo-v-layers">
         <xsl:for-each select="topology/layer">
          <div class="topo-v-lyr" id="{@id}">
            <h3><xsl:value-of select="@name"/></h3>
            <div class="topo-v-operations">
              <xsl:for-each select="graphic">
                <div class="topo-v-graphic-holder" index="{position()}">
                  <xsl:for-each select="operation">
                  <div class="topo-v-lyr-op">
                    <p class="topo-v-op-holder">
                      <xsl:attribute name="features">
                          <xsl:for-each select="feature"><xsl:value-of select="."/>,</xsl:for-each>
                      </xsl:attribute>
                      <span class="op-name"><xsl:value-of select="@name"/></span>
                      <span class="op-total"><xsl:value-of select="count(feature)"/></span>
                    </p>
                  </div>
                </xsl:for-each>
              </div>
              </xsl:for-each>
            </div>
          </div>
        </xsl:for-each> 
       </div>
    </div>
  </xsl:template>
</xsl:stylesheet>