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
                    <xsl:if test="rows/content/form/label/nome">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
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
                    <xsl:if test="rows/content/form/label/descricao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/descricao"/>
                        </span>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="400">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao"/>
                        </textarea>
                      </label>
                    </xsl:if>
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
                    <xsl:if test="rows/content/form/label/estado">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/estado"/>
                        </span>
                        <select name="{rows/content/form/list/estado/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/estado/option">
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
                    <xsl:if test="rows/content/form/label/flg_pagamento">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/flg_pagamento"/>
                        </span>
                        <select name="{rows/content/form/list/flg_pagamento/@name}" class="select required" maxlength="1">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/flg_pagamento"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/flg_pagamento/option">
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
                    <xsl:if test="rows/content/form/label/tipo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/tipo"/>
                        </span>
                        <select name="{rows/content/form/list/tipo/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/tipo/option">
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
                    <xsl:if test="rows/content/form/label/data_ini">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/data_ini"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_ini/@name}" value="{rows/content/form/value/data_ini}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_ini"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_fim">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/data_fim"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/categoria">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/categoria"/>
                        </span>
                        <select name="{rows/content/form/list/categoria/@name}" class="select" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/categoria"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/categoria/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR adiciona_servicos--><xsl:if test="rows/content/form/label/adiciona_servicos">
                      <div rel="adiciona_servicos" name="sep_adiciona_servicos">
                        <div class="adiciona_servicos">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/adiciona_servicos"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div>
                        <xsl:call-template name="tools-bar-form-group">
                          <xsl:with-param name="rel" select="'adiciona_servicos'"/>
                          <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        </xsl:call-template>
                        <xsl:if test="rows/content/form/label/servico">
                          <label>
                            <span>
                              <xsl:value-of select="rows/content/form/label/servico"/>
                            </span>
                            <input type="LOOKUP" name="{rows/content/form/value/servico/@name}" value="{rows/content/form/value/servico}" class="LOOKUP" readonly="readonly" Tread="readonly" maxlength="200" rel="F_adiciona_servicos">
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
                        <xsl:if test="rows/content/form/label/cod_servico">
                          <label>
                            <span>
                              <xsl:value-of select="rows/content/form/label/cod_servico"/>
                            </span>
                            <input type="text" name="{rows/content/form/value/cod_servico/@name}" value="{rows/content/form/value/cod_servico}" class="text" readonly="readonly" Tread="readonly" maxlength="50" rel="F_adiciona_servicos">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/cod_servico"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/bd_user">
                          <label>
                            <span>(*)<xsl:value-of select="rows/content/form/label/bd_user"/>
                            </span>
                            <input type="text" name="{rows/content/form/value/bd_user/@name}" value="{rows/content/form/value/bd_user}" class="text required" maxlength="100" rel="F_adiciona_servicos">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/bd_user"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/id_host">
                          <label>
                            <span>(*)<xsl:value-of select="rows/content/form/label/id_host"/>
                            </span>
                            <select name="{rows/content/form/list/id_host/@name}" class="select required" maxlength="20" rel="F_adiciona_servicos">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/id_host"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/id_host/option">
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
                        <xsl:if test="rows/content/form/label/id_server">
                          <label>
                            <span>(*)<xsl:value-of select="rows/content/form/label/id_server"/>
                            </span>
                            <select name="{rows/content/form/list/id_server/@name}" class="select required" maxlength="20" rel="F_adiciona_servicos">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/id_server"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/id_server/option">
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
                            <select name="{rows/content/form/list/biztalk/@name}" class="select" maxlength="20" rel="F_adiciona_servicos">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/biztalk"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/biztalk/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="text"/>
                                </option>
                              </xsl:for-each>
                            </select>
                          </label>
                        </xsl:if><!-- START TABELA LIST--><div class="simple-table table-responsive" rel="DIV_adiciona_servicos">
                          <table rel="T_adiciona_servicos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/servico">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/servico/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/servico"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/cod_servico">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/cod_servico/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/cod_servico"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/bd_user">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/bd_user/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/bd_user"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/id_host">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/id_host/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/id_host"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/id_server">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/id_server/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/id_server"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/adiciona_servicos/label/biztalk">
                                  <xsl:if test="not(rows/content/form/table/adiciona_servicos/label/biztalk/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/adiciona_servicos/label/biztalk"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th align="center" width="10"/>
                                <th align="center" width="10"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/adiciona_servicos/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="servico">
                                    <xsl:if test="not(servico/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/servico}">
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
                                  <xsl:if test="cod_servico">
                                    <xsl:if test="not(cod_servico/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/cod_servico}">
                                        <xsl:value-of select="cod_servico_desc"/>
                                        <input type="hidden" name="p_cod_servico_fk" value="{cod_servico}"/>
                                        <input type="hidden" name="p_cod_servico_fk_desc" value="{cod_servico_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="cod_servico/@visible = 'false'">
                                      <input type="hidden" name="p_cod_servico_fk" value="{cod_servico}"/>
                                      <input type="hidden" name="p_cod_servico_fk_desc" value="{cod_servico_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="bd_user">
                                    <xsl:if test="not(bd_user/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/bd_user}">
                                        <xsl:value-of select="bd_user_desc"/>
                                        <input type="hidden" name="p_bd_user_fk" value="{bd_user}"/>
                                        <input type="hidden" name="p_bd_user_fk_desc" value="{bd_user_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="bd_user/@visible = 'false'">
                                      <input type="hidden" name="p_bd_user_fk" value="{bd_user}"/>
                                      <input type="hidden" name="p_bd_user_fk_desc" value="{bd_user_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="id_host">
                                    <xsl:if test="not(id_host/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/id_host}">
                                        <xsl:value-of select="id_host_desc"/>
                                        <input type="hidden" name="p_id_host_fk" value="{id_host}"/>
                                        <input type="hidden" name="p_id_host_fk_desc" value="{id_host_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_host/@visible = 'false'">
                                      <input type="hidden" name="p_id_host_fk" value="{id_host}"/>
                                      <input type="hidden" name="p_id_host_fk_desc" value="{id_host_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="id_server">
                                    <xsl:if test="not(id_server/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/id_server}">
                                        <xsl:value-of select="id_server_desc"/>
                                        <input type="hidden" name="p_id_server_fk" value="{id_server}"/>
                                        <input type="hidden" name="p_id_server_fk_desc" value="{id_server_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_server/@visible = 'false'">
                                      <input type="hidden" name="p_id_server_fk" value="{id_server}"/>
                                      <input type="hidden" name="p_id_server_fk_desc" value="{id_server_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="biztalk">
                                    <xsl:if test="not(biztalk/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/biztalk}">
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
                                  <td align="center" width="10" data-title="Apagar">
                                    <xsl:if test="not(@nodelete)">
                                      <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_adiciona_servicos_del" rel="adiciona_servicos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <td align="center" width="10" data-title="Editar">
                                    <xsl:if test="not(@noupdate)">
                                      <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_adiciona_servicos_edit" rel="adiciona_servicos" class="IGRP_editRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_adiciona_servicos_id" value="{adiciona_servicos_id}"/>
                                  <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                  <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                    </xsl:if><!-- INICIO SEPARADOR lista_prod--><xsl:if test="rows/content/form/label/lista_prod">
                      <div rel="lista_prod" name="sep_lista_prod">
                        <div class="lista_prod">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/lista_prod"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div>
                        <xsl:call-template name="tools-bar-form-group">
                          <xsl:with-param name="rel" select="'lista_prod'"/>
                          <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        </xsl:call-template>
                        <xsl:if test="rows/content/form/label/produto">
                          <label>
                            <span>
                              <xsl:value-of select="rows/content/form/label/produto"/>
                            </span>
                            <input type="LOOKUP" name="{rows/content/form/value/produto/@name}" value="{rows/content/form/value/produto}" class="LOOKUP" maxlength="30" rel="F_lista_prod">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/produto"/>
                              </xsl:call-template>
                            </input>
                            <xsl:call-template name="lookup-tool">
                              <xsl:with-param name="page" select="rows/page"/>
                              <xsl:with-param name="ad_hoc" select="'1'"/>
                              <xsl:with-param name="action" select="'LOOKUP'"/>
                              <xsl:with-param name="name" select="rows/content/form/value/produto/@name"/>
                              <xsl:with-param name="js_lookup" select="rows/content/form/lookup/produto"/>
                            </xsl:call-template>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dono_produto">
                          <label>
                            <span>
                              <xsl:value-of select="rows/content/form/label/dono_produto"/>
                            </span>
                            <input type="text" name="{rows/content/form/value/dono_produto/@name}" value="{rows/content/form/value/dono_produto}" class="text" maxlength="300" rel="F_lista_prod">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/dono_produto"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if><!-- START TABELA LIST--><div class="simple-table table-responsive" rel="DIV_lista_prod">
                          <table rel="T_lista_prod">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/lista_prod/label/produto">
                                  <xsl:if test="not(rows/content/form/table/lista_prod/label/produto/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_prod/label/produto"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_prod/label/dono_produto">
                                  <xsl:if test="not(rows/content/form/table/lista_prod/label/dono_produto/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_prod/label/dono_produto"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th align="center" width="10"/>
                                <th align="center" width="10"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/lista_prod/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="produto">
                                    <xsl:if test="not(produto/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/produto}">
                                        <xsl:value-of select="produto_desc"/>
                                        <input type="hidden" name="p_produto_fk" value="{produto}"/>
                                        <input type="hidden" name="p_produto_fk_desc" value="{produto_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="produto/@visible = 'false'">
                                      <input type="hidden" name="p_produto_fk" value="{produto}"/>
                                      <input type="hidden" name="p_produto_fk_desc" value="{produto_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="dono_produto">
                                    <xsl:if test="not(dono_produto/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/dono_produto}">
                                        <xsl:value-of select="dono_produto_desc"/>
                                        <input type="hidden" name="p_dono_produto_fk" value="{dono_produto}"/>
                                        <input type="hidden" name="p_dono_produto_fk_desc" value="{dono_produto_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="dono_produto/@visible = 'false'">
                                      <input type="hidden" name="p_dono_produto_fk" value="{dono_produto}"/>
                                      <input type="hidden" name="p_dono_produto_fk_desc" value="{dono_produto_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td align="center" width="10" data-title="Apagar">
                                    <xsl:if test="not(@nodelete)">
                                      <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_lista_prod_del" rel="lista_prod" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <td align="center" width="10" data-title="Editar">
                                    <xsl:if test="not(@noupdate)">
                                      <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_lista_prod_edit" rel="lista_prod" class="IGRP_editRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_lista_prod_id" value="{lista_prod_id}"/>
                                  <input type="hidden" name="p_id_produto_fk" value="{id_produto}"/>
                                  <input type="hidden" name="p_id_produto_fk_desc" value="{id_produto_desc}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141231"/>
</xsl:stylesheet>
