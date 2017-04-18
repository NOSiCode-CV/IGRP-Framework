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
                <xsl:if test="rows/content/form/label/nr_estudante">
                  <xsl:if test="rows/content/form/label/nr_estudante">
                    <div class="col-1-4 item" item-name="nr_estudante">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nr_estudante" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nr_estudante/@name}" value="{rows/content/form/value/nr_estudante}" class="text required" maxlength="12">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nr_estudante"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_est">
                  <xsl:if test="rows/content/form/label/nome_est">
                    <div class="col-1-4 item" item-name="nome_est">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome_est" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_est/@name}" value="{rows/content/form/value/nome_est}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_est"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/apelido_est">
                  <xsl:if test="rows/content/form/label/apelido_est">
                    <div class="col-1-4 item" item-name="apelido_est">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/apelido_est" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/apelido_est/@name}" value="{rows/content/form/value/apelido_est}" class="text required" maxlength="12">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/apelido_est"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_nasc">
                  <xsl:if test="rows/content/form/label/data_nasc">
                    <div class="col-1-4 item" item-name="data_nasc">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/data_nasc" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/data_nasc/@name}" value="{rows/content/form/value/data_nasc}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/data_nasc"/>
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
                <xsl:if test="rows/content/form/label/curso_est">
                  <xsl:if test="rows/content/form/label/curso_est">
                    <div class="col-1-4 item" item-name="curso_est">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/curso_est" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/curso_est/@name}" value="{rows/content/form/value/curso_est}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/curso_est"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/ano_curso">
                  <xsl:if test="rows/content/form/label/ano_curso">
                    <div class="col-1-4 item" item-name="ano_curso">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/ano_curso" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/ano_curso/@name}" value="{rows/content/form/value/ano_curso}" class="number required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/ano_curso"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
