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
                    <xsl:if test="rows/content/filter/label/num_est">
                      <label>
                        <span>
                          <xsl:value-of select="rows/content/filter/label/num_est"/>
                        </span>
                        <input type="text" name="{rows/content/filter/value/num_est/@name}" value="{rows/content/filter/value/num_est}" class="text" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/num_est"/>
                          </xsl:call-template>
                        </input>
                      </label>
                    </xsl:if><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  --><div class="table">
                    <table class="sortable IGRP_table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/nr_est">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nr_est"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/nome_est">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/nome_est"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/apelido_est">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/apelido_est"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/curso_est">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/curso_est"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ano">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/ano"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <xsl:variable name="pos" select="(position()+1) mod 2"/>
                          <tr class="">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="nr_est">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="nr_est"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="nome_est">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="nome_est"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="apelido_est">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="apelido_est"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="curso_est">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="curso_est"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ano">
                              <td align="" class="table_row{$pos}">
                                <xsl:value-of select="ano"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140410"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140410"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140410"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140410"/>
</xsl:stylesheet>
