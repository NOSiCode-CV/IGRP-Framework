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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/id_area_neg">
                    <div class="col-1-4 item" item-name="id_area_neg">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/id_area_neg) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/id_area_neg" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/id_area_neg" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/id_area_neg/@name}" chosen="select" id="{rows/content/form/list/id_area_neg/@name}" data-placeholder="{rows/content/form/list/id_area_neg/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/id_area_neg"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/id_area_neg/option[position() != 1]">
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
                  <xsl:if test="rows/content/form/label/codigo">
                    <div class="col-1-4 item" item-name="codigo">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/codigo) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/cliente_desc">
                    <div class="col-1-4 item" item-name="cliente_desc">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/cliente_desc) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/cliente_desc" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/cliente_desc" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cliente_desc/@name}" value="{rows/content/form/value/cliente_desc}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente_desc"/>
                          </xsl:call-template>
                        </input>
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
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/dt_inicio_prev">
                    <div class="col-1-4 item" item-name="dt_inicio_prev">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/dt_inicio_prev) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/dt_inicio_prev" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/dt_inicio_prev" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_inicio_prev/@name}" value="{rows/content/form/value/dt_inicio_prev}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_inicio_prev"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/dt_fim_prev">
                    <div class="col-1-4 item" item-name="dt_fim_prev">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/form/label/dt_fim_prev) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/form/label/dt_fim_prev" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/form/label/dt_fim_prev" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_fim_prev/@name}" value="{rows/content/form/value/dt_fim_prev}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_fim_prev"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
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
                          <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/estado/@name}" chosen="select" id="{rows/content/form/list/estado/@name}" data-placeholder="{rows/content/form/list/estado/option[position() = 1]}" class="select">
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
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/sigla">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/sigla"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_inicio_prev">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/dt_inicio_prev"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_fim_prev">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/dt_fim_prev"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/duracao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/duracao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/area_neg_desc">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/area_neg_desc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/percentagem">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/percentagem"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="sigla">
                              <td align="" data-row="{position()}" data-title="{../../label/sigla}" class="text">
                                <xsl:value-of select="sigla"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_inicio_prev">
                              <td align="" data-row="{position()}" data-title="{../../label/dt_inicio_prev}" class="date">
                                <xsl:value-of select="dt_inicio_prev"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_fim_prev">
                              <td align="" data-row="{position()}" data-title="{../../label/dt_fim_prev}" class="date">
                                <xsl:value-of select="dt_fim_prev"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="duracao">
                              <td align="" data-row="{position()}" data-title="{../../label/duracao}" class="number">
                                <xsl:value-of select="duracao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="area_neg_desc">
                              <td align="" data-row="{position()}" data-title="{../../label/area_neg_desc}" class="text">
                                <xsl:value-of select="area_neg_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="percentagem">
                              <td align="" data-row="{position()}" data-title="{../../label/percentagem}" class="text">
                                <xsl:value-of select="percentagem"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150612"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150612"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150612"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150612"/>
</xsl:stylesheet>
