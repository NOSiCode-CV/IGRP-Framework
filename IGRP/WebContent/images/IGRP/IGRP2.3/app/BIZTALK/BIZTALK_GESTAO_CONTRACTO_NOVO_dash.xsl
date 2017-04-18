<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED / DIM )--><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
      <body><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--CENTER PANE--><div class="general">
          <div id="content">
            <div class="ui-layout-center">
              <xsl:call-template name="dialog-modal"/><!-- START YOUR CODE HERE --><div class="box-content"><!--PAGE TITLE--><xsl:call-template name="page-title">
                  <xsl:with-param name="title" select="rows/content/title"/>
                </xsl:call-template><!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages">
                  <xsl:with-param name="class" select="'notification'"/>
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content">
                    <xsl:if test="rows/content/form/label/id_iten"/><!-- INICIO SEPARADOR itens_contrato--><xsl:if test="rows/content/form/label/itens_contrato">
                      <xsl:if test="rows/content/form/label/itens_contrato">
                        <div rel="itens_contrato">
                          <div class="itens_contrato">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/itens_contrato"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'itens_contrato'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/servico">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/servico"/>
                              </span>
                              <input type="LOOKUP" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="LOOKUP required" maxlength="300" rel="F_itens_contrato">
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
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/tipo_consumo">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/tipo_consumo"/>
                              </span>
                              <select name="{rows/content/form/list/tipo_consumo/@name}" class="select required IGRP_change" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo_consumo"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tipo_consumo/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                              <a id="idp_tipo_consumo"/>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/data_inicio">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/data_inicio"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="date IGRP_datepicker required" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/data_fim">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/data_fim"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}" class="date IGRP_datepicker required" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/quota">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/quota"/>
                              </span>
                              <input type="number" name="{rows/content/form/value/quota/@name}" value="{rows/content/form/value/quota}" class="number required IGRP_change" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/quota"/>
                                </xsl:call-template>
                              </input>
                              <a id="idp_quota"/>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/saldo">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/saldo"/>
                              </span>
                              <input type="number" name="{rows/content/form/value/saldo/@name}" value="{rows/content/form/value/saldo}" class="number required" readonly="readonly" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/saldo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/data_base_user">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/data_base_user"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/data_base_user/@name}" value="{rows/content/form/value/data_base_user}" class="text" maxlength="100" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_base_user"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/host">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/host"/>
                              </span>
                              <select name="{rows/content/form/list/host/@name}" class="select" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/host"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/host/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/server">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/server"/>
                              </span>
                              <select name="{rows/content/form/list/server/@name}" class="select" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/server"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/server/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/biztalk">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/biztalk"/>
                              </span>
                              <input type="checkbox" name="{rows/content/form/value/biztalk/@name}" value="1" class="checkbox" maxlength="30" rel="F_itens_contrato">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/biztalk"/>
                                </xsl:call-template>
                                <xsl:if test="rows/content/form/value/biztalk='1'">
                                  <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                              </input>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_itens_contrato">
                            <table rel="T_itens_contrato">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/servico">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/servico/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/servico"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/tipo_consumo">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/tipo_consumo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/tipo_consumo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/data_inicio">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/data_inicio/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/data_inicio"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/data_fim">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/data_fim/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/data_fim"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/quota">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/quota/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/quota"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/saldo">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/saldo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/saldo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/data_base_user">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/data_base_user/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/data_base_user"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/host">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/host/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/host"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/server">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/server/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/server"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/biztalk">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/biztalk/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/biztalk"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/itens_contrato/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="servico">
                                      <xsl:if test="not(servico/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="servico_desc"/>
                                          <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                          <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="servico/@visible = 'false'">
                                        <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                        <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="tipo_consumo">
                                      <xsl:if test="not(tipo_consumo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tipo_consumo_desc"/>
                                          <input type="hidden" name="p_tipo_consumo_fk" value="{tipo_consumo}"/>
                                          <input type="hidden" name="p_tipo_consumo_fk_desc" value="{tipo_consumo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tipo_consumo/@visible = 'false'">
                                        <input type="hidden" name="p_tipo_consumo_fk" value="{tipo_consumo}"/>
                                        <input type="hidden" name="p_tipo_consumo_fk_desc" value="{tipo_consumo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="data_inicio">
                                      <xsl:if test="not(data_inicio/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="data_inicio_desc"/>
                                          <input type="hidden" name="p_data_inicio_fk" value="{data_inicio}"/>
                                          <input type="hidden" name="p_data_inicio_fk_desc" value="{data_inicio_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="data_inicio/@visible = 'false'">
                                        <input type="hidden" name="p_data_inicio_fk" value="{data_inicio}"/>
                                        <input type="hidden" name="p_data_inicio_fk_desc" value="{data_inicio_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="data_fim">
                                      <xsl:if test="not(data_fim/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="data_fim_desc"/>
                                          <input type="hidden" name="p_data_fim_fk" value="{data_fim}"/>
                                          <input type="hidden" name="p_data_fim_fk_desc" value="{data_fim_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="data_fim/@visible = 'false'">
                                        <input type="hidden" name="p_data_fim_fk" value="{data_fim}"/>
                                        <input type="hidden" name="p_data_fim_fk_desc" value="{data_fim_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="quota">
                                      <xsl:if test="not(quota/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="quota_desc"/>
                                          <input type="hidden" name="p_quota_fk" value="{quota}"/>
                                          <input type="hidden" name="p_quota_fk_desc" value="{quota_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="quota/@visible = 'false'">
                                        <input type="hidden" name="p_quota_fk" value="{quota}"/>
                                        <input type="hidden" name="p_quota_fk_desc" value="{quota_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="saldo">
                                      <xsl:if test="not(saldo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="saldo_desc"/>
                                          <input type="hidden" name="p_saldo_fk" value="{saldo}"/>
                                          <input type="hidden" name="p_saldo_fk_desc" value="{saldo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="saldo/@visible = 'false'">
                                        <input type="hidden" name="p_saldo_fk" value="{saldo}"/>
                                        <input type="hidden" name="p_saldo_fk_desc" value="{saldo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="data_base_user">
                                      <xsl:if test="not(data_base_user/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="data_base_user_desc"/>
                                          <input type="hidden" name="p_data_base_user_fk" value="{data_base_user}"/>
                                          <input type="hidden" name="p_data_base_user_fk_desc" value="{data_base_user_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="data_base_user/@visible = 'false'">
                                        <input type="hidden" name="p_data_base_user_fk" value="{data_base_user}"/>
                                        <input type="hidden" name="p_data_base_user_fk_desc" value="{data_base_user_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="host">
                                      <xsl:if test="not(host/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="host_desc"/>
                                          <input type="hidden" name="p_host_fk" value="{host}"/>
                                          <input type="hidden" name="p_host_fk_desc" value="{host_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="host/@visible = 'false'">
                                        <input type="hidden" name="p_host_fk" value="{host}"/>
                                        <input type="hidden" name="p_host_fk_desc" value="{host_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="server">
                                      <xsl:if test="not(server/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="server_desc"/>
                                          <input type="hidden" name="p_server_fk" value="{server}"/>
                                          <input type="hidden" name="p_server_fk_desc" value="{server_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="server/@visible = 'false'">
                                        <input type="hidden" name="p_server_fk" value="{server}"/>
                                        <input type="hidden" name="p_server_fk_desc" value="{server_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="biztalk">
                                      <xsl:if test="not(biztalk/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="biztalk_desc"/>
                                          <input type="hidden" name="p_biztalk_fk" value="{biztalk}"/>
                                          <input type="hidden" name="p_biztalk_fk_desc" value="{biztalk_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="biztalk/@visible = 'false'">
                                        <input type="hidden" name="p_biztalk_fk" value="{biztalk}"/>
                                        <input type="hidden" name="p_biztalk_fk_desc" value="{biztalk_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_itens_contrato_del" rel="itens_contrato" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_itens_contrato_edit" rel="itens_contrato" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_itens_contrato_id" value="{itens_contrato_id}"/>
                                    <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                    <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if><!-- INICIO SEPARADOR itens_contrato_sep--><xsl:if test="rows/content/form/label/itens_contrato_sep">
                      <xsl:if test="rows/content/form/label/itens_contrato_sep">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/itens_contrato_sep"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/servico_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/servico_sep"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/servico_sep/@name}" value="{rows/content/form/value/servico_sep}" class="LOOKUP required" maxlength="300">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/servico_sep"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/servico_sep/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/servico_sep"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id_servico_sep"/>
                    <xsl:if test="rows/content/form/label/tipo_consumo_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/tipo_consumo_sep"/>
                        </span>
                        <select name="{rows/content/form/list/tipo_consumo_sep/@name}" class="select required IGRP_change" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_consumo_sep"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/tipo_consumo_sep/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <a id="idp_tipo_consumo_sep"/>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_inicio_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/data_inicio_sep"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_inicio_sep/@name}" value="{rows/content/form/value/data_inicio_sep}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio_sep"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_fim_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/data_fim_sep"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_fim_sep/@name}" value="{rows/content/form/value/data_fim_sep}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_fim_sep"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/quota_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/quota_sep"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/quota_sep/@name}" value="{rows/content/form/value/quota_sep}" class="number required IGRP_change" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/quota_sep"/>
                          </xsl:call-template>
                        </input>
                        <a id="idp_quota_sep"/>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/saldo_sep">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/saldo_sep"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/saldo_sep/@name}" value="{rows/content/form/value/saldo_sep}" class="number required" readonly="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/saldo_sep"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado_sep">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/estado_sep"/>
                        </span>
                        <select name="{rows/content/form/list/estado_sep/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado_sep"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/estado_sep/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_base_user_sep">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/data_base_user_sep"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_base_user_sep/@name}" value="{rows/content/form/value/data_base_user_sep}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_base_user_sep"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/host_sep">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/host_sep"/>
                        </span>
                        <select name="{rows/content/form/list/host_sep/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/host_sep"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/host_sep/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/biztalk_sep">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/biztalk_sep"/>
                        </span>
                        <input type="checkbox" name="{rows/content/form/value/biztalk_sep/@name}" value="1" class="checkbox" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/biztalk_sep"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/biztalk_sep='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/server_sep">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/server_sep"/>
                        </span>
                        <select name="{rows/content/form/list/server_sep/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/server_sep"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/server_sep/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr/>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140425"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140425"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140425"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140425"/>
</xsl:stylesheet>
