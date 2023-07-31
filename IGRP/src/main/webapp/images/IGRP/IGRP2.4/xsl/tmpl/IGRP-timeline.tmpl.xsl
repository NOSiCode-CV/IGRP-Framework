<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IGRP-timeline" mode="IGRP-timeline" match="*">
   
    <xsl:param name="themes" select="'hexa-theme'"/>
   
    <xsl:param name="bg" />
    
    <xsl:variable name="name" select="local-name(.)"/>

    <xsl:variable name="btn-target" select="fields/*[@type='link']/@target"/>
    
    <div class="timeline-box">

      <ul class="timeline {$themes}">
        
        <xsl:for-each select="table/value/row">
          
          <xsl:variable name="row-icon" select="*[name() = concat($name, '_icon')]"/>

          <xsl:variable name="row-header" select="*[name()=concat($name, '_hd')]"/>

          <xsl:variable name="row-date" select="*[name()=concat($name, '_date')]"/>

          <xsl:variable name="row-text" select="*[name()=concat($name, '_text')]"/>

          <xsl:variable name="row-btn" select="*[name()=concat($name, '_btn')]"/>

          <xsl:variable name="row-btn-desc" select="*[name()=concat($name, '_btn_desc')]"/>
          
          <li>
            <div class="timeline-icon">
              <xsl:if test="$row-icon">
                <xsl:choose>
                  <xsl:when test="$row-icon!= ''">
                    <div class="icon big {$bg}">
                      <i class="fa {$row-icon}" aria-hidden="true"></i>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="icon {$bg}"></div>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </div>
            <div class="timeline-block">
              <xsl:if test="$row-header">
                <xsl:choose>
                  <xsl:when test="$themes= 'hexa-theme'">
                    <div class="timeline-header">
                      <h2 class="flag">
                        <xsl:value-of select="$row-header"/>
                      </h2>
                      <span class="time-wrapper">
                        <xsl:if test="$row-date != ''">
                          <xsl:value-of select="$row-date"/>
                        </xsl:if>
                      </span>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="timeline-header {$bg}" >
                      <h2 class="">
                        <span>
                          <xsl:value-of select="$row-header"/>
                        </span>
                        <xsl:if test="$row-date !=''">
                          <span class="time-line-date">
                            <xsl:value-of select="$row-date"/>
                          </span>
                        </xsl:if>
                      </h2>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <div class="timeline-content">
                <xsl:if test="$row-text">
                  <p>
                    <xsl:value-of select="$row-text"/>
                  </p>
                </xsl:if>
                <xsl:if test="$row-btn">
                  <xsl:choose>
                    <xsl:when test="$row-btn != ''">
                      <a href="{$row-btn}" target="{$btn-target}" class="">
                        <xsl:value-of select="$row-btn-desc "/>
                      </a>
                    </xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </div>
            </div>
          </li>

        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
</xsl:stylesheet>