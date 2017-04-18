<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/><div class="colCenter"><!-- START VIEW --><xsl:apply-templates mode="IGRP-view" select="rows/content/view"/><!-- END VIEW --><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/hierarquia_trabalho">
                  <div class="box-content resetPadding" sep-name="hierarquia_trabalho">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/hierarquia_trabalho"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START FORM LIST--><xsl:if test="not(rows/content/form/table/hierarquia_trabalho/value/row[position() = 1]/@noupdate)">
                        <div class="col showResponsiveTable" item-name="add-hierarquia_trabalho">
                          <div class="addRowFormlist addRow">
                            <a rel="hierarquia_trabalho" class="IGRP_addRowForm">
                              <img title="{$lngPath/separatorlist_dialog/add}" src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </a>
                          </div>
                        </div>
                      </xsl:if>
                      <div class="box-table table-responsive">
                        <table class="IGRP_formlist" rel="T_hierarquia_trabalho" data-control="data-hierarquia_trabalho">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/projeto">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/projeto/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/projeto" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/tarefa">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/tarefa/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/tarefa" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/nome_tp_estado">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/nome_tp_estado/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/nome_tp_estado" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/data_inicio_prev">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/data_inicio_prev/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/data_inicio_prev" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/data_fim_prev">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/data_fim_prev/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/data_fim_prev" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/bug">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/bug/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/bug" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/hierarquia_trabalho/label/percent">
                                <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/label/percent/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/hierarquia_trabalho/label/percent" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/hierarquia_trabalho/value/row[position() = 1]/@nodelete)">
                                <th class="fBtn">
                                  <xsl:if test="not(rows/content/form/table/hierarquia_trabalho/value/row[position() = 1]/@noupdate)">
                                    <img title="" src="{$path_tmpl}/img/icon/tools-bar/add.png" item-name="add-hierarquia_trabalho" rel="hierarquia_trabalho" class="IGRP_addRowForm"/>
                                  </xsl:if>
                                </th>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/hierarquia_trabalho/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="projeto">
                                  <xsl:if test="not(projeto/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/projeto}" class="text">
                                      <input type="hidden" name="p_projeto_fk_desc" value="{projeto_desc}"/>
                                      <xsl:value-of select="projeto_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_projeto_fk" value="{projeto}"/>
                                      <xsl:if test="not(@nodelete)">
                                        <span class="showResponsiveTable respDelRow" item-name="del-hierarquia_trabalho">
                                          <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="hierarquia_trabalho" class="IGRP_delRow"/>
                                        </span>
                                      </xsl:if>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="tarefa">
                                  <xsl:if test="not(tarefa/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/tarefa}" class="text">
                                      <input type="hidden" name="p_tarefa_fk_desc" value="{tarefa_desc}"/>
                                      <xsl:value-of select="tarefa_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_tarefa_fk" value="{tarefa}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="nome_tp_estado">
                                  <xsl:if test="not(nome_tp_estado/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/nome_tp_estado}" class="text">
                                      <input type="hidden" name="p_nome_tp_estado_fk_desc" value="{nome_tp_estado_desc}"/>
                                      <xsl:value-of select="nome_tp_estado_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_nome_tp_estado_fk" value="{nome_tp_estado}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="data_inicio_prev">
                                  <xsl:if test="not(data_inicio_prev/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/data_inicio_prev}" class="text">
                                      <input type="hidden" name="p_data_inicio_prev_fk_desc" value="{data_inicio_prev_desc}"/>
                                      <xsl:value-of select="data_inicio_prev_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_data_inicio_prev_fk" value="{data_inicio_prev}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="data_fim_prev">
                                  <xsl:if test="not(data_fim_prev/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/data_fim_prev}" class="text">
                                      <input type="hidden" name="p_data_fim_prev_fk_desc" value="{data_fim_prev_desc}"/>
                                      <xsl:value-of select="data_fim_prev_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_data_fim_prev_fk" value="{data_fim_prev}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="bug">
                                  <xsl:if test="not(bug/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/bug}" class="text">
                                      <input type="hidden" name="p_bug_fk_desc" value="{bug_desc}"/>
                                      <xsl:value-of select="bug_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_bug_fk" value="{bug}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="percent">
                                  <xsl:if test="not(percent/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/percent}" class="text">
                                      <input type="hidden" name="p_percent_fk_desc" value="{percent_desc}"/>
                                      <xsl:value-of select="percent_desc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_percent_fk" value="{percent}"/>
                                    </td>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(@nodelete) or not(@noupdate)">
                                  <td class="fBtn" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-hierarquia_trabalho" class="IGRP_delRow" rel="hierarquia_trabalho"/>
                                    </xsl:if>
                                  </td>
                                </xsl:if>
                                <input type="hidden" name="p_hierarquia_trabalho_id" value="{hierarquia_trabalho_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END FORM LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/projeto">
                    <div class="col-1-4 item" item-name="projeto">
                      <div class="igrp_item LOOKUP">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/projeto) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/projeto" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/projeto" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP" name="{rows/content/filter/value/projeto/@name}" value="{rows/content/filter/value/projeto}" class="LOOKUP">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/projeto"/>
                            </xsl:call-template>
                          </input>
                          <xsl:call-template name="lookup-tool">
                            <xsl:with-param name="page" select="rows/page"/>
                            <xsl:with-param name="ad_hoc" select="'1'"/>
                            <xsl:with-param name="action" select="'LOOKUP'"/>
                            <xsl:with-param name="name" select="rows/content/filter/value/projeto/@name"/>
                            <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/projeto"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/data_inicio_prev">
                    <div class="col-1-4 item" item-name="data_inicio_prev">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_inicio_prev) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_inicio_prev" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_inicio_prev" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_inicio_prev/@name}" value="{rows/content/filter/value/data_inicio_prev}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_inicio_prev"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/data_fim_prev">
                    <div class="col-1-4 item" item-name="data_fim_prev">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/data_fim_prev) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/data_fim_prev" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/data_fim_prev" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/data_fim_prev/@name}" value="{rows/content/filter/value/data_fim_prev}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/data_fim_prev"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/id_tp_tarefa">
                    <div class="col-1-4 item" item-name="id_tp_tarefa">
                      <div class="igrp_item selectchange">
                        <a id="idp_id_tp_tarefa"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/id_tp_tarefa) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/id_tp_tarefa" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/id_tp_tarefa" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/id_tp_tarefa/@name}" chosen="select" id="{rows/content/filter/list/id_tp_tarefa/@name}" data-placeholder="{rows/content/filter/list/id_tp_tarefa/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/id_tp_tarefa"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/id_tp_tarefa/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/id_tpfase_tptarefa">
                    <div class="col-1-4 item" item-name="id_tpfase_tptarefa">
                      <div class="igrp_item selectchange">
                        <a id="idp_id_tpfase_tptarefa"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/id_tpfase_tptarefa) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/id_tpfase_tptarefa" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/id_tpfase_tptarefa" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/id_tpfase_tptarefa/@name}" chosen="select" id="{rows/content/filter/list/id_tpfase_tptarefa/@name}" data-placeholder="{rows/content/filter/list/id_tpfase_tptarefa/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/id_tpfase_tptarefa"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/id_tpfase_tptarefa/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/id_tpfase_tpestado">
                    <div class="col-1-4 item" item-name="id_tpfase_tpestado">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/id_tpfase_tpestado) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/id_tpfase_tpestado" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/id_tpfase_tpestado" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/id_tpfase_tpestado/@name}" chosen="select" id="{rows/content/filter/list/id_tpfase_tpestado/@name}" data-placeholder="{rows/content/filter/list/id_tpfase_tpestado/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/id_tpfase_tpestado"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/id_tpfase_tpestado/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/atrasado">
                    <div class="col-1-4 item" item-name="atrasado">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/filter/value/atrasado/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/atrasado"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/filter/value/atrasado='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/filter/label/atrasado" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor">
                <div class="box-table table-responsive">
                  <div class="table-container">
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/projeto">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/projeto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_tp_estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome_tp_estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_inicio_prev">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_inicio_prev"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_fim_prev">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_fim_prev"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/bug">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/bug"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/percent">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/percent"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/resposta_tarefa">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_resposta_tarefa_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="projeto">
                              <td align="" data-row="{position()}" data-title="{../../label/projeto}" class="text">
                                <xsl:value-of select="projeto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" data-row="{position()}" data-title="{../../label/nome}" class="text">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_tp_estado">
                              <td align="" data-row="{position()}" data-title="{../../label/nome_tp_estado}" class="text">
                                <xsl:value-of select="nome_tp_estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_inicio_prev">
                              <td align="" data-row="{position()}" data-title="{../../label/data_inicio_prev}" class="date">
                                <xsl:value-of select="data_inicio_prev"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_fim_prev">
                              <td align="" data-row="{position()}" data-title="{../../label/data_fim_prev}" class="date">
                                <xsl:value-of select="data_fim_prev"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="bug">
                              <td align="" data-row="{position()}" data-title="{../../label/bug}" class="text">
                                <xsl:value-of select="bug"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="percent">
                              <td align="" data-row="{position()}" data-title="{../../label/percent}" class="text">
                                <xsl:value-of select="percent"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="resposta_tarefa">
                              <td align="" data-row="{position()}" data-title="{../../label/resposta_tarefa}" class="checkbox">
                                <xsl:if test="resposta_tarefa != '-0'">
                                  <input type="checkbox" name="p_resposta_tarefa" value="{resposta_tarefa}">
                                    <xsl:if test="resposta_tarefa_check=resposta_tarefa">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="resposta_tarefa_desc"/>
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
                  <xsl:if test="rows/content/execucao_tarefa"><!-- START CHARTS--><div class="col" sep-name="execucao_tarefa">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/execucao_tarefa"/>
                        <xsl:with-param name="chart_type" select="rows/content/execucao_tarefa/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/execucao_tarefa/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <xsl:if test="rows/content/desempenho"><!-- START CHARTS--><div class="col" sep-name="desempenho">
                      <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/desempenho"/>
                        <xsl:with-param name="chart_type" select="rows/content/desempenho/chart_type"/>
                        <xsl:with-param name="height" select="150"/>
                        <xsl:with-param name="title" select="rows/content/desempenho/caption"/>
                      </xsl:call-template>
                    </div><!-- END CHARTS--></xsl:if>
                  <div class="_clear"/>
                </div>
                <div class="_clear"/>
              </div>
            </div><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150831"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150831"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150831"/>
  <xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=20150831"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150831"/>
</xsl:stylesheet>
