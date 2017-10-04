<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="process-flow" mode="process-flow" match="table">
    

    <div class="process flat">
      <a href="#" class="active">Set Dates/Locations/Forms</a>
      <a href="#">Verify Roster</a>
      <a href="#">Match Students / Faculty</a>
      <a href="#">Review</a>
    </div>


    <xsl:if test="value/row">
      <xsl:variable name="cont" select="count(value/row)"/>
      <div class="box-content">
        <div class="process">
          <ul class="fluxo_process" id="dashboard-buttons">
            <xsl:for-each select="value/row">
              <xsl:choose>
                <xsl:when test="type='stage'">
                  <li>
                    <xsl:choose>
                      <xsl:when test="string-length(title) &gt; 15">
                        <a href="{link}" class="done tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="substring(title,1,15)"/>
                            <xsl:text>(...)</xsl:text>
                          </span>
                        </a>
                        <em>
                          <xsl:value-of select="title"/>
                        </em>
                      </xsl:when>
                      <xsl:otherwise>
                        <a href="{link}" class="done tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="title"/>
                          </span>
                        </a>
                      </xsl:otherwise>
                    </xsl:choose>
                  </li>
                </xsl:when>
                <xsl:when test="type='curent'">
                  <li>
                    <xsl:choose>
                      <xsl:when test="string-length(title) &gt; 15">
                        <a href="{link}" class="ative tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="substring(title,1,15)"/>
                            <xsl:text>(...)</xsl:text>
                          </span>
                        </a>
                        <em>
                          <xsl:value-of select="title"/>
                        </em>
                      </xsl:when>
                      <xsl:otherwise>
                        <a href="{link}" class="ative tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="title"/>
                          </span>
                        </a>
                      </xsl:otherwise>
                    </xsl:choose>
                  </li>
                </xsl:when>
                <xsl:when test="type = 'proc_start' or type = 'proc_end'">
                  <li>
                    <xsl:choose>
                      <xsl:when test="string-length(title) &gt; 9">
                        <a href="{link}" class="done tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num proc_start">
                              <xsl:value-of select="substring(title,1,9)"/>
                              <xsl:text>(...)</xsl:text>
                            </span>
                            <span class="stp_bar proc"></span>
                          </span>
                          <!--<span class="label"><xsl:value-of select="substring(title,1,15)"/><xsl:text>(...)</xsl:text></span>-->
                        </a>
                        <em>
                          <xsl:value-of select="title"/>
                        </em>
                      </xsl:when>
                      <xsl:otherwise>
                        <a href="{link}" class="done tooltip-addhoc">
                          <span class="dot">
                            <span class="stp_num proc_start">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar proc">
                              <xsl:value-of select="title"/>
                            </span>
                          </span>
                          <!--<span class="label"><xsl:value-of select="title"/></span>-->
                        </a>
                      </xsl:otherwise>
                    </xsl:choose>
                  </li>
                </xsl:when>
                <xsl:otherwise>
                  <li>
                    <xsl:choose>
                      <xsl:when test="string-length(title) &gt; 15">
                        <a href="{link}" class="tooltip-addhoc" >
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="substring(title,1,15)"/>
                            <xsl:text>(...)</xsl:text>
                          </span>
                        </a>
                        <em>
                          <xsl:value-of select="title"/>
                        </em>
                      </xsl:when>
                      <xsl:otherwise>
                        <a href="{link}" class="tooltip-addhoc" >
                          <span class="dot">
                            <span class="stp_num">
                              <xsl:value-of select="position()"/>
                            </span>
                            <span class="stp_bar"></span>
                          </span>
                          <span class="label">
                            <xsl:value-of select="title"/>
                          </span>
                        </a>
                      </xsl:otherwise>
                    </xsl:choose>
                  </li>
                </xsl:otherwise>
              </xsl:choose>
              <!--</xsl:otherwise>
                    </xsl:choose>-->
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>