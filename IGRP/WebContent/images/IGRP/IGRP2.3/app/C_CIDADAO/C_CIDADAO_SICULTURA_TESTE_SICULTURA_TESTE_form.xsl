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
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/documento">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/documento"/>
                        </span>
                        <select name="{rows/content/form/list/documento/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/documento"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/documento/option">
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
                    <xsl:if test="rows/content/form/label/numero_doc">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/numero_doc"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/numero_doc/@name}" value="{rows/content/form/value/numero_doc}" class="number required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/numero_doc"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nome_artistico">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/nome_artistico"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome_artistico/@name}" value="{rows/content/form/value/nome_artistico}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_artistico"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_nascimento">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/data_nascimento"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_nascimento/@name}" value="{rows/content/form/value/data_nascimento}" class="date IGRP_datepicker required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_nascimento"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nacionalidade">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/nacionalidade"/>
                        </span>
                        <select name="{rows/content/form/list/nacionalidade/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nacionalidade"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/nacionalidade/option">
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
                    <xsl:if test="rows/content/form/label/sexo">
                      <label>
                        <span>(*)<xsl:value-of select="rows/content/form/label/sexo"/>
                        </span>
                        <select name="{rows/content/form/list/sexo/@name}" class="select required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/sexo"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/sexo/option">
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
                    <xsl:if test="rows/content/form/label/nib">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nib"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/nib/@name}" value="{rows/content/form/value/nib}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nib"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/nif">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nif"/>
                        </span>
                        <input type="LOOKUP_NIF" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}" class="LOOKUP_NIF" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nif"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/nif/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nif"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/mae">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/mae"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/mae/@name}" value="{rows/content/form/value/mae}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/mae"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/pai">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/pai"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/pai/@name}" value="{rows/content/form/value/pai}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/pai"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR informacoes_contacto--><xsl:if test="rows/content/form/label/informacoes_contacto">
                      <xsl:if test="rows/content/form/label/informacoes_contacto">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/informacoes_contacto"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/morada">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/morada"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/morada"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/residencias">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/residencias"/>
                        </span>
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/residencias/@name}" value="{rows/content/form/value/residencias}" class="LOOKUP_GEOG" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/residencias"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/residencias/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/residencias"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/email">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/email"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/email"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/telef_movel">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/telef_movel"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/telef_movel/@name}" value="{rows/content/form/value/telef_movel}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telef_movel"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/telef_fixo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/telef_fixo"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/telef_fixo/@name}" value="{rows/content/form/value/telef_fixo}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telef_fixo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/web">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/web"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/web/@name}" value="{rows/content/form/value/web}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/web"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/fax">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/fax"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/fax/@name}" value="{rows/content/form/value/fax}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/fax"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/cx__postal">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/cx__postal"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/cx__postal/@name}" value="{rows/content/form/value/cx__postal}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cx__postal"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR informacoes_artisticas--><xsl:if test="rows/content/form/label/informacoes_artisticas">
                      <xsl:if test="rows/content/form/label/informacoes_artisticas">
                        <div rel="informacoes_artisticas">
                          <div class="informacoes_artisticas">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/informacoes_artisticas"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'informacoes_artisticas'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/actividade">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/actividade"/>
                              </span>
                              <select name="{rows/content/form/list/actividade/@name}" class="select required" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/actividade"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/actividade/option">
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
                          <xsl:if test="rows/content/form/label/genero_artistico">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/genero_artistico"/>
                              </span>
                              <select name="{rows/content/form/list/genero_artistico/@name}" class="select" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/genero_artistico"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/genero_artistico/option">
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
                          <xsl:if test="rows/content/form/label/sub_genero">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/sub_genero"/>
                              </span>
                              <select name="{rows/content/form/list/sub_genero/@name}" class="select" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/sub_genero"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/sub_genero/option">
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
                          <xsl:if test="rows/content/form/label/tipo_actuacao">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/tipo_actuacao"/>
                              </span>
                              <select name="{rows/content/form/list/tipo_actuacao/@name}" class="select" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo_actuacao"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tipo_actuacao/option">
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
                          <xsl:if test="rows/content/form/label/tempo_actividade">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/tempo_actividade"/>
                              </span>
                              <select name="{rows/content/form/list/tempo_actividade/@name}" class="select" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tempo_actividade"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tempo_actividade/option">
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
                          <xsl:if test="rows/content/form/label/periodo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/periodo"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/periodo/@name}" value="{rows/content/form/value/periodo}" class="text" maxlength="30" rel="F_informacoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/periodo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_informacoes_artisticas">
                            <table rel="T_informacoes_artisticas">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/actividade">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/actividade/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/actividade"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/genero_artistico">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/genero_artistico/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/genero_artistico"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/sub_genero">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/sub_genero/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/sub_genero"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/tipo_actuacao">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/tipo_actuacao/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/tipo_actuacao"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/tempo_actividade">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/tempo_actividade/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/tempo_actividade"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informacoes_artisticas/label/periodo">
                                    <xsl:if test="not(rows/content/form/table/informacoes_artisticas/label/periodo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informacoes_artisticas/label/periodo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/informacoes_artisticas/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="actividade">
                                      <xsl:if test="not(actividade/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="actividade_desc"/>
                                          <input type="hidden" name="p_actividade_fk" value="{actividade}"/>
                                          <input type="hidden" name="p_actividade_fk_desc" value="{actividade_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="actividade/@visible = 'false'">
                                        <input type="hidden" name="p_actividade_fk" value="{actividade}"/>
                                        <input type="hidden" name="p_actividade_fk_desc" value="{actividade_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="genero_artistico">
                                      <xsl:if test="not(genero_artistico/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="genero_artistico_desc"/>
                                          <input type="hidden" name="p_genero_artistico_fk" value="{genero_artistico}"/>
                                          <input type="hidden" name="p_genero_artistico_fk_desc" value="{genero_artistico_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="genero_artistico/@visible = 'false'">
                                        <input type="hidden" name="p_genero_artistico_fk" value="{genero_artistico}"/>
                                        <input type="hidden" name="p_genero_artistico_fk_desc" value="{genero_artistico_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="sub_genero">
                                      <xsl:if test="not(sub_genero/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="sub_genero_desc"/>
                                          <input type="hidden" name="p_sub_genero_fk" value="{sub_genero}"/>
                                          <input type="hidden" name="p_sub_genero_fk_desc" value="{sub_genero_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="sub_genero/@visible = 'false'">
                                        <input type="hidden" name="p_sub_genero_fk" value="{sub_genero}"/>
                                        <input type="hidden" name="p_sub_genero_fk_desc" value="{sub_genero_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="tipo_actuacao">
                                      <xsl:if test="not(tipo_actuacao/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tipo_actuacao_desc"/>
                                          <input type="hidden" name="p_tipo_actuacao_fk" value="{tipo_actuacao}"/>
                                          <input type="hidden" name="p_tipo_actuacao_fk_desc" value="{tipo_actuacao_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tipo_actuacao/@visible = 'false'">
                                        <input type="hidden" name="p_tipo_actuacao_fk" value="{tipo_actuacao}"/>
                                        <input type="hidden" name="p_tipo_actuacao_fk_desc" value="{tipo_actuacao_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="tempo_actividade">
                                      <xsl:if test="not(tempo_actividade/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tempo_actividade_desc"/>
                                          <input type="hidden" name="p_tempo_actividade_fk" value="{tempo_actividade}"/>
                                          <input type="hidden" name="p_tempo_actividade_fk_desc" value="{tempo_actividade_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tempo_actividade/@visible = 'false'">
                                        <input type="hidden" name="p_tempo_actividade_fk" value="{tempo_actividade}"/>
                                        <input type="hidden" name="p_tempo_actividade_fk_desc" value="{tempo_actividade_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="periodo">
                                      <xsl:if test="not(periodo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="periodo_desc"/>
                                          <input type="hidden" name="p_periodo_fk" value="{periodo}"/>
                                          <input type="hidden" name="p_periodo_fk_desc" value="{periodo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="periodo/@visible = 'false'">
                                        <input type="hidden" name="p_periodo_fk" value="{periodo}"/>
                                        <input type="hidden" name="p_periodo_fk_desc" value="{periodo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_informacoes_artisticas_del" rel="informacoes_artisticas" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_informacoes_artisticas_edit" rel="informacoes_artisticas" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_informacoes_artisticas_id" value="{informacoes_artisticas_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if><!-- INICIO SEPARADOR publicacoes--><xsl:if test="rows/content/form/label/publicacoes">
                      <xsl:if test="rows/content/form/label/publicacoes">
                        <div rel="publicacoes">
                          <div class="publicacoes">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/publicacoes"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'publicacoes'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/tipo_publicacao">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/tipo_publicacao"/>
                              </span>
                              <select name="{rows/content/form/list/tipo_publicacao/@name}" class="select" maxlength="30" rel="F_publicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo_publicacao"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tipo_publicacao/option">
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
                          <xsl:if test="rows/content/form/label/titulo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/titulo"/>
                              </span>
                              <input type="text" name="{rows/content/form/value/titulo/@name}" value="{rows/content/form/value/titulo}" class="text" maxlength="30" rel="F_publicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/descricao">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/descricao"/>
                              </span>
                              <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" maxlength="30" rel="F_publicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                                </xsl:call-template>
                                <xsl:value-of select="rows/content/form/value/descricao"/>
                              </textarea>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/anexo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/anexo"/>
                              </span>
                              <input type="file" name="{rows/content/form/value/anexo/@name}" value="{rows/content/form/value/anexo}" class="file" maxlength="30" rel="F_publicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/anexo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/publicacao">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/publicacao"/>
                              </span>
                              <select name="{rows/content/form/list/publicacao/@name}" class="select" maxlength="30" rel="F_publicacoes">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/publicacao"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/publicacao/option">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_publicacoes">
                            <table rel="T_publicacoes">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/publicacoes/label/tipo_publicacao">
                                    <xsl:if test="not(rows/content/form/table/publicacoes/label/tipo_publicacao/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/publicacoes/label/tipo_publicacao"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/publicacoes/label/titulo">
                                    <xsl:if test="not(rows/content/form/table/publicacoes/label/titulo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/publicacoes/label/titulo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/publicacoes/label/descricao">
                                    <xsl:if test="not(rows/content/form/table/publicacoes/label/descricao/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/publicacoes/label/descricao"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/publicacoes/label/anexo">
                                    <xsl:if test="not(rows/content/form/table/publicacoes/label/anexo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/publicacoes/label/anexo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/publicacoes/label/publicacao">
                                    <xsl:if test="not(rows/content/form/table/publicacoes/label/publicacao/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/publicacoes/label/publicacao"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/publicacoes/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="tipo_publicacao">
                                      <xsl:if test="not(tipo_publicacao/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tipo_publicacao_desc"/>
                                          <input type="hidden" name="p_tipo_publicacao_fk" value="{tipo_publicacao}"/>
                                          <input type="hidden" name="p_tipo_publicacao_fk_desc" value="{tipo_publicacao_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tipo_publicacao/@visible = 'false'">
                                        <input type="hidden" name="p_tipo_publicacao_fk" value="{tipo_publicacao}"/>
                                        <input type="hidden" name="p_tipo_publicacao_fk_desc" value="{tipo_publicacao_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="titulo">
                                      <xsl:if test="not(titulo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="titulo_desc"/>
                                          <input type="hidden" name="p_titulo_fk" value="{titulo}"/>
                                          <input type="hidden" name="p_titulo_fk_desc" value="{titulo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="titulo/@visible = 'false'">
                                        <input type="hidden" name="p_titulo_fk" value="{titulo}"/>
                                        <input type="hidden" name="p_titulo_fk_desc" value="{titulo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="descricao">
                                      <xsl:if test="not(descricao/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="descricao_desc"/>
                                          <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                          <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="descricao/@visible = 'false'">
                                        <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                        <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="anexo">
                                      <xsl:if test="not(anexo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:choose>
                                            <xsl:when test="anexo != ''">
                                              <a href="{anexo}" class="_blank2" name="anexo">
                                                <xsl:value-of select="anexo_desc"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="anexo_desc"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                          <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                          <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="anexo/@visible = 'false'">
                                        <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                        <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="publicacao">
                                      <xsl:if test="not(publicacao/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="publicacao_desc"/>
                                          <input type="hidden" name="p_publicacao_fk" value="{publicacao}"/>
                                          <input type="hidden" name="p_publicacao_fk_desc" value="{publicacao_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="publicacao/@visible = 'false'">
                                        <input type="hidden" name="p_publicacao_fk" value="{publicacao}"/>
                                        <input type="hidden" name="p_publicacao_fk_desc" value="{publicacao_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_publicacoes_del" rel="publicacoes" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_publicacoes_edit" rel="publicacoes" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_publicacoes_id" value="{publicacoes_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if><!-- INICIO SEPARADOR documento_comprovativo--><xsl:if test="rows/content/form/label/documento_comprovativo">
                      <xsl:if test="rows/content/form/label/documento_comprovativo">
                        <div rel="documento_comprovativo">
                          <div class="documento_comprovativo">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/documento_comprovativo"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'documento_comprovativo'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/tipo_documento">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/tipo_documento"/>
                              </span>
                              <select name="{rows/content/form/list/tipo_documento/@name}" class="select" maxlength="30" rel="F_documento_comprovativo">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo_documento"/>
                                </xsl:call-template>
                                <xsl:for-each select="rows/content/form/list/tipo_documento/option">
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
                          <xsl:if test="rows/content/form/label/anexo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/anexo"/>
                              </span>
                              <input type="file" name="{rows/content/form/value/anexo/@name}" value="{rows/content/form/value/anexo}" class="file" maxlength="30" rel="F_documento_comprovativo">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/anexo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if>
                          <xsl:if test="rows/content/form/label/titulo">
                            <label>
                              <span>
                                <xsl:value-of select="rows/content/form/label/titulo"/>
                              </span>
                              <textarea name="{rows/content/form/value/titulo/@name}" class="textarea" maxlength="30" rel="F_documento_comprovativo">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
                                </xsl:call-template>
                                <xsl:value-of select="rows/content/form/value/titulo"/>
                              </textarea>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_documento_comprovativo">
                            <table rel="T_documento_comprovativo">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/documento_comprovativo/label/tipo_documento">
                                    <xsl:if test="not(rows/content/form/table/documento_comprovativo/label/tipo_documento/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/documento_comprovativo/label/tipo_documento"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/documento_comprovativo/label/anexo">
                                    <xsl:if test="not(rows/content/form/table/documento_comprovativo/label/anexo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/documento_comprovativo/label/anexo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/documento_comprovativo/label/titulo">
                                    <xsl:if test="not(rows/content/form/table/documento_comprovativo/label/titulo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/documento_comprovativo/label/titulo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/documento_comprovativo/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
                                    <xsl:if test="tipo_documento">
                                      <xsl:if test="not(tipo_documento/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="tipo_documento_desc"/>
                                          <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                          <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="tipo_documento/@visible = 'false'">
                                        <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                        <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="anexo">
                                      <xsl:if test="not(anexo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:choose>
                                            <xsl:when test="anexo != ''">
                                              <a href="{anexo}" class="_blank2" name="anexo">
                                                <xsl:value-of select="anexo_desc"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <xsl:value-of select="anexo_desc"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                          <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                          <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="anexo/@visible = 'false'">
                                        <input type="hidden" name="p_anexo_fk" value="{anexo}"/>
                                        <input type="hidden" name="p_anexo_fk_desc" value="{anexo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="titulo">
                                      <xsl:if test="not(titulo/@visible)">
                                        <td class="table_row{$pos}">
                                          <xsl:value-of select="titulo_desc"/>
                                          <input type="hidden" name="p_titulo_fk" value="{titulo}"/>
                                          <input type="hidden" name="p_titulo_fk_desc" value="{titulo_desc}"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="titulo/@visible = 'false'">
                                        <input type="hidden" name="p_titulo_fk" value="{titulo}"/>
                                        <input type="hidden" name="p_titulo_fk_desc" value="{titulo_desc}"/>
                                      </xsl:if>
                                    </xsl:if>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@nodelete)">
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_documento_comprovativo_del" rel="documento_comprovativo" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_documento_comprovativo_edit" rel="documento_comprovativo" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_documento_comprovativo_id" value="{documento_comprovativo_id}"/>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div><!-- END TABELA LIST--></div>
                      </xsl:if>
                    </xsl:if><!-- INICIO SEPARADOR declaracao_publicacao_inform--><xsl:if test="rows/content/form/label/declaracao_publicacao_inform">
                      <xsl:if test="rows/content/form/label/declaracao_publicacao_inform">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/declaracao_publicacao_inform"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/publicar_informacao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/publicar_informacao"/>
                        </span>
                        <xsl:for-each select="rows/content/form/list/publicar_informacao/option">
                          <input type="radio" name="{../@name}" value="{value}" class="radiolist" maxlength="30">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="../../../label/publicar_informacao"/>
                            </xsl:call-template>
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="text"/>
                          <br/>
                        </xsl:for-each>
                      </label>
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140508"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140508"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140508"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140508"/>
</xsl:stylesheet>
