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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col" sep-name="form">
                <xsl:if test="rows/content/form/label/sep">
                  <div class="col-1-4 item" item-name="sep">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/sep) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/sep" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/sep" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/sep/@name}" value="{rows/content/form/value/sep}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/sep"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/texto">
                  <div class="box-content addPadding10 resetBorder" sep-name="texto">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="rows/content/form/value/texto/@name"/>
                      <xsl:with-param name="value" select="rows/content/form/value/texto"/>
                      <xsl:with-param name="maxlength" select="30"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/idade">
                  <div class="col-1-4 item" item-name="idade">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/idade) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" max="100" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="number">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                        </xsl:call-template>
                      </input>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160531"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20160531"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160531"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160531"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20160531"/>
</xsl:stylesheet>
