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
                <xsl:if test="rows/content/form/label/aplicacao_origem">
                  <div class="col-1-4 item" item-name="aplicacao_origem">
                    <div class="igrp_item selectchange">
                      <a id="idp_aplicacao_origem"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao_origem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao_origem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/aplicacao_origem" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/aplicacao_origem/@name}" chosen="select" id="{rows/content/form/list/aplicacao_origem/@name}" data-placeholder="{rows/content/form/list/aplicacao_origem/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao_origem"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/aplicacao_origem/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/elemento">
                  <div class="col-1-4 item" item-name="elemento">
                    <div class="igrp_item selectchange">
                      <a id="idp_elemento"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/elemento) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/elemento" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/elemento" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/elemento/@name}" chosen="select" id="{rows/content/form/list/elemento/@name}" data-placeholder="{rows/content/form/list/elemento/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/elemento"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/elemento/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/area">
                  <div class="col-1-4 item" item-name="area">
                    <div class="igrp_item selectchange">
                      <a id="idp_area"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/area) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/area" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/area" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/area/@name}" chosen="select" id="{rows/content/form/list/area/@name}" data-placeholder="{rows/content/form/list/area/option[position() = 1]}" class="selectchange IGRP_change">
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
                    <div class="igrp_item selectchange">
                      <a id="idp_processo"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/processo/@name}" chosen="select" id="{rows/content/form/list/processo/@name}" data-placeholder="{rows/content/form/list/processo/option[position() = 1]}" class="selectchange IGRP_change">
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
                <xsl:if test="rows/content/form/label/aplicacao_destino">
                  <div class="col-1-4 item" item-name="aplicacao_destino">
                    <div class="igrp_item selectchange">
                      <a id="idp_aplicacao_destino"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao_destino) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao_destino" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/aplicacao_destino" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/aplicacao_destino/@name}" chosen="select" id="{rows/content/form/list/aplicacao_destino/@name}" data-placeholder="{rows/content/form/list/aplicacao_destino/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao_destino"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/aplicacao_destino/option[position() != 1]">
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
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/marcar">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_marcar_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/descricao">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/descricao"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="marcar">
                              <td align="center" data-row="{position()}" data-title="{../../label/marcar}" class="checkbox">
                                <xsl:if test="marcar != '-0'">
                                  <input type="checkbox" name="p_marcar" value="{marcar}">
                                    <xsl:if test="marcar_check=marcar">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="marcar_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="descricao">
                              <td align="left" data-row="{position()}" data-title="{../../label/descricao}" class="text">
                                <xsl:value-of select="descricao"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150525"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150525"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150525"/>
</xsl:stylesheet>
