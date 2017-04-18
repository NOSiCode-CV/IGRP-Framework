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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/cliente_creditar">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/cliente_creditar"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/entidade">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/entidade"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/referencia">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/referencia"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/valor">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/valor"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado_rateio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado_rateio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/data_rateio">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/data_rateio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado_pagamento">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/estado_pagamento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/observacao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/observacao"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="cliente_creditar">
                              <td align="" class="table_row{$pos}" data-title="{../../label/cliente_creditar}">
                                <xsl:value-of select="cliente_creditar"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="entidade">
                              <td align="" class="table_row{$pos}" data-title="{../../label/entidade}">
                                <xsl:value-of select="entidade"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="referencia">
                              <td align="" class="table_row{$pos}" data-title="{../../label/referencia}">
                                <xsl:value-of select="referencia"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="valor">
                              <td align="" class="table_row{$pos}" data-title="{../../label/valor}">
                                <xsl:value-of select="valor"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado_rateio">
                              <td align="" class="table_row{$pos}" data-title="{../../label/estado_rateio}">
                                <xsl:value-of select="estado_rateio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="data_rateio">
                              <td align="" class="table_row{$pos}" data-title="{../../label/data_rateio}">
                                <xsl:value-of select="data_rateio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado_pagamento">
                              <td align="" class="table_row{$pos}" data-title="{../../label/estado_pagamento}">
                                <xsl:value-of select="estado_pagamento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="observacao">
                              <td align="" class="table_row{$pos}" data-title="{../../label/observacao}">
                                <xsl:value-of select="observacao"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141119"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141119"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141119"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141119"/>
</xsl:stylesheet>
