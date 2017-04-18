<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="get-icon-item">
    <xsl:attribute name="class">fa <xsl:value-of select="img"/></xsl:attribute>
  </xsl:template>

  <xsl:template name="get-icon-item-with-color">
    <!--passed template parameter -->
      <xsl:param name="list"/>
      <xsl:param name="delimiter" select="'|'"/>
      <xsl:param name="use-fa" select="'true'"/>
      <xsl:param name="img-folder" select="''"/>
      <xsl:param name="size" select="'normal'"/>
      <xsl:param name="btnClass"  select="'btn'"/>

      <xsl:choose>
          <xsl:when test="contains($list, $delimiter)">                
              <xsl:attribute name="class">
                <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> <xsl:value-of select="concat($btnClass,' ',$btnClass,'-')"/><xsl:value-of select="substring-before($list,$delimiter)"/>
              </xsl:attribute>
              <xsl:call-template name="get-icon-item-with-color">
                  <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                  <xsl:with-param name="delimiter" select="$delimiter"/>
                  <xsl:with-param name="use-fa" select="$use-fa"/>
                  <xsl:with-param name="img-folder" select="$img-folder"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:if test="$list != ''">
                <xsl:choose>
                  <xsl:when test="$use-fa = 'true'">
                    <div class="icon-item-holder">
                      <i class="fa {$list}"></i>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="class">
                      <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> <xsl:value-of select="concat($btnClass,' ',$btnClass,'-default')"/>
                    </xsl:attribute>
                    <div class="icon-item-holder">
                      <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
          </xsl:otherwise>
      </xsl:choose>

  </xsl:template>


  

</xsl:stylesheet>