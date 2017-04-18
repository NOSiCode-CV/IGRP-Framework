<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/bi">
                  <xsl:if test="rows/content/form/label/bi">
                    <div class="col-1-4 item" item-name="bi">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/bi"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <xsl:if test="rows/content/form/label/email">
                    <div class="col-1-4 item" item-name="email">
                      <div class="igrp_item email">
                        <label>
                          <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                        </label>
                        <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/email"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data">
                  <xsl:if test="rows/content/form/label/data">
                    <div class="col-1-4 item" item-name="data">
                      <div class="igrp_item date">
                        <label>
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/link">
                  <xsl:if test="rows/content/form/label/link">
                    <div class="col-1-4 item" item-name="link">
                      <div class="igrp_item link">
                        <a href="{rows/content/form/value/link}" class="link bClick" name="p_link" target="_blank">
                          <xsl:value-of select="rows/content/form/label/link" disable-output-escaping="yes"/>
                        </a>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR response--><xsl:if test="rows/content/form/label/response">
                  <div class="box-content resetPadding" sep-name="response">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/response"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_resp">
                  <xsl:if test="rows/content/form/label/nome_resp">
                    <div class="col-1-4 item" item-name="nome_resp">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome_resp" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_resp/@name}" value="{rows/content/form/value/nome_resp}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_resp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nif_resp">
                  <xsl:if test="rows/content/form/label/nif_resp">
                    <div class="col-1-4 item" item-name="nif_resp">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nif_resp" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nif_resp/@name}" value="{rows/content/form/value/nif_resp}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif_resp"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_nasc_resp">
                  <xsl:if test="rows/content/form/label/data_nasc_resp">
                    <div class="col-1-4 item" item-name="data_nasc_resp">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/data_nasc_resp" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_nasc_resp/@name}" value="{rows/content/form/value/data_nasc_resp}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_nasc_resp"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
