<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><!-- START SIMPLE-MENU --><xsl:apply-templates mode="simple-menu" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/organica">
                    <div class="col-1-4 item" item-name="organica">
                      <div class="igrp_item selectchange">
                        <a id="idp_organica"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/organica) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/organica" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/organica" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/organica/@name}" chosen="select" id="{rows/content/filter/list/organica/@name}" data-placeholder="{rows/content/filter/list/organica/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/organica"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/organica/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/numero_processo">
                    <div class="col-1-4 item" item-name="numero_processo">
                      <div class="igrp_item number">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/numero_processo) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/numero_processo" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/numero_processo" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/filter/value/numero_processo/@name}" value="{rows/content/filter/value/numero_processo}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/numero_processo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/tipo_processo">
                    <div class="col-1-4 item" item-name="tipo_processo">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/tipo_processo) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/tipo_processo" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/tipo_processo" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/tipo_processo/@name}" chosen="select" id="{rows/content/filter/list/tipo_processo/@name}" data-placeholder="{rows/content/filter/list/tipo_processo/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/tipo_processo"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/tipo_processo/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/data_inicio">
                    <div class="col-1-4 item" item-name="data_inicio">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_inicio) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_inicio"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/data_fim">
                    <div class="col-1-4 item" item-name="data_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_fim) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/prioridade">
                    <div class="col-1-4 item" item-name="prioridade">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/prioridade) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/prioridade" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/prioridade" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/prioridade/@name}" chosen="select" id="{rows/content/filter/list/prioridade/@name}" data-placeholder="{rows/content/filter/list/prioridade/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/prioridade"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/prioridade/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/search">
                    <div class="col-1-4 item" item-name="search">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/search) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/search" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/search" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/search/@name}" value="{rows/content/filter/value/search}" class="text" maxlength="500">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/search"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/priority">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/priority"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/numero_processo">
                            <th align="right">
                              <xsl:value-of select="rows/content/table/label/numero_processo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/descricao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/descricao"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atribuido_por">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/atribuido_por"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atribuido_a">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/atribuido_a"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_entrada">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/data_entrada"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="priority">
                              <td align="" data-row="{position()}" data-title="{../../label/priority}" class="number">
                                <xsl:value-of select="priority"/>
                                <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                  <xsl:with-param name="ctx" select="context-menu"/>
                                </xsl:apply-templates>
                              </td>
                            </xsl:if>
                            <xsl:if test="numero_processo">
                              <td align="right" data-row="{position()}" data-title="{../../label/numero_processo}" class="number">
                                <xsl:value-of select="numero_processo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo">
                              <td align="" data-row="{position()}" data-title="{../../label/tipo}" class="text">
                                <xsl:value-of select="tipo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="descricao">
                              <td align="" data-row="{position()}" data-title="{../../label/descricao}" class="text">
                                <xsl:value-of select="descricao"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atribuido_por">
                              <td align="" data-row="{position()}" data-title="{../../label/atribuido_por}" class="text">
                                <xsl:value-of select="atribuido_por"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atribuido_a">
                              <td align="" data-row="{position()}" data-title="{../../label/atribuido_a}" class="text">
                                <xsl:value-of select="atribuido_a"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_entrada">
                              <td align="center" data-row="{position()}" data-title="{../../label/data_entrada}" class="date">
                                <xsl:value-of select="data_entrada"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form>
            <div class="col">
              <div class="_clear"/>
            </div></div><div class="colLR">
              <div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/execucao_tarefas"><!-- START CHARTS--><div class="col" sep-name="execucao_tarefas">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/execucao_tarefas"/>
                        <xsl:with-param name="chart_type" select="rows/content/execucao_tarefas/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/execucao_tarefas/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/evolucao_desempenho"><!-- START CHARTS--><div class="col" sep-name="evolucao_desempenho">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/evolucao_desempenho"/>
                        <xsl:with-param name="chart_type" select="rows/content/evolucao_desempenho/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/evolucao_desempenho/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/desvio"><!-- START CHARTS--><div class="col" sep-name="desvio">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/desvio"/>
                        <xsl:with-param name="chart_type" select="rows/content/desvio/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/desvio/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150526"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150526"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150526"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150526"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150526"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150526"/>
</xsl:stylesheet>
