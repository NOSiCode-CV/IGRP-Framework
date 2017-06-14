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
                <xsl:if test="rows/content/form/label/igrp_photo_id"/>
                <xsl:if test="rows/content/form/label/igrp_fingerleft_id"/>
                <xsl:if test="rows/content/form/label/igrp_fingerright_id"/>
                <xsl:if test="rows/content/form/label/igrp_signature_id"/>
                <xsl:if test="rows/content/form/label/host_ip">
                  <xsl:if test="rows/content/form/label/host_ip">
                    <div class="col-1-4 item" item-name="host_ip">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/host_ip" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/host_ip/@name}" value="{rows/content/form/value/host_ip}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/host_ip"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/application_id">
                  <xsl:if test="rows/content/form/label/application_id">
                    <div class="col-1-4 item" item-name="application_id">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/application_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/application_id/@name}" value="{rows/content/form/value/application_id}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/application_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/session_key"/>
                <xsl:if test="rows/content/form/label/process_id">
                  <xsl:if test="rows/content/form/label/process_id">
                    <div class="col-1-4 item" item-name="process_id">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/process_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/process_id/@name}" value="{rows/content/form/value/process_id}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/process_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/igrp_activity_id"/>
                <xsl:if test="rows/content/form/label/igrp_procedure"/>
                <xsl:if test="rows/content/form/label/igrp_external_id"/><!-- INICIO SEPARADOR data_bio--><xsl:if test="rows/content/form/label/data_bio">
                  <div class="box-content resetPadding" sep-name="data_bio">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/data_bio"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/photo_link">
                  <xsl:if test="rows/content/form/label/photo_link">
                    <div class="col-1-4 item" item-name="photo_link">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/photo_link" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/photo_link/@name}" value="{rows/content/form/value/photo_link}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/photo_link"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/fingerleft_link">
                  <xsl:if test="rows/content/form/label/fingerleft_link">
                    <div class="col-1-4 item" item-name="fingerleft_link">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/fingerleft_link" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/fingerleft_link/@name}" value="{rows/content/form/value/fingerleft_link}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/fingerleft_link"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/fingerright_link">
                  <xsl:if test="rows/content/form/label/fingerright_link">
                    <div class="col-1-4 item" item-name="fingerright_link">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/fingerright_link" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/fingerright_link/@name}" value="{rows/content/form/value/fingerright_link}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/fingerright_link"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/signature_link">
                  <xsl:if test="rows/content/form/label/signature_link">
                    <div class="col-1-4 item" item-name="signature_link">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/signature_link" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/signature_link/@name}" value="{rows/content/form/value/signature_link}" class="text" maxlength="2000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/signature_link"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/igrp_greyscale_id"/>
                <xsl:if test="rows/content/form/label/greyscale_link">
                  <xsl:if test="rows/content/form/label/greyscale_link">
                    <div class="col-1-4 item" item-name="greyscale_link">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/greyscale_link" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/greyscale_link/@name}" value="{rows/content/form/value/greyscale_link}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/greyscale_link"/>
                          </xsl:call-template>
                        </input>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
