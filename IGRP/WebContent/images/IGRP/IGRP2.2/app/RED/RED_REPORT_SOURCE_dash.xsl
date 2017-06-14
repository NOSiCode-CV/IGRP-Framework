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
                <xsl:if test="rows/content/form/label/tipo">
                  <div class="col-1-4 item" item-name="tipo">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tipo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tipo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/tipo" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/tipo/@name}" chosen="select" id="{rows/content/form/list/tipo/@name}" data-placeholder="{rows/content/form/list/tipo/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tipo"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/tipo/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao">
                  <div class="col-1-4 item" item-name="aplicacao">
                    <div class="igrp_item select">
                      <a id="idp_aplicacao"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/aplicacao" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/aplicacao/@name}" chosen="select" id="{rows/content/form/list/aplicacao/@name}" data-placeholder="{rows/content/form/list/aplicacao/option[position() = 1]}" class="select IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/aplicacao/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/pagina">
                  <div class="col-1-4 item" item-name="pagina">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/pagina) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/pagina/@name}" value="{rows/content/form/value/pagina}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/pagina/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pagina"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/area">
                  <div class="col-1-4 item" item-name="area">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/area) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/area" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/area" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/area/@name}" chosen="select" id="{rows/content/form/list/area/@name}" data-placeholder="{rows/content/form/list/area/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/area"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/area/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/processo">
                  <div class="col-1-4 item" item-name="processo">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/processo/@name}" chosen="select" id="{rows/content/form/list/processo/@name}" data-placeholder="{rows/content/form/list/processo/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/processo/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/etapa">
                  <div class="col-1-4 item" item-name="etapa">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/etapa) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/etapa" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/etapa/@name}" chosen="select" id="{rows/content/form/list/etapa/@name}" data-placeholder="{rows/content/form/list/etapa/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/etapa"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/etapa/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/type_name">
                  <div class="col-1-4 item" item-name="type_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/type_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/type_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/type_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/type_name/@name}" value="{rows/content/form/value/type_name}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/type_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/type_query">
                  <div class="col-1-4 item" item-name="type_query">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/type_query) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/type_query" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/type_query" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/type_query/@name}" class="textarea" maxlength="3000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/type_query"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/type_query" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/servico">
                  <div class="col-1-4 item" item-name="servico">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/servico) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/servico" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/servico" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/servico"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/servico/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/servico"/>
                        </xsl:call-template>
                      </div>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150826"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150826"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150826"/>
</xsl:stylesheet>
