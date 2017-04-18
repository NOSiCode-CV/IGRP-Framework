<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/rv_domain">
                  <div class="col-1-4 item" item-name="rv_domain">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/rv_domain) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/rv_domain" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/rv_domain" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/rv_domain/@name}" value="{rows/content/form/value/rv_domain}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/rv_domain"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_low_value">
                  <div class="col-1-4 item" item-name="rv_low_value">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/rv_low_value) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/rv_low_value" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/rv_low_value" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/rv_low_value/@name}" class="textarea" maxlength="240">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/rv_low_value"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/rv_low_value" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_high_value">
                  <div class="col-1-4 item" item-name="rv_high_value">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/rv_high_value) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/rv_high_value" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/rv_high_value" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/rv_high_value/@name}" class="textarea" maxlength="240">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/rv_high_value"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/rv_high_value" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_abbreviation">
                  <div class="col-1-4 item" item-name="rv_abbreviation">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/rv_abbreviation) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/rv_abbreviation" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/rv_abbreviation" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/rv_abbreviation/@name}" class="textarea" maxlength="240">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/rv_abbreviation"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/rv_abbreviation" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rv_meaning">
                  <div class="col-1-4 item" item-name="rv_meaning">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/rv_meaning) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/rv_meaning" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/rv_meaning" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/rv_meaning/@name}" class="textarea" maxlength="240">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/rv_meaning"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/rv_meaning" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150320"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150320"/>
</xsl:stylesheet>
