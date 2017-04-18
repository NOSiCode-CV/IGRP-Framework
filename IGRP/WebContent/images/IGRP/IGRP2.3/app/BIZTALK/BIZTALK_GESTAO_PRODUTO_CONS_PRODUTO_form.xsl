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
                        <span>
                          <xsl:value-of select="rows/content/form/label/nome"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text" readonly="readonly" Tread="readonly" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/codigo">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/codigo"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/cliente">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/cliente"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/cliente/@name}" value="{rows/content/form/value/cliente}" class="text" readonly="readonly" Tread="readonly" maxlength="200">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/descricao">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/descricao"/>
                        </span>
                        <textarea name="{rows/content/form/value/descricao/@name}" class="textarea" readonly="readonly" Tread="readonly" maxlength="400">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/descricao"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/descricao"/>
                        </textarea>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/estado"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}" class="text" readonly="readonly" Tread="readonly" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/preco">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/preco"/>
                        </span>
                        <input type="number" name="{rows/content/form/value/preco/@name}" value="{rows/content/form/value/preco}" class="number" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/preco"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/tipo_produto">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/tipo_produto"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/tipo_produto/@name}" value="{rows/content/form/value/tipo_produto}" class="text" maxlength="1">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_produto"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/data_inicio">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/data_inicio"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
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
                    </xsl:if><!-- INICIO SEPARADOR lista_servicos--><xsl:if test="rows/content/form/label/lista_servicos">
                      <div rel="lista_servicos" name="sep_lista_servicos">
                        <div id="lista_servicos">
                          <xsl:call-template name="page-title">
                            <xsl:with-param name="title" select="rows/content/form/label/lista_servicos"/>
                            <xsl:with-param name="class" select="'subtitle'"/>
                          </xsl:call-template>
                        </div><!-- START TABELA LIST--><div class="simple-table table-responsive" rel="DIV_lista_servicos">
                          <table rel="T_lista_servicos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/servico">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/servico/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/servico"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/cod_servico">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/cod_servico/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/cod_servico"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/bd_user">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/bd_user/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/bd_user"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/id_host">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/id_host/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/id_host"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/id_server">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/id_server/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/id_server"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/lista_servicos/label/biztalk">
                                  <xsl:if test="not(rows/content/form/table/lista_servicos/label/biztalk/@visible)">
                                    <th class="checkbox">
                                      <input type="checkbox" name="p_biztalk_all" class="IGRP_checkall"/>
                                      <xsl:value-of select="rows/content/form/table/lista_servicos/label/biztalk"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/lista_servicos/value/row[not(@total='yes')]">
                                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                                <tr>
                                  <xsl:if test="servico">
                                    <xsl:if test="not(servico/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/servico}">
                                        <xsl:value-of select="servico"/>
                                        <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="servico/@visible = 'false'">
                                      <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="cod_servico">
                                    <xsl:if test="not(cod_servico/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/cod_servico}">
                                        <xsl:value-of select="cod_servico"/>
                                        <input type="hidden" name="p_cod_servico_fk" value="{cod_servico}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="cod_servico/@visible = 'false'">
                                      <input type="hidden" name="p_cod_servico_fk" value="{cod_servico}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="bd_user">
                                    <xsl:if test="not(bd_user/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/bd_user}">
                                        <xsl:value-of select="bd_user"/>
                                        <input type="hidden" name="p_bd_user_fk" value="{bd_user}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="bd_user/@visible = 'false'">
                                      <input type="hidden" name="p_bd_user_fk" value="{bd_user}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="id_host">
                                    <xsl:if test="not(id_host/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/id_host}">
                                        <xsl:value-of select="id_host"/>
                                        <input type="hidden" name="p_id_host_fk" value="{id_host}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_host/@visible = 'false'">
                                      <input type="hidden" name="p_id_host_fk" value="{id_host}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="id_server">
                                    <xsl:if test="not(id_server/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/id_server}">
                                        <xsl:value-of select="id_server"/>
                                        <input type="hidden" name="p_id_server_fk" value="{id_server}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="id_server/@visible = 'false'">
                                      <input type="hidden" name="p_id_server_fk" value="{id_server}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="biztalk">
                                    <xsl:if test="not(biztalk/@visible)">
                                      <td class="table_row{$pos}" data-title="{../../label/biztalk}">
                                        <xsl:if test="biztalk != '-0'">
                                          <input type="checkbox" name="p_biztalk_fk" value="{biztalk}">
                                            <xsl:if test="biztalk_check=biztalk">
                                              <xsl:attribute name="checked">checked</xsl:attribute>
                                            </xsl:if>
                                          </input>
                                        </xsl:if>
                                        <xsl:value-of select="biztalk_desc"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="biztalk/@visible = 'false'">
                                      <input type="hidden" name="p_biztalk_fk" value="{biztalk}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <input type="hidden" name="p_lista_servicos_id" value="{lista_servicos_id}"/>
                                  <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                  <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141205"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141205"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141205"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141205"/>
</xsl:stylesheet>
