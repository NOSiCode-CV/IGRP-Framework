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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/form/label/nome_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/nome_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/nome_pesq/@name}" value="{rows/content/form/value/nome_pesq}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/nome_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/codigo_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/codigo_pesq"/>
                        </span>
                        <input type="text" name="{rows/content/form/value/codigo_pesq/@name}" value="{rows/content/form/value/codigo_pesq}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/codigo_pesq"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/estado_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/estado_pesq"/>
                        </span>
                        <select name="{rows/content/form/list/estado_pesq/@name}" class="select" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado_pesq"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/estado_pesq/option">
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
                    <xsl:if test="rows/content/form/label/cliente_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/cliente_pesq"/>
                        </span>
                        <input type="LOOKUP" name="{rows/content/form/value/cliente_pesq/@name}" value="{rows/content/form/value/cliente_pesq}" class="LOOKUP" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cliente_pesq"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/cliente_pesq/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/cliente_pesq"/>
                        </xsl:call-template>
                      </label>
                    </xsl:if>
                    <xsl:if test="rows/content/form/label/categoria_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/categoria_pesq"/>
                        </span>
                        <select name="{rows/content/form/list/categoria_pesq/@name}" class="select" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/categoria_pesq"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/categoria_pesq/option">
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
                    <xsl:if test="rows/content/form/label/flg_pagamento_pesq">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/form/label/flg_pagamento_pesq"/>
                        </span>
                        <select name="{rows/content/form/list/flg_pagamento_pesq/@name}" class="select" maxlength="1">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/flg_pagamento_pesq"/>
                          </xsl:call-template>
                          <xsl:for-each select="rows/content/form/list/flg_pagamento_pesq/option">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/codigo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/codigo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cliente">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/flg_pagamento">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/flg_pagamento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/categoria">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/categoria"/>
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
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="" class="table_row{$pos}" data-title="{../../label/id}">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome">
                              <td align="" class="table_row{$pos}" data-title="{../../label/nome}">
                                <xsl:value-of select="nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="codigo">
                              <td align="" class="table_row{$pos}" data-title="{../../label/codigo}">
                                <xsl:value-of select="codigo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cliente">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente}">
                                <xsl:value-of select="cliente"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="flg_pagamento">
                              <td align="" class="table_row{$pos}" data-title="{../../label/flg_pagamento}">
                                <xsl:value-of select="flg_pagamento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo">
                              <td align="" class="table_row{$pos}" data-title="{../../label/tipo}">
                                <xsl:value-of select="tipo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="categoria">
                              <td align="" class="table_row{$pos}" data-title="{../../label/categoria}">
                                <xsl:value-of select="categoria"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141231"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141231"/>
</xsl:stylesheet>
