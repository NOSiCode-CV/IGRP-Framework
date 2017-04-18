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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><!-- START SIMPLE-MENU --><xsl:apply-templates mode="menu-simple" select="rows/content/menu"/><!-- END SIMPLE-MENU --><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/cliente_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/cliente_pesq"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/filter/value/cliente_pesq/@name}" value="{rows/content/filter/value/cliente_pesq}" class="LOOKUP" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/cliente_pesq"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/cliente_pesq/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/cliente_pesq"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/cliente_prest_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/cliente_prest_pesq"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/filter/value/cliente_prest_pesq/@name}" value="{rows/content/filter/value/cliente_prest_pesq}" class="LOOKUP" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/cliente_prest_pesq"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/cliente_prest_pesq/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/cliente_prest_pesq"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data_inicio">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_inicio"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_inicio"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/data_fim">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/data_fim"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date IGRP_datepicker" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/filter/label/tipo_contracto">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/tipo_contracto"/>
                        </span>
                        <select name="{rows/content/filter/list/tipo_contracto/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/tipo_contracto"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/tipo_contracto/option">
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
                    <xsl:if test="rows/content/filter/label/estado">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/estado"/>
                        </span>
                        <select name="{rows/content/filter/list/estado/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/estado"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/filter/list/estado/option">
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
                    <xsl:if test="rows/content/filter/label/servico">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/servico"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/filter/value/servico/@name}" value="{rows/content/filter/value/servico}" class="LOOKUP" maxlength="300">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/servico"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/filter/value/servico/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/servico"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/cliente">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cliente_prestador">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente_prestador"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/codigo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/codigo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_inicio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_inicio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_fim">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_fim"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/n_itens">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/n_itens"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/doc_contrato">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/doc_contrato"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id_contrato">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id_contrato"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="cliente">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente}">
                                <xsl:value-of select="cliente"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cliente_prestador">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente_prestador}">
                                <xsl:value-of select="cliente_prestador"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="codigo">
                              <td align="" class="table_row{$pos}" data-title="{../../label/codigo}">
                                <xsl:value-of select="codigo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_inicio">
                              <td align="" class="table_row{$pos}" data-title="{../../label/data_inicio}">
                                <xsl:value-of select="data_inicio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_fim">
                              <td align="" class="table_row{$pos}" data-title="{../../label/data_fim}">
                                <xsl:value-of select="data_fim"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="" class="table_row{$pos}" data-title="{../../label/estado}">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="n_itens">
                              <td align="" class="table_row{$pos}" data-title="{../../label/n_itens}">
                                <xsl:value-of select="n_itens"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="doc_contrato">
                              <td align="" class="table_row{$pos}" data-title="{../../label/doc_contrato}">
                                <xsl:choose>
                                  <xsl:when test="doc_contrato != ''">
                                    <a href="{doc_contrato}" class="_blank">
                                      <xsl:value-of select="doc_contrato_desc"/>
                                    </a>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:value-of select="doc_contrato_desc"/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </td>
                            </xsl:if>
                            <xsl:if test="id_contrato">
                              <td align="" class="table_row{$pos}" data-title="{../../label/id_contrato}">
                                <xsl:value-of select="id_contrato"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id">
                              <td align="" class="table_row{$pos}" data-title="{../../label/id}">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141215"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141215"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141215"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141215"/>
</xsl:stylesheet>
