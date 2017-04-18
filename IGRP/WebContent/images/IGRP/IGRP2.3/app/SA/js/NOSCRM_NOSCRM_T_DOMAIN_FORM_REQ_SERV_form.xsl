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
                    <xsl:if test="rows/content/form/label/rv_value">
                      <label class="text">
                        <span>(*)<xsl:value-of select="rows/content/form/label/rv_value"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/rv_value/@name}" value="{rows/content/form/value/rv_value}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rv_value"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/rv_meaning">
                      <label class="textarea_m">
                        <span>(*)<xsl:value-of select="rows/content/form/label/rv_meaning"/>
                        </span>
                        <textarea name="{rows/content/form/value/rv_meaning/@name}" class="textarea_m required" maxlength="3000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rv_meaning"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/rv_meaning"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/ordem">
                      <label class="number">
                        <span>
                          <xsl:value-of select="rows/content/form/label/ordem"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/ordem/@name}" value="{rows/content/form/value/ordem}" class="number" maxlength="9">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/ordem"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!-- INICIO SEPARADOR associar_unidade--><xsl:if test="rows/content/form/label/associar_unidade">
                      <div rel="associar_unidade" name="sep_associar_unidade">
                        <div class="associar_unidade">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/associar_unidade"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div>
                        <xsl:call-template name="tools-bar-form-group">
                          <xsl:with-param name="rel" select="'associar_unidade'"/>
                          <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        </xsl:call-template>
                        <xsl:if test="rows/content/form/label/unidade_ls">
                          <label class="select">
                            <span>(*)<xsl:value-of select="rows/content/form/label/unidade_ls"/>
                            </span>
                            <select name="{rows/content/form/list/unidade_ls/@name}" class="select required" maxlength="30" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/unidade_ls"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/unidade_ls/option">
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
                        <xsl:if test="rows/content/form/label/ordem_ls">
                          <label class="number">
                            <span>
                              <xsl:value-of select="rows/content/form/label/ordem_ls"/>
                            </span>
                            <input type="number" name="{rows/content/form/value/ordem_ls/@name}" value="{rows/content/form/value/ordem_ls}" class="number" maxlength="30" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/ordem_ls"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/preco_ls">
                          <label class="number">
                            <span>
                              <xsl:value-of select="rows/content/form/label/preco_ls"/>
                            </span>
                            <input type="number" name="{rows/content/form/value/preco_ls/@name}" value="{rows/content/form/value/preco_ls}" class="number" maxlength="30" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/preco_ls"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tempo">
                          <label class="select">
                            <span>(*)<xsl:value-of select="rows/content/form/label/tempo"/>
                            </span>
                            <select name="{rows/content/form/list/tempo/@name}" class="select required" maxlength="50" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/tempo"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/tempo/option">
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
                        <xsl:if test="rows/content/form/label/estado_ls">
                          <label class="select">
                            <span>(*)<xsl:value-of select="rows/content/form/label/estado_ls"/>
                            </span>
                            <select name="{rows/content/form/list/estado_ls/@name}" class="select required" maxlength="30" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/estado_ls"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/estado_ls/option">
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
                        <xsl:if test="rows/content/form/label/valor_minimo">
                          <label class="number">
                            <span>
                              <xsl:value-of select="rows/content/form/label/valor_minimo"/>
                            </span>
                            <input type="number" name="{rows/content/form/value/valor_minimo/@name}" value="{rows/content/form/value/valor_minimo}" class="number" maxlength="5" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/valor_minimo"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/valor_maximo">
                          <label class="number">
                            <span>
                              <xsl:value-of select="rows/content/form/label/valor_maximo"/>
                            </span>
                            <input type="number" name="{rows/content/form/value/valor_maximo/@name}" value="{rows/content/form/value/valor_maximo}" class="number" maxlength="5" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/valor_maximo"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/intervalo_progressao">
                          <label class="number">
                            <span>
                              <xsl:value-of select="rows/content/form/label/intervalo_progressao"/>
                            </span>
                            <input type="number" name="{rows/content/form/value/intervalo_progressao/@name}" value="{rows/content/form/value/intervalo_progressao}" class="number" maxlength="30" rel="F_associar_unidade">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="rows/content/form/label/intervalo_progressao"/>
                              </xsl:call-template>
                            </input>
                          </label>
                        </xsl:if><!-- START TABELA LIST--><div class="simple-table table-responsive" rel="DIV_associar_unidade">
                          <table rel="T_associar_unidade">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/unidade_ls">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/unidade_ls/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/unidade_ls"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/ordem_ls">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/ordem_ls/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/ordem_ls"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/preco_ls">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/preco_ls/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/preco_ls"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/tempo">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/tempo/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/tempo"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/estado_ls">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/estado_ls/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/estado_ls"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/valor_minimo">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/valor_minimo/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/valor_minimo"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/valor_maximo">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/valor_maximo/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/valor_maximo"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/associar_unidade/label/intervalo_progressao">
                                  <xsl:if test="not(rows/content/form/table/associar_unidade/label/intervalo_progressao/@visible)">
                                    <th class="">
                                      <xsl:value-of select="rows/content/form/table/associar_unidade/label/intervalo_progressao"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th align="center" width="10"/>
                                <th align="center" width="10"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/associar_unidade/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="unidade_ls">
                                    <xsl:if test="not(unidade_ls/@visible)">
                                      <td class="" data-title="{../../label/unidade_ls}">
                                        <xsl:value-of select="unidade_ls_desc"/>
                                        <input type="hidden" name="p_unidade_ls_fk" value="{unidade_ls}"/>
                                        <input type="hidden" name="p_unidade_ls_fk_desc" value="{unidade_ls_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="unidade_ls/@visible = 'false'">
                                      <input type="hidden" name="p_unidade_ls_fk" value="{unidade_ls}"/>
                                      <input type="hidden" name="p_unidade_ls_fk_desc" value="{unidade_ls_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="ordem_ls">
                                    <xsl:if test="not(ordem_ls/@visible)">
                                      <td class="" data-title="{../../label/ordem_ls}">
                                        <xsl:value-of select="ordem_ls_desc"/>
                                        <input type="hidden" name="p_ordem_ls_fk" value="{ordem_ls}"/>
                                        <input type="hidden" name="p_ordem_ls_fk_desc" value="{ordem_ls_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="ordem_ls/@visible = 'false'">
                                      <input type="hidden" name="p_ordem_ls_fk" value="{ordem_ls}"/>
                                      <input type="hidden" name="p_ordem_ls_fk_desc" value="{ordem_ls_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="preco_ls">
                                    <xsl:if test="not(preco_ls/@visible)">
                                      <td class="" data-title="{../../label/preco_ls}">
                                        <xsl:value-of select="preco_ls_desc"/>
                                        <input type="hidden" name="p_preco_ls_fk" value="{preco_ls}"/>
                                        <input type="hidden" name="p_preco_ls_fk_desc" value="{preco_ls_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="preco_ls/@visible = 'false'">
                                      <input type="hidden" name="p_preco_ls_fk" value="{preco_ls}"/>
                                      <input type="hidden" name="p_preco_ls_fk_desc" value="{preco_ls_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="tempo">
                                    <xsl:if test="not(tempo/@visible)">
                                      <td class="" data-title="{../../label/tempo}">
                                        <xsl:value-of select="tempo_desc"/>
                                        <input type="hidden" name="p_tempo_fk" value="{tempo}"/>
                                        <input type="hidden" name="p_tempo_fk_desc" value="{tempo_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="tempo/@visible = 'false'">
                                      <input type="hidden" name="p_tempo_fk" value="{tempo}"/>
                                      <input type="hidden" name="p_tempo_fk_desc" value="{tempo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="estado_ls">
                                    <xsl:if test="not(estado_ls/@visible)">
                                      <td class="" data-title="{../../label/estado_ls}">
                                        <xsl:value-of select="estado_ls_desc"/>
                                        <input type="hidden" name="p_estado_ls_fk" value="{estado_ls}"/>
                                        <input type="hidden" name="p_estado_ls_fk_desc" value="{estado_ls_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="estado_ls/@visible = 'false'">
                                      <input type="hidden" name="p_estado_ls_fk" value="{estado_ls}"/>
                                      <input type="hidden" name="p_estado_ls_fk_desc" value="{estado_ls_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="valor_minimo">
                                    <xsl:if test="not(valor_minimo/@visible)">
                                      <td class="" data-title="{../../label/valor_minimo}">
                                        <xsl:value-of select="valor_minimo_desc"/>
                                        <input type="hidden" name="p_valor_minimo_fk" value="{valor_minimo}"/>
                                        <input type="hidden" name="p_valor_minimo_fk_desc" value="{valor_minimo_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="valor_minimo/@visible = 'false'">
                                      <input type="hidden" name="p_valor_minimo_fk" value="{valor_minimo}"/>
                                      <input type="hidden" name="p_valor_minimo_fk_desc" value="{valor_minimo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="valor_maximo">
                                    <xsl:if test="not(valor_maximo/@visible)">
                                      <td class="" data-title="{../../label/valor_maximo}">
                                        <xsl:value-of select="valor_maximo_desc"/>
                                        <input type="hidden" name="p_valor_maximo_fk" value="{valor_maximo}"/>
                                        <input type="hidden" name="p_valor_maximo_fk_desc" value="{valor_maximo_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="valor_maximo/@visible = 'false'">
                                      <input type="hidden" name="p_valor_maximo_fk" value="{valor_maximo}"/>
                                      <input type="hidden" name="p_valor_maximo_fk_desc" value="{valor_maximo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="intervalo_progressao">
                                    <xsl:if test="not(intervalo_progressao/@visible)">
                                      <td class="" data-title="{../../label/intervalo_progressao}">
                                        <xsl:value-of select="intervalo_progressao_desc"/>
                                        <input type="hidden" name="p_intervalo_progressao_fk" value="{intervalo_progressao}"/>
                                        <input type="hidden" name="p_intervalo_progressao_fk_desc" value="{intervalo_progressao_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="intervalo_progressao/@visible = 'false'">
                                      <input type="hidden" name="p_intervalo_progressao_fk" value="{intervalo_progressao}"/>
                                      <input type="hidden" name="p_intervalo_progressao_fk_desc" value="{intervalo_progressao_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td align="center" width="10" data-title="Apagar">
                                    <xsl:if test="not(@nodelete)">
                                      <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_associar_unidade_del" rel="associar_unidade" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <td align="center" width="10" data-title="Editar">
                                    <xsl:if test="not(@noupdate)">
                                      <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_associar_unidade_edit" rel="associar_unidade" class="IGRP_editRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_associar_unidade_id" value="{associar_unidade_id}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20170222"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20170222"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20170222"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20170222"/>
</xsl:stylesheet>
