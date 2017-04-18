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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/id">
                  <div class="col-1-4 item" item-name="id">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/id) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/id" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/id" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/id/@name}" value="{rows/content/form/value/id}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/id"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nif">
                  <div class="col-1-4 item" item-name="nif">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nif) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nif" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nif" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
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
                <xsl:if test="rows/content/form/label/nome_normal">
                  <div class="col-1-4 item" item-name="nome_normal">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome_normal) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome_normal" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nome_normal" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome_normal/@name}" value="{rows/content/form/value/nome_normal}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome_normal"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data">
                  <div class="col-1-4 item" item-name="data">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <div class="col-1-4 item" item-name="estado">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
