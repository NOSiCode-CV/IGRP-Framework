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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/contr_prod_id">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/contr_prod_id"/>
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
                          <xsl:if test="rows/content/table/label/flg_pagamento">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/flg_pagamento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/valor_pago">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/valor_pago"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/percentagem">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/percentagem"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/id_contrato">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/id_contrato"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_consumo">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/tipo_consumo"/>
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
                          <xsl:if test="rows/content/table/label/rateio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/rateio"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="contr_prod_id">
                              <td align="" class="table_row{$pos}" data-title="{../../label/contr_prod_id}">
                                <xsl:value-of select="contr_prod_id"/>
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
                            <xsl:if test="flg_pagamento">
                              <td align="" class="table_row{$pos}" data-title="{../../label/flg_pagamento}">
                                <xsl:value-of select="flg_pagamento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="valor_pago">
                              <td align="" class="table_row{$pos}" data-title="{../../label/valor_pago}">
                                <xsl:value-of select="valor_pago"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="percentagem">
                              <td align="" class="table_row{$pos}" data-title="{../../label/percentagem}">
                                <xsl:value-of select="percentagem"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="id_contrato">
                              <td align="" class="table_row{$pos}" data-title="{../../label/id_contrato}">
                                <xsl:value-of select="id_contrato"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_consumo">
                              <td align="" class="table_row{$pos}" data-title="{../../label/tipo_consumo}">
                                <xsl:value-of select="tipo_consumo"/>
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
                            <xsl:if test="rateio">
                              <td align="" class="table_row{$pos}" data-title="{../../label/rateio}">
                                <xsl:value-of select="rateio"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150106"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20150106"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20150106"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150106"/>
</xsl:stylesheet>
