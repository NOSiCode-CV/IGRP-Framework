<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template mode="app" name="app" match="applications">
    <xsl:if test="application">
      <div class="box-content">
        <div class="box-app addPaddingBottom10">
          <xsl:for-each select="application[@available='yes']">
            <div class="col-1-7">
              <div class="igrp_app_icon addBorder">
                <xsl:if test="num_alert and num_alert!=''">
                  <span class="igrp_app_alert"> <a href="{link_alert}"> <xsl:value-of select="num_alert"/> </a> </span>
                </xsl:if>
                <a href="{link}">
                <div class="igrp_icon">
                  <xsl:choose>
                    <xsl:when test="img">
                      <img src="{$path}/iconApp/{img}" alt="{title}"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="{$path}/iconApp/app_nosi-proj.png" alt="{title}"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
                <span class="igrp_app_label"><xsl:value-of select="title"/></span> </a> </div>
            </div>
          </xsl:for-each>
          <div class="_clear"/>
        </div>
        <!--no app-->
        <div class="box-app addPaddingtop10">
           <div class="box-content resetPadding collapsed resetBorder">
                <xsl:call-template name="titlecollapser">
                    <xsl:with-param name="title" select="subtitle"/>
                    <xsl:with-param name="class" select="'addBorder'"/>
                </xsl:call-template>
                <div class="box-collapser resetBorder addPaddingTop10">
                      <xsl:for-each select="application[@available='no']">
                        <div class="col-1-7">
                          <div class="igrp_app_icon no_app">
                            <div class="igrp_icon">
                              <xsl:choose>
                                <xsl:when test="img">
                                  <img src="{$path}/iconApp/{img}" alt="{title}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <img src="{$path}/iconApp/app_nosi-proj.png" alt="{title}"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </div>
                            <span class="igrp_app_label"> <xsl:value-of select="title"/> </span></div>
                        </div>
                      </xsl:for-each>
                     <div class="_clear"/>
                </div>
            	<div class="_clear"/>
    		</div>
          <div class="_clear"/>
        </div>
        <div class="_clear"/>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>