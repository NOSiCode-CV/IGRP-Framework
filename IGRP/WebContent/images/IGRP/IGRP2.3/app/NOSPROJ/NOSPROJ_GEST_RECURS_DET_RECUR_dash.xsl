<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form"><!-- INICIO SEPARADOR informacoes_identificacao--><xsl:if test="rows/content/form/label/informacoes_identificacao">
                  <div class="box-content resetPadding" sep-name="informacoes_identificacao">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/informacoes_identificacao"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item LOOKUP_NIF">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP_NIF" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="LOOKUP_NIF required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/nome/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_nasc">
                  <div class="col-1-4 item" item-name="dt_nasc">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_nasc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_nasc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_nasc" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/dt_nasc/@name}" value="{rows/content/form/value/dt_nasc}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_nasc"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sexo">
                  <div class="col-1-4 item" item-name="sexo">
                    <div class="igrp_item radiolist">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/sexo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/sexo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/sexo" disable-output-escaping="yes"/>
                      </label>
                      <xsl:for-each select="rows/content/form/list/sexo/option">
                        <div class="col-1-1">
                          <input type="radio" name="{../@name}" value="{value}" class="radiolist">
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
                <xsl:if test="rows/content/form/label/nu_bi">
                  <div class="col-1-4 item" item-name="nu_bi">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nu_bi) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nu_bi" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
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
                <xsl:if test="rows/content/form/label/nu_nif">
                  <div class="col-1-4 item" item-name="nu_nif">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nu_nif) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nu_nif" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nu_nif" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/nu_nif/@name}" value="{rows/content/form/value/nu_nif}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nu_nif"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_registo">
                  <div class="col-1-4 item" item-name="dt_registo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_registo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_registo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/dt_registo/@name}" value="{rows/content/form/value/dt_registo}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/dt_registo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/estado">
                  <div class="col-1-4 item" item-name="estado">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/estado/@name}" chosen="select" id="{rows/content/form/list/estado/@name}" data-placeholder="{rows/content/form/list/estado/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/estado/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/dt_fim">
                  <div class="col-1-4 item" item-name="dt_fim">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/dt_fim) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/dt_fim" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/dt_fim" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/dt_fim/@name}" value="{rows/content/form/value/dt_fim}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/dt_fim"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/localidade">
                  <div class="col-1-4 item" item-name="localidade">
                    <div class="igrp_item LOOKUP_GEOG">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/localidade) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/localidade" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/localidade" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/localidade/@name}" value="{rows/content/form/value/localidade}" class="LOOKUP_GEOG">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/localidade"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/localidade/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/localidade"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/morada">
                  <div class="col-1-4 item" item-name="morada">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/morada) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}" class="text" maxlength="150">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/morada"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR contactos--><xsl:if test="rows/content/form/label/contactos">
                  <div class="box-content resetPadding" sep-name="contactos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/contactos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/telefone">
                  <div class="col-1-4 item" item-name="telefone">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/telefone) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/telefone"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <div class="col-1-4 item" item-name="email">
                    <div class="igrp_item email">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/email) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
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
                <xsl:if test="rows/content/form/label/email_alt">
                  <div class="col-1-4 item" item-name="email_alt">
                    <div class="igrp_item email">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/email_alt) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/email_alt" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/email_alt" disable-output-escaping="yes"/>
                      </label>
                      <input type="email" name="{rows/content/form/value/email_alt/@name}" value="{rows/content/form/value/email_alt}" class="email">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/email_alt"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR informacoes_academicas--><xsl:if test="rows/content/form/label/informacoes_academicas">
                  <div class="box-content resetPadding" sep-name="informacoes_academicas">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/informacoes_academicas"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/curso">
                  <div class="col-1-4 item" item-name="curso">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/curso) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/curso" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/curso" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/curso/@name}" value="{rows/content/form/value/curso}" class="text" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/curso"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/pais_curso">
                  <div class="col-1-4 item" item-name="pais_curso">
                    <div class="igrp_item LOOKUP_GEOG">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pais_curso) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pais_curso" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pais_curso" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/pais_curso/@name}" value="{rows/content/form/value/pais_curso}" class="LOOKUP_GEOG">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pais_curso"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pais_curso/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pais_curso"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nivel">
                  <div class="col-1-4 item" item-name="nivel">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nivel) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nivel" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/nivel" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/nivel/@name}" chosen="select" id="{rows/content/form/list/nivel/@name}" data-placeholder="{rows/content/form/list/nivel/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nivel"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/nivel/option[position() != 1]">
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
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
