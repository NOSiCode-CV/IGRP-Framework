<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <!--XSL Generator (RED/DIM 2015)-->
      <head>
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/>
        <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        <!--HOME-->
        <div id="igrp-bodyPage">
          <!--HOME LEFT-->
          <xsl:call-template name="home-slide-menu"/>
          <!--HOME RIGTH-->
          <div class="bodyPageRigth">
            <!--START YOUR CODE HERE-->
            <!--SHOW TABLET AND MOBILE TITLE-->
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>
            <xsl:call-template name="calendar">
              <xsl:with-param name="vLng" select="'pt'"/>
                <xsl:with-param name="vDefDate" select="rows/content/form/value/default_date"/>
                <xsl:with-param name="vUrlAdd" select="rows/content/form/value/add_evento"/>
              </xsl:call-template>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!--SHOW HIDDEN-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              
                <div class="catCalendar">
                  <xsl:if test="rows/content/filter/label/categoria">
                    <div class="col item" item-name="categoria">
                      <div class="igrp_item selCalendar selectchange">
                        <!--<label>
                          <xsl:if test="string-length(rows/content/filter/label/categoria) >45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/categoria" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/categoria" disable-output-escaping="yes"/>
                        </label>-->
                        <select name="{rows/content/filter/list/categoria/@name}" chosen="select" id="{rows/content/filter/list/categoria/@name}" data-placeholder="{rows/content/filter/list/categoria/option[position() = 1]}" class="selectchange">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/categoria"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/categoria/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div>
                <!--START TOOL BAR FILTER
                <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/>-->
                <!--END TOOL BAR FILTER-->

              

              
              <!--END TABELA-->
            </form>
            <!--END YOUR CODE HERE-->
            <!--SHOW NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div>
        <!--FOOTER PAGE-->
        <div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20160113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20160113"/>
  <xsl:include href="../../xsl/tmpl/IGRP-calendar.tmpl.xsl?v=20160113"/>
</xsl:stylesheet>
