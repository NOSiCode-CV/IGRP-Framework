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
                <xsl:if test="rows/content/form/label/id"/>
                <xsl:if test="rows/content/form/label/cod_imdb">
                  <xsl:if test="rows/content/form/label/cod_imdb">
                    <div class="col-1-4 item" item-name="cod_imdb">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/cod_imdb" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/cod_imdb/@name}" value="{rows/content/form/value/cod_imdb}" class="number required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_imdb"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/titulo">
                  <xsl:if test="rows/content/form/label/titulo">
                    <div class="col-1-4 item" item-name="titulo">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/titulo" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/titulo/@name}" class="textarea required" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/titulo" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/ano_lancamento">
                  <xsl:if test="rows/content/form/label/ano_lancamento">
                    <div class="col-1-4 item" item-name="ano_lancamento">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/ano_lancamento" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/ano_lancamento/@name}" value="{rows/content/form/value/ano_lancamento}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/ano_lancamento"/>
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
                <xsl:if test="rows/content/form/label/cod_barras">
                  <xsl:if test="rows/content/form/label/cod_barras">
                    <div class="col-1-4 item" item-name="cod_barras">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/cod_barras" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cod_barras/@name}" value="{rows/content/form/value/cod_barras}" class="text required" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_barras"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/capa_id">
                  <xsl:if test="rows/content/form/label/capa_id">
                    <div class="col-1-4 item" item-name="capa_id">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/capa_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/capa_id/@name}" value="{rows/content/form/value/capa_id}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/capa_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_filme">
                  <xsl:if test="rows/content/form/label/tipo_filme">
                    <div class="col-1-4 item" item-name="tipo_filme">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo_filme" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/tipo_filme/@name}" value="{rows/content/form/value/tipo_filme}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_filme"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/capa">
                  <xsl:if test="rows/content/form/label/capa">
                    <div class="col-1-4 item" item-name="capa">
                      <div class="igrp_item file">
                        <label>
                          <xsl:value-of select="rows/content/form/label/capa" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/capa/@name}"/>
                          <span class="upload">File</span>
                          <input type="file" name="{rows/content/form/value/capa/@name}" value="{rows/content/form/value/capa}" class="file uploadFile">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/capa"/>
                            </xsl:call-template>
                          </input>
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
