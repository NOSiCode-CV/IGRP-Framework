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
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><!-- START TAB MENU  --><xsl:apply-templates mode="tab-menu" select="rows/content/menu"/><!-- END TAB MENU  --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/schema">
                  <xsl:if test="rows/content/form/label/schema">
                    <div class="col-1-4 item" item-name="schema">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/schema" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/schema/@name}" value="{rows/content/form/value/schema}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/schema"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_ecra">
                  <xsl:if test="rows/content/form/label/tipo_ecra">
                    <div class="col-1-4 item" item-name="tipo_ecra">
                      <div class="igrp_item radiolist">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo_ecra" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/tipo_ecra/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/tipo_ecra"/>
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
                <xsl:if test="rows/content/form/label/modulo">
                  <xsl:if test="rows/content/form/label/modulo">
                    <div class="col-1-4 item" item-name="modulo">
                      <div class="igrp_item selectchange">
                        <a id="idp_modulo"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/modulo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/modulo/@name}" chosen="select" data-placeholder="{rows/content/form/list/modulo/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/modulo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/modulo/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/pagina">
                  <xsl:if test="rows/content/form/label/pagina">
                    <div class="col-1-4 item" item-name="pagina">
                      <div class="igrp_item selectchange">
                        <a id="idp_pagina"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/pagina" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/pagina/@name}" chosen="select" data-placeholder="{rows/content/form/list/pagina/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pagina"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/pagina/option[position() != 1]">
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
                </xsl:if>
                <xsl:if test="rows/content/form/label/table_view_name">
                  <xsl:if test="rows/content/form/label/table_view_name">
                    <div class="col-1-4 item" item-name="table_view_name">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/table_view_name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/table_view_name/@name}" value="{rows/content/form/value/table_view_name}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/table_view_name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_package_db">
                  <xsl:if test="rows/content/form/label/nome_package_db">
                    <div class="col-1-4 item" item-name="nome_package_db">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nome_package_db" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_package_db/@name}" value="{rows/content/form/value/nome_package_db}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_package_db"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome_package_html">
                  <xsl:if test="rows/content/form/label/nome_package_html">
                    <div class="col-1-4 item" item-name="nome_package_html">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/nome_package_html" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome_package_html/@name}" value="{rows/content/form/value/nome_package_html}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_package_html"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sobrepor_db">
                  <xsl:if test="rows/content/form/label/sobrepor_db">
                    <div class="col-1-4 item" item-name="sobrepor_db">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/form/value/sobrepor_db/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/sobrepor_db"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/form/value/sobrepor_db='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/form/label/sobrepor_db" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dados_exemplo">
                  <xsl:if test="rows/content/form/label/dados_exemplo">
                    <div class="col-1-4 item" item-name="dados_exemplo">
                      <div class="igrp_item radiolist">
                        <label>
                          <xsl:value-of select="rows/content/form/label/dados_exemplo" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/dados_exemplo/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/dados_exemplo"/>
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
                </xsl:if><!-- INICIO SEPARADOR script_sep--><xsl:if test="rows/content/form/label/script_sep">
                  <div class="box-content resetPadding" sep-name="script_sep">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/script_sep"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/script">
                  <xsl:if test="rows/content/form/label/script">
                    <div class="col-1-4 item" item-name="script">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/script" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/script/@name}" class="textarea" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/script"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/script" disable-output-escaping="yes"/>
                        </textarea>
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
  <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
