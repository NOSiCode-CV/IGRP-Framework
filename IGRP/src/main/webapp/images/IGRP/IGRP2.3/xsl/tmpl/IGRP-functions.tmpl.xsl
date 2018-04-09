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
      <xsl:param name="classes"  select="'btn'"/>

      <xsl:choose>
          <xsl:when test="contains($list, $delimiter)">                
              <xsl:attribute name="class">
                <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> 
                <xsl:value-of select="concat($btnClass,' ',$btnClass,'-')"/>
                <xsl:value-of select="substring-before($list,$delimiter)"/>
                <xsl:value-of select="concat(' ',$classes)"/>
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
                      <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> 
                      <xsl:value-of select="concat($btnClass,' ',$btnClass,'-default')"/>
                      <xsl:value-of select="concat(' ',$classes)"/>
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

  <xsl:template name="get-target-params">
   
      <xsl:param name="list"/>
      <xsl:param name="delimiter" select="'|'"/>

      <xsl:choose>
          <xsl:when test="contains($list, $delimiter)">                
              <xsl:attribute name="target">
                <xsl:value-of select="substring-before($list,$delimiter)"/>
              </xsl:attribute>
              <xsl:call-template name="get-target-params">
                  <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                  <xsl:with-param name="delimiter" select="$delimiter"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:if test="$list != ''">
                <xsl:choose>
                  <xsl:when test="$list = 'refresh'">
                    <xsl:attribute name="close">
                      <xsl:value-of select="$list"/>
                    </xsl:attribute>
                  </xsl:when> 
                  <xsl:otherwise>
                    <xsl:attribute name="target-fields">
                      <xsl:value-of select="$list"/>
                    </xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
          </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <xsl:template name="select-multiple-value">
    <xsl:param name="value"/>
    <xsl:param name="selected"/>
    <xsl:param name="delimiter" select="';'"/>

     <xsl:choose>
      
      <xsl:when test="contains($selected, $delimiter)">                
          
          <xsl:variable name="item" select="substring-before($selected,$delimiter)"/>

          <xsl:if test="$item = $value">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if>

          <xsl:call-template name="select-multiple-value">
              <xsl:with-param name="value" select="$value"/>
              <xsl:with-param name="selected" select="substring-after($selected,$delimiter)"/>
              <xsl:with-param name="delimiter" select="$delimiter"/>
          </xsl:call-template>

      </xsl:when>

      <xsl:otherwise>
        
        <xsl:if test="$selected = $value">
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>

      </xsl:otherwise>

    </xsl:choose> 
  </xsl:template>

  <xsl:template name="get-active-tab">
    
    <xsl:param name="value"/>
    <xsl:param name="class" select="''"/>
    
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$value = '1'">
          active <xsl:value-of select="$class"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$class"/></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="setAttributes">
    <xsl:param name="field"/>

    <xsl:if test="$field/@readonly='true'">
      <xsl:attribute name="disabled">
        <xsl:value-of select="'disabled'" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@readonly='readonly' and ($field/@type != 'file' or not($field/@type))">
      <xsl:attribute name="readonly">
        <xsl:value-of select="'readonly'" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@maxlength">
      <xsl:attribute name="maxlength">
        <xsl:value-of select="$field/@maxlength" />
      </xsl:attribute>
    </xsl:if>
    
  </xsl:template>

</xsl:stylesheet>