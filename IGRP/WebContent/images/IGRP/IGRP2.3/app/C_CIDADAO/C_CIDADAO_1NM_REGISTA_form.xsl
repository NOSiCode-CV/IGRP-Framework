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
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="50">
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
                <xsl:if test="rows/content/form/label/apelido">
                  <xsl:if test="rows/content/form/label/apelido">
                    <div class="col-1-4 item" item-name="apelido">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/apelido" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/apelido/@name}" value="{rows/content/form/value/apelido}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/apelido"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id_morada">
                  <xsl:if test="rows/content/form/label/id_morada">
                    <div class="col-1-4 item" item-name="id_morada">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/id_morada" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/id_morada/@name}" value="{rows/content/form/value/id_morada}" class="number required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/id_morada"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/morada">
                  <xsl:if test="rows/content/form/label/morada">
                    <div class="col-1-4 item" item-name="morada">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/morada/@name}" class="textarea required" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/morada"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/morada" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/foto_id">
                  <xsl:if test="rows/content/form/label/foto_id">
                    <div class="col-1-4 item" item-name="foto_id">
                      <div class="igrp_item file">
                        <label>
                          <xsl:value-of select="rows/content/form/label/foto_id" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/foto_id/@name}"/>
                          <span class="upload">File</span>
                          <input type="file" name="{rows/content/form/value/foto_id/@name}" value="{rows/content/form/value/foto_id}" class="file uploadFile">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/foto_id"/>
                            </xsl:call-template>
                          </input>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nu_socio">
                  <xsl:if test="rows/content/form/label/nu_socio">
                    <div class="col-1-4 item" item-name="nu_socio">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nu_socio" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/nu_socio/@name}" value="{rows/content/form/value/nu_socio}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nu_socio"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <xsl:if test="rows/content/form/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nu_bi">
                  <xsl:if test="rows/content/form/label/nu_bi">
                    <div class="col-1-4 item" item-name="nu_bi">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nu_bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nu_bi/@name}" value="{rows/content/form/value/nu_bi}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nu_bi"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nif">
                  <xsl:if test="rows/content/form/label/nif">
                    <div class="col-1-4 item" item-name="nif">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nif" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/telefone">
                  <xsl:if test="rows/content/form/label/telefone">
                    <div class="col-1-4 item" item-name="telefone">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telefone"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/telemovel">
                  <xsl:if test="rows/content/form/label/telemovel">
                    <div class="col-1-4 item" item-name="telemovel">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telemovel" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telemovel"/>
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
