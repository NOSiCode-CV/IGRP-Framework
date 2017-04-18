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
                    <xsl:if test="rows/content/form/label/cliente">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/cliente"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="LOOKUP required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/cliente/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/cliente"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/id_cliente"/>
                    <xsl:if test="rows/content/form/label/codigo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/codigo"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/dt_inicio">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/dt_inicio"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/dt_inicio/@name}" value="{rows/content/form/value/dt_inicio}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_inicio"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/dt_fim">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/dt_fim"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/dt_fim/@name}" value="{rows/content/form/value/dt_fim}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/dt_fim"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/notas">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/notas"/>
                        </span>
                        <textarea name="{rows/content/form/value/notas/@name}" class="textarea" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/notas"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/notas"/>
                        </textarea>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR itens--><xsl:if test="rows/content/form/label/itens">
                      <xsl:if test="rows/content/form/label/itens">
                        <div rel="itens">
                          <div id="itens">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/itens"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'itens'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/servico">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/servico"/>
                              </span>
                              <input type="LOOKUP" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="LOOKUP" maxlength="30" rel="F_itens">
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
                          <xsl:if test="rows/content/form/label/tp_consumo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/tp_consumo"/>
                              </span>
                              <select name="{rows/content/form/list/tp_consumo/@name}" class="selectchange IGRP_change" maxlength="30" rel="F_itens">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tp_consumo"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tp_consumo/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                              <a id="idp_tp_consumo"/>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/dt_inicio_item">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/dt_inicio_item"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/dt_inicio_item/@name}" value="{rows/content/form/value/dt_inicio_item}" class="date IGRP_datepicker" maxlength="30" rel="F_itens">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/dt_inicio_item"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/dt_fim_item">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/dt_fim_item"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/dt_fim_item/@name}" value="{rows/content/form/value/dt_fim_item}" class="date IGRP_datepicker" maxlength="30" rel="F_itens">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/dt_fim_item"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/quota">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/quota"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/quota/@name}" value="{rows/content/form/value/quota}" class="text" maxlength="30" rel="F_itens">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/quota"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/saldo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/saldo"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/saldo/@name}" value="{rows/content/form/value/saldo}" class="text" readonly="readonly" maxlength="30" rel="F_itens">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/saldo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_itens">
                            <table rel="T_itens">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/itens/label/servico">
                                    <xsl:if test="not(rows/content/form/table/itens/label/servico/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/servico"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens/label/tp_consumo">
                                    <xsl:if test="not(rows/content/form/table/itens/label/tp_consumo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/tp_consumo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens/label/dt_inicio_item">
                                    <xsl:if test="not(rows/content/form/table/itens/label/dt_inicio_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/dt_inicio_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens/label/dt_fim_item">
                                    <xsl:if test="not(rows/content/form/table/itens/label/dt_fim_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/dt_fim_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens/label/quota">
                                    <xsl:if test="not(rows/content/form/table/itens/label/quota/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/quota"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens/label/saldo">
                                    <xsl:if test="not(rows/content/form/table/itens/label/saldo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens/label/saldo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/itens/value/row[not(@total='yes')]">
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
                                    <xsl:if test="tp_consumo">
                                      <xsl:if test="not(tp_consumo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tp_consumo_desc"/>
                                          <input type="hidden" name="p_tp_consumo_fk" value="{tp_consumo}"/>
                                          <input type="hidden" name="p_tp_consumo_fk_desc" value="{tp_consumo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tp_consumo/@visible = 'false'">
                                        <input type="hidden" name="p_tp_consumo_fk" value="{tp_consumo}"/>
                                        <input type="hidden" name="p_tp_consumo_fk_desc" value="{tp_consumo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="dt_inicio_item">
                                      <xsl:if test="not(dt_inicio_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="dt_inicio_item_desc"/>
                                          <input type="hidden" name="p_dt_inicio_item_fk" value="{dt_inicio_item}"/>
                                          <input type="hidden" name="p_dt_inicio_item_fk_desc" value="{dt_inicio_item_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="dt_inicio_item/@visible = 'false'">
                                        <input type="hidden" name="p_dt_inicio_item_fk" value="{dt_inicio_item}"/>
                                        <input type="hidden" name="p_dt_inicio_item_fk_desc" value="{dt_inicio_item_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="dt_fim_item">
                                      <xsl:if test="not(dt_fim_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="dt_fim_item_desc"/>
                                          <input type="hidden" name="p_dt_fim_item_fk" value="{dt_fim_item}"/>
                                          <input type="hidden" name="p_dt_fim_item_fk_desc" value="{dt_fim_item_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="dt_fim_item/@visible = 'false'">
                                        <input type="hidden" name="p_dt_fim_item_fk" value="{dt_fim_item}"/>
                                        <input type="hidden" name="p_dt_fim_item_fk_desc" value="{dt_fim_item_desc}"/>
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
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" rel="itens" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" rel="itens" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_itens_id" value="{itens_id}"/>
                                    <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                    <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if><!-- INICIO SEPARADOR itens_contrato--><xsl:if test="rows/content/form/label/itens_contrato">
                      <xsl:if test="rows/content/form/label/itens_contrato">
                        <div rel="itens_contrato">
                          <div id="itens_contrato">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/itens_contrato"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div><!-- START TABELA LIST--><div class="simple-table" rel="DIV_itens_contrato">
                            <table rel="T_itens_contrato">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/servico_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/servico_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/servico_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/tipo_consumo_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/tipo_consumo_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/tipo_consumo_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/data_inicio_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/data_inicio_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/data_inicio_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/data_fim_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/data_fim_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/data_fim_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/quota_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/quota_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/quota_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/saldo_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/saldo_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/saldo_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/itens_contrato/label/estado_item">
                                    <xsl:if test="not(rows/content/form/table/itens_contrato/label/estado_item/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/itens_contrato/label/estado_item"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/itens_contrato/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="servico_item">
                                      <xsl:if test="not(servico_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="servico_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="tipo_consumo_item">
                                      <xsl:if test="not(tipo_consumo_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tipo_consumo_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="data_inicio_item">
                                      <xsl:if test="not(data_inicio_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="data_inicio_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="data_fim_item">
                                      <xsl:if test="not(data_fim_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="data_fim_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="quota_item">
                                      <xsl:if test="not(quota_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="quota_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="saldo_item">
                                      <xsl:if test="not(saldo_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="saldo_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="estado_item">
                                      <xsl:if test="not(estado_item/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="estado_item"/>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <input type="hidden" name="p_itens_contrato_id" value="{itens_contrato_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if>
                  </div><!-- END FORM--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr/>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140203"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140203"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140203"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140203"/>
</xsl:stylesheet>
