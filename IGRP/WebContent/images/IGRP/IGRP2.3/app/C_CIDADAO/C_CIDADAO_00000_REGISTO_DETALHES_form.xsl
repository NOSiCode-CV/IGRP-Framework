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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR registos_estagiarios--><xsl:if test="rows/content/form/label/registos_estagiarios">
                  <div class="box-content resetPadding" sep-name="registos_estagiarios">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/registos_estagiarios"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
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
                <xsl:if test="rows/content/form/label/idade">
                  <xsl:if test="rows/content/form/label/idade">
                    <div class="col-1-4 item" item-name="idade">
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/idade" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}" class="number required" maxlength="2">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/idade"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sexo">
                  <xsl:if test="rows/content/form/label/sexo">
                    <div class="col-1-4 item" item-name="sexo">
                      <div class="igrp_item radiolist">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/sexo" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/sexo/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist required">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/sexo"/>
                              </xsl:call-template>
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="text" disable-output-escaping="yes"/>
                          </div>
                        </xsl:for-each>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/area_estagio">
                  <xsl:if test="rows/content/form/label/area_estagio">
                    <div class="col-1-4 item" item-name="area_estagio">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/area_estagio" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/area_estagio/@name}" value="{rows/content/form/value/area_estagio}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/area_estagio"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/curso">
                  <xsl:if test="rows/content/form/label/curso">
                    <div class="col-1-4 item" item-name="curso">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/curso" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/curso/@name}" value="{rows/content/form/value/curso}" class="text required" maxlength="4">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/curso"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/grau_academico">
                  <xsl:if test="rows/content/form/label/grau_academico">
                    <div class="col-1-4 item" item-name="grau_academico">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/grau_academico" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/grau_academico/@name}" value="{rows/content/form/value/grau_academico}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/grau_academico"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/universidade">
                  <xsl:if test="rows/content/form/label/universidade">
                    <div class="col-1-4 item" item-name="universidade">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/universidade" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/universidade/@name}" value="{rows/content/form/value/universidade}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/universidade"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR contato--><xsl:if test="rows/content/form/label/contato">
                  <div class="box-content resetPadding" sep-name="contato">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/contato"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/morada">
                  <xsl:if test="rows/content/form/label/morada">
                    <div class="col-1-4 item" item-name="morada">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/morada"/>
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
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                        </label>
                        <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email required">
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
                <xsl:if test="rows/content/form/label/rua">
                  <xsl:if test="rows/content/form/label/rua">
                    <div class="col-1-4 item" item-name="rua">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/rua" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/rua/@name}" value="{rows/content/form/value/rua}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rua"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/numero_porta">
                  <xsl:if test="rows/content/form/label/numero_porta">
                    <div class="col-1-4 item" item-name="numero_porta">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/numero_porta" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/numero_porta/@name}" value="{rows/content/form/value/numero_porta}" class="text" maxlength="4">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/numero_porta"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/caixa_postal">
                  <xsl:if test="rows/content/form/label/caixa_postal">
                    <div class="col-1-4 item" item-name="caixa_postal">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/caixa_postal" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/caixa_postal/@name}" value="{rows/content/form/value/caixa_postal}" class="number" maxlength="4">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/caixa_postal"/>
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
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="number" maxlength="7">
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
                      <div class="igrp_item number">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/telemovel" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}" class="number required" maxlength="7">
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
                <xsl:if test="rows/content/form/label/id"/>
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
