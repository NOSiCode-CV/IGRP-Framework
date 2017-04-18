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
                </xsl:apply-templates><!-- END NOTIFICATION MESSAGES--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- START HIDDEN FILTER--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/><!-- END HIDDEN FILTER--><!-- START HIDDEN FORM--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- END HIDDEN FORM--><!-- START FILTER--><div class="box-content">
                    <xsl:if test="rows/content/filter/label/email">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/email"/>
                        </span>
                        <input type="email" name="{rows/content/filter/value/email/@name}" value="{rows/content/filter/value/email}" class="email" maxlength="200">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/email"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar"/><!--END TOOL BAR TABLE--><!-- START TABELA--><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
                  <div class="table table-responsive">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/email">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/email"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/falha_pgto">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/falha_pgto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/sucesso_pgto">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/sucesso_pgto"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/falha_rateio">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/falha_rateio"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/sucesso_pgto">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/sucesso_pgto"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="email">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/email}">
                                <xsl:value-of select="email"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="falha_pgto">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/falha_pgto}">
                                <xsl:value-of select="falha_pgto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="sucesso_pgto">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/sucesso_pgto}">
                                <xsl:value-of select="sucesso_pgto"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="falha_rateio">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/falha_rateio}">
                                <xsl:value-of select="falha_rateio"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="sucesso_pgto">
                              <td align="left" class="table_row{$pos}" data-title="{../../label/sucesso_pgto}">
                                <xsl:value-of select="sucesso_pgto"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20141111"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20141111"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20141111"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20141111"/>
</xsl:stylesheet>
