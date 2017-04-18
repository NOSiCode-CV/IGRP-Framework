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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FORM--><div class="box-content"><!-- INICIO SEPARADOR ilha--><xsl:if test="rows/content/form/label/ilha">
                      <xsl:if test="rows/content/form/label/ilha">
                        <xsl:call-template name="page-title">
                          <xsl:with-param name="title" select="rows/content/form/label/ilha"/>
                          <xsl:with-param name="class" select="'subtitle'"/>
                        </xsl:call-template>
                      </xsl:if>
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
                    <xsl:if test="rows/content/form/label/nome_artistico">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nome_artistico"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome_artistico/@name}" value="{rows/content/form/value/nome_artistico}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_artistico"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_nascimento">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/data_nascimento"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_nascimento/@name}" value="{rows/content/form/value/data_nascimento}" class="date IGRP_datepicker" maxlength="30">
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
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/nacionalidade/@name}" value="{rows/content/form/value/nacionalidade}" class="LOOKUP_GEOG required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nacionalidade"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/nacionalidade/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nacionalidade"/>
                        </xsl:call-template>
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
                    <xsl:if test="rows/content/form/label/residencia">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/residencia"/>
                        </span>
                        <input type="LOOKUP_GEOG" name="{rows/content/form/value/residencia/@name}" value="{rows/content/form/value/residencia}" class="LOOKUP_GEOG" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/residencia"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="'LOOKUP'"/>
                          <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/residencia/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/residencia"/>
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
                    <xsl:if test="rows/content/form/label/telf_mov">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/telf_mov"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/telf_mov/@name}" value="{rows/content/form/value/telf_mov}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telf_mov"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/telf_fixo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/telf_fixo"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/telf_fixo/@name}" value="{rows/content/form/value/telf_fixo}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telf_fixo"/>
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
                    </xsl:if><!-- INICIO SEPARADOR informaoes_artisticas--><xsl:if test="rows/content/form/label/informaoes_artisticas">
                      <xsl:if test="rows/content/form/label/informaoes_artisticas">
                        <div rel="informaoes_artisticas">
                          <div class="informaoes_artisticas">
                            <xsl:call-template name="page-title">
                              <xsl:with-param name="title" select="rows/content/form/label/informaoes_artisticas"/>
                              <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                          </div>
                          <xsl:call-template name="tools-bar-form-group">
                            <xsl:with-param name="rel" select="'informaoes_artisticas'"/>
                            <xsl:with-param name="class" select="'IGRP_addRow'"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/label/actividade">
                            <label>
                              <span>(*)<xsl:value-of select="rows/content/form/label/actividade"/>
                              </span>
                              <select name="{rows/content/form/list/actividade/@name}" class="select required" maxlength="30" rel="F_informaoes_artisticas">
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
                              <select name="{rows/content/form/list/genero_artistico/@name}" class="select" maxlength="30" rel="F_informaoes_artisticas">
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
                              <select name="{rows/content/form/list/sub_genero/@name}" class="select" maxlength="30" rel="F_informaoes_artisticas">
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
                              <select name="{rows/content/form/list/tipo_actuacao/@name}" class="select" maxlength="30" rel="F_informaoes_artisticas">
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
                              <select name="{rows/content/form/list/tempo_actividade/@name}" class="select" maxlength="30" rel="F_informaoes_artisticas">
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
                              <input type="text" name="{rows/content/form/value/periodo/@name}" value="{rows/content/form/value/periodo}" class="text" maxlength="30" rel="F_informaoes_artisticas">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/periodo"/>
                                </xsl:call-template>
                              </input>
                            </label>
                          </xsl:if><!-- START TABELA LIST--><div class="simple-table" rel="DIV_informaoes_artisticas">
                            <table rel="T_informaoes_artisticas">
                              <thead>
                                <tr>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/actividade">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/actividade/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/actividade"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/genero_artistico">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/genero_artistico/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/genero_artistico"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/sub_genero">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/sub_genero/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/sub_genero"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/tipo_actuacao">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/tipo_actuacao/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/tipo_actuacao"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/tempo_actividade">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/tempo_actividade/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/tempo_actividade"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/table/informaoes_artisticas/label/periodo">
                                    <xsl:if test="not(rows/content/form/table/informaoes_artisticas/label/periodo/@visible)">
                                      <th>
                                        <xsl:value-of select="rows/content/form/table/informaoes_artisticas/label/periodo"/>
                                      </th>
                                    </xsl:if>
                                  </xsl:if>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/informaoes_artisticas/value/row[not(@total='yes')]">
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
                                        <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_informaoes_artisticas_del" rel="informaoes_artisticas" class="IGRP_delRow"/>
                                      </xsl:if>
                                    </td>
                                    <td align="center" width="10">
                                      <xsl:if test="not(@noupdate)">
                                        <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_informaoes_artisticas_edit" rel="informaoes_artisticas" class="IGRP_editRow"/>
                                      </xsl:if>
                                    </td>
                                    <input type="hidden" name="p_informaoes_artisticas_id" value="{informaoes_artisticas_id}"/>
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
                          </xsl:call-template><!-- START TABELA LIST--><div class="simple-table" rel="DIV_publicacoes">
                            <table rel="T_publicacoes">
                              <thead>
                                <tr>
                                  <th align="center" width="10"/>
                                  <th align="center" width="10"/>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/form/table/publicacoes/value/row[not(@total='yes')]">
                                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                  <tr>
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
                    </xsl:if>
                  </div><!-- END FORM--></form><!-- END YOUR CODE HERE --></div>
            </div><!-- START HOME BOTTOM --><xsl:call-template name="home-side"/>
          </div>
        </div><!--HOME-FOOTER--></body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140502"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140502"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140502"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140502"/>
</xsl:stylesheet>
